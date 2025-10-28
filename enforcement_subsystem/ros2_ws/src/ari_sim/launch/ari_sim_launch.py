from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='ari_sim',
            executable='actions_controller',
            name='actions_controller_sim',
            output='screen'
        ),
        Node(
            package='ari_sim',
            executable='dietary_handler',
            name='dietary_handler_sim',
            output='screen'
        ),
        Node(
            package='ari_sim',
            executable='nurse_comm',
            name='nurse_comm_sim',
            output='screen'
        ),
        Node(
            package='ari_sim',
            executable='patient_data_handler',
            name='patient_data_handler_sim',
            output='screen'
        ),
        Node(
            package='ari_sim',
            executable='training_controller',
            name='training_controller_sim',
            output='screen'
        ),
        Node(
            package='ari_sim',
            executable='tts',
            name='tts_sim',
            output='screen'
        )
    ])
