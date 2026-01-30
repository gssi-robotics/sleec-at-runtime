import os
import json
import time
import rclpy
from rclpy.node import Node
from threading import Thread, Event
from std_msgs.msg import String, Empty

from rclpy.executors import MultiThreadedExecutor
from rclpy.callback_groups import ReentrantCallbackGroup


class ScalabilityTestRunnerNode(Node):
    def __init__(self):
        super().__init__('ari_sim_scalability_tests_runner')

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
        self.raw_condition_update_publisher = self.create_publisher(String, 'raw_condition_update', 10)

        # Subscribers for results
        self.create_subscription(String, 'raw_obligation_enforcement', self.result_callback, 10, callback_group=self.callback_group)

        self.test_results = {}
        self.running_test_id = 0

        self.test_start_time = 0
        self.test_end_time = 0

        self.test_thread = Thread(target=self.test_loop, daemon=True)
        self.test_thread.start()

    def test_loop(self):
        self.get_logger().info("Starting test loop...")
        self.run_tests()
        wait_event = Event()
        wait_event.wait(2)
        wait_event.clear()
        self.print_results()

    def run_tests(self):
        self.test_start_time = time.perf_counter()
        for test_case in self.test_data["test_cases"]:
            test_id = test_case["id"]
            conditions = test_case["conditions"]

            self.get_logger().info(f'---- Running test case #{test_id} ----')

            self.running_test_id = test_id
            self.test_results[test_id] = {"id": test_id, "start": 0, "end": 0}

            # Update this: set all the conditions once
            self.get_logger().info(f"Publishing conditions")

            # Build the message
            msg = String()
            msg.data = json.dumps(conditions)

            # Storing start time
            self.test_results[test_id]["start"] = time.perf_counter()

            self.raw_condition_update_publisher.publish(msg)

            pub_event = Event()
            pub_event.wait(1)
            pub_event.clear()

        self.test_end_time = time.perf_counter()

    def result_callback(self, msg):
        action = msg.data
        self.get_logger().info(f"Received result: {action}")
        result_time = time.perf_counter()

        if self.test_results[self.running_test_id]["end"] == 0:
            self.test_results[self.running_test_id]["end"] = result_time

    def print_results(self):
        self.get_logger().info("************************ Test results ************************")
        for test_results in self.test_results.values():
            test_id = test_results["id"]
            start = test_results.get("start", 0)
            end = test_results.get("end", 0)
            time = int((end-start) * 1000.0) if end != 0 and start != 0 else "N/A"
            self.get_logger().info(f"Test #{test_id}: time: {time} ms")

        self.get_logger().info("************************ Summary ************************")
        total_test_cases = len(self.test_data["test_cases"])
        collected = len(self.test_results)
        self.get_logger().info(f"Test cases run: {total_test_cases}")
        self.get_logger().info(f"Collected results for: {collected}")
        self.get_logger().info(f"Total time: {int(self.test_end_time-self.test_start_time)} seconds")

def main():
    rclpy.init()
    node = ScalabilityTestRunnerNode()
    executor = MultiThreadedExecutor()
    executor.add_node(node)
    executor.spin()
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
