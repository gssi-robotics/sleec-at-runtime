from dataclasses import dataclass
from enum import Enum
from typing import Optional


class ARICapability(str, Enum):
    ''' Enum representing the capabilities of ARI mapped to ROS topics. '''
    NAVIGATE_TO_WEB_PAGE = "/web/go_to",
    SPEECH = "/tts",
    CALL_NURSE = "/call_nurse",
    SHOW_TABLET_INTERFACE = "/tablet/show", # check how to do it


@dataclass
class ARICommand:
    capability: ARICapability
    input_data: Optional[str] = None 


# Example usage:
command = ARICommand(capability=ARICapability.SPEECH, input_data="Hello world")

