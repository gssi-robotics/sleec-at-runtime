import asyncio
import httpx
import os
import sys
import uuid
import time
import logging_manager
import aio_pika
import json
import random
from configuration_manager import ConfigurationManager
from model_uploader import ModelUploader
from enforcer import Enforcer
from knowledge import knowledge, rabbit_mq_param


def read_input(input_dict):
    s = input("Insert input location values: ")
    x = s.split()
    for i in range(0,len(x),2):
        input_dict[x[i]] = x[i+1] 
   

def start(enforcer:Enforcer, model_uploader:ModelUploader):
    """
    Run a series of tests for the Target System, with or without an ASM model used as enforcement policy specification

    Parameters:

        enforcer (Enforcer or None):  enforcement module (if any) to validate and correct actions.
        model_uploader(ModelUploader or None): module for uploading the ASM model and its libraries.
   
    Returns:
        None
    """

    execute_enforcer = enforcer != None
    
    if execute_enforcer:
        knowledge.start_time = time.perf_counter()
        model_uploader.upload_runtime_model()
        knowledge.upload_delay = (time.perf_counter() - knowledge.start_time) * 1000

    logger.info("--Starting new test run--")
    knowledge.test_run_start = time.perf_counter()
  
    knowledge.n_step = 0
    if execute_enforcer:
            knowledge.total_sanitisation_delay = 0
            knowledge.max_sanitisation_delay = 0
            knowledge.enforcer_interventions = 0 # Number of step in which the enforcer changed the input action to a different action
            knowledge.start_time = time.perf_counter()
            enforcer.begin_enforcement()
            knowledge.start_delay = (time.perf_counter() - knowledge.start_time) * 1000
            
async def enforcer_loop(enforcer:Enforcer, input_conditions):
    '''Activate the enforcement loop, which is invoked when the input conditions change.'''   
    
   # logger.info(f"[INFO-2] Input conditions: {input_conditions}")
    
    try:
        async with httpx.AsyncClient() as client:
            #do enforcement task
            #Read the inputs for the ASM model (a dict: the name of the function is the key, the value is the function's value)
            # If the enforcer is running, try to sanitise the system's output with the ASM enforcement model
            knowledge.start_time = time.perf_counter()
            knowledge.n_step+=1
            #invoke the output sanitization step
            knowledge.out_obligations = enforcer.sanitise_output(input_conditions) #returns a dict of obligation id :time constraint
            #some stats 
            sanitisation_delay = (time.perf_counter() - knowledge.start_time) * 1000
            knowledge.max_sanitisation_delay = max(knowledge.max_sanitisation_delay, sanitisation_delay)
            knowledge.total_sanitisation_delay += sanitisation_delay
            # Change the action if the enforcer returns a new different one
            if knowledge.out_obligations != None: 
                logger.info(f"[INFO] Obligations to enforce: {knowledge.out_obligations}")
                knowledge.enforcer_interventions += 1
                await publish_obligations(knowledge.out_obligations)
            else:
                logger.info("No obligations to enforce returned by asmeta server...")

    except Exception as e:
        print(f"Error in the enforcement loop: {e}")


