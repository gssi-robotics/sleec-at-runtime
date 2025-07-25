import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Temperature
import random

class TemperatureSimulator(Node):
    def __init__(self):
        super().__init__('temperature_simulator')
        self.publisher_ = self.create_publisher(Temperature, 'temperature', 10)
        self.base_temp = 22.0  # Celsius
        self.timer = self.create_timer(60.0, self.publish_temperature)

    def publish_temperature(self):
        msg = Temperature()
        msg.temperature = round(self.base_temp + random.uniform(-2, 2))  # simulate variation
        self.publisher_.publish(float(msg))
        #self.get_logger().info(f"Temperature: {msg.temperature:.2f} °C")

def main(args=None):
    rclpy.init(args=args)
    node = TemperatureSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
