from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        # Battery simulation
        Node(
            package='firefighter_sim',
            executable='battery_sim',
            name='battery_simulator',
            output='screen'
        ),

        # Person presence simulation
        Node(
            package='firefighter_sim',
            executable='presence_sim',
            name='person_presence_simulator',
            output='screen'
        ),

        # Temperature simulation
        Node(
            package='firefighter_sim',
            executable='temperature_sim',
            name='temperature_simulator',
            output='screen'
        ),

        # Wind speed simulation
        Node(
            package='firefighter_sim',
            executable='wind_sim',
            name='wind_speed_simulator',
            output='screen'
        ),

        # Actuator command listener
        Node(
            package='firefighter_sim',
            executable='actuator_listener',
            name='actuator_listener',
            output='screen'
        )
    ])
