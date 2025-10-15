import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'ari_sim_comm_layer'

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
    maintainer='Gianluca Filippone',
    maintainer_email='gianluca.filippone@gssi.it',
    description='Abstract communication layer for simulated Ari\'s SLEEC rules enforcer',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'monitor = ari_sim_comm_layer.monitor.monitor_node:main',            
            'executor = ari_sim_comm_layer.executor.executor_node:main',            
        ],
    },
)
