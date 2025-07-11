# Use the official ROS 2 Humble image
FROM ros:humble-ros-base

# Set the working directory
WORKDIR /ros_ws

# Copy your source code
COPY ./ros2_ws /ros_ws

# Install dependencies and build
RUN apt update && apt install -y \
    python3-pip \
    ros-humble-ros-base \
    && rm -rf /var/lib/apt/lists/*


# Build the workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

# Source the workspace when starting the container
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && source /ros_ws/install/setup.bash && bash"]