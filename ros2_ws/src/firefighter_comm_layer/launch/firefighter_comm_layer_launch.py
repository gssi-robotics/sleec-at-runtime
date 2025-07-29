from launch import LaunchDescription
from launch.actions import GroupAction
from launch_ros.actions import Node, PushRosNamespace

def generate_launch_description():
    return LaunchDescription([
        GroupAction([
            PushRosNamespace('firefighter'),
            Node(
                package='firefighter_comm_layer',
                executable='monitor',
                name='monitor',
                output='screen'
            ),
            Node(
                package='firefighter_comm_layer',
                executable='executor',
                name='executor',
                output='screen'
            ),
        ])
    ])
