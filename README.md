# Enforcing Ethics at Runtime in Autonomous Systems

This is the replication package for the paper _Enforcing Ethics at Runtime in Autonomous Systems_ submitted to TSE.

## Repository structure
```
sleec-at-runtime
|   README.md                                   # This file
├---ari_web_ws                                  # ROS 2 workspace containing the ROS package for the interaction with ARI web module
|       Dockerfile                              # Dockerile for running the web interface over containerized environment
|       README.md                               # Instructions for running the web interface
|
├---enforcement_subsystem                          # Folder containing the full implementation of the SLEEC@run.time Enforcer Subsystem
|   |   .env.ari-sim                            # Environment variables for runnig the Enforcer Subsystem over Docker for ARI interaction
|   |   .env.ros-deployment                     # Environment variables for runnig the ARI simulator on ROS 2
|   |   docker-compose.yml                      # Docker compose file for running SLEEC@run.time in a containerized environment
|   |   requirements.txt                        # Pip requirements file
|   ├---asmeta_server                           # ASMETA simulation server
|   ├---enforcer                                # Enforcer component and model files
|   |   |   config.template.json                # Parametrized configuration file for the Enforcer Subsystem
|   |   |   Dockerfile                          # Dockerfile for running the Enforcer over containerized environment
|   |   |   entrypoint.sh                       # Enforcer running entrypoint
|   |   |   requirements.txt                    # Pip requirements file
|   |   ├---enforcer                            # Python implementation of the Enforcer component (includes configuration and model uploader)
|   |   └---resources
|   |       ├---libraries
|   |       |       SLEECLibrary.asm            # ASM library file containing the SLEEC constructor
|   |       |       StandardLibrary.asm         # ASM library file for ASMETA
|   |       └---models
|   |               ARIEC.asm                   # ASM SLEEC model for the running scenario
|   |               ARIECHeaders.asm            # ASM model containing signatures and definitions for the running scenario
|   |
|   ├---ros2_ws                                 # ROS 2 workspace containing the ROS packages for the Monitor and Executor compents, plus testing/simulation facilities
|   |   |   Dockerfile                          # Dockerfile for running in a containerized environment
|   |   └---src
|   |       ├---ari_sim                         # ROS 2 package containing a headless simulation of ARI and a command line user interface
|   |       ├---ari_sim_comm_layer              # ROS 2 package containing the implementation of Monitor and Executor components
|   |       └---ari_test_runner                 # ROS 2 package containing the implementation of the Test runner module
|   |
|   └---utils                                   # Utilities for converting ASM in Python data structures
|
├---experiments                                 # Experiment data and results
|   |   Dockerfile                              # Dockerfile for running experiments in a containerized environment
|   |   run_testcases.sh                            # Test running entrypoint
|   |   test_cases_generator.py                 # Test cases generator script
|   ├---results
|   |   ├---analysis                            # Results analysis
|   |   |       analysis.ipynb                  # Jupyter notebook containing results analysis code, data, and charts
|   |   |       extracted_asmeta_data.csv       # CSV containing summary of ASMETA server running data
|   |   |       extracted_enforcer_data.csv     # CSV containing summary of Enforcer running data
|   |   |       extracted_test_results.csv      # CSV containing extracted data for all the test cases run
|   |   └---raw_data                            # Folder containing all the raw log files collected for all the tests
|   └---test_cases                              # Generated test cases used for experiments
|
├---proof_of_concept                            # Video reports of the execution of the ARIEC running scenario over PAL ARI humanoid robot
└---qualitative analysis                        # Inputs and results of the qualitative analysis
```

