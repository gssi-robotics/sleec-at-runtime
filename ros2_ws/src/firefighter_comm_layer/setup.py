import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'firefighter_comm_layer'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name, 'launch'), glob('launch/*'))
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Name Surname',
    maintainer_email='name.surname@email.com',
    description='Abstract communication layer for Firefighter example SLEEC rules enforcer',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'monitor = firefighter_comm_layer.monitor_node:main',            
            'executor = firefighter_comm_layer.executor_node:main',            
        ],
    },
)
