FROM ros:humble-ros-base

WORKDIR /ros2_ws

COPY ../enforcement_subsystem/ros2_ws/src/ari_test_runner ./src/ari_test_runner

RUN apt update && apt install -y \
    python3-pip \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/* \
    && rosdep update

RUN apt-get update && rosdep install --from-paths src -y --ignore-src
    
RUN pip install requests

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

COPY ./experiments/reference_scenario ./reference_scenario
COPY ./experiments/scalability ./scalability

RUN chmod +x ./reference_scenario/run_reference_scenario_tests.sh
RUN chmod +x ./scalability/run_scalability_tests.sh

ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash && bash"]