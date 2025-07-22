import threading
import asyncio
import rclpy
from rclpy.node import Node
from std_msgs.msg import String, Int32, Bool
from fastapi import FastAPI
import uvicorn
import json
from data.old.conditions import *
from data.old.utils import json_serialize

app = FastAPI()



class ObservationProcessorNode(Node):
    def __init__(self):
        super().__init__('observation_processor_node')
        self.conditions_knowledge = ConditionState(Context(user="user123", time=datetime.now()))
        
        self.create_subscription(String, '/human_status', self.human_status_callback, 10)
        self.create_subscription(Int32, '/human_n_exercises', self.exercises_callback, 10) 
        self.create_subscription(Bool, '/human_energy_level', self.energy_callback, 10)
        self.create_subscription(String, '/human_mood', self.mood_callback, 10)
        # self.create_subscription(String, '/knowledge_update', self.knowledge_callback, 10) --> do we need something like that?
        

    def human_status_callback(self, msg):
        ''' Callback for human status updates.
        returns a string (walking, sleeping, training, eating, resting)'''
        self.conditions_knowledge.context.time = datetime.now()
        
        self.get_logger().info(f'Received movement status: {msg.data}')
        self.conditions_knowledge.user_status.activity = Activity[msg.data]

    def exercises_callback(self, msg):
        self.conditions_knowledge.context.time = datetime.now()
        
        self.get_logger().info(f'Received exercise count: {msg.data}')
        rep_done = True if msg.data >= 10 else False
        self.conditions_knowledge.interaction.repetitions_done = rep_done
    
    def energy_callback(self, msg):
        self.conditions_knowledge.context.time = datetime.now()
        
        self.get_logger().info(f'Received energy level: {msg.data}')
        self.conditions_knowledge.user_status.energy_level = EnergyLevel[msg.data]

    def mood_callback(self, msg):
        self.conditions_knowledge.context.time = datetime.now()
        
        self.get_logger().info(f'Received mood: {msg.data}')
        self.conditions_knowledge.user_status.mood = Mood[msg.data]
          

# FastAPI edpoints
@app.get("/probe/conditions")
async def get_last_data():
    if node.conditions_knowledge:
        return json_serialize(node.conditions_knowledge)

def ros2_thread():
    global node
    rclpy.init()
    node = ObservationProcessorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

def main(args=None):
    spin_thread = threading.Thread(target=ros2_thread, daemon=True)
    spin_thread.start()
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level='info')

if __name__ == "__main__":
    main()
