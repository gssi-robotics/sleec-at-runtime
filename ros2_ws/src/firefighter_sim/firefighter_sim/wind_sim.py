import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32
import math
import time

class WindSimulator(Node):
    def __init__(self):
        super().__init__('wind_speed_simulator')
        self.publisher_ = self.create_publisher(Float32, 'wind_speed', 10)
        self.start_time = self.get_clock().now().seconds_nanoseconds()[0]
        self.timer = self.create_timer(1.0, self.publish_wind)

    def publish_wind(self):
        t = self.get_clock().now().seconds_nanoseconds()[0] - self.start_time
        wind_speed = 3.0 + 2.0 * math.sin(t / 10.0)  # simulate oscillation
        msg = Float32()
        msg.data = wind_speed
        self.publisher_.publish(msg)
        #self.get_logger().info(f"Wind Speed: {msg.data:.2f} m/s")

def main(args=None):
    rclpy.init(args=args)
    node = WindSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
