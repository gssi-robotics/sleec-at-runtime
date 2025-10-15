from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='ari_sim_comm_layer',
            executable='monitor',
            name='monitor',
            output='screen',
        ),
        Node(
            package='ari_sim_comm_layer',
            executable='executor',
            name='executor',
            output='screen'
        ),
    ])
