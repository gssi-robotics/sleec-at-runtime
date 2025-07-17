from dataclasses import dataclass, asdict, is_dataclass
from enum import Enum
from datetime import datetime
from typing import Any


class Mood(str, Enum):
    HAPPY = "happy"
    SAD = "sad"
    DISTRESSED = "distressed"
    CALM = "calm"

class EnergyLevel(str, Enum):
    ENERGETIC = "energetic"
    TIRED = "tired"
    NORMAL = "normal"

class Activity(str, Enum):
    WALKING = "walking"
    SLEEPING = "sleeping"
    TRAINING = "training"
    EATING = "eating"
    RESTING = "resting"

@dataclass
class Context:
    user: str
    time: datetime

@dataclass
class UserStatus:
    mood: Mood
    energy_level: EnergyLevel
    activity: Activity

@dataclass
class InteractionStatus:
    exercise_completed: bool
    user_encouraged: bool
    repetitions_done: int

@dataclass
class ConditionState:
    context: Context
    user_status: UserStatus
    status: InteractionStatus


    
# Example usage:
example = ConditionState(
    context=Context(
        user="user123",
        time=datetime.now()
    ),
    user_status=UserStatus(
        mood=Mood.HAPPY,
        energy_level=EnergyLevel.ENERGETIC,
        activity=Activity.WALKING
    ),
    status=InteractionStatus(
        exercise_completed=True,
        user_encouraged=True,
        repetitions_done  = 10
    )
)


def parse_conditions(data: dict) -> ConditionState:
    return ConditionState(
        context=Context(
            user=data["context"]["user"],
            time=datetime.fromisoformat(data["context"]["time"].replace("Z", "+00:00"))
        ),
        user_status=UserStatus(
            mood=Mood(data["user_status"]["mood"]),
            energy_level=EnergyLevel(data["user_status"]["energy_level"]),
            activity=Activity(data["user_status"]["activity"])
        ),
        status=InteractionStatus(
            exercise_completed=data["status"]["exercise_completed"],
            user_encouraged=data["status"]["user_encouraged"],
            repetitions_done=data["status"]["repetitions_done"]
        )
    )

def serialize(obj: Any) -> Any:
    if isinstance(obj, Enum):
        return obj.value
    elif isinstance(obj, datetime):
        return obj.isoformat()
    elif is_dataclass(obj):
        return {k: serialize(v) for k, v in asdict(obj).items()}
    elif isinstance(obj, list):
        return [serialize(i) for i in obj]
    elif isinstance(obj, dict):
        return {k: serialize(v) for k, v in obj.items()}
    else:
        return obj
    