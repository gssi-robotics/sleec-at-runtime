import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty
from sensor_msgs.msg import BatteryState
import time

class BatterySimulator(Node):
    def __init__(self):
        super().__init__('battery_simulator')

        self.create_subscription(Empty, 'start', self.start_callback, 10)
        self.create_subscription(Empty, 'stop', self.stop_callback, 10)

        self.battery_publisher = self.create_publisher(BatteryState, 'battery_state', 10)
        self.timer = None

    def publish_battery(self):
        msg = BatteryState()
        msg.percentage = max(self.battery_level, 0.0)
        self.battery_publisher.publish(msg)
        #self.get_logger().info(f"Battery Level: {msg.percentage:.2f}")
        self.battery_level -= 0.005  # Deplete slowly

    def start_callback(self, msg):
        if not self.timer:
            self.battery_level = 1.0
            self.timer = self.create_timer(1.0, self.publish_battery)
        elif self.timer.is_canceled():
            self.battery_level = 1.0
            self.timer.reset()
            self.get_logger().info("Battery simulation restarted.")
        else:
            self.get_logger().info("Battery simulation already started.")

    def stop_callback(self, msg):
        if self.timer:
            self.timer.cancel()
            self.get_logger().info("Battery simulation stopped.")
        else:
            self.get_logger().info("Battery simulation is not running.")

def main(args=None):
    rclpy.init(args=args)
    node = BatterySimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
