#!/bin/bash

source /ros2_ws/install/setup.bash

publish_once() {
    topic="$1"
    ros2 topic pub --once "$topic" std_msgs/msg/Empty '{}'
}

publish_once /ari/start

# Trap Ctrl-C (SIGINT) to publish stop message
trap 'publish_once /ari/stop; exit 0' SIGINT

# Keep the script running until interrupted
echo "Simulator started. Press Ctrl-C to stop."
while true; do
    sleep 1
done