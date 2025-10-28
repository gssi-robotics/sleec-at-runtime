
import time
import logging_manager
from rest_client import RestClient

class Enforcer(RestClient):    
    def __init__(self, ip, base_port, asm_name):
        """
        Initialize the Enforcer class.
        """
        super().__init__(ip, base_port)
        self.logger = logging_manager.get_logger(__name__)
        self.asm_name = asm_name
        self.exec_id = None
    
    def begin_enforcement(self):
        """
        Start a new execution of the ASM.
        """
        try:
            response = self._send_request("POST", "start", params={"name": self.asm_name})
            self.exec_id = response.json()["id"]
            self.logger.info(f"Execution started with ID: {self.exec_id}")
        except Exception as e:
            self.logger.error(f"Failed to start execution: {e}")
            raise     
            
    def end_enforcement(self):
        """
        Stop the execution of the ASM.
        """
        try:
            self._send_request("DELETE", "stop-model", params={"id": str(self.exec_id)})
            self.logger.info(f"Execution stopped for ID: {self.exec_id}")
        except Exception as e:
            self.logger.error(f"Failed to stop execution: {e}")
            raise

    '''
    #First input for an initialization step (if necessary) of the ASM enforcement model 
    def initialize_enforcement_model(self,input_dict):
        endpoint = "step"
        json_data = {}
        json_data["id"] = self.exec_id
        json_data["monitoredVariables"] = input_dict    
        try:
            start_time = time.perf_counter()
            response = self._send_request("PUT", endpoint, json=json_data)
            delay = (time.perf_counter() - start_time) * 1000
            self.logger.info(f"ASM step performed for ID {self.exec_id} with delay {delay:.2f} ms")
            if not response.json()["runOutput"]["outvalues"]: # outAction not set (should never happen)
                self.logger.error("The ASM returned no outAction but should always return something")
                return None
            else:
                self.logger.info("Initialization done!")
                return response.json()["runOutput"]["outvalues"]["outObligation","outConstraint"] #Your out location (e.g., "out_state") from your ASM model goes here
        except Exception as e:
            self.logger.error("ASM step execution failed: %s", e)
            raise    
    '''

    #Your output sanitization logic goes here. This is application-specific and depends on the
    #I/O interfaces (and also on Probe/Effector interfaces in case of gray-box enforcement).
    def sanitise_output(self, input_dict):
        """
        Perform an ASM step and repair (if necessary) the system action (i.e. output sanitisation).
        """
        endpoint = "step"
        json_data = {}
        json_data["id"] = self.exec_id
        json_data["monitoredVariables"] = input_dict    
        
        try:
            start_time = time.perf_counter()
            response = self._send_request("PUT", endpoint, json=json_data)
            delay = (time.perf_counter() - start_time) * 1000
            self.logger.info(f"ASM step performed for ID {self.exec_id} with delay {delay:.2f} ms")
            # Check if dictionary of out locations is empty
            out_locations = response.json()["runOutput"]["outvalues"] #all out locations of the ASM are collected
            self.logger.info(f"ASM output: {out_locations}")
            if not out_locations: # out locations not set (should never happen; typically when the input for the ASM is ill formed)
                self.logger.error("The ASM returned no outAction but should always return something.")
                return None #return None
            """if len(out_locations) <= 1:  replaced with the next sentence"""
            #if out_locations['outObligation'] == 'undef':  #OLD: single obligation
            #NEW if for multi obligation
            if all(value == "false" for key, value in out_locations.items() if key.startswith("outObligation")):
                self.logger.info("Enforcement not applied.")
                self.logger.info(f"ASM output: {out_locations}")
                return None #Return None
            else:
                self.logger.info("Enforcement applied.")
                #Filtering of the out locations of the ASM for the obligation and its time constraints (if any)
                #Current version works only for single obligation; so the returned dict has a single key
                #Examples: {GOHOME: (AFTER,5,MIN,undef)}, {GOHOME: (WITHIN,8,MIN,SOUNDALARM)}, {GOHOME: undef}
                #OLD single obligation
                #time_constraint_tuple = out_locations['outConstraint('+out_locations['outObligation']+')']
                #enforced_obligations = {out_locations['outObligation']:time_constraint_tuple} 
                #NEW multi obligation
                # Select keys that start with "outObligation" and have the value "true"
                #valid_keys = [key for key, value in out_locations.items()
                #              if key.startswith("outObligation") and value.lower() == "true"]
                enforced_obligations = {}
                for key in out_locations:
                    if key.startswith("outObligation") and out_locations[key] == "true":
                        obligationID = key.split("(", 1)[1].rstrip(")")
                        time_constraint_tuple = out_locations['outConstraint('+obligationID+')']
                        enforced_obligations[obligationID] = time_constraint_tuple
                #Return the obligations to actuate, as filtered from the out locations of the ASM model
                #self.logger.info(f"ASM output: {out_locations['outObligation']} {out_locations['outConstraint('+out_locations['outObligation']+')']}")
                self.logger.info(f"ASM output (as filtered): {enforced_obligations}")
                return enforced_obligations
        except Exception as e:
            self.logger.error("ASM step execution failed: %s", e)
            raise    
