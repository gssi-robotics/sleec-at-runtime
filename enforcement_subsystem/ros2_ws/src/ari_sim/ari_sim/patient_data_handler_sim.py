import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class PatientDataHandlerSim(Node):
    def __init__(self):
        super().__init__('ari_patient_data_handler_sim')

        self.create_subscription(String, 'data_share', self.command_callback, 10)

    def command_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        if body == 'share':
            self.get_logger().info("Sharing data")
        else:
            self.get_logger().info(body)


def main(args=None):
    rclpy.init(args=args)
    node = PatientDataHandlerSim()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
