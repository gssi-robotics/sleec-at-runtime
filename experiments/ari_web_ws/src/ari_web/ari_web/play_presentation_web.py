#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import String
import requests
import json
import time

class PlayPresentationClient(Node):
    def __init__(self):
        super().__init__('play_presentation_client')

        self.robot_host = '10.68.0.1'
        # ARI Parameters
        self.declare_parameter('robot_host', '10.68.0.1')
        self.declare_parameter('presentation_endpoint', '/action/pal_play_presentation_from_name')
        self.declare_parameter('tts_endpoint', '/action/tts')

        # Complete URLs
        robot_host = self.get_parameter('robot_host').get_parameter_value().string_value
        presentation_ep = self.get_parameter('presentation_endpoint').get_parameter_value().string_value
        tts_ep = self.get_parameter('tts_endpoint').get_parameter_value().string_value

        self.presentation_url = f'http://{robot_host}{presentation_ep}'
        self.tts_url = f'http://{robot_host}{tts_ep}'

        self.get_logger().info(f'Presentation endpoint: {self.presentation_url}')
        self.get_logger().info(f'TTS endpoint: {self.tts_url}')


        # Subscription for presentation names
        self.sub_presentation = self.create_subscription(
            String,
            '/rest/play_presentation',
            self.listener_callback_presentation,
            10
        )

        # Subscription for TTS
        self.sub_tts = self.create_subscription(
            String,
            '/rest/tts_speak',
            self.listener_callback_tts,
            10
        )

    def listener_callback_presentation(self, msg):
        """Send presentation request to ARI and poll until it starts."""
        presentation_name = msg.data.strip()
        payload = {"presentation_name": presentation_name}
        self.get_logger().info(f'Sending presentation request: "{presentation_name}"')

        try:
            response = requests.post(
                self.presentation_url,
                headers={'Content-Type': 'application/json'},
                data=json.dumps(payload),
                timeout=5.0
            )

            if response.status_code in (200, 201):
                goal_id = response.json()['response']['goal_id']
                self.get_logger().info(f'Goal accepted: {goal_id}')

                # Poll the goal status until it starts executing
                for _ in range(20):  # up to 10 seconds
                    status = self.check_goal_status(goal_id)
                    if status == "EXECUTING":
                        self.get_logger().info(f'Presentation "{presentation_name}" started!')
                        break
                    time.sleep(0.5)
                else:
                    self.get_logger().warn(f'Presentation "{presentation_name}" did not start within timeout.')

            else:
                self.get_logger().warn(f'Unexpected response ({response.status_code}): {response.text[:200]}')

        except requests.exceptions.RequestException as e:
            self.get_logger().error(f'[ERROR] Request error: {e}')


    def listener_callback_tts(self, msg):
        """Receive text and send it to ARI TTS endpoint."""
        text = msg.data.strip()
        payload = {
            "rawtext": {
                "text": text,
                "lang_id": "en_GB"
            }
        }
        self.get_logger().info(f'Sending TTS request: "{text}"')

        try:
            response = requests.post(
                self.tts_url,
                headers={'Content-Type': 'application/json'},
                data=json.dumps(payload),
                timeout=5.0
            )
            if response.status_code in (200, 201):
                self.get_logger().info(f'[SUCCESS] TTS request accepted ({response.status_code})')
            else:
                self.get_logger().warn(f'[WARNING] Unexpected TTS response ({response.status_code}): {response.text[:200]}')
        except requests.exceptions.RequestException as e:
            self.get_logger().error(f'[ERROR] TTS request error: {e}')
            
            
    def check_goal_status(self, goal_id):
        status_url = f"http://{self.robot_host}/action/pal_get_goal_status/{goal_id}"
        try:
            resp = requests.get(status_url, timeout=5.0)
            if resp.status_code == 200:
                status = resp.json().get('response', {}).get('status')
                self.get_logger().info(f'Goal {goal_id} status: {status}')
                return status
            else:
                self.get_logger().warn(f'Unexpected status response ({resp.status_code})')
                return None
        except requests.exceptions.RequestException as e:
            self.get_logger().error(f'Error checking goal status: {e}')
            return None

def main(args=None):
    rclpy.init(args=args)
    node = PlayPresentationClient()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
