from sleec_enforcer_subsystem.firefighter_comm_layer.model_structures import CapabilityID

def process_obligations(outObligations, executor_node):
    '''Processes the obligations received from the RabbitMQ and triggers capabilities based on constraints.'''
    
    for capability, constraint in outObligations.items():
        executor_node.get_logger().info(f"[Obligation] Processing capability: {capability}")
        
        if constraint == "undef":
            executor_node.get_logger().info(f"No time constraint for {capability}")
            trigger_capability(capability, executor_node)
            continue
        

        tc_type, amount, unit, follow_up = parse_constraint(constraint)

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
    if capability == CapabilityID.GOHOME:
        executor_node.go_home()
    elif capability == CapabilityID.SOUNDALARM:
        executor_node.activate_alarm(True)
    else:
        executor_node.get_logger().warn(f"[Unknown capability] {capability}")


def parse_constraint(constraint):
    '''Parses a time constraint string into tuple structured format.'''
    if constraint is None or constraint == 'undef':
        return None

    # Already structured
    if isinstance(constraint, (list, tuple)):
        if len(constraint) != 4:
            raise ValueError(f"Expected 4 elements, got {len(constraint)}")
        tc_type, amount, unit, follow_up = constraint
        return str(tc_type), int(amount), str(unit), str(follow_up)

    if not isinstance(constraint, str):
        raise TypeError(f"Unsupported type: {type(constraint)}")

    # String like "(AFTER,5,MIN,DONOTHING)"
    s = constraint.strip()
    if s.startswith("(") and s.endswith(")"):
        s = s[1:-1]

    parts = [p.strip() for p in s.split(",")]
    if len(parts) != 4:
        raise ValueError(f"Expected 4 comma-separated items, got {len(parts)} in {constraint}")

    tc_type, amount, unit, follow_up = parts
    try:
        amount = int(amount)
    except ValueError: pass

    return tc_type, amount, unit, follow_up
