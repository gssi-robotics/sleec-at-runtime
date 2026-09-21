import json
import time
import rclpy
import requests
from rclpy.node import Node
from ari_comm_layer.executor.pika_subscriber import PikaSubscriber
from ari_comm_layer.executor.obligations_processor import ObligationsProcessor

class ExecutorNode(Node):
    def __init__(self):
        super().__init__('ari_sim_executor_node')

        self.obligations_processor = ObligationsProcessor(self)

        # ARI Parameters
        self.declare_parameter('robot_host', '10.68.0.1')
        self.declare_parameter('robot_port', 80)
        self.declare_parameter('presentation_endpoint', '/action/pal_play_presentation_from_name')
        self.declare_parameter('tts_endpoint', '/action/tts')

        # Complete URLs
        robot_host = self.get_parameter('robot_host').get_parameter_value().string_value
        robot_port = self.get_parameter('robot_port').get_parameter_value().integer_value
        presentation_ep = self.get_parameter('presentation_endpoint').get_parameter_value().string_value
        tts_ep = self.get_parameter('tts_endpoint').get_parameter_value().string_value

        self.presentation_url = f'http://{robot_host}:{robot_port}{presentation_ep}'
        self.tts_url = f'http://{robot_host}:{robot_port}{tts_ep}'

        self.get_logger().info(f'Presentation endpoint: {self.presentation_url}')
        self.get_logger().info(f'TTS endpoint: {self.tts_url}')

        # RabbitMQ Parameters
        self.declare_parameter('rabbitmq_host', 'rabbitmq')
        rabbitmq_host = self.get_parameter('rabbitmq_host').get_parameter_value().string_value

        self.declare_parameter('rabbitmq_user', 'guest')
        rabbitmq_user = self.get_parameter('rabbitmq_user').get_parameter_value().string_value

        self.declare_parameter('rabbitmq_pass', 'guest')
        rabbitmq_pass = self.get_parameter('rabbitmq_pass').get_parameter_value().string_value

        # Initialize RabbitMQ subscriber
        self.pika_subscriber = PikaSubscriber(
            host=rabbitmq_host,
            port=5672,
            user=rabbitmq_user,
            password=rabbitmq_pass,
            queue="obligations",
            on_message=self.obligations_processor.on_msg,
            auto_ack=False,          
            requeue_on_error=True,
        )

        self.get_logger().info("Effector (REST communication) ready")

    def call_presentation(self, presentation_name):
            payload = {"presentation_name": presentation_name}
            self.get_logger().info(f'Sending presentation request: "{presentation_name}"')
    
            try:
                response = requests.post(
                    self.presentation_url,
                    headers={'Content-Type': 'application/json'},
                    data=json.dumps(payload),
                    timeout=5.0
                )
    
                if response.status_code in (200, 201):
                    goal_id = response.json()['response']['goal_id']
                    self.get_logger().info(f'Goal accepted: {goal_id}')
    
                    # Poll the goal status until it starts executing
                    for _ in range(20):  # up to 10 seconds
                        status = self.check_goal_status(goal_id)
                        if status == "EXECUTING":
                            self.get_logger().info(f'Presentation "{presentation_name}" started!')
                            break
                        time.sleep(0.5)
                    else:
                        self.get_logger().warn(f'Presentation "{presentation_name}" did not start within timeout.')
    
                else:
                    self.get_logger().warn(f'Unexpected response ({response.status_code}): {response.text[:200]}')
    
            except requests.exceptions.RequestException as e:
                self.get_logger().error(f'[ERROR] Request error: {e}')

    def call_tts(self, text):
        payload = {
            "rawtext": {
                "text": text,
                "lang_id": "en_GB"
            }
        }
        self.get_logger().info(f'Sending TTS request: "{text}"')

        try:
            response = requests.post(
                self.tts_url,
                headers={'Content-Type': 'application/json'},
                data=json.dumps(payload),
                timeout=5.0
            )
            if response.status_code in (200, 201):
                self.get_logger().info(f'[SUCCESS] TTS request accepted ({response.status_code})')
            else:
                self.get_logger().warn(f'[WARNING] Unexpected TTS response ({response.status_code}): {response.text[:200]}')
        except requests.exceptions.RequestException as e:
            self.get_logger().error(f'[ERROR] TTS request error: {e}')

    def greet_user(self):
        self.get_logger().info("Executing greetInUserLanguage")
        self.call_tts("Hello!")

    def start_session(self):
        self.get_logger().info("Executing startTrainingSession")
        self.call_presentation("start_training_session")

    def close_door(self):
        self.get_logger().info("Executing closeDoor")
        self.call_presentation("close_door")

    def ask_permission_open_door(self):
        self.get_logger().info("Executing askPermissionForOpenDoor")
        self.call_tts("Is it ok for you if we keep the door open?")

    def alert_nurse(self):
        self.get_logger().info("Executing alertNurse")
        self.call_tts("Nurse, please come to the room!")

    def show_next_exercise(self):
        self.get_logger().info("Executing showNextExercise")
        self.call_presentation("show_next_exercise")

    def encourage(self):
        self.get_logger().info("Executing encourage")
        self.call_tts("Come on! You can do it!")

    def ask_user_intent(self):
        self.get_logger().info("Executing askUserIntent")
        self.call_tts("What do you want to do?")

    def notify_session_end(self):
        self.get_logger().info("Executing notifySessionEnd")
        self.call_presentation("notify_session_end")

    def share_data(self):
        self.get_logger().info("Executing shareData")
        self.call_presentation("share_data")

    def deny_data_sharing(self):
        self.get_logger().info("Executing denyDataSharingWithExplanation")
        self.call_tts("Data can not be shared: person unauthorized")

    def inform_nurse(self):
        self.get_logger().info("Executing informNurse")
        self.call_tts("Nurse, please come to the room!")

    def remind_mealtime(self):
        self.get_logger().info("Executing remindUserMealTime")
        self.call_tts("It's mealtime! Please get ready!")

    def wake_up_user(self):
        self.get_logger().info("Executing wakeUpUser")
        self.call_tts("Psst! Wake up!")

    def explain_no_food(self):
        self.get_logger().info("Executing explainNoFood")
        self.call_tts("Sorry, you can not have more food now...")

    def give_dietary_snack(self):
        self.get_logger().info("Executing giveDietarySnack")
        self.call_presentation("give_dietary_snack")

    def deliver_meal(self):
        self.get_logger().info("Executing deliverMeal")
        self.call_presentation("deliver_meal")

    def explain_dietary_adherence(self):
        self.get_logger().info("Executing explainDietAdherenceReason")
        self.call_tts("It is important to follow your dietary program!")

    def deliver_alternative_meal(self):
        self.get_logger().info("Executing deliverDietaryAlternative")
        self.call_presentation("deliver_dietary_alternative")

    def raw_obligation_enforcement(self, obligation: str):
        self.get_logger().info(f"Obligation requested without robot binding: {obligation}, skipping.")

def main(args=None):
    rclpy.init(args=args)
    node = ExecutorNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
