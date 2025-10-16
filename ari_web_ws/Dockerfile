# Use the official ROS 2 Humble image
FROM ros:humble-ros-base

# Set the working directory
WORKDIR /ari_web_ws

# Copy your source code
COPY ./src /ari_web_ws/src

# Install dependencies and build
RUN apt update && apt install -y \
    python3-pip \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/* \
    && rosdep update


RUN pip install requests

RUN apt update && apt install -y iputils-ping

RUN apt-get update && rosdep install --from-paths src -y --ignore-src

# Build the workspace
RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

# Source the workspace when starting the container
ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && source /ari_web_ws/install/setup.bash && bash"]