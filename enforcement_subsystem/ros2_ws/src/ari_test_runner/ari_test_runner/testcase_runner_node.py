import os
import json
import time
import rclpy
from rclpy.node import Node
from threading import Thread, Event
from std_msgs.msg import String, Float32, Int32, Bool, Empty
from sensor_msgs.msg import Temperature

from rclpy.executors import MultiThreadedExecutor
from rclpy.callback_groups import ReentrantCallbackGroup


class TestcaseRunnerNode(Node):
    def __init__(self):
        super().__init__('ari_sim_testcase_runner')

        self.callback_group = ReentrantCallbackGroup()

        self.declare_parameter('testcase_file', '')
        test_file = self.get_parameter('testcase_file').get_parameter_value().string_value

        if not test_file or not os.path.exists(test_file):
            self.get_logger().error(f"No testcase file found: {test_file}")
            return

        with open(test_file) as f:
            self.test_data = json.load(f)
        self.get_logger().info(f"Json data loaded from {test_file}")

        # Publishers for test data
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

        # Subscribers for results
        self.create_subscription(String, 'training_cmd', self.result_callback, 10, callback_group=self.callback_group)
        self.create_subscription(String, 'tts', self.result_callback, 10, callback_group=self.callback_group)
        self.create_subscription(String, 'actions', self.result_callback, 10, callback_group=self.callback_group)
        self.create_subscription(String, 'nurse_comm', self.result_callback, 10, callback_group=self.callback_group)
        self.create_subscription(String, 'data_share', self.result_callback, 10, callback_group=self.callback_group)
        self.create_subscription(String, 'meal_cmd', self.result_callback, 10, callback_group=self.callback_group)

        self.test_results = {}
        self.running_test_id = 0

        self.test_start_time = 0
        self.test_end_time = 0

        # self.create_subscription(Empty, 'start_testing', self.run_tests, 10, callback_group=self.callback_group)

        self.test_thread = Thread(target=self.test_loop, daemon=True)
        self.test_thread.start()

    def test_loop(self):
        self.get_logger().info("Starting test loop...")
        self.run_tests()
        wait_event = Event()
        wait_event.wait(2)
        wait_event.clear()
        self.print_results()

    def publish_conditions(self, test_case_conditions):
        for name, value in test_case_conditions.items():
            pub = self.topic_publishers[name]
            msg_type = type(pub.msg_type())

            self.get_logger().info(f"Publishing condition {name}: {value}")

            try:
                if msg_type is String:
                    msg = String(data=value)
                elif msg_type is Bool:
                    msg = Bool(data=value)
                elif msg_type is Int32:
                    msg = Int32(data=value)
                elif msg_type is Float32:
                    msg = Float32(data=float(value))
                elif msg_type is Temperature:
                    msg = Temperature(temperature=float(value))
                elif msg_type is Empty:
                    if value:
                        msg = Empty()
                    else:
                        continue
                else:
                    self.get_logger().info("Unsupported message type.")
                    continue

                pub.publish(msg)

                pub_event = Event()
                pub_event.wait(0.5)
                pub_event.clear()

            except Exception as e:
                self.get_logger().info(f"Error while sending message: {e}")

    def run_tests(self):
        self.test_start_time = time.perf_counter()
        for test_case in self.test_data["test_cases"]:
            test_id = test_case["id"]
            expected_obligations = test_case["expected_obligation"]
            if len(expected_obligations) > 0:
                expected_obligations_list = [s.strip() for s in expected_obligations[0].split("AND")]
            else:
                expected_obligations_list = expected_obligations

            day_time = test_case["time"]
            conditions = test_case["conditions"]
            interactions = test_case["interactions"]

            self.get_logger().info(f'---- Running test case #{test_id} (expecting {expected_obligations}) ----')

            # Setting up expected results for this test case
            self.running_test_id = test_id
            self.test_results[test_id] = {"id": test_id, "start": 0, "expected_obligations": expected_obligations_list, "end": 0, "executed_obligations": []}

            self.publish_conditions(conditions)

            # Publish time
            time_publisher = self.topic_publishers["time"]
            time_msg = String(data=day_time)

            # If no interactions are set, time will fire the next obligation: save the time before publishing
            self.get_logger().info(f"Publishing time: {day_time}...")
            if not (interactions["data_request"] or interactions["user_request_food"] or interactions["user_complains"]):
                self.test_results[test_id]["start"] = time.perf_counter()
            time_publisher.publish(time_msg)

            pub_event = Event()
            pub_event.wait(1)
            pub_event.clear()

            # Publish interactions
            msg = Empty()
            if interactions["data_request"]:
                self.get_logger().info(f"Publishing data_request...")
                pub = self.topic_publishers["data_request"]
                self.test_results[test_id]["start"] = time.perf_counter()
                pub.publish(msg)
                pub_event = Event()
                pub_event.wait(1)
                pub_event.clear()

            if interactions["user_request_food"]:
                self.get_logger().info(f"Publishing user_request_food...")
                pub = self.topic_publishers["user_request_food"]
                self.test_results[test_id]["start"] = time.perf_counter()
                pub.publish(msg)
                pub_event = Event()
                pub_event.wait(1)
                pub_event.clear()

            if interactions["user_complains"]:
                self.get_logger().info(f"Publishing user_complains...")
                pub = self.topic_publishers["user_complains"]
                self.test_results[test_id]["start"] = time.perf_counter()
                pub.publish(msg)
                pub_event = Event()
                pub_event.wait(1)
                pub_event.clear()

            # Reset conditions
            condition_reset_publisher = self.topic_publishers["condition_reset"]
            condition_reset_publisher.publish(Empty())
            pub_event = Event()
            pub_event.wait(1)
            pub_event.clear()

        self.test_end_time = time.perf_counter()

    def result_callback(self, msg):
        command = json.loads(msg.data)
        action = command.get("action", None)
        self.get_logger().info(f"Received result: {action}")
        result_time = time.perf_counter()

        if self.test_results[self.running_test_id]["end"] == 0:
            self.test_results[self.running_test_id]["end"] = result_time

        self.test_results[self.running_test_id]["executed_obligations"].append(action)

    def print_results(self):
        self.get_logger().info("************************ Test results ************************")
        successes = 0
        failures = 0
        for test_results in self.test_results.values():
            test_id = test_results["id"]
            start = test_results.get("start", 0)
            end = test_results.get("end", 0)
            expected_obligations = test_results["expected_obligations"]
            executed_obligations = test_results["executed_obligations"]
            check = set(expected_obligations) == set(executed_obligations)
            if check:
                successes+=1
            else:
                failures+=1
            time = int((end-start) * 1000.0) if end != 0 and start != 0 else "N/A"
            self.get_logger().info(f"Test #{test_id}: expected {expected_obligations}, executed {executed_obligations} (check: {check}), time: {time} ms")

        self.get_logger().info("************************ Summary ************************")
        total_test_cases = len(self.test_data["test_cases"])
        collected = len(self.test_results)
        self.get_logger().info(f"Test cases run: {total_test_cases}")
        self.get_logger().info(f"Collected results for: {collected}")
        self.get_logger().info(f"Successes: {successes} ({(successes/total_test_cases)*100.0:.3f}%)")
        self.get_logger().info(f"Failures: {failures} ({(failures/total_test_cases)*100.0:.3f}%)")
        self.get_logger().info(f"Total time: {int(self.test_end_time-self.test_start_time)} seconds")

def main():
    rclpy.init()
    node = TestcaseRunnerNode()
    executor = MultiThreadedExecutor()
    executor.add_node(node)
    executor.spin()
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
