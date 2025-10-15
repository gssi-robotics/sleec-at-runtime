import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String, Bool, Int32

class TrainingControllerSim(Node):
    def __init__(self):
        super().__init__('ari_training_controller_sim')

        self.create_subscription(String, 'training_cmd', self.command_callback, 10)

    def command_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        body = command.get("body", None)

        self.get_logger().info(f"Performing {action}")

        if body == 'start':
            self.get_logger().info("Starting training session")
        elif body == 'next':
            self.get_logger().info("Showing next exercise")
        elif body == 'end':
            self.get_logger().info("Training session ended")
        else:
            self.get_logger().info(f"Received unknown training control command {body}")


def main(args=None):
    rclpy.init(args=args)
    node = TrainingControllerSim()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
