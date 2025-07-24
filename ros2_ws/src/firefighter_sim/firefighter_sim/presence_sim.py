import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool
import random

class PersonPresenceSimulator(Node):
    def __init__(self):
        super().__init__('person_presence_simulator')
        self.publisher_ = self.create_publisher(Bool, 'person_detected', 10)
        self.timer = self.create_timer(2.0, self.publish_presence)

    def publish_presence(self):
        presence = Bool()
        presence.data = random.random() < 0.3  # 30% chance of presence
        self.publisher_.publish(presence)
        #self.get_logger().info(f"Person Detected: {presence.data}")

def main(args=None):
    rclpy.init(args=args)
    node = PersonPresenceSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
