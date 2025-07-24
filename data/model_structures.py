from enum import Enum
from typing import Optional
from dataclasses import dataclass

# === ENUMS ===
class WindScale(str, Enum):
    LIGHT = "LIGHT"
    MODERATE = "MODERATE"
    STRONG = "STRONG"

class CapabilityID(str, Enum):
    DONOTHING = "DONOTHING"
    SOUNDALARM = "SOUNDALARM"
    GOHOME = "GOHOME"

class Capability(str, Enum):
    GOHOME = "goHome"
    SOUNDALARM = "soundAlarm"
    DONOTHING = "doNothing"

@dataclass
class Condition:
    batteryCritical: bool
    cameraStart: bool
    alarmRinging: bool
    personNearby: bool
    temperature: float
    windSpeed: WindScale
    alarmdeadline: int

@dataclass
class Obligation:
    capability_id: CapabilityID

    mapping = {
        CapabilityID.DONOTHING: Capability.DONOTHING.value,
        CapabilityID.GOHOME: Capability.GOHOME.value,
        CapabilityID.SOUNDALARM: Capability.SOUNDALARM.value,
    }

    def get_capability(self) -> str:
        return self.mapping[self.capability_id]