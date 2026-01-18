import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty
from std_msgs.msg import Bool
import random

class PersonPresenceSimulator(Node):
    def __init__(self):
        super().__init__('person_presence_simulator')

        self.create_subscription(Empty, 'start', self.start_callback, 10)
        self.create_subscription(Empty, 'stop', self.stop_callback, 10)

        self.presence_publisher = self.create_publisher(Bool, 'person_detected', 10)
        self.timer = None

    def publish_presence(self):
        presence = Bool()
        presence.data = random.random() < 0.3  # 30% chance of presence
        self.presence_publisher.publish(presence)
        #self.get_logger().info(f"Person Detected: {presence.data}")

    def start_callback(self, msg):
        if not self.timer:
            self.timer = self.create_timer(2.0, self.publish_presence)
        elif self.timer.is_canceled():
            self.timer.reset()
            self.get_logger().info("Person simulation restarted.")
        else:
            self.get_logger().info("Person simulation already started.")

    def stop_callback(self, msg):
        if self.timer:
            self.timer.cancel()
            self.get_logger().info("Person simulation stopped.")
        else:
            self.get_logger().info("Person simulation is not running.")

def main(args=None):
    rclpy.init(args=args)
    node = PersonPresenceSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
