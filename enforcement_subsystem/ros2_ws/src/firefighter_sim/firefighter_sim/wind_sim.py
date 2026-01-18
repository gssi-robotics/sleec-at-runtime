import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty
from std_msgs.msg import Float32
import math
import time

class WindSimulator(Node):
    def __init__(self):
        super().__init__('wind_speed_simulator')

        self.create_subscription(Empty, 'start', self.start_callback, 10)
        self.create_subscription(Empty, 'stop', self.stop_callback, 10)

        self.wind_publisher = self.create_publisher(Float32, 'wind_speed', 10)
        self.timer = None

    def publish_wind(self):
        t = self.get_clock().now().seconds_nanoseconds()[0] - self.start_time
        wind_speed = 3.0 + 2.0 * math.sin(t / 10.0)  # simulate oscillation
        msg = Float32()
        msg.data = wind_speed
        self.wind_publisher.publish(msg)
        #self.get_logger().info(f"Wind Speed: {msg.data:.2f} m/s")

    def start_callback(self, msg):
        if not self.timer:
            self.start_time = self.get_clock().now().seconds_nanoseconds()[0]
            self.timer = self.create_timer(1.0, self.publish_wind)
        elif self.timer.is_canceled():
            self.timer.reset()
            self.get_logger().info("Wind simulation restarted.")
        else:
            self.get_logger().info("Wind simulation already started.")

    def stop_callback(self, msg):
        if self.timer:
            self.timer.cancel()
            self.get_logger().info("Wind simulation stopped.")
        else:
            self.get_logger().info("Wind simulation is not running.")

def main(args=None):
    rclpy.init(args=args)
    node = WindSimulator()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
