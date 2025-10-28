import rclpy
from rclpy.node import Node
from std_msgs.msg import Empty, Bool, Float32, String, Int32
from sensor_msgs.msg import Temperature
from ari_sim_comm_layer.monitor.pika_publisher import PikaPublisher
from ari_sim_comm_layer.monitor.conditions_processor import ConditionsProcessor

class MonitorNode(Node):
    def __init__(self):
        super().__init__('ari_sim_monitor_node')

        self.declare_parameter('rabbitmq_user', 'guest')
        rabbitmq_user = self.get_parameter('rabbitmq_user').get_parameter_value().string_value

        self.declare_parameter('rabbitmq_pass', 'guest')
        rabbitmq_pass = self.get_parameter('rabbitmq_pass').get_parameter_value().string_value

        # Setup RabbitMQ Connection 
        self.pika_publisher = PikaPublisher(
            host="rabbitmq",
            port=5672,
            user=rabbitmq_user,
            password=rabbitmq_pass,
            queue="conditions"
        )

        self.conditions_processor = ConditionsProcessor(self, self.pika_publisher)

        # ======== START PROBE SUBSCRIBERS ======== #
        self.create_subscription(String, 'time', self.conditions_processor.time_callback, 10)
        self.create_subscription(Bool, 'user_privacy_concern', self.conditions_processor.user_privacy_concern_callback, 10)
        self.create_subscription(String, 'user_open_door_permission', self.conditions_processor.user_open_door_permission_callback, 10)
        self.create_subscription(Temperature, 'room_temperature', self.conditions_processor.room_temperature_callback, 10)
        self.create_subscription(Bool, 'user_exercising', self.conditions_processor.user_exercising_callback, 10)
        self.create_subscription(Int32, 'exercise_count', self.conditions_processor.exercise_count_callback, 10)
        self.create_subscription(Empty, 'user_encouraged', self.conditions_processor.user_encouraged_callback, 10)
        self.create_subscription(Bool, 'user_physical_alerts', self.conditions_processor.user_physical_alerts_callback, 10)
        self.create_subscription(Empty, 'user_complains', self.conditions_processor.user_complains_callback, 10)
        self.create_subscription(Bool, 'user_exercise_preferences', self.conditions_processor.user_exercise_preferences_callback, 10)
        self.create_subscription(Empty, 'data_request', self.conditions_processor.data_request_callback, 10)
        self.create_subscription(Bool, 'user_consent_granted', self.conditions_processor.user_consent_granted_callback, 10)
        self.create_subscription(Bool, 'authorized_access', self.conditions_processor.authorized_access_callback, 10)
        self.create_subscription(Empty, 'user_ready', self.conditions_processor.user_ready_callback, 10)
        self.create_subscription(String, 'user_sleep_status', self.conditions_processor.user_sleep_status_callback, 10)
        self.create_subscription(Float32, 'glucose_value', self.conditions_processor.glucose_value_callback, 10)
        self.create_subscription(Empty, 'user_request_food', self.conditions_processor.user_request_food_callback, 10)
        self.create_subscription(Empty, 'medical_emergency', self.conditions_processor.medical_emergency_callback, 10)
        self.create_subscription(Empty, 'user_refuse_diet', self.conditions_processor.user_refuse_diet_callback, 10)
        self.create_subscription(String, 'exercise_result', self.conditions_processor.last_exercise_result_callback, 10)

        self.create_subscription(Empty, 'condition_reset', self.conditions_processor.reset_callback, 10)

        self.get_logger().info("Probe started")
        # ======== END PROBE SUBSCRIBERS ======== #


        self.get_logger().info("Monitor node started...")


def main(args=None):
    rclpy.init(args=args)
    node = MonitorNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


