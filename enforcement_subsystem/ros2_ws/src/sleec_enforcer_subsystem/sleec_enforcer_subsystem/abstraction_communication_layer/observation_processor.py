import threading
import asyncio
import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from fastapi import FastAPI
import uvicorn
import json

app = FastAPI()

class ObservationProcessorNode(Node):
    def __init__(self):
        super().__init__('observation_processor_node')

        self.create_subscription(String, 'sensor_data', self.some_data_listener_callback, 10)
        self.conditions = {}

    def some_data_listener_callback(self, msg):
        self.get_logger().info(f'Received: {msg.data}')
        try:
            data_json = json.loads(msg.data)
            value = data_json.get("value")
        except json.JSONDecodeError:
            self.get_logger().error('Failed to decode JSON from the received message.')
            value = None
        # Here we should process the data and update conditions
        self.conditions["some_condition"] = value

# FastAPI edpoints
@app.get("/probe/conditions")
async def get_last_data():
    if not "some_condition" in node.conditions:
        return {"message": "No data received yet."}
    return {"some_condition": node.conditions["some_condition"]}

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
