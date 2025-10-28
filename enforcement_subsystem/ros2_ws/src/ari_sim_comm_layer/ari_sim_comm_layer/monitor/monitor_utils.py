import json

from ari_sim_comm_layer.ARI_model_structures import Conditions

def publish_on_change(func):
    '''Decorator to publish the condition via RabbitMQ if it has changed after executing the function.'''
    def wrapper(self, *args, **kwargs):

        # copy of the old condition object
        prev = Conditions()
        prev.__dict__.update(self.conditions.export_dict())

        # run the function
        func(self, *args, **kwargs)

        # publish if changed
        if has_condition_changed(self.conditions, prev):
            json_str = json.dumps(vars(self.conditions), default=str)
            try:
                self.rabbit_publisher.publish(json_str)
                self.get_logger().info(f"[RabbitMQ] Published: {json_str}")
            except Exception as e:
                self.get_logger().error(f"[RabbitMQ] publish failed: {e}")

    return wrapper

def has_condition_changed(conditions: Conditions, previous_conditions: Conditions) -> bool:
    '''Check if the condition has changed compared to the previous state.'''
    return conditions.__dict__ != previous_conditions.__dict__