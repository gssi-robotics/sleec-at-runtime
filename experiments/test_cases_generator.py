import os
import json
import random
import sys
from datetime import datetime

meal_times = ["12:30", "18:30"]
start_session_times = ["10:00", "16:00"]
training_times = ["10:15", "16:15"]
other_times = ["09:00", "14:00", "20:00"]

coverage = {
    "SLEEC1 - default rule": 0,
    "SLEEC1 - hedge clause 1": 0,
    "SLEEC1 - hedge clause 2": 0,
    "SLEEC1a - default rule": 0,
    "SLEEC1b - default rule": 0,
    "SLEEC2 - default rule": 0,
    "SLEEC2 - hedge clause 1": 0,
    "SLEEC2 - hedge clause 2": 0,
    "SLEEC2 - hedge clause 3": 0,
    "SLEEC2a - default rule": 0,
    "SLEEC2a - hedge clause 1": 0,
    "SLEEC3 - default rule": 0,
    "SLEEC3 - hedge clause 1": 0,
    "SLEEC4 - default rule": 0,
    "SLEEC4 - hedge clause 1": 0,
    "SLEEC4 - hedge clause 2": 0,
    "SLEEC4 - hedge clause 3": 0,
    "SLEEC5 - default rule": 0,
    "SLEEC5 - hedge clause 1": 0,
    "SLEEC6 - default rule": 0,
    "SLEEC6 - hedge clause 1": 0,
    "SLEEC6 - hedge clause 2": 0
}

def get_SLEEC1(time, user_privacy_concern, room_temperature, user_open_door_permission):
    if (time in start_session_times) and not user_privacy_concern:
        return ("greetInUserLanguage AND startTrainingSession", "SLEEC1 - default rule")
    if (time in start_session_times) and user_privacy_concern and not (room_temperature >= 26):
        return ("greetInUserLanguage AND closeDoor AND startTrainingSession", "SLEEC1 - hedge clause 1")
    if (time in start_session_times) and user_privacy_concern and (room_temperature >= 26) and (user_open_door_permission == "Unknown"):
        return ("askPermissionForOpenDoor", "SLEEC1 - hedge clause 2")
    if (time in start_session_times) and user_privacy_concern and (room_temperature >= 26) and (user_open_door_permission != "Unknown"):
        return None
    return None

def get_SLEEC1a(time, room_temperature, user_open_door_permission):
    if (time in start_session_times) and (room_temperature >= 26) and (user_open_door_permission == "Yes"):
        return ("greetInUserLanguage AND startTrainingSession", "SLEEC1a - default rule")
    return None

def get_SLEEC1b(time, room_temperature, user_open_door_permission):
    if (time in start_session_times) and (room_temperature >= 26) and (user_open_door_permission == "No"):
        return ("alertNurse AND closeDoor", "SLEEC1b - default rule")
    return None

def get_SLEEC2(time, user_exercising, exercise_count, user_encouraged, user_physical_alerts):
    if (time in training_times) and (not user_exercising) and not (exercise_count < 5):
        return ("showNextExercise", "SLEEC2 - default rule")
    if (time in training_times) and (not user_exercising) and (exercise_count < 5) and not user_encouraged:
        return ("encourage", "SLEEC2 - hedge clause 1")
    if (time in training_times) and (not user_exercising) and (exercise_count < 5) and user_encouraged and not user_physical_alerts:
        return ("askUserIntent", "SLEEC2 - hedge clause 2")
    if (time in training_times) and (not user_exercising) and (exercise_count < 5) and user_encouraged and user_physical_alerts:
        return ("notifySessionEnd AND alertNurse", "SLEEC2 - hedge clause 3")
    return None

def get_SLEEC2a(user_exercising, user_complains, user_exercise_preferences):
    if user_exercising and user_complains and not user_exercise_preferences:
        return ("encourage", "SLEEC2a - default rule")
    if user_exercising and user_complains and user_exercise_preferences:
        return (None, "SLEEC2a - hedge clause 1")
    return None

def get_SLEEC3(data_request, user_consent_granted, authorized_access):
    if data_request and not (not user_consent_granted or not authorized_access):
        return ("shareData", "SLEEC3 - default rule")
    if data_request and (not user_consent_granted or not authorized_access):
        return ("denyDataSharingWithExplanation", "SLEEC3 - hedge clause 1")
    return None

def get_SLEEC4(time, user_ready, user_sleep_status, glucose_value):
    if (time in meal_times) and not user_ready and user_sleep_status == "No":
        return ("remindUserMealTime", "SLEEC4 - default rule")
    if (time in meal_times) and not user_ready and user_sleep_status == "Light":
        return ("wakeUpUser", "SLEEC4 - hedge clause 1")
    if (time in meal_times) and not user_ready and user_sleep_status == "REM" and not (glucose_value <= 70):
        return ("informNurse", "SLEEC4 - hedge clause 2")
    if (time in meal_times) and not user_ready and user_sleep_status == "REM" and (glucose_value <= 70):
        return ("alertNurse", "SLEEC4 - hedge clause 3")
    return None

def get_SLEEC5(time, user_request_food, glucose_value):
    if user_request_food and not (time in meal_times) and not (glucose_value <= 85):
        return ("remindUserMealTime AND explainNoFood", "SLEEC5 - default rule")
    if user_request_food and not (time in meal_times) and (glucose_value <= 85):
        return ("giveDietarySnack AND informNurse", "SLEEC5 - hedge clause 1")
    return None

