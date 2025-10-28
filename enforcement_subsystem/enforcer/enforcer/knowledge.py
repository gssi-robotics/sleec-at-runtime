
class Knowledge:
    def __init__(self):
        self.enforcer_interventions = 0
        self.n_step = 0
        self.test_run_start = None
        self.out_action = None
        self.start_time = None
        self.start_delay = None
        self.stop_delay = None
        self.upload_delay = None
        self.delete_delay = None
        self.total_sanitisation_delay = 0
        self.max_sanitisation_delay = 0
        self.input_conditions = {}  #dict function name : value
        self.out_obligations = {} #dict CapabilityID : (TCType,Integer,TimerUnit,CapabilityID)
                     #examples: GOHOME: (AFTER,5,MIN,undef), GOHOME: (WITHIN,8,MIN,SOUNDALARM), GOHOME: undef

# Create a shared knowledge instance
knowledge = Knowledge()


class RabbitMQParam():
    def __init__(self):
        self.host = None
        self.port = None
        self.user = None
        self.password = None
        self.conditions_queue_name = None
        self.obligations_queue_name = None
        self.conditions_queue = None
        self.obligations_queue = None    
        self.exchange = None    

    def __str__(self):
        return f"RabbitMQParam(host={self.host}, port={self.port}, user={self.user}, password={self.password}, conditions_queue_name={self.conditions_queue_name}, obligations_queue_name={self.obligations_queue_name})"

# Create a shared rabbit instance 
rabbit_mq_param = RabbitMQParam()