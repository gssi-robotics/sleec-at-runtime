import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool, Float32
from sensor_msgs.msg import BatteryState, Temperature
from dataclasses import asdict
from firefighter_comm_layer.condition_processor import *
from firefighter_comm_layer.pika_publisher import PikaPublisher
    


class MonitorNode(Node):
    def __init__(self):
        super().__init__('monitor')
        self.condition = init_condition()
        
        # Setup RabbitMQ Connection 
        self.rabbit_publisher = PikaPublisher(
            host="rabbitmq",
            port=5672,
            queue="conditions"
        )

        # Sensor Subscribers
        self.create_subscription(BatteryState, 'battery_state', self.battery_callback, 10)
        self.create_subscription(Bool, 'person_detected', self.presence_callback, 10)
        self.create_subscription(Temperature, 'temperature', self.temperature_callback, 10)
        self.create_subscription(Float32, 'wind_speed', self.wind_callback, 10)

        # Actuator Subscribers
        self.create_subscription(Bool, 'activate_camera', self.camera_callback, 10)
        self.create_subscription(Bool, 'activate_alarm', self.alarm_callback, 10)

        self.get_logger().info("Monitor node started...")
        
        self.condition_dict = asdict(self.condition)
        # Serialize to JSON string
        json_str = json.dumps(self.condition_dict)
        self.get_logger().info(f"self.condition initialized: {json_str}")

    # Sensor Callbacks
    @publish_on_change
    def battery_callback(self, msg: BatteryState):
        battery = msg.percentage * 100
        #self.get_logger().info(f"[Battery] Level: {battery}")
        if battery <= 20:
            self.condition.batteryCritical = True

    @publish_on_change
    def presence_callback(self, msg: Bool):
        #self.get_logger().info(f"[Person Detected] {msg.data}")
        self.condition.personNearby = msg.data

    @publish_on_change
    def temperature_callback(self, msg: Temperature):
        #self.get_logger().info(f"[Temperature] {msg.temperature:.2f} °C")
        self.condition.temperature = msg.temperature

    @publish_on_change
    def wind_callback(self, msg: Float32):
        #self.get_logger().info(f"[Wind Speed] {msg.data:.2f} m/s")
        speed_m_s = msg.data
        if speed_m_s <= 3.3:
            self.condition.windSpeed = WindScale.LIGHT.value
        elif 3.4 <= speed_m_s <= 8.0:
            self.condition.windSpeed = WindScale.MODERATE.value
        elif speed_m_s >  8.0:
            self.condition.windSpeed = WindScale.STRONG.value
        
    # Check Actuators - Callbacks
    @publish_on_change
    def camera_callback(self, msg: Bool):
        #self.get_logger().info(f"[Camera ON] {msg.data}")
        self.condition.cameraStart = msg.data

    @publish_on_change
    def alarm_callback(self, msg: Bool):
        #self.get_logger().info(f"[Alarm ON] {msg.data}")
        self.condition.alarmRinging = msg.data



def main(args=None):
    rclpy.init(args=args)
    node = MonitorNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


