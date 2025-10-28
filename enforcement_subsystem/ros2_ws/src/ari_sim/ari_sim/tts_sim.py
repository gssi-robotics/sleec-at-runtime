import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class TTSSimNode(Node):
    def __init__(self):
        super().__init__('ari_tts_sim_node')

        self.create_subscription(String, 'tts', self.tts_callback, 10)

    def tts_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        self.get_logger().info(f"Ari says: \"{body}\"")

def main(args=None):
    rclpy.init(args=args)
    node = TTSSimNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
