# ari-ros2-sleec-runtime-enforcer
SLEEC rules enforcer @ runtime for Ari over ROS2 using Asmeta

## Components
### Enforcer
The `enforcer/` folder contains the enforcer component. It runs the A and P components of the MAPE-K loop.

#### Running the enforcer
```
cd enforcer
python3 enforcer.py
```

> [!NOTE]
> `httpx` package is required. [Installing dependencies](#installing-dependencies)

### Abstraction Communication Layer
The Abstraction Communication Layer is a ROS2-based package located inside the `ros2_ws/src/sleec_enforcer_subsystem/` folder. It runs two sub-components: `Observation Processor` (Monitor component of the MAPE-K) and `Actuation Processor` (Executor).

#### Running the Abstraction Communication Layer
> [!NOTE]
> This component is a ROS2-based application. It requires `ROS 2` installed for building and running. Otherwise, refer to the [mocked version](#mock-of-the-abstraction-communication-layer).

Install:
```
cd ros2_ws
colcon build
. install/setup.bash
```

Run:
```
ros2 launch sleec_enforcer_subsystem abstraction_communication_layer_launch.py 
```

### Mock of the Abstraction Communication Layer
The `comm_layer_mock/` folder contains a mocked version of the Abstraction Communication Layer for development and testing purposes. It does not require ROS2 to run. It runs the `probe` endpoint on the port `8000` and the `obligation` endporint on the port `8001`

#### Running the enforcer
```
cd comm_layer_mock
python3 mock.py
```

> [!NOTE]
> `fastapi` and `uvicorn` packages are required. [Installing dependencies](#installing-dependencies)

### Robot simulator
This repository contains a mock simulation of the robot to test the whole system. It is implemented as a ROS2 package within `ros2_ws/src/robot_sim/`.

#### Running the mock robot simulator
Install:
```
cd ros2_ws
colcon build
. install/setup.bash
```

Run:
```
ros2 launch robot_sim robot_sim_launch.py
```

## Installing dependencies
Run
```
pip install -r requirements.txt
```
to install the dependencies for the project (ROS2 is excluded. Follow the [ROS2 documentation](https://docs.ros.org/en/humble/Installation.html) to install ROS2)