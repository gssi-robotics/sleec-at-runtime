# Enforcing Ethics at Runtime in Autonomous Systems

This is the replication package for the paper _Enforcing Ethics at Runtime in Autonomous Systems_ submitted to TSE.

## Table of Contents
- [Repository structure](#repository-structure)
- [Build and run](#build-and-run)
  - [Run the ARI simulation over Docker compose](#run-the-ari-simulation-over-docker-compose)
    - [Interact with the system](#interact-with-the-system)
  - [Run in local (Docker) testing configuration](#run-in-local-docker-testing-configuration)
    - [Run tests](#run-tests)
    - [Run scalability tests](#run-scalability-tests)
  - [Run the components separately](#run-the-components-separately)
    - [Enforcer and ASMETA Server components](#enforcer-and-asmeta-server-components)
    - [Monitor and Executor (Communication Layer)](#monitor-and-executor-communication-layer)
    - [Run simulators/tests](#run-simulatorstests)
    - [Interact with the system](#interact-with-the-system-1)
- [Experiments](#experiments)
  - [Reproducing experiments](#reproducing-experiments)
    - [1. Deploy and run the Enforcer, ASMETA Server, and RabbitMQ broker](#1-deploy-and-run-the-enforcer-asmeta-server-and-rabbitmq-broker)
    - [2. Deploy and run the Monitor and the Executor](#2-deploy-and-run-the-monitor-and-the-executor)
    - [3. Deploy the Test Runner](#3-deploy-the-test-runner)
    - [4a. Start the tests](#4a-start-the-tests)
    - [4b. Start the scalability tests](#4b-start-the-scalability-tests)
    - [5. Collect log files](#5-collect-log-files)
  - [Analyzing results](#analyzing-results)
- [Architecture components detail](#architecture-components-detail)
  - [ASMETA server](#asmeta-server)
    - [Running the ASMETA server (standalone)](#running-the-asmeta-server-standalone)
    - [Running the ASMETA server (Docker)](#running-the-asmeta-server-docker)
  - [Enforcer](#enforcer)
    - [Running the Enforcer (standalone)](#running-the-enforcer-standalone)
    - [Running the enforcer (Docker)](#running-the-enforcer-docker)
  - [Monitor and Executor](#monitor-and-executor)
    - [Running the SLEEC Enforcement Subsystem (standalone)](#running-the-sleec-enforcement-subsystem-standalone)
- [Installing dependencies (only for standalone deployment)](#installing-dependencies-only-for-standalone-deployment)

## Repository structure
```
sleec-at-runtime
|   README.md                                       # This file
├---ari_web_ws                                      # ROS 2 workspace containing the ROS package for the interaction with ARI web module
|       Dockerfile                                  # Dockerile for running the web interface over containerized environment
|       README.md                                   # Instructions for running the web interface
|
├---enforcement_subsystem                           # Folder containing the full implementation of the SLEEC@run.time Enforcement Subsystem
|   |   .env.ari-sim                                # Environment variables for runnig the Enforcement Subsystem over Docker for ARI interaction
|   |   .env.ros-deployment                         # Environment variables for runnig the ARI simulator on ROS 2
|   |   docker-compose.yml                          # Docker compose file for running SLEEC@run.time in a containerized environment
|   |   requirements.txt                            # Pip requirements file
|   ├---asmeta_server                               # ASMETA simulation server
|   ├---enforcer                                    # Enforcer component and model files
|   |   |   config.template.json                    # Parametrized configuration file for the Enforcement Subsystem
|   |   |   Dockerfile                              # Dockerfile for running the Enforcer over containerized environment
|   |   |   entrypoint.sh                           # Enforcer running entrypoint
|   |   |   requirements.txt                        # Pip requirements file
|   |   ├---enforcer                                # Python implementation of the Enforcer component (includes configuration and model uploader)
|   |   └---resources
|   |       ├---libraries
|   |       |       SLEECLibrary.asm                # ASM library file containing the SLEEC constructor
|   |       |       StandardLibrary.asm             # ASM library file for ASMETA
|   |       └---models
|   |               ARIEC.asm                       # ASM SLEEC model for the running scenario
|   |               ARIECHeaders.asm                # ASM model containing signatures and definitions for the running scenario
|   |
|   ├---ros2_ws                                     # ROS 2 workspace containing the ROS packages for the Monitor and Executor compents, plus testing/simulation facilities
|   |   |   Dockerfile                              # Dockerfile for running in a containerized environment
|   |   └---src
|   |       ├---ari_sim                             # ROS 2 package containing a headless simulation of ARI and a command line user interface
|   |       ├---ari_sim_comm_layer                  # ROS 2 package containing the implementation of Monitor and Executor components
|   |       └---ari_test_runner                     # ROS 2 package containing the implementation of the Test Runner module
|   |
|   └---utils                                       # Utilities for converting ASM in Python data structures
|
├---experiments                                     # Experiment data and results
|   |   Dockerfile                                  # Dockerfile for running experiments in a containerized environment
|   |   run_testcases.sh                            # Test running entrypoint
|   |   test_cases_generator.py                     # Test cases generator script
|   ├---results
|   |   ├---analysis                                # Results analysis
|   |   |       analysis.ipynb                      # Jupyter notebook containing results analysis code, data, and charts
|   |   |       extracted_asmeta_data.csv           # CSV containing summary of ASMETA server running data
|   |   |       extracted_enforcer_data.csv         # CSV containing summary of Enforcer running data
|   |   |       extracted_test_results.csv          # CSV containing extracted data for all the test cases run
|   |   ├---raw_data                                # Folder containing all the raw log files collected for all the tests
|   |   └---scalability
|   |       ├---analysis                            # Results analysis for the scalability tests
|   |       |       extracted_asmeta_data.csv       # CSV containing summary of ASMETA server running data
|   |       |       extracted_enforcer_data.csv     # CSV containing summary of Enforcer running data
|   |       |       extracted_test_runner_data.csv  # CSV containing summary of Test Runner running data
|   |       |       scalability_analysis.ipynb      # Jupyter notebook containing results analysis code, data, and charts
|   |       └---raw_data                            # Folder containing all the raw log files collected for all scalability the tests
|   ├---scalability_test_cases                      # Generators and generated test cases for scalability tests
|   |       ├---configurators                       # Configurator script for dynamically uploading ASM models to ASMETA Server
|   |       ├---generators                          # Generators for SLEECLibrary, ASM models, and test cases for scalability tests
|   |       ├---libraries                           # Generated SLEECLibrary models for scalability tests
|   |       ├---models                              # Generated ASM models for scalability tests
|   |       └---test_cases                          # Generated test cases used for scalability tests
|   └---test_cases                                  # Generated test cases used for experiments
|
├---proof_of_concept                                # Video reports of the execution of the ARIEC running scenario over PAL ARI humanoid robot
└---qualitative analysis                            # Inputs and results of the qualitative analysis
```

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

### Run in local (Docker) testing configuration
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

#### Run scalability tests
On a new terminal:
```
docker exec -it sleec-runtime-enforcer-ari-sim-test-runner-1 bash
```

Generate a new test case if needed (optional):
```
python3 scalability_test_cases_generator.py -r <#rules> -c <#conditions> -n <#test_cases>
```

Then run:
```
./run_scalability_tests.sh <#rules> <#conditions> docker
```

### Run the components separately
Alternatively, components can be run separately. This is useful if running the Enforcement Subsystem with a real robot.

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

Run the Test Runner:
Open a new terminal in the `experiments` folder.

Generate a new test cases if needed (optional). For testing the usecase:
```
python3 test_cases_generator.py <number_of_cases> <test_case_name>
```

For scalability tests:
```
cd scalability_test_cases
python3 scalability_test_cases_generator.py -r <#rules> -c <#conditions> -n <#test_cases>
cd ..
```

Test the usecase:
```
cp -r test_cases ../enforcement_subsystem/ros2_ws/
cp run_testcases.sh ../enforcement_subsystem/ros2_ws/
cd ../enforcement_subststem/ros2_ws
chmod +x run_testcases.sh
./run_testcases.sh <test_case_name>
```

Run the scalability tests:
```
cp -r scalability_test_cases ../enforcement_subsystem/ros2_ws/
cp run_scalability_tests.sh ../enforcement_subsystem/ros2_ws/
cd ../enforcement_subststem/ros2_ws
chmod +x run_scalability_tests.sh
./run_scalability_tests.sh <#rules> <#conditions> ros
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
    - The Jupyter notebook used for running the log results analysis (`analysis.ipynb`) with output attached, the .csv files containing the results summary: ASMETA server running data (`extracted_asmeta_data.csv`), Enforcer running data (`extracted_enforcer_data.csv`), and Test Runner results (`extracted_test_results.csv`).

- The `test_cases` folder contains a set of .json files for test cases of different sizes. The test cases sets in `ariec250.json` and `ariec500.json` are the one used in the paper.

- The Python script for the test cases generator (`test_cases_generator.py`). Run it using `python3 test_cases_generator.py <number_of_cases> <name>`.

### Reproducing experiments
Follow the steps below to reproduce the experiments in the same setting as in the paper:

#### 1. Deploy and run the Enforcer, ASMETA Server, and RabbitMQ broker
Clone the repository on the machine that will execute the Enforcement Subsystem (Docker and ROS 2 Humble required), then:
```
cd sleec-at-runtime/enforcement_subsystem
pip install requirements.txt
docker compose --env-file .env.ros-deployment up --build
```

#### 2. Deploy and run the Monitor and the Executor:
On a new terminal:
```
cd ros2_ws
colcon build
. install/setup.bash
ros2 launch ari_sim_comm_layer ari_sim_comm_layer_launch.py rabbitmq_user:=robotuser rabbitmq_pass:=robotpass
```

#### 3. Deploy the Test Runner:
Copy the ros2 workspace, the test cases folders, and the experiment runner on the robot/device that will run the Test Runner.
If using scp, e.g.:
```
scp -r enforcement_subsystem/ros2_ws/ <user>@<host>:<folder_path>
scp -r experiments/test_cases <user>@<host>:<folder_path>/ros2_ws
scp experiments/run_testcases.sh <user>@<host>:<folder_path>/ros2_ws
scp experiments/run_testcasesrun_scalability_tests.sh <user>@<host>:<folder_path>/ros2_ws
scp -r experiments/scalability_test_cases <user>@<host>:<folder_path>/ros2_ws
```

Or, alternatively, download/clone the whole repository on the robot/device and:
```
cd sleec-at-runtime/experiments
cp -r test_cases ../enforcement_subsystem/ros2_ws/
cp run_testcases.sh ../enforcement_subsystem/ros2_ws/
cp -r run_scalability_tests ../enforcement_subsystem/ros2_ws/
cp run_scalability_tests.sh ../enforcement_subsystem/ros2_ws/
cd ../enforcement_subsystem/ros2_ws
chmod +x run_testcases.sh
chmod +x run_scalability_tests.sh
```

#### 4a. Start the tests:
From within the robot/device running the Test Runner:
```
cd enforcer_subsystem/ros2_ws
colcon build
./run_testcases.sh <test_case_name>
```

#### 4b. Start the scalability tests:
> [!NOTE]
> `requests` python package is required. Install using `pip install requests`.

From within the robot/device running the Test Runner:
```
cd enforcer_subsystem/ros2_ws
colcon build
./run_scalability_tests.sh <test_name> <#rules> <#conditions> ros
```

#### 5. Collect log files
After running the tests, collect the logs generated by the Docker containers and the robot/device running the Test Runner for the analysis.

> [!NOTE]
> The log files must be placed in the `raw_data` folder to run the analysis. Logs collected from test cases (e.g., ariec) must be placed in the `experiments/raw_data/<test_case_name>/` folder, while logs collected for scalability tests must be placed in the `experiments/scalability/raw_data/<test_name>/` folder.

- To collect logs generated by the ASMETA server, run:
```
docker logs sleec-runtime-enforcer-asmeta-server-1 > <path/to/raw_data/test_name/>asmeta-server.log
```

- To collect logs generated by the Enforcer, run:
  ```
  docker cp sleec-runtime-enforcer-enforcer-1:/sleec_enforcer/enforcer/log/ <path/to/raw_data/test_name/>
  ```
  This will download all the log files. The log files for the last run is the newest one. Rename it into `enforcer.log` and remove the other downloaded log files.

- To collect logs generated by the Test Runner, either: (i) copy the log from the Test Runner shell window into a new file named `text-runner` within the `raw_data/` folder, or (ii) copy the the ROS 2 log file into the `raw_data/` folder, using scp from the local computer:

  ```
  scp <user>@<host>:<folder_path>/root/.ros/log/*.log <path/to/raw_data/test_name/>
  ```
  This will download all the log files. Rename the newest log into `test-runner.log` and remove the other downloaded log files.

  If the test runner is running on a docker container, download the log files using
  ```
  docker cp sleec-runtime-enforcer-ari-sim-test-runner-1:/root/.ros/log/ <path/to/raw_data/test_name/>
  ```
  And select the newest file.

  > [!NOTE]
  > Using the on-screen logs from the Test Runner window is preferred as ROS2 may not have flushed the entire stdout buffer in the log file.

### Analyzing results
The Jupyter notebook file `analysis.ipynb` within the `experiments/results/analysis/` folder contains the analysis of the results for the test cases run. To run it over newly collected data, update the `log_dirs` list with the list of experiments whose log files are collected and stored in the `raw_data/` folder, and run again the Jupyter notebook to view the results. The analysis reports the consistency of the enforced obligations againts the expected ones, and the time overhead over the observed components.

The Jupyter notebook file `scalability_analysis.ipynb` within the `experiments/results/scalabilty/analysis/` folder contains the analysis of the scalability tests. To run it over newly collected, data, update the `log_dirs` list with the list of experiments whose log files are collected and stored in the `scalability/raw_data/` folder, and run again the Jupyter notebook to view the results. The analysis reports the overhead on each observed component with respect to the scalability tests executed with test cases of different sizes.

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

#### Running the SLEEC Enforcement Subsystem (standalone)
Please refer to the instructions for running this component [separately](#run-the-components-separately)

## Installing dependencies (only for standalone deployment)
Run
```
pip install -r requirements.txt
```
from within the `enforcement_subsystem/` folder to install the dependencies for the project (ROS2 is excluded. Follow the [ROS2 documentation](https://docs.ros.org/en/humble/Installation.html) to install ROS2)