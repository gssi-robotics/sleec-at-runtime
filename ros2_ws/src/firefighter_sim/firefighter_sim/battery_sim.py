import rclpy
from rclpy.node import Node
from sensor_msgs.msg import BatteryState
import time

class BatterySimulator(Node):
    def __init__(self):
        super().__init__('battery_simulator')
        self.publisher_ = self.create_publisher(BatteryState, 'battery_state', 10)
        self.battery_level = 1.0  # 100%
        self.timer = self.create_timer(1.0, self.publish_battery)

    def publish_battery(self):
        msg = BatteryState()
        msg.percentage = max(self.battery_level, 0.0)
        self.publisher_.publish(msg)
        self.get_logger().info(f"Battery Level: {msg.percentage:.2f}")
        self.battery_level -= 0.005  # Deplete slowly

def main(args=None):
    rclpy.init(args=args)
    node = BatterySimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