def get_SLEEC6(time, user_ready, user_refuse_diet, exercise_result):
    if (time in meal_times) and user_ready and not user_refuse_diet:
        return ("deliverMeal", "SLEEC6 - default rule")
    if (time in meal_times) and user_ready and user_refuse_diet and not (exercise_result in ["Good", "Excellent"]):
        return ("explainDietAdherenceReason AND deliverMeal", "SLEEC6 - hedge clause 1")
    if (time in meal_times) and user_ready and user_refuse_diet and (exercise_result in ["Good", "Excellent"]):
        return ("deliverDietaryAlternative", "SLEEC6 - hedge clause 2")
    return None

def generate_test_cases(n):
    test_cases = {"coverage": coverage, "test_cases": []}

    for i in range(1, n + 1):

        time = random.choice(meal_times + start_session_times + training_times + other_times)

        # Used in SLEEC 1, 1a, 1b, 2, 2a
        user_privacy_concern = random.choice([True, False])
        room_temperature = random.randint(19, 28)
        user_open_door_permission = random.choice(["Yes", "No", "Unknown"]) if user_privacy_concern else "Unknown"
        user_exercising = random.choice([True, False]) if time in training_times else False # If during exercising, otherwise is False
        exercise_count = random.randint(3, 6) if time in training_times else 0 # If during exercising, otherwise is 0
        user_encouraged = random.choice([True, False]) if time in training_times else False # If during exercising, otherwise is False
        user_physical_alerts = random.choice([True, False]) if time in training_times else False # If during exercising, otherwise is False
        user_complains = random.choice([True, False]) if time in training_times else False # If during exercising, otherwise is False
        user_exercise_preferences = random.choice([True, False])

        # Used in SLEEC 3
        data_request = random.choice([True, False]) if time in other_times else False # Simulate request data only if not during meal time or training time
        user_consent_granted = random.choice([True, False]) # For data sharing
        authorized_access = random.choice([True, False]) if data_request else False

        # Used in SLEEC 4, 5, 6
        user_ready = random.choice([True, False]) if time in meal_times else False # Check only if at meal time
        user_sleep_status = random.choice(["REM", "Light", "No"]) if time in meal_times else "NO" # Simulate sleep only during meal time... can't happen while training!
        glucose_value = random.randint(60, 120)
        user_request_food = random.choice([True, False]) if not data_request and time in other_times else False # Handle a request at a time: if there is no data request, then there can be a food request
        medical_emergency = random.choice([True, False])
        user_refuse_diet = random.choice([True, False]) if time in meal_times else False # Diet can be refused only during meal time
        exercise_result = random.choice(["Poor", "Sufficient", "Good", "Excellent"])

        def compute_expected_behaviours():
            sleec_results = [
                get_SLEEC1(time, user_privacy_concern, room_temperature, user_open_door_permission),
                get_SLEEC1a(time, room_temperature, user_open_door_permission),
                get_SLEEC1b(time, room_temperature, user_open_door_permission),
                get_SLEEC2(time, user_exercising, exercise_count, user_encouraged, user_physical_alerts),
                get_SLEEC2a(user_exercising, user_complains, user_exercise_preferences),
                get_SLEEC3(data_request, user_consent_granted, authorized_access),
                get_SLEEC4(time, user_ready, user_sleep_status, glucose_value),
                get_SLEEC5(time, user_request_food, glucose_value),
                get_SLEEC6(time, user_ready, user_refuse_diet, exercise_result)
            ]
            return [b for b in sleec_results if b is not None]

        expected_behaviours = compute_expected_behaviours()

        if len(expected_behaviours) > 1:
            print(f"Test case {i} has more than one expected behaviour!")
        if len(expected_behaviours) < 1:
            print(f"Test case {i} has no expected behaviour!")

        expected_obligation = []
        expected_rule = []
        for (obligation, rule) in expected_behaviours:
            if obligation:
                expected_obligation.append(obligation)
            expected_rule.append(rule)
            coverage[rule] = coverage[rule]+1

        case = { # First the conditions are provided, then the time, then the user's actions
            "id": i,
            'time': time,
            "interactions":{
                'data_request': data_request,
                'user_request_food': user_request_food,
                'user_complains': user_complains
            },
            "conditions": {
                'user_privacy_concern': user_privacy_concern,
                'room_temperature': room_temperature,
                'user_open_door_permission':user_open_door_permission,
                'user_exercising': user_exercising,
                'exercise_count': exercise_count,
                'user_encouraged': user_encouraged,
                'user_physical_alerts': user_physical_alerts,
                'user_exercise_preferences': user_exercise_preferences,
                'user_consent_granted': user_consent_granted,
                'authorized_access': authorized_access,
                'user_ready': user_ready,
                'user_sleep_status': user_sleep_status,
                'glucose_value': glucose_value,
                'medical_emergency': medical_emergency,
                'user_refuse_diet': user_refuse_diet,
                'exercise_result': exercise_result,
            },
            "expected_obligation": expected_obligation,
            "expected_rule": expected_rule
        }
        test_cases["test_cases"].append(case)
    return test_cases


if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        sys.exit("Usage: python3 test_cases_generator.py <number_of_test_cases> [<name>]")

    try:
        N = int(sys.argv[1])
    except ValueError:
        sys.exit("The argument must be an integer.")

    if len(sys.argv) == 3:
        filename = sys.argv[2]
    else:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M")
        filename = f"testcase_{timestamp}"

    data = generate_test_cases(N)
    filepath = os.path.join(".","test_cases", f"{filename}.json")

    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "w") as f:
        json.dump(data, f, indent=4)
