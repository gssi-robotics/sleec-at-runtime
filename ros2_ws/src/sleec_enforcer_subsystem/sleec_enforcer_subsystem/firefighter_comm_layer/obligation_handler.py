from sleec_enforcer_subsystem.firefighter_comm_layer.model_structures import Capability

def process_obligations(outObligations, executor_node):
    '''Processes the obligations received from the MQTT topic and triggers capabilities based on constraints.'''
    for capability, constraint in outObligations.items():
        executor_node.get_logger().info(f"[Obligation] Processing capability: {capability}")
        
        if constraint == "undef":
            executor_node.get_logger().info(f"No time constraint for {capability}")
            trigger_capability(capability, executor_node)
            continue

        tc_type, amount, unit, follow_up = constraint

        executor_node.get_logger().info(
            f"Constraint on {capability}: {tc_type} {amount} {unit}, follow-up: {follow_up}"
        )

        # Convert time to seconds
        multiplier = {"MILLISEC": 0.001, "NANOSEC": 1e-9, "SEC": 1, "MIN": 60, "HOUR": 3600}
        delay = int(amount) * multiplier.get(unit.upper(), 60)

        if tc_type == "AFTER":
            executor_node.get_logger().info(f"Delaying {capability} by {delay} seconds")
            executor_node.create_timer(delay, lambda: trigger_capability(capability, executor_node))

        elif tc_type == "WITHIN":
            # Execute now, then start deadline timer for follow-up
            trigger_capability(capability, executor_node)

            if follow_up != "undef":
                executor_node.get_logger().info(f"Scheduling follow-up: {follow_up} in {delay} seconds")
                executor_node.create_timer(delay, lambda: trigger_capability(follow_up, executor_node))

        else:
            executor_node.get_logger().warn(f"Unknown constraint type: {tc_type}")

        
def trigger_capability(capability, executor_node):
    '''Triggers the specified capability on the executor node.'''
    if capability == Capability.GOHOME:
        executor_node.go_home()
    elif capability == Capability.SOUNDALARM:
        executor_node.activate_alarm()
    else:
        executor_node.get_logger().warn(f"[Unknown capability] {capability}")
