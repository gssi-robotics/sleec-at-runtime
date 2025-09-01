# ari-ros2-sleec-runtime-enforcer
SLEEC rules enforcer @ runtime for Ari over ROS2 using Asmeta

## Build and run

> [!NOTE]
> Docker Compose is the recommended way for running the system.

**Run over Docker Compose:**
```
git clone https://github.com/gianlucafilippone/ari-ros2-sleec-runtime-enforcer.git
cd ari-ros2-sleec-runtime-enforcer
docker compose up
```

**Start the [Firefighter scenario](#firefighter-example):**

Open a new terminal
```
docker exec -it sleec-runtime-enforcer-firefighter-sim-1 bash
```

Choose if running a simulated scenario:
```
. install/setup.bash
source src/firefighter_sim/run/start_simulator.sh
```

...or if manually setting conditions
```
. install/setup.bash
source src/firefighter_sim/run/prompt_data.sh
```

## Components detail
### ASMETA server
The `asmeta_server` folder contains the ASMETA model@runtime enforcer component wrapped in a RESTful web service.

#### Running the ASMETA server (standalone)
```
cd asmeta_server
python3 asmeta_runtime_server.py
```

#### Running the ASMETA server (Docker)
Build the Docker image
```
cd asmeta_server
docker build -t asmeta-server .
```

Run the container
```
docker run -it -p 8080:8080 --rm --name asmeta-server asmeta-server
```

### Enforcer
The `enforcer/` folder contains the enforcer component. It runs the A and P components of the MAPE-K loop.

#### Running the Enforcer (standalone)
```
cd enforcer
python3 enforcer.py
```

> [!NOTE]
> `httpx`, `requests`, and `aio-pika` packages are required. [Installing dependencies](#installing-dependencies-(only-for-standalone-deployment))

#### Running the enforcer (Docker)
Build the Docker image
```
cd enforcer
docker build -t enforcer .
```

Run the container
```
docker run -it --rm enforcer enforcer
```

> [!IMPORTANT]
> To allow communication between containers, all the communicating container must be attached to a Docker network. See [Docker documentation](https://docs.docker.com/engine/network/) for further details. This is not required if the communication is directed from the host system to a Docker container, e.g., if the Enforcer is running as standalone and the ASMETA server runs on Docker.

### SLEEC Enforcer Subsystem
The SLEEC Enforcer Subsystem is a ROS2-based package located inside the `ros2_ws/src/sleec_enforcer_subsystem/` folder. It runs three sub-components: `Observation Processor` (Monitor component of the MAPE-K), `Actuation Processor` (Executor), and the Enforcer component (`Enforcer`).

> [!IMPORTANT]
> This component is no longer maintained and not integrated with other components. Refer to the Firefighter Communication Layer for a fully integrated component.

#### Running the SLEEC Enforcer Subsystem (standalone)
> [!NOTE]
> This component is a ROS2-based application. It requires `ROS 2` installed for building and running. Run over a ROS2 environment or using Docker.

> [!NOTE]
> This component is integrated with the [Robot simulator]() component.

Build:
```
cd ros2_ws
colcon build
```

Install dependencies:
```
apt-get update
sudo rosdep init
rosdep update
rosdep install --from-paths src -y --ignore-src
```

Run the Abstraction Communication Layer:
```
. install/setup.bash
ros2 launch sleec_enforcer_subsystem sleec_enforcer_subsystem_launch.py
```

#### Running the SLEEC Enforcer Subsystem (Docker)
Build the Docker image with ROS2:
```
cd ros2_ws
docker build -t sleec-enforcer  .
```

Run:
```
docker run -it -p 8000:8000 -p 8001:8001 --rm --name sleec-enforcer sleec-enforcer
. install/setup.bash
ros2 launch sleec_enforcer_subsystem sleec_enforcer_subsystem_launch.py 
```

### Robot Simulator
The Robot simulator is a ROS2-based package located inside the `ros2_ws/src/robot_sim` folder. It runs a simulated robot publishing messages and listening to mock tasks to be executed.

#### Running the Robot simulator (standalone)
> [!NOTE]
> This component is a ROS2-based application. It requires `ROS 2` installed for building and running. Run over a ROS2 environment or using Docker.

Build:
```
cd ros2_ws
colcon build
```

Install dependencies:
```
apt-get update
sudo rosdep init
rosdep update
rosdep install --from-paths src -y --ignore-src
```

Run the topic publisher:
```
. install/setup.bash
ros2 run robot_sim topic_publisher
```

Run the task executor:
```
. install/setup.bash
ros2 run robot_sim task_executor
```

#### Running the Robot simulator (Docker)
Build the Docker image with ROS2:
```
cd ros2_ws
docker build -t robot-sim  .
```

Run:
```
docker run -it --name robot-sim robot-sim
```

On the same terminal:
```
ros2 run robot_sim topic_publisher
```

On a new terminal:
```
docker exec -it robot-sim bash
. install/setup.bash
ros2 run robot_sim task_executor
```

## Installing dependencies (only for standalone deployment)
Run
```
pip install -r requirements.txt
```
to install the dependencies for the project (ROS2 is excluded. Follow the [ROS2 documentation](https://docs.ros.org/en/humble/Installation.html) to install ROS2)


# Examples

## Firefighter Example

Build the Docker images and start the containers:
```
docker compose up
```

Launch firefighter simulation:
```
docker exec -it sleec-runtime-enforcer-firefighter-sim-1 bash
. install/setup.bash
cd src/firefighter_sim/run/start_simulator.sh
```
