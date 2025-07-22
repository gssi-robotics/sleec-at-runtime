enforcer_interventions = None
n_step = None
test_run_start = None
out_action = None
start_time = None
start_delay = None
stop_delay = None
upload_delay = None
delete_delay = None
total_sanitisation_delay = None
input_conditions = {} #dict function name : value
out_obligations = {} #dict CapabilityID : (TCType,Integer,TimerUnit,CapabilityID)
                     #examples: GOHOME: (AFTER,5,MIN,undef), GOHOME: (WITHIN,8,MIN,SOUNDALARM), GOHOME: undef