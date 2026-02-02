import json
from ari_sim_comm_layer.ARI_model_structures import CapabilityID


class ObligationsProcessor():

    def __init__(self, node):
        self.executor = node
        self.capabilities_func_dict = {
            CapabilityID.GREETINUSERLANGUAGE: self.executor.greet_user,
            CapabilityID.STARTTRAININGSESSION: self.executor.start_session,
            CapabilityID.CLOSEDOOR: self.executor.close_door,
            CapabilityID.ASKPERMISSIONFOROPENDOOR: self.executor.ask_permission_open_door,
            CapabilityID.ALERTNURSE: self.executor.alert_nurse,
            CapabilityID.SHOWNEXTEXERCISE: self.executor.show_next_exercise,
            CapabilityID.ENCOURAGE: self.executor.encourage,
            CapabilityID.ASKUSERINTENT: self.executor.ask_user_intent,
            CapabilityID.NOTIFYSESSIONEND: self.executor.notify_session_end,
            CapabilityID.SHAREDATA: self.executor.share_data,
            CapabilityID.DENYDATASHARINGWITHEXPLANATION: self.executor.deny_data_sharing,
            CapabilityID.REMINDUSERMEALTIME: self.executor.remind_mealtime,
            CapabilityID.WAKEUPUSER: self.executor.wake_up_user,
            CapabilityID.INFORMNURSE: self.executor.inform_nurse,
            CapabilityID.EXPLAINNOFOOD: self.executor.explain_no_food,
            CapabilityID.GIVEDIETARYSNACK: self.executor.give_dietary_snack,
            CapabilityID.DELIVERMEAL: self.executor.deliver_meal,
            CapabilityID.EXPLAINDIETADHERENCEREASON: self.executor.explain_dietary_adherence,
            CapabilityID.DELIVERDIETARYALTERNATIVE: self.executor.deliver_alternative_meal
        }

    def get_logger(self):
        return self.executor.get_logger()

    def on_msg(self, body: bytes):
        '''Callback for RabbitMQ messages. Processes obligations received from the queue.'''
        try:
            out_obligations = json.loads(body.decode("utf-8"))
            self.get_logger().info("[Obligation Processor] Received obligations")
            self.process_obligations(out_obligations)
        except Exception as e:
            self.get_logger().error(f"[Obligation Processor] Error processing message: {e}")

    def process_obligations(self, out_obligations):
        '''Processes the obligations received from the RabbitMQ and triggers capabilities based on constraints.'''
        
        for capability, constraint in out_obligations.items():
            self.get_logger().info(f"[Obligation Processor] Processing capability: {capability}")
            
            if constraint == "undef":
                self.get_logger().info(f"No time constraint for {capability}")
                self.trigger_capability(capability)

            else:
                type, amount, unit, follow_up = self.parse_constraint(constraint)

                self.get_logger().info(
                    f"Constraint on {capability}: {type} {amount} {unit}, follow-up: {follow_up}"
                )

                # Convert time to seconds
                multiplier = {"MILLISEC": 0.001, "NANOSEC": 1e-9, "SEC": 1, "MIN": 60, "HOUR": 3600}
                delay = int(amount) * multiplier.get(unit.upper(), 60)

                if type == "AFTER":
                    self.get_logger().info(f"Delaying {capability} by {delay} seconds")
                    # self.node.create_timer(delay, lambda: self.trigger_capability(capability), oneShot=True)
                    self.trigger_capability(capability)

                elif type == "WITHIN":
                    # Execute now, then start deadline timer for follow-up
                    self.trigger_capability(capability)

                    if follow_up != "undef":
                        self.get_logger().info(f"Scheduling follow-up: {follow_up} in {delay} seconds")
                        # self.node.create_timer(delay, lambda: self.trigger_capability(follow_up), oneshot=True)

                else:
                    self.node.get_logger().warn(f"Unknown constraint type: {type}")

            
    def trigger_capability(self, capability):
        '''Triggers the specified capability on the executor node.'''
        try:
            if capability == CapabilityID.DONOTHING:
                self.get_logger().info("No action (DONOTHING).")
            elif capability in self.capabilities_func_dict:
                self.capabilities_func_dict[capability]()
            else:
                self.get_logger().warn(f"Unknown capability: {capability}... publishing as a raw obligation.")
                self.executor.raw_obligation_enforcement(capability)
        except Exception as e:
            self.get_logger().error(f"[Obligation Processor] Error executing capability {capability}: {e}")

    def parse_constraint(self, constraint):
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
