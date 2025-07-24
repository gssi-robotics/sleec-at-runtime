from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='sleec_enforcer_subsystem',
            executable='monitor',
            name='monitor',
            output='screen'
        ),
        # Node(
        #     package='sleec_enforcer_subsystem',
        #     executable='executor',
        #     name='executor',
        #     output='screen'
        # ),
    ])
