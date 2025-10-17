import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from ari_sim_comm_layer.executor.pika_subscriber import PikaSubscriber
from ari_sim_comm_layer.executor.obligations_processor import ObligationsProcessor

class ExecutorNode(Node):
    def __init__(self):
        super().__init__('ari_sim_executor_node')

        self.obligations_processor = ObligationsProcessor(self)

        # Initialize RabbitMQ subscriber
        self.pika_subscriber = PikaSubscriber(
            host="rabbitmq",
            port=5672,
            queue="obligations",
            on_message=self.obligations_processor.on_msg,
            auto_ack=False,          
            requeue_on_error=True,
        )

        self.exercise_pub = self.create_publisher(String, 'training_cmd', 10)
        self.tts_pub = self.create_publisher(String, 'tts', 10)
        self.actions_pub = self.create_publisher(String, 'actions', 10)
        self.nurse_pub = self.create_publisher(String, 'nurse_comm', 10)
        self.data_share_pub = self.create_publisher(String, 'data_share', 10)
        self.meal_cmd_pub = self.create_publisher(String, 'meal_cmd', 10)

        self.get_logger().info("Effector ready...")

    def greet_user(self):
        self.get_logger().info("Executing greetInUserLanguage")
        msg = String()
        msg.data = json.dumps({"action": "greetInUserLanguage", "body": "Hello!"})
        self.tts_pub.publish(msg)

    def start_session(self):
        self.get_logger().info("Executing startTrainingSession")
        msg = String()
        msg.data = json.dumps({"action": "startTrainingSession", "body": "start"})
        self.exercise_pub.publish(msg)

    def close_door(self):
        self.get_logger().info("Executing closeDoor")
        msg = String()
        msg.data = json.dumps({"action": "closeDoor", "body": "close_door"})
        self.actions_pub.publish(msg)

    def ask_permission_open_door(self):
        self.get_logger().info("Executing askPermissionForOpenDoor")
        msg = String()
        msg.data = json.dumps({"action": "askPermissionForOpenDoor", "body": "Is it ok for you if we keep the door open?"})
        self.tts_pub.publish(msg)

    def alert_nurse(self):
        self.get_logger().info("Executing alertNurse")
        msg = String()
        msg.data = json.dumps({"action": "alertNurse", "body": "alert"})
        self.nurse_pub.publish(msg)

    def show_next_exercise(self):
        self.get_logger().info("Executing showNextExercise")
        msg = String()
        msg.data = "next"
        msg.data = json.dumps({"action": "showNextExercise", "body": "next"})
        self.exercise_pub.publish(msg)

    def encourage(self):
        self.get_logger().info("Executing encourage")
        msg = String()
        msg.data = json.dumps({"action": "encourage", "body": "Come on! You can do it!"})
        self.tts_pub.publish(msg)

    def ask_user_intent(self):
        self.get_logger().info("Executing askUserIntent")
        msg = String()
        msg.data = json.dumps({"action": "askUserIntent", "body": "What do you want to do?"})
        self.tts_pub.publish(msg)

    def notify_session_end(self):
        self.get_logger().info("Executing notifySessionEnd")
        msg = String()
        msg.data = "end"
        msg.data = json.dumps({"action": "notifySessionEnd", "body": "end"})
        self.exercise_pub.publish(msg)

    def share_data(self):
        self.get_logger().info("Executing shareData")
        msg = String()
        msg.data = json.dumps({"action": "shareData", "body": "share"})
        self.data_share_pub.publish(msg)

    def deny_data_sharing(self):
        self.get_logger().info("Executing denyDataSharingWithExplanation")
        msg = String()
        msg.data = json.dumps({"action": "denyDataSharingWithExplanation", "body": "Data can not be shared: person unauthorized"})
        self.data_share_pub.publish(msg)

    def inform_nurse(self):
        self.get_logger().info("Executing informNurse")
        msg = String()
        msg.data = json.dumps({"action": "informNurse", "body": "inform"})
        self.nurse_pub.publish(msg)

    def remind_mealtime(self):
        self.get_logger().info("Executing remindUserMealTime")
        msg = String()
        msg.data = json.dumps({"action": "remindUserMealTime", "body": "It's mealtime! Please get ready!"})
        self.tts_pub.publish(msg)

    def wake_up_user(self):
        self.get_logger().info("Executing wakeUpUser")
        msg = String()
        msg.data = json.dumps({"action": "wakeUpUser", "body": "Psst! Wake up!"})
        self.tts_pub.publish(msg)

    def explain_no_food(self):
        self.get_logger().info("Executing explainNoFood")
        msg = String()
        msg.data = json.dumps({"action": "explainNoFood", "body": "Sorry, you can not have more food now..."})
        self.tts_pub.publish(msg)

    def give_dietary_snack(self):
        self.get_logger().info("Executing giveDietarySnack")
        msg = String()
        msg.data = json.dumps({"action": "giveDietarySnack", "body": "deliver_snack"})
        self.meal_cmd_pub.publish(msg)

    def deliver_meal(self):
        self.get_logger().info("Executing deliverMeal")
        msg = String()
        msg.data = json.dumps({"action": "deliverMeal", "body": "deliver_meal"})
        self.meal_cmd_pub.publish(msg)

    def explain_dietary_adherence(self):
        self.get_logger().info("Executing explainDietAdherenceReason")
        msg = String()
        msg.data = json.dumps({"action": "explainDietAdherenceReason", "body": "It is important to follow your dietary program!"})
        self.tts_pub.publish(msg)

    def deliver_alternative_meal(self):
        self.get_logger().info("Executing deliverDietaryAlternative")
        msg = String()
        msg.data = json.dumps({"action": "deliverDietaryAlternative", "body": "deliver_alt_meal"})
        self.meal_cmd_pub.publish(msg)
    
def main(args=None):
    rclpy.init(args=args)
    node = ExecutorNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()
