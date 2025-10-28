from enum import Enum
from dataclasses import dataclass

# === ENUMS ===
class GlucoseLevel(str, Enum):
    VERYLOW = "VERYLOW" # < 70
    LOW = "LOW" # 85-70
    NORMAL = "NORMAL" # 85-120
    HIGH = "HIGH" # > 120

class TimeOfDay(str, Enum):
    MEALTIME = "MEALTIME"
    STARTTRAININGTIME = "STARTTRAININGTIME"
    TRAININGTIME = "TRAININGTIME"
    ANOTHERTIME = "ANOTHERTIME"

class Permission(str, Enum):
    GRANTED = "GRANTED"
    DENIED = "DENIED"
    UNKNOWN = "UNKNOWN"

class CapabilityID(str, Enum):
    GREETINUSERLANGUAGE = "GREETINUSERLANGUAGE"
    STARTTRAININGSESSION = "STARTTRAININGSESSION"
    CLOSEDOOR = "CLOSEDOOR"
    ASKPERMISSIONFOROPENDOOR = "ASKPERMISSIONFOROPENDOOR"
    ALERTNURSE = "ALERTNURSE"
    SHOWNEXTEXERCISE = "SHOWNEXTEXERCISE"
    ENCOURAGE = "ENCOURAGE"
    ASKUSERINTENT = "ASKUSERINTENT"
    NOTIFYSESSIONEND = "NOTIFYSESSIONEND"
    DONOTHING = "DONOTHING"
    SHAREDATA = "SHAREDATA"
    DENYDATASHARINGWITHEXPLANATION = "DENYDATASHARINGWITHEXPLANATION"
    REMINDUSERMEALTIME = "REMINDUSERMEALTIME"
    WAKEUPUSER = "WAKEUPUSER"
    INFORMNURSE = "INFORMNURSE"
    EXPLAINNOFOOD = "EXPLAINNOFOOD"
    GIVEDIETARYSNACK = "GIVEDIETARYSNACK"
    DELIVERMEAL = "DELIVERMEAL"
    EXPLAINDIETADHERENCEREASON = "EXPLAINDIETADHERENCEREASON"
    DELIVERDIETARYALTERNATIVE = "DELIVERDIETARYALTERNATIVE"

class Capability(str, Enum):
    GREETINUSERLANGUAGE = "greetInUserLanguage"
    STARTTRAININGSESSION = "startTrainingSession"
    CLOSEDOOR = "closeDoor"
    ASKPERMISSIONFOROPENDOOR = "askPermissionForOpenDoor"
    ALERTNURSE = "alertNurse"
    SHOWNEXTEXERCISE = "showNextExercise"
    ENCOURAGE = "encourage"
    ASKUSERINTENT = "askUserIntent"
    NOTIFYSESSIONEND = "notifySessionEnd"
    DONOTHING = "doNothing"
    SHAREDATA = "shareData"
    DENYDATASHARINGWITHEXPLANATION = "denyDataSharingWithExplanation"
    REMINDUSERMEALTIME = "remindUserMealTime"
    WAKEUPUSER = "wakeUpUser"
    INFORMNURSE = "informNurse"
    EXPLAINNOFOOD = "explainNoFood"
    GIVEDIETARYSNACK = "giveDietarySnack"
    DELIVERMEAL = "deliverMeal"
    EXPLAINDIETADHERENCEREASON = "explainDietAdherenceReason",
    DELIVERDIETARYALTERNATIVE = "deliverDietaryAlternative"

@dataclass
class Conditions:
    timeOfDay: TimeOfDay = TimeOfDay.ANOTHERTIME # Added as custom default
    userPrefersPrivacy: bool = False
    roomTemperature: int = 18 # Added as custom default
    userDoorOpenConsent: Permission = Permission.UNKNOWN # Added as custom deafult
    userExercising: bool = False
    fewerExerciseRepetitions: bool = False
    userEncouraged: bool = False
    userPhysicalIssues: bool = False
    userComplains: bool = False
    userSilentExercisePreference: bool = False
    requestUserData: bool = False
    userDataConsentGranted: bool = False
    unauthorizedPerson: bool = False
    userReadyToEat: bool = False
    userIsSleeping: bool = False
    userInRemSleep: bool = False
    glucoseLevel: GlucoseLevel = GlucoseLevel.NORMAL # Added as custom default
    userRequestsFood: bool = False
    medicalEmergencyAlert: bool = False
    userDietRefusal: bool = False
    differentFoodAllowed: bool = False

    def export_dict(self):
        return vars(self).copy()

@dataclass
class Obligation:
    capability_id: CapabilityID

    mapping = {
        CapabilityID.GREETINUSERLANGUAGE: Capability.GREETINUSERLANGUAGE.value,
        CapabilityID.STARTTRAININGSESSION: Capability.STARTTRAININGSESSION.value,
        CapabilityID.CLOSEDOOR: Capability.CLOSEDOOR.value,
        CapabilityID.ASKPERMISSIONFOROPENDOOR: Capability.ASKPERMISSIONFOROPENDOOR.value,
        CapabilityID.ALERTNURSE: Capability.ALERTNURSE.value,
        CapabilityID.SHOWNEXTEXERCISE: Capability.SHOWNEXTEXERCISE.value,
        CapabilityID.ENCOURAGE: Capability.ENCOURAGE.value,
        CapabilityID.ASKUSERINTENT: Capability.ASKUSERINTENT.value,
        CapabilityID.NOTIFYSESSIONEND: Capability.NOTIFYSESSIONEND.value,
        CapabilityID.DONOTHING: Capability.DONOTHING.value,
        CapabilityID.SHAREDATA: Capability.SHAREDATA.value,
        CapabilityID.DENYDATASHARINGWITHEXPLANATION: Capability.DENYDATASHARINGWITHEXPLANATION.value,
        CapabilityID.REMINDUSERMEALTIME: Capability.REMINDUSERMEALTIME.value,
        CapabilityID.WAKEUPUSER: Capability.WAKEUPUSER.value,
        CapabilityID.INFORMNURSE: Capability.INFORMNURSE.value,
        CapabilityID.EXPLAINNOFOOD: Capability.EXPLAINNOFOOD.value,
        CapabilityID.GIVEDIETARYSNACK: Capability.GIVEDIETARYSNACK.value,
        CapabilityID.DELIVERMEAL: Capability.DELIVERMEAL.value,
        CapabilityID.EXPLAINDIETADHERENCEREASON: Capability.EXPLAINDIETADHERENCEREASON.value,
        CapabilityID.DELIVERDIETARYALTERNATIVE: Capability.DELIVERDIETARYALTERNATIVE.value
    }

    def get_capability(self) -> str:
        return self.mapping[self.capability_id]