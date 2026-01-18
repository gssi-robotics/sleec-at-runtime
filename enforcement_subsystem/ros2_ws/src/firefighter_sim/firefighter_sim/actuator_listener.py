import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool, String

class ActuatorListener(Node):
    def __init__(self):
        super().__init__('actuator_listener')

        self.camera_sub = self.create_subscription(Bool, 'activate_camera', self.camera_callback, 10)
        self.alarm_sub = self.create_subscription(Bool, 'activate_alarm', self.alarm_callback, 10)
        self.nav_sub = self.create_subscription(String, 'go_to', self.go_to_callback, 10)

        self.camera_active = False
        self.alarm_active = False
        self.navigating_to = None

        self.navigation_timer = None

    def camera_callback(self, msg):
        if msg.data:
            if self.camera_active:
                self.get_logger().info("Camera already active.")
            else:
                self.camera_active = True
                self.get_logger().info("Camera activated.")
        else:
            if not self.camera_active:
                self.get_logger().info("Camera already inactive.")
            else:
                self.camera_active = False
                self.get_logger().info("Camera deactivated.")

    def alarm_callback(self, msg):
        if msg.data:
            if self.alarm_active:
                self.get_logger().info("Alarm already active.")
            else:
                self.alarm_active = True
                self.get_logger().info("Alarm activated!")
        else:
            if not self.alarm_active:
                self.get_logger().info("Alarm already inactive.")
            else:
                self.alarm_active = False
                self.get_logger().info("Alarm deactivated.")

    def go_to_callback(self, msg):
        if self.navigation_timer:
            self.get_logger().info(f"Navigation already in progress, canceling previous navigation to {self.navigating_to}.")
            self.navigation_timer.cancel()
            self.navigation_timer = None
            self.navigating_to = None
        if msg.data.lower() == "home":
            self.get_logger().info("Navigating to home...")
            self.navigation_timer = self.create_timer(10.0, self.navigation_timer_callback)
            self.navigating_to = "home"
        else:
            self.get_logger().info(f"Received unknown navigation target: {msg.data}. Navigation interrupted.")

    def navigation_timer_callback(self):
        self.get_logger().info(f"Navigation to {self.navigating_to} complete.")
        self.navigation_timer.cancel()
        self.navigation_timer = None
        self.navigating_to = None

def main(args=None):
    rclpy.init(args=args)
    node = ActuatorListener()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
