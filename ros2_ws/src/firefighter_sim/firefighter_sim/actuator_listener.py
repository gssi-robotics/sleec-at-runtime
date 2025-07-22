import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool, String

class ActuatorListener(Node):
    def __init__(self):
        super().__init__('actuator_listener')

        self.camera_sub = self.create_subscription(Bool, 'activate_camera', self.camera_callback, 10)
        self.alarm_sub = self.create_subscription(Bool, 'activate_alarm', self.alarm_callback, 10)
        self.nav_sub = self.create_subscription(String, 'go_to', self.go_to_callback, 10)

    def camera_callback(self, msg):
        if msg.data:
            self.get_logger().info("Camera activated.")
        else:
            self.get_logger().info("Camera deactivated.")

    def alarm_callback(self, msg):
        if msg.data:
            self.get_logger().info("Alarm activated!")
        else:
            self.get_logger().info("Alarm deactivated.")

    def go_to_callback(self, msg):
        if msg.data.lower() == "home":
            self.get_logger().info("Navigating to home...")
        else:
            self.get_logger().info(f"Received unknown navigation target: {msg.data}")

def main(args=None):
    rclpy.init(args=args)
    node = ActuatorListener()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