## Table of Contents
* [Build and run](#build-and-run)
  * [Run the ARI simulation over Docker compose](#run-the-ari-simulation-over-docker-compose)
    * [Interact with the system](#interact-with-the-system)
  * [Run in local testing configuration](#run-in-local-testing-configuration)
    * [Run tests](#run-tests)
  * [Run the components separately](#run-the-components-separately)
    * [Enforcer and ASMETA Server components](#enforcer-and-asmeta-server-components)
    * [Monitor and Executor (Communication Layer)](#monitor-and-executor-communication-layer)
    * [Run simulators/tests](#run-simulatorstests)
    * [Interact with the system](#interact-with-the-system-1)
* [Experiments](#experiments)
  * [Reproducing experiments](#reproducing-experiments)
    * [Deploy and run the Enforcer, ASMETA Server, and RabbitMQ broker](#deploy-and-run-the-enforcer-asmeta-server-and-rabbitmq-broker)
    * [Deploy and run the Monitor and the Executor](#deploy-and-run-the-monitor-and-the-executor)
    * [Deploy the Test runner](#deploy-the-test-runner)
    * [Start the tests](#start-the-tests)
* [Architecture components detail](#architecture-components-detail)
  * [ASMETA server](#asmeta-server)
    * [Running the ASMETA server (standalone)](#running-the-asmeta-server-standalone)
    * [Running the ASMETA server (Docker)](#running-the-asmeta-server-docker)
  * [Enforcer](#enforcer)
    * [Running the Enforcer (standalone)](#running-the-enforcer-standalone)
    * [Running the Enforcer (Docker)](#running-the-enforcer-docker)
  * [Monitor and Executor](#monitor-and-executor)
    * [Running the SLEEC Enforcer Subsystem (standalone)](#running-the-sleec-enforcer-subsystem-standalone)
* [Installing dependencies (only for standalone deployment)](#installing-dependencies-only-for-standalone-deployment)


## Build and run

Clone or download the repository:
```
git clone <REPO_URL>
cd sleec-at-runtime
```

SLEEC@run.time may be run in different deployment options, described below:
- On a single Docker compose ([instructions](#run-the-ari-simulation-over-docker-compose))
- In local testing configuration ([instructions](#run-in-local-testing-configuration))
- Separately ([instructions](#run-the-components-separately))

### Run the ARI simulation over Docker compose
Docker Compose is the recommended way for running the whole system.

```
cd enforcement_subsystem
docker compose --profile ari-sim --env-file .env.ari-sim up --build
```

#### Interact with the system
On a new terminal:
```
docker exec -it sleec-runtime-enforcer-ari-sim-1 bash
. install/setup.bash
ros2 run ari_sim ari_sim_user_interface
```
...and follow the prompted instructions

### Run in local testing configuration
```
cd enforcement_subsystem
docker compose --profile ari-sim-test --env-file .env.ari-sim up --build
```

#### Run tests
On a new terminal:
```
docker exec -it sleec-runtime-enforcer-ari-sim-test-runner-1 bash
```

Generate a new test case if needed (optional):
```
python3 test_cases_generator.py <number_of_cases> <test_case_name>
```

Then run:
```
./run_testcases.sh <test_case_name>
```


### Run the components separately
Alternatively, components can be run separately. This is useful if running the Enforcer Subsystem with a real robot.

> [!NOTE]
> All the components can be run [standalone](#components-detail), although discouraged.

#### Enforcer and ASMETA Server components

> [!NOTE]
> Docker engine and Docker compose are required for running these components

```
cd enforcement_subsystem
docker compose --env-file .env.ros-deployment up --build
```

This command will run the Enforcer component, the ASMETA server, and a RabbitMQ broker. It will load at the startup the ARIEC .asm models. To change default model, change the referenced .env file. The uploaded enforce model must be placed into the `enforcement_subsystem/enforcer/resources/` folder.

#### Monitor and Executor (Communication Layer)

> [!NOTE]
> ROS 2 Humble and Pip are required for running these components.

Install the package dependencies:
```
cd enforcement_subsystem
pip install requirements.txt
```

Install the ROS 2 packages:
```
cd ros2_ws
colcon build
```

Run the Monitor and Executor (on the implementation for the ARIEC scenario):
```
. install/setup.bash
ros2 launch ari_sim_comm_layer ari_sim_comm_layer_launch.py rabbitmq_user:=robotuser rabbitmq_pass:=robotpass
```


#### Run simulators/tests
Run the ARI simulator:
On a new terminal in the `ros2_ws` folder, then run:
```
. install/setup.bash
ros2 launch ari_sim ari_sim_launch.py
```

Run the test runner:
Open a new terminal in the `experiments` folder. Generate a new test case if needed (optional):
```
python3 test_cases_generator.py <number_of_cases> <test_case_name>
```

Then run:
```
cp -r test_cases ../enforcement_subsystem/ros2_ws/
cp run_testcases.sh ../enforcement_subsystem/ros2_ws/
cd ../enforcement_subststem/ros2_ws
chmod +x run_testcases.sh
./run_testcases.sh <test_case_name>
```

#### Interact with the system
Run the simulator as described above and open a new terminal in the `ros2_ws` folder, then run:
```
. install/setup.bash
ros2 run ari_sim ari_sim_user_interface
```
...and follow the prompted instructions

## Experiments
The `experiments` folder contains all the data collected data, analysis software, and results for the experimentation (Section 7.2 in the paper).

- The `results` folder contains:
    - All the collected logs during the experiments: local execution of 250 test cases (`local-ariec250`), robot execution of 250 and 500 test cases (`ariec250`, `ariec500`) and  _ping_ result logs (`ping.txt`).
    - The Jupyter notebook used for running the log results analysis (`analysis.ipynb`) with output attached, the .csv files containing the results summary: ASMETA server running data (`extracted_asmeta_data.csv`), Enforcer running data (`extracted_enforcer_data.csv`), and Test runner results (`extracted_test_results.csv`).

- The `test_cases` folder contains a set of .json files for test cases of different sizes. The test cases sets in `ariec250.json` and `ariec500.json` are the one used in the paper.

- The Python script for the test cases generator (`test_cases_generator.py`). Run it using `python3 test_cases_generator.py <number_of_cases> <name>`.

### Reproducing experiments
#### Deploy and run the Enforcer, ASMETA Server, and RabbitMQ broker
Clone the repository on the machine that will execute the Enforcement Subsystem (Docker and ROS 2 Humble required), then:
```
cd sleec-at-runtime/enforcement_subsystem
pip install requirements.txt
docker compose --env-file .env.ros-deployment up --build
```

#### Deploy and run the Monitor and the Executor:
On a new terminal:
```
cd ros2_ws
colcon build
. install/setup.bash
ros2 launch ari_sim_comm_layer ari_sim_comm_layer_launch.py rabbitmq_user:=robotuser rabbitmq_pass:=robotpass
```

#### Deploy the Test runner:
Copy the ros2 workspace, the test cases folder, and the experiment runner on the robot/device that will run the Test runner.
If using scp, e.g.:
```
scp -r enforcement_subsystem/ros2_ws/ <user>@<host>:<folder_path>
scp -r experiments/test_cases <user>@<host>:<folder_path>/ros2_ws
scp experiments/run_testcases.sh <user>@<host>:<folder_path>/ros2_ws
```

Or, alternatively, download/clone the whole repository on the robot/device and:
```
cd sleec-at-runtime/experiments
cp -r test_cases ../enforcement_subsystem/ros2_ws/
cp run_testcases.sh ../enforcement_subsystem/ros2_ws/
cd ../enforcement_subststem/ros2_ws
chmod +x run_testcases.sh
```

#### Start the tests:
From within the robot/device running the Test runner:
```
cd enforcer_subsystem/ros2_ws
colcon build
./run_testcases.sh <test_case_name>
```

After running the tests, collect the logs generated by the Docker containers and the robot/device running the Test runner for the analysis.


## Architecture components detail
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


### Monitor and Executor
Monitor and Executor are two ROS2-based package located inside the `enforcement/subsystem/ros2_ws/src/ari_sim_comm_layer/` folder.

#### Running the SLEEC Enforcer Subsystem (standalone)
Please refer to the instructions for running this component [separately](#run-the-components-separately)

## Installing dependencies (only for standalone deployment)
Run
```
pip install -r requirements.txt
```
to install the dependencies for the project (ROS2 is excluded. Follow the [ROS2 documentation](https://docs.ros.org/en/humble/Installation.html) to install ROS2)