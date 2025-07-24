import rclpy
from rclpy.node import Node
from std_msgs.msg import String, Bool

class Executor(Node):
    def __init__(self):
        super().__init__('executor_node')
        self.go_pub = self.create_publisher(String, 'go_to', 10)
        self.alarm_pub = self.create_publisher(Bool, 'activate_alarm', 10)

        self.get_logger().info("Executor ready...")

    def activate_alarm(self, activate: bool):
        # Publish alarm activation
        alarm_msg = Bool()
        alarm_msg.data = activate
        self.alarm_pub.publish(alarm_msg)
        self.get_logger().info(f"Published: activate_alarm {activate}")

        
    def go_home(self):
        # Publish navigation command
        go_msg = String()
        go_msg.data = "home"
        self.go_pub.publish(go_msg)
        self.get_logger().info("Published: Go home")

    
    
def main(args=None):
    rclpy.init(args=args)
    node = Executor()
    #mqtt_listener = MQTTListener(executor_node=node) # Start MQTT listener
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


