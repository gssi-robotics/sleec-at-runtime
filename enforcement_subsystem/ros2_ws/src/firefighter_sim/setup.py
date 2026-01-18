import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'firefighter_sim'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name, 'launch'), glob('launch/*.py')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Sara Pettinari',
    maintainer_email='sara.pettinari@gssi.it',
    description='Firefighter simulated robot package',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'battery_sim = firefighter_sim.battery_sim:main',
            'presence_sim = firefighter_sim.presence_sim:main',
            'temperature_sim = firefighter_sim.temperature_sim:main',
            'wind_sim = firefighter_sim.wind_sim:main',
            'actuator_listener = firefighter_sim.actuator_listener:main',
        ],
    },
)
