from firefighter_comm_layer.model_structures import Condition, WindScale

def init_condition():
    '''Initialize the condition with default values.'''
    condition = Condition(
        batteryCritical=False,
        cameraStart=False,
        alarmRinging=False,
        personNearby=False,
        temperature=20.0,
        windSpeed=WindScale.LIGHT,
        alarmdeadline=30
    )
    return condition


def has_condition_changed(condition: Condition, previous_condition: Condition) -> bool:
    '''Check if the condition has changed compared to the previous state.'''
    return condition.__dict__ != previous_condition.__dict__