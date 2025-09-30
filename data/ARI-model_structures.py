from enum import Enum
from typing import Optional
from dataclasses import dataclass

# === ENUMS ===
class GlucoseLevel(str, Enum):
    LOW = "LOW"
    NORMAL = "NORMAL"
    HIGH = "HIGH"

class TimeOfDay(str, Enum):
    MEALTIME = "MEALTIME"
    STARTTRAININGTIME = "STARTTRAININGTIME"
    TRAININGTIME = "TRAININGTIME"
    ANOTHERTIME = "ANOTHERTIME"

class CapabilityID(str, Enum):
    SHOWNEXTEXERCISE = "SHOWNEXTEXERCISE"
    ENCOURAGE = "ENCOURAGE"
    ASKUSERINTENT = "ASKUSERINTENT"
    ENDSESSION = "ENDSESSION"
    STARTTRAININGSESSION = "STARTTRAININGSESSION"
    CLOSEDOOR = "CLOSEDOOR"
    OPENDOOR = "OPENDOOR"
    INFORMNURSE = "INFORMNURSE"
    ALERTNURSE = "ALERTNURSE"
    SHAREDATA = "SHAREDATA"
    DONOTHING = "DONOTHING"
    DENYDATASHARINGWITHEXPLANATION = "DENYDATASHARINGWITHEXPLANATION"
    REMINDMEALTIME = "REMINDMEALTIME"
    WAKEUPUSER = "WAKEUPUSER"
    EXPLAINNOFOOD = "EXPLAINNOFOOD"
    DELIVERMEAL = "DELIVERMEAL"
    EXPLAINDIETADHERENCE = "EXPLAINDIETADHERENCE"
    DELIVERDIETARYCHEATMEAL = "DELIVERDIETARYCHEATMEAL"
    GREETINUSERLANGUAGE = "GREETINUSERLANGUAGE"
    EXPLAINWARMSTART = "EXPLAINWARMSTART"
    GIVEDIETARYSNACK = "GIVEDIETARYSNACK"

class Capability(str, Enum):
    SHOWNEXTEXERCISE = "showNextExercise"
    ENCOURAGE = "encourage"
    ASKUSERINTENT = "askUserIntent"
    NOTIFYSESSIONEND = "notifySessionEnd"
    GREETINUSERLANGUAGE = "greetInUserLanguage"
    CLOSEDOOR = "closeDoor"
    OPENDOOR = "openDoor"
    STARTTRAININGSESSION = "startTrainingSession"
    INFORMNURSE = "informNurse"
    SHAREDATA = "shareData"
    DENYDATASHARINGWITHEXPLANATION = "denyDataSharingWithExplanation"
    REMINDUSERMEALTIME = "remindUserMealTime"
    WAKEUPUSER = "wakeUpUser"
    EXPLAINNOFOOD = "explainNoFood"
    DELIVERMEAL = "deliverMeal"
    EXPLAINDIETADHERENCEREASON = "explainDietAdherenceReason"
    GIVEDIETARYSNACK = "giveDietarySnack"

@dataclass
class Condition:
    userExercising: bool
    fewerExerciseRepetitions: bool
    userEncouraged: bool
    userIsTired: bool
    userComplains: bool
    userReadyToEat: bool
    userPrefersPrivacy: bool
    medicalEmergencyAlert: bool
    requestUserData: bool
    userConsentGranted: bool
    unauthorizedPerson: bool
    userIsSleeping: bool
    userInRemSleep: bool
    riskOfHypoglycemia: bool
    userRequestsFood: bool
    userDietRefusal: bool
    morningExerciseAllowsCheatMeal: bool
    glucoseLevel: GlucoseLevel
    roomTemperature: int
    timeOfDay: TimeOfDay
    tooWarm: int
    isMealTime: TimeOfDay
    isTimeForStartingTrainingSession: TimeOfDay
    isTrainingTime: TimeOfDay

@dataclass
class Obligation:
    capability_id: CapabilityID

    mapping = {
        CapabilityID.SHOWNEXTEXERCISE: Capability.SHOWNEXTEXERCISE.value,
        CapabilityID.ENCOURAGE: Capability.ENCOURAGE.value,
        CapabilityID.ASKUSERINTENT: Capability.ASKUSERINTENT.value,
        CapabilityID.NOTIFYSESSIONEND: Capability.ENDSESSION.value,
        CapabilityID.STARTTRAININGSESSION: Capability.STARTTRAININGSESSION.value,
        CapabilityID.CLOSEDOOR: Capability.CLOSEDOOR.value,
        CapabilityID.OPENDOOR: Capability.OPENDOOR.value,
        CapabilityID.INFORMNURSE: Capability.INFORMNURSE.value,
        CapabilityID.ALERTNURSE: Capability.ALERTNURSE.value,
        CapabilityID.SHAREDATA: Capability.SHAREDATA.value,
        CapabilityID.DENYDATASHARINGWITHEXPLANATION: Capability.DENYDATASHARINGWITHEXPLANATION.value,
        CapabilityID.REMINDUSERMEALTIME: Capability.REMINDMEALTIME.value,
        CapabilityID.WAKEUPUSER: Capability.WAKEUPUSER.value,
        CapabilityID.EXPLAINNOFOOD: Capability.EXPLAINNOFOOD.value,
        CapabilityID.DELIVERMEAL: Capability.DELIVERMEAL.value,
        CapabilityID.EXPLAINDIETADHERENCEREASON: Capability.EXPLAINDIETADHERENCE.value,
        CapabilityID.DELIVERDIETARYCHEATMEAL: Capability.DELIVERDIETARYCHEATMEAL.value,
        CapabilityID.GREETINUSERLANGUAGE: Capability.GREETINUSERLANGUAGE.value,
        CapabilityID.EXPLAINUSERWARMSTART: Capability.EXPLAINWARMSTART.value,
        CapabilityID.GIVEDIETARYSNACK: Capability.GIVEDIETARYSNACK.value,
    }

    def get_capability(self) -> str:
        return self.mapping[self.capability_id]