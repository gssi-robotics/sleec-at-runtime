import os
from glob import glob
from setuptools import find_packages, setup

package_name = 'ari_sim'

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
    description='Ari test runner package',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'actions_controller = ari_sim.actions_controller_sim:main',
            'ari_sim_user_interface = ari_sim.ari_sim_user_interface:main',
            'dietary_handler = ari_sim.dietary_handler_sim:main',
            'nurse_comm = ari_sim.nurse_comm_sim:main',
            'patient_data_handler = ari_sim.patient_data_handler_sim:main',
            'training_controller = ari_sim.training_controller_sim:main',
            'tts = ari_sim.tts_sim:main'
        ],
    },
)
