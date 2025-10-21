from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node

def generate_launch_description():

    rabbitmq_user_arg = DeclareLaunchArgument('rabbitmq_user', default_value='guest')
    rabbitmq_pass_arg = DeclareLaunchArgument('rabbitmq_pass', default_value='guest')

    rabbitmq_user = LaunchConfiguration('rabbitmq_user')
    rabbitmq_pass = LaunchConfiguration('rabbitmq_pass')

    return LaunchDescription([
        rabbitmq_user_arg,
        rabbitmq_pass_arg,
        Node(
            package='ari_sim_comm_layer',
            executable='monitor',
            name='monitor',
            output='screen',
            parameters=[{'rabbitmq_user': rabbitmq_user}, {'rabbitmq_pass': rabbitmq_pass}]
        ),
        Node(
            package='ari_sim_comm_layer',
            executable='executor',
            name='executor',
            output='screen',
            parameters=[{'rabbitmq_user': rabbitmq_user}, {'rabbitmq_pass': rabbitmq_pass}]
        ),
    ])
