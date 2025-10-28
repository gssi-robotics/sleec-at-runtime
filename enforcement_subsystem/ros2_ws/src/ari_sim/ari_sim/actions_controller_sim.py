import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class ActionsControllerSim(Node):
    def __init__(self):
        super().__init__('ari_training_controller_sim')

        self.create_subscription(String, 'actions', self.command_callback, 10)

    def command_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        if body == 'close_door':
            self.get_logger().info("Closing door")
        else:
            self.get_logger().info(f"Received unknown action command {body}")


def main(args=None):
    rclpy.init(args=args)
    node = ActionsControllerSim()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
