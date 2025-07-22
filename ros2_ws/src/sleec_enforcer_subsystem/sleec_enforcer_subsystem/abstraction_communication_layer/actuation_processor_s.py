import threading
import asyncio
import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from robot_sim_interfaces.srv import TaskExecutorService
from fastapi import FastAPI
from  pydantic  import  BaseModel 
import uvicorn

app = FastAPI()

class ActuationProcessorNode(Node):
    def __init__(self):
        super().__init__('actuation_processor_node')
        self.publishers = {}  # store topic publishers

        self.task_executor_client = self.create_client(TaskExecutorService, 'task_executor_service')
        while not self.task_executor_client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Waiting for task_executor_service...')

    async def call_service(self, task):
        request = TaskExecutorService.Request()
        request.task = task
        future = self.task_executor_client.call_async(request)
        await future
        return future.result()
    
    def publish_to_topic(self, topic_name: str, message: str):
        if topic_name not in self.publishers:
            # Dynamically create a publisher for the topic
            self.publishers[topic_name] = self.create_publisher(String, topic_name, 10)
            self.get_logger().info(f"Created new publisher for topic {topic_name}")

        msg = String()
        msg.data = message
        self.publishers[topic_name].publish(msg)
        self.get_logger().info(f"Published '{message}' to topic '{topic_name}'")


class ServiceInput(BaseModel):
    capability: str  # topic name
    input_data: str  # message content
    

@app.post("/obligation/execute")
async def call_service(request: ServiceInput):
    if node is None:
        return {"error": "ROS node not initialized"}
    if request.capability and request.input_data:
        # Topic publishing
        node.publish_to_topic(request.capability, request.input_data)
        return {"status": "published", "topic": request.capability, "data": request.input_data}


def ros2_thread():
    global node
    rclpy.init()
    node = ActuationProcessorNode()
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
    uvicorn.run(app, host="0.0.0.0", port=8001, log_level='info')

if __name__ == "__main__":
    main()