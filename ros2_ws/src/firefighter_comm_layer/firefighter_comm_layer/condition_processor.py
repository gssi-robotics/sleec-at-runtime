import json
from dataclasses import asdict
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


def publish_on_change(func):
    '''Decorator to publish the condition via RabbitMQ if it has changed after executing the function.'''
    def wrapper(self, *args, **kwargs):
        # copy of the old condition
        prev = init_condition()
        prev.__dict__.update(self.condition.__dict__)

        # run the function
        func(self, *args, **kwargs)

        # publish if changed
        if has_condition_changed(self.condition, prev):
            json_str = json.dumps(asdict(self.condition), default=str)
            try:
                self.rabbit_publisher.publish(json_str)
                self.get_logger().info(f"[RabbitMQ] Published: {json_str}")
            except Exception as e:
                self.get_logger().error(f"[RabbitMQ] publish failed: {e}")

    return wrapper