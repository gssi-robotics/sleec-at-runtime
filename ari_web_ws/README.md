# ARI Web Workspace

The ARI Web Workspace provides a lightweight and containerized environment to run and interact with the ARI Web module for ROS 2.
It enables web-based presentation control and communication through ROS 2 topics.

## Quick Start
1. Build the Docker image

```bash
docker build -t ros2-ari .
```

2. Run the container

```bash
docker run -it --rm --network host ros2-ari
```

3. Launch the ARI web node

```bash
ros2 run ari_web play_presentation_web 
```

4. Send a presentation command (from a new terminal)

```bash
ros2 topic pub /rest/play_presentation std_msgs/String "data: 'EndRepetitions'"
```