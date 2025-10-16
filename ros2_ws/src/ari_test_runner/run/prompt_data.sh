#!/bin/bash

source /ros2_ws/install/setup.bash

publish_messages() {
    read -p "Battery level (float, e.g., 75.0): " battery_level
    ros2 topic pub --once /ari/battery_state sensor_msgs/msg/BatteryState "{percentage: $battery_level}"

    read -p "Person nearby? (true/false): " person_nearby
    ros2 topic pub --once /ari/person_detected std_msgs/msg/Bool "{data: $person_nearby}"

    read -p "Temperature (float, e.g., 22.0): " temperature
    ros2 topic pub --once /ari/temperature sensor_msgs/msg/Temperature "{temperature: $temperature}"

    read -p "Wind speed (float, e.g., 5.2): " wind_speed
    ros2 topic pub --once /ari/wind_speed std_msgs/msg/Float32 "{data: $wind_speed}"

    read -p "Start camera? (true/false): " camera_start
    ros2 topic pub --once /ari/activate_camera std_msgs/msg/Bool "{data: $camera_start}"
}

while true; do
    publish_messages
    echo "----"
done