import json
import rclpy
from rclpy.node import Node
from std_msgs.msg import String, Bool
from firefighter_comm_layer.pika_subscriber import PikaSubscriber
from firefighter_comm_layer.obligation_processor import process_obligations

class ExecutorNode(Node):
    def __init__(self):
        super().__init__('executor_node')
        self.go_pub = self.create_publisher(String, 'go_to', 10)
        self.alarm_pub = self.create_publisher(Bool, 'activate_alarm', 10)
        
        # Initialize RabbitMQ subscriber
        sub = PikaSubscriber(
            host="rabbitmq",
            port=5672,
            queue="obligations",
            on_message=self.on_msg,
            auto_ack=False,          
            requeue_on_error=True,
        )
                
        self.get_logger().info("Executor ready...")
        
    def on_msg(self, body: bytes):
        '''Callback for RabbitMQ messages. Processes obligations received from the queue.'''
        payload = json.loads(body.decode("utf-8"))
        self.get_logger().info("[Executor] Received obligations")
        process_obligations(payload, self)


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
    node = ExecutorNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()