async def main():

    #Start enforcer by uploading of the ASM enforcement model
    ip, port, asm_path, asm_file_name, other_models_names = config_manager.get_server_params()
    enforcer =Enforcer(ip, port, asm_file_name)
    model_uploader = ModelUploader(ip, port, asm_path, asm_file_name, other_models_names)
    try:                    
        start(enforcer,model_uploader)
    except Exception as e:
        # Try to run the tests again without the ASM model if at a certain point the server is down  
        logger.error("Failed to connect to the server - Executing the test runs WITHOUT the model")            
        #run(None, None)
   
    execute_enforcer = enforcer != None

    # Connecting to RabbitMQ
    rabbit_mq_param.host, rabbit_mq_param.port, rabbit_mq_param.user, rabbit_mq_param.password, rabbit_mq_param.conditions_queue_name, rabbit_mq_param.obligations_queue_name = config_manager.get_rabbitmq_params()
    try:
        # Try multiple times for robustness
        retries = 10
        delay = 3
        for attempt in range(retries):
            try:
                connection = await aio_pika.connect_robust(host=rabbit_mq_param.host, port=rabbit_mq_param.port, login=rabbit_mq_param.user, password=rabbit_mq_param.password)
                logger.info("Connected to RabbitMQ")
            except Exception as e:
                logger.info(f"Attempt {attempt+1}/{retries}: RabbitMQ not ready, retrying in {delay}s...")
                await asyncio.sleep(delay)
        channel = await connection.channel()
        await channel.set_qos(prefetch_count=1)

        rabbit_mq_param.exchange = channel.default_exchange

        rabbit_mq_param.conditions_queue = await channel.declare_queue(
            rabbit_mq_param.conditions_queue_name, durable=True
        )
        rabbit_mq_param.obligations_queue = await channel.declare_queue(
            rabbit_mq_param.obligations_queue_name, durable=True
        )
    
        logger.info(f"Connected to RabbitMQ at {rabbit_mq_param.host}:{rabbit_mq_param.port}")
        loop_ready = True
    except Exception as e:
        logger.error(f"Failed to connect to RabbitMQ: {e}")
        loop_ready = False
    
    #Run enforcement feedback loop
    if execute_enforcer and loop_ready:
        # while True:
        #     logger.info("--Executing new step--")
        #     await enforcer_loop(enforcer)      # Run one step of the ASM enforcement model
        #     await asyncio.sleep(5.0)
        # Subtituting with the connection with RabbitMQ
        logger.info("Starting RabbitMQ consumer for enforcement loop")

        # Define callback for handling condition messages
        async def handle_condition_change(message: aio_pika.IncomingMessage):
            logger.info("--Executing new step--")
            async with message.process():
                input_conditions = json.loads(message.body.decode()) # Assume that the monitor sends all the set of defined conditions
                knowledge.input_conditions = input_conditions  # Update the knowledge with the received conditions
                logger.info(f"[INFO] Received input conditions: {input_conditions}")
                # NOTE: Condition publishing works, but we cannot guarantee that the monitored condition values align with the SLEEC-ASM rule
                # For testing, we can use a randomly selected set of conditions that are compatible with the ruleno
                # input_conditions_list = [
                #     {'batteryCritical': True, 'cameraStart': True, 'alarmRinging': True, 'personNearby': True, 'temperature': 36.0, 'windSpeed': "LIGHT", 'alarmdeadline': 30},
                #     {'batteryCritical': True, 'cameraStart': True, 'alarmRinging': True, 'personNearby': False, 'temperature': 30.0, 'windSpeed': "LIGHT", 'alarmdeadline': 30},
                #     {'batteryCritical': True, 'cameraStart': True, 'alarmRinging': True, 'personNearby': True, 'temperature': 30.0, 'windSpeed': "LIGHT", 'alarmdeadline': 30}
                # ]
                # input_conditions = random.choice(input_conditions_list)
                
                await enforcer_loop(enforcer, input_conditions)
        try:
            await rabbit_mq_param.conditions_queue.consume(handle_condition_change)

            logger.info("Awaiting messages (CTRL‑C to stop)...")
            await asyncio.get_running_loop().create_future()

        except asyncio.CancelledError:
            logger.info("Stopping RabbitMQ consumer")
        finally:
            await connection.close()

    # Stop the execution of the ASM enforcement model
    if execute_enforcer:
            knowledge.start_time = time.perf_counter()
            enforcer.end_enforcement()
            knowledge.stop_delay = (time.perf_counter() - knowledge.start_time) * 1000
            logger.info("Enforcer delays:")
            logger.info(f"* Start delay: {knowledge.start_delay:.2f}ms")
            logger.info(f"* Total sanitisation delay: {knowledge.total_sanitisation_delay:.2f}ms (max {knowledge.max_sanitisation_delay:.2f}ms)")
            logger.info(f"* Stop delay: {knowledge.stop_delay:.2f}ms")
            logger.info(f"Number of enforcer interventions: {knowledge.enforcer_interventions} (out of {knowledge.n_step})")

    test_execution_time = (time.perf_counter() - knowledge.test_run_start) * 1000
    #logger.info(f"Test run {i} completed in {test_execution_time:.2f}ms:")
    logger.info(f"Test run completed in {test_execution_time:.2f}ms:")
    logger.info(f"* Model simulation steps: {knowledge.n_step}")
    logger.info("")
    # Delete the runtime models
    if execute_enforcer:
        knowledge.start_time = time.perf_counter()
        model_uploader.delete_runtime_model()
        knowledge.delete_delay = (time.perf_counter() - knowledge.start_time) * 1000
        logger.info(f"Upload model delay: {knowledge.upload_delay:.2f}ms")
        logger.info(f"Delete model delay: {knowledge.delete_delay:.2f}ms")


async def publish_obligations(payload: dict):
    body = json.dumps(payload).encode("utf-8")
    await rabbit_mq_param.exchange.publish(
        aio_pika.Message(body=body, delivery_mode=aio_pika.DeliveryMode.PERSISTENT),
        routing_key=rabbit_mq_param.obligations_queue.name,
    )
    logger.info(f"[RabbitMQ] Published obligations: {payload}")


if __name__ == "__main__":
    CONFIG_FILE = "config.json"
    # Setup from a configuration file
    config_manager = ConfigurationManager(CONFIG_FILE)

    # Setup Logging
    execution_id = uuid.uuid4()
    level, log_folder = config_manager.get_logging_params()
    logging_manager.setup_logging(level, log_folder, execution_id)
    logger = logging_manager.get_logger(__name__)
    logger.info(f"Loaded config.json - Starting execution with id {execution_id}")
    config_manager.log_configuration()

    # Start and run enforcer
    asyncio.run(main())
    
    
