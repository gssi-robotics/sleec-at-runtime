import json
from std_msgs.msg import Bool, Float32, String, Int32
from sensor_msgs.msg import Temperature

from ari_sim_comm_layer.ARI_model_structures import Conditions, GlucoseLevel, TimeOfDay, Permission
# from ari_sim_comm_layer.monitor.monitor_utils import publish_on_change

meal_times = ["12:30", "18:30"]
start_session_times = ["10:00", "16:00"]
training_times = ["10:15", "16:15"]

class ConditionsProcessor():
    def __init__(self, node, publisher):
        self.node = node
        self.publisher = publisher
        self.conditions = Conditions()

        self.get_logger().info("Conditions Processor started")

    def get_logger(self):
        return self.node.get_logger()

    def reset_callback(self, msg):
        self.conditions = Conditions()
        self.get_logger().info("Resetting conditions")

    def publish_on_change(func):
        '''Decorator to publish the condition via RabbitMQ if it has changed after executing the function.'''
        def wrapper(self, *args, **kwargs):
            # copy of the old condition object
            prev = Conditions()
            prev.__dict__.update(self.conditions.export_dict())

            def has_condition_changed(current_conditions: Conditions, previous_conditions: Conditions) -> bool:
                '''Check if the condition has changed compared to the previous state.'''
                return current_conditions.__dict__ != previous_conditions.__dict__

            # run the function
            func(self, *args, **kwargs)

            # publish if changed
            if has_condition_changed(self.conditions, prev):
                json_str = json.dumps(vars(self.conditions), default=str)
                try:
                    self.publisher.publish(json_str)
                    self.get_logger().info(f"[RabbitMQ] Published: {json_str}")
                except Exception as e:
                    self.get_logger().error(f"[RabbitMQ] publish failed: {e}")
        return wrapper
    
    @publish_on_change
    def time_callback(self, msg: String):
        time = msg.data
        self.get_logger().info(f"Received time data: {time}")
        if time in meal_times:
            self.conditions.timeOfDay = TimeOfDay.MEALTIME
        elif time in start_session_times:
            self.conditions.timeOfDay = TimeOfDay.STARTTRAININGTIME
        elif time in training_times:
            self.conditions.timeOfDay = TimeOfDay.TRAININGTIME
        else:
            self.conditions.timeOfDay = TimeOfDay.ANOTHERTIME

    @publish_on_change
    def user_privacy_concern_callback(self, msg: Bool):
        self.get_logger().info(f"Received user privacy concern: {msg.data}")
        self.conditions.userPrefersPrivacy = msg.data

    @publish_on_change
    def user_open_door_permission_callback(self, msg: String):
        self.get_logger().info(f"Received user permission: {msg.data}")
        if msg.data == "Yes":
            self.conditions.userDoorOpenConsent = Permission.GRANTED
        elif msg.data == "No":
            self.conditions.userDoorOpenConsent = Permission.DENIED
        else:
            self.conditions.userDoorOpenConsent = Permission.UNKNOWN

    @publish_on_change
    def room_temperature_callback(self, msg: Temperature):
        temperature = msg.temperature
        self.get_logger().info(f"Received temperature data: {temperature}")
        self.conditions.roomTemperature = int(temperature)

    @publish_on_change
    def user_exercising_callback(self, msg: Bool):
        self.get_logger().info(f"Received user exercising status: {msg.data}")
        self.conditions.userExercising = msg.data

    @publish_on_change
    def exercise_count_callback(self, msg: Int32):
        count = msg.data
        self.get_logger().info(f"Received user exercising repetition count: {msg.data}")
        if count < 5:
            self.conditions.fewerExerciseRepetitions = True
        else:
            self.conditions.fewerExerciseRepetitions = False

    @publish_on_change
    def user_encouraged_callback(self, msg):
        self.get_logger().info("Received user encourage report")
        self.conditions.userEncouraged = True

    @publish_on_change
    def user_physical_alerts_callback(self, msg: Bool):
        self.get_logger().info(f"Received user physical issues report: {msg.data}")
        self.conditions.userPhysicalIssues = msg.data

    @publish_on_change
    def user_complains_callback(self, msg):
        self.get_logger().info("Received user complain report")
        self.conditions.userComplains = True

    @publish_on_change
    def user_exercise_preferences_callback(self, msg: Bool):
        self.get_logger().info(f"Received user exercise preferences: silent: {msg.data}")
        self.conditions.userSilentExercisePreference = msg.data

    @publish_on_change
    def data_request_callback(self, msg):
        self.get_logger().info("Received data request callback")
        self.conditions.requestUserData = True

    @publish_on_change
    def user_consent_granted_callback(self, msg: Bool):
        self.get_logger().info(f"Received user consent granting: {msg.data}")
        self.conditions.userDataConsentGranted = msg.data

    @publish_on_change
    def authorized_access_callback(self, msg: Bool):
        self.get_logger().info(f"Received access autorization: {msg.data}")
        self.conditions.unauthorizedPerson = not msg.data

    @publish_on_change
    def user_ready_callback(self, msg):
        self.get_logger().info("Received user ready report")
        self.conditions.userReadyToEat = True

    @publish_on_change
    def user_sleep_status_callback(self, msg: String):
        sleep_status = msg.data # "REM", "Light", "No"
        self.get_logger().info(f"Received user sleep status: {msg.data}")
        if sleep_status == "REM":
            self.conditions.userIsSleeping = True
            self.conditions.userInRemSleep = True
        elif sleep_status == "Light":
            self.conditions.userIsSleeping = True
            self.conditions.userInRemSleep = False
        else:
            self.conditions.userIsSleeping = False
            self.conditions.userInRemSleep = False

    @publish_on_change
    def glucose_value_callback(self, msg: Float32):
        level = msg.data
        self.get_logger().info(f"Received glucose value update: {level}")
        if level <= 70:
            self.conditions.glucoseLevel = GlucoseLevel.VERYLOW
        elif level <= 85:
            self.conditions.glucoseLevel = GlucoseLevel.LOW
        elif level < 120:
            self.conditions.glucoseLevel = GlucoseLevel.NORMAL
        else:
            self.conditions.glucoseLevel = GlucoseLevel.HIGH

    @publish_on_change
    def user_request_food_callback(self, msg):
        self.get_logger().info("Received user food request")
        self.conditions.userRequestsFood = True

    @publish_on_change
    def medical_emergency_callback(self, msg):
        self.get_logger().info("Received medical emergency alert")
        self.conditions.medicalEmergencyAlert = True

    @publish_on_change
    def user_refuse_diet_callback(self, msg):
        self.get_logger().info("Received user diet refusal")
        self.conditions.userDietRefusal = True

    @publish_on_change
    def last_exercise_result_callback(self, msg: String):
        result = msg.data # Poor, Sufficient, Good, Excellent
        self.get_logger().info(f"Received exercise result: {msg.data}")
        if result in ["Good", "Excellent"]:
            self.conditions.differentFoodAllowed = True
        else:
            self.conditions.differentFoodAllowed = False
