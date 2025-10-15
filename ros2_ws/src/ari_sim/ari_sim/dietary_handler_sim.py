import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class DietaryHandlerSim(Node):
    def __init__(self):
        super().__init__('ari_dietary_handler_sim')

        self.create_subscription(String, 'meal_cmd', self.command_callback, 10)

    def command_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        if body == 'deliver_snack':
            self.get_logger().info("Delivering a snack")
        elif body == 'deliver_meal':
            self.get_logger().info("Delivering meal")
        elif body == 'deliver_alt_meal':
            self.get_logger().info("Delivering an alternative meal")
        else:
            self.get_logger().info(f"Received an unknown instruction {body}")


def main(args=None):
    rclpy.init(args=args)
    node = DietaryHandlerSim()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
