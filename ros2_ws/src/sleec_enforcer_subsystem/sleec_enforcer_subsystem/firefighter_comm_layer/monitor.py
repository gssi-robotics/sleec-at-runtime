import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import Bool, Float32, String
from sensor_msgs.msg import BatteryState, Temperature
from dataclasses import asdict
from sleec_enforcer_subsystem.firefighter_comm_layer.model_structures import Probe, WindScale


class Monitor(Node):
    def __init__(self):
        super().__init__('monitor')
        self.probe = init_probe()

        # Sensor Subscribers
        self.create_subscription(BatteryState, 'battery_state', self.battery_callback, 10)
        self.create_subscription(Bool, 'person_detected', self.presence_callback, 10)
        self.create_subscription(Temperature, 'temperature', self.temperature_callback, 10)
        self.create_subscription(Float32, 'wind_speed', self.wind_callback, 10)

        # Actuator Subscribers
        self.create_subscription(Bool, 'activate_camera', self.camera_callback, 10)
        self.create_subscription(Bool, 'activate_alarm', self.alarm_callback, 10)

        self.get_logger().info("Monitor node started...")
        
        self.probe_dict = asdict(self.probe)
        # Serialize to JSON string
        json_str = json.dumps(self.probe_dict)
        self.get_logger().info(f"self.probe initialized: {json_str}")

    # Sensor Callbacks
    def battery_callback(self, msg: BatteryState):
        battery = msg.percentage * 100
        self.get_logger().info(f"[Battery] Level: {battery}")
        if battery <= 20:
            self.probe.batteryCritical = True

    def presence_callback(self, msg: Bool):
        self.get_logger().info(f"[Person Detected] {msg.data}")
        self.probe.personDetected = msg.data

    def temperature_callback(self, msg: Temperature):
        self.get_logger().info(f"[Temperature] {msg.temperature:.2f} °C")
        self.probe.temperature = msg.temperature

    def wind_callback(self, msg: Float32):
        self.get_logger().info(f"[Wind Speed] {msg.data:.2f} m/s")
        speed_m_s = msg.data
        if speed_m_s <= 3.3:
            self.probe.windSpeed = WindScale.LIGHT.value
        elif 3.4 <= speed_m_s <= 8.0:
            self.probe.windSpeed = WindScale.MODERATE.value
        elif speed_m_s >  8.0:
            self.probe.windSpeed = WindScale.STRONG.value
        
    # Check Actuators - Callbacks
    def camera_callback(self, msg: Bool):
        self.get_logger().info(f"[Camera ON] {msg.data}")
        self.probe.cameraStart = msg.data

    def alarm_callback(self, msg: Bool):
        self.get_logger().info(f"[Alarm ON] {msg.data}")
        self.probe.alarmRinging = msg.data



def main(args=None):
    rclpy.init(args=args)
    node = Monitor()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


def init_probe():
    probe = Probe(
        batteryCritical=False,
        cameraStart=False,
        alarmRinging=False,
        personNearby=False,
        temperature=20.0,
        windSpeed=WindScale.LIGHT,
        alarmdeadline=30
    )
    return probe