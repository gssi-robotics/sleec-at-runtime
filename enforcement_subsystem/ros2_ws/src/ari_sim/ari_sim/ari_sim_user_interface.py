import rclpy
from rclpy.node import Node
from std_msgs.msg import String, Bool, Int32, Float32, Empty
from sensor_msgs.msg import Temperature


class RobotUserInterface(Node):
    def __init__(self):
        super().__init__('robot_user_interface')

        self.topic_publishers = {
            'time': self.create_publisher(String, 'time', 10),
            'user_privacy_concern': self.create_publisher(Bool, 'user_privacy_concern', 10),
            'room_temperature': self.create_publisher(Temperature, 'room_temperature', 10),
            'user_open_door_permission': self.create_publisher(String, 'user_open_door_permission', 10),
            'user_exercising': self.create_publisher(Bool, 'user_exercising', 10),
            'exercise_count': self.create_publisher(Int32, 'exercise_count', 10),
            'user_encouraged': self.create_publisher(Empty, 'user_encouraged', 10),
            'user_physical_alerts': self.create_publisher(Bool, 'user_physical_alerts', 10),
            'user_complains': self.create_publisher(Empty, 'user_complains', 10),
            'user_exercise_preferences': self.create_publisher(Bool, 'user_exercise_preferences', 10),
            'data_request': self.create_publisher(Empty, 'data_request', 10),
            'user_consent_granted': self.create_publisher(Bool, 'user_consent_granted', 10),
            'authorized_access': self.create_publisher(Bool, 'authorized_access', 10),
            'user_ready': self.create_publisher(Empty, 'user_ready', 10),
            'user_sleep_status': self.create_publisher(String, 'user_sleep_status', 10),
            'glucose_value': self.create_publisher(Float32, 'glucose_value', 10),
            'user_request_food': self.create_publisher(Empty, 'user_request_food', 10),
            'medical_emergency': self.create_publisher(Empty, 'medical_emergency', 10),
            'user_refuse_diet': self.create_publisher(Empty, 'user_refuse_diet', 10),
            'exercise_result': self.create_publisher(String, 'exercise_result', 10),
            'condition_reset': self.create_publisher(Empty, 'condition_reset', 10),
        }

        self.topic_list = list(self.topic_publishers.keys())

        self.get_logger().info("RobotUserInterface is ready.")
        print("\n=== Robot User Interface ===")
        print("Select a topic number to publish a message, or type 'exit' to quit.\n")

        self.run_interface()

    def show_menu(self):
        print("\nAvailable topics:")
        for i, topic in enumerate(self.topic_list, start=1):
            print(f"  [{i}] {topic}")

    def run_interface(self):
        while rclpy.ok():
            self.show_menu()
            choice = input("\nEnter topic number (or 'exit' to quit): ").strip()

            if choice.lower() == 'exit':
                break

            if not choice.isdigit() or not (1 <= int(choice) <= len(self.topic_list)):
                print("Invalid choice. Please enter a valid number.")
                continue

            topic = self.topic_list[int(choice) - 1]
            pub = self.topic_publishers[topic]
            msg_type = type(pub.msg_type())

            try:
                # Handle different message types
                if msg_type is String:
                    data = input("Enter a string: ")
                    msg = String(data=data)
                elif msg_type is Bool:
                    val = input("Enter True or False: ").lower()
                    msg = Bool(data=(val in ['true', '1', 'yes', 'y']))
                elif msg_type is Int32:
                    data = int(input("Enter an integer: "))
                    msg = Int32(data=data)
                elif msg_type is Float32:
                    data = float(input("Enter a float value: "))
                    msg = Float32(data=data)
                elif msg_type is Temperature:
                    temp = float(input("Enter temperature value (°C): "))
                    msg = Temperature(temperature=temp)
                elif msg_type is Empty:
                    input("Press Enter to send an empty message.")
                    msg = Empty()
                else:
                    print("Unsupported message type.")
                    continue

                pub.publish(msg)
                print(f"Message published on '{topic}'")

            except Exception as e:
                print(f"Error while sending message: {e}")


def main(args=None):
    rclpy.init(args=args)
    try:
        RobotUserInterface()
    except KeyboardInterrupt:
        pass
    finally:
        rclpy.shutdown()


if __name__ == '__main__':
    main()
