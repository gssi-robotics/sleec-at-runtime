import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class NurseCommunicationSim(Node):
    def __init__(self):
        super().__init__('ari_nurse_comm_sim')

        self.create_subscription(String, 'nurse_comm', self.command_callback, 10)

    def command_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        if body == 'inform':
            self.get_logger().info(f"Informing nurse")
        elif body == 'alert':
            self.get_logger().info(f"Alerting nurse")
        else:
            self.get_logger().info(f"Communicating nurse: {body}")

def main(args=None):
    rclpy.init(args=args)
    node = NurseCommunicationSim()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
