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
    capability: Capability

    def get_id(self) -> CapabilityID:
        mapping = {
            Capability.DONOTHING: CapabilityID.DONOTHING,
            Capability.GOHOME: CapabilityID.GOHOME,
            Capability.SOUNDALARM: CapabilityID.SOUNDALARM,
        }
        return mapping[self.capability]