import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty
from sensor_msgs.msg import Temperature
import random

class TemperatureSimulator(Node):
    def __init__(self):
        super().__init__('temperature_simulator')

        self.create_subscription(Empty, 'start', self.start_callback, 10)
        self.create_subscription(Empty, 'stop', self.stop_callback, 10)

        self.temperature_publisher = self.create_publisher(Temperature, 'temperature', 10)
        self.base_temp = 22.0  # Celsius
        self.timer = None

    def publish_temperature(self):
        msg = Temperature()
        msg.temperature = float(round(self.base_temp + random.uniform(-2, 2)))  # simulate variation
        self.temperature_publisher.publish(msg)
        #self.get_logger().info(f"Temperature: {msg.temperature:.2f} °C")

    def start_callback(self, msg):
        if not self.timer:
            self.timer = self.create_timer(5.0, self.publish_temperature)
        elif self.timer.is_canceled():
            self.timer.reset()
            self.get_logger().info("Temperature simulation restarted.")
        else:
            self.get_logger().info("Temperature simulation already started.")

    def stop_callback(self, msg):
        if self.timer:
            self.timer.cancel()
            self.get_logger().info("Temperature simulation stopped.")
        else:
            self.get_logger().info("Temperature simulation is not running.")

def main(args=None):
    rclpy.init(args=args)
    node = TemperatureSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
