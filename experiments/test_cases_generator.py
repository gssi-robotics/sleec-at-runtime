import os
import json
import random
import sys
from datetime import datetime

def get_daisy_addressing_obligation(userNameUnknown, userDirectsOtherwise, domain):
    if (domain == "hospital"):
        if userNameUnknown and not userDirectsOtherwise:
            return "AddressSirOrMadam"
        if userNameUnknown and userDirectsOtherwise:
                return "UseUserChosenName"
        return "UsePreferredName"
    return "not_specified"

def get_daisy_instruction_fail_obligation(instructionRepeat, timeElapsed, domain):
    if (domain == "hospital"):
        if (instructionRepeat >=3 or timeElapsed > 20):
            return "CallSupport"
        return "RepeatInstruction"
    return "not_specified"

def get_daisy_preparing_examination_obligation(UserAge, legalAge, domain):
    if (domain == "hospital"):
        if (UserAge < legalAge):
            return "EnsureLegalPresence"
        return "EnsurePrivateSpace"
    return "not_specified"

def get_dressassist_curtain_opening_obligation(userUndressed, userDistressed, domain):
    if (domain == "house"):
        if (userUndressed and not userDistressed):
            return "RefuseRequest AND ExplainReason"
        if (userUndressed and userDistressed):
            return "WarnUser AND OpenCurtains"
        return "OpenCurtains"
    return "not_specified"

def get_dressassist_dresing_started_obligation(medicalEmergency, userAdvices, domain):
    if (domain == "house"):
        if (medicalEmergency or userAdvices):
            return "doNothing"
        return "CloseDoor"
    return "not_specified"

def get_dressassist_dressing_stop_obligation(riskLevel, r_low, domain):
    if (domain == "house"):
        if (riskLevel < r_low):
            return "AskToFinishFirst"
        return "RobotStop"
    return "not_specified"

def get_human_on_floor_obligation(userResponsive, userWithCompanion, domain):
    if (userResponsive and not userWithCompanion):
        return "AskForUserStatus"
    if (userResponsive and userWithCompanion):
        return "AskCompanionToCheck"
    return "CallEmergencyServices"

def get_mealtime_monitoring_obligation(userOccupied, domain):
    if (userOccupied):
        return "RemindLater"
    return "InformUser"

def generate_test_cases(n):
    test_cases = {"test_cases": []}

    for i in range(1, n + 1):

        time = random.choice(["09:00", "10:00", "10:15", "12:30", "18:30"])
        user_privacy_concern = random.choice([True, False])
        room_temperature = random.randint(19, 28)
        user_exercising = random.choice([True, False])
        exercise_count = random.randint(3, 6)
        user_encouraged = random.choice([True, False])
        user_physical_alerts = random.choice([True, False])
        user_complains = random.choice([True, False])
        user_exercise_preferences = random.choice([True, False])
        data_request = random.choice([True, False])
        user_consent_granted = random.choice([True, False])
        authorized_access = random.choice([True, False])
        user_ready = random.choice([True, False])
        user_sleep_status = random.choice(["REM", "Light", "NO"])
        glucose_value = random.randint(60, 120)
        user_request_food = random.choice([True, False])
        medical_emergency = random.choice([True, False])
        user_refuse_diet = random.choice([True, False])
        exercise_result = random.choice(["Poor", "Sufficient", "Good", "Excellent"])

        case = {
            "id": i,
            'time': time,
            'user_consent_granted': user_consent_granted,
            'data_request': data_request,
            "context_conditions": {
                'user_privacy_concern': user_privacy_concern,
                'room_temperature': room_temperature,
                'user_exercising': user_exercising,
                'exercise_count': exercise_count,
                'user_encouraged': user_encouraged,
                'user_physical_alerts': user_physical_alerts,
                'user_complains': user_complains,
                'user_exercise_preferences': user_exercise_preferences,
                'authorized_access': authorized_access,
                'user_ready': user_ready,
                'user_sleep_status': user_sleep_status,
                'glucose_value': glucose_value,
                'user_request_food': user_request_food,
                'medical_emergency': medical_emergency,
                'user_refuse_diet': user_refuse_diet,
                'exercise_result': exercise_result,
            },
            "expected_behaviours": {
                # "daisy_addressing": get_daisy_addressing_obligation(userNameUnknown, userDirectsOtherwise, domain),
                # "daisy_instruction_fail": get_daisy_instruction_fail_obligation(instructionRepeat, timeElapsed, domain),
                # "daisy_preparing_examination": get_daisy_preparing_examination_obligation(UserAge, legalAge, domain),
                # "dressassist_curtain_opening":  get_dressassist_curtain_opening_obligation(userUndressed, userDistressed, domain),
                # "dressassist_dresing_started": get_dressassist_dresing_started_obligation(medicalEmergency, userAdvices, domain),
                # "dressassist_dressing_stop":get_dressassist_dressing_stop_obligation(riskLevel, r_low, domain),
                # "human_on_floor": get_human_on_floor_obligation(userResponsive, userWithCompanion, domain),
                # "mealtime_monitoring": get_mealtime_monitoring_obligation(userOccupied, domain)
            }
        }
        test_cases["test_cases"].append(case)

    return test_cases


if __name__ == "__main__":
    if len(sys.argv) < 2 or len(sys.argv) > 3:
        sys.exit("Usage: python test_cases_generator.py <number_of_test_cases> [<name>]")

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
