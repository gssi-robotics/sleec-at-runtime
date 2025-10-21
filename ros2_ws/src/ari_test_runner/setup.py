import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'ari_test_runner'

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
    maintainer='name surname',
    maintainer_email='name.surname@gssi.it',
    description='Firefighter simulated robot package',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'test_runner = ari_test_runner.test_runner_node:main',
        ],
    },
)
