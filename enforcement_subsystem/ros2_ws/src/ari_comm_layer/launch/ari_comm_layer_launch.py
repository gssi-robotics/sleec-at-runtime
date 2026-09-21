from launch import LaunchDescription
from launch.actions import DeclareLaunchArgument
from launch.substitutions import LaunchConfiguration
from launch_ros.parameter_descriptions import ParameterValue
from launch_ros.actions import Node

def generate_launch_description():

    rabbitmq_host_arg = DeclareLaunchArgument('rabbitmq_host', default_value='rabbitmq')
    rabbitmq_user_arg = DeclareLaunchArgument('rabbitmq_user', default_value='guest')
    rabbitmq_pass_arg = DeclareLaunchArgument('rabbitmq_pass', default_value='guest')
    robot_host_arg = DeclareLaunchArgument('robot_host', default_value='10.68.0.1')
    robot_port_arg = DeclareLaunchArgument('robot_port', default_value='80')

    rabbitmq_host = LaunchConfiguration('rabbitmq_host')
    rabbitmq_user = LaunchConfiguration('rabbitmq_user')
    rabbitmq_pass = LaunchConfiguration('rabbitmq_pass')
    robot_host = LaunchConfiguration('robot_host')
    robot_port = ParameterValue(LaunchConfiguration('robot_port'), value_type=int)

    return LaunchDescription([
        rabbitmq_host_arg,
        rabbitmq_user_arg,
        rabbitmq_pass_arg,
        robot_host_arg,
        robot_port_arg,
        Node(
            package='ari_comm_layer',
            executable='monitor',
            name='monitor',
            output='screen',
            parameters=[{'rabbitmq_host': rabbitmq_host}, {'rabbitmq_user': rabbitmq_user}, {'rabbitmq_pass': rabbitmq_pass}]
        ),
        Node(
            package='ari_comm_layer',
            executable='executor',
            name='executor',
            output='screen',
            parameters=[{'rabbitmq_host': rabbitmq_host}, {'rabbitmq_user': rabbitmq_user}, {'rabbitmq_pass': rabbitmq_pass}, {'robot_host': robot_host}, {'robot_port': robot_port}]
        ),
    ])
