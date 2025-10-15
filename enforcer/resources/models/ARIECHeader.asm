//Ethic controller for ARI-based assistive companion robot 
//ARI is capable of supporting patients that have diabet and have to follow 
//a diet and training program

asm ARIECHeader

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary
export *

signature:	
	/* DOMAIN-SPECIFIC SIGNATURE */
    
	//domains
	enum domain GlucoseLevel = {VERYLOW, LOW, NORMAL, HIGH}
	//A value representing a specific time during the daily routine; ANOTHER TIME is any other time excluding the previous ones 
	enum domain TimeOfDay = {MEALTIME, STARTTRAININGTIME, TRAININGTIME, ANOTHERTIME} 
	
	enum domain CapabilityID = {GREETINUSERLANGUAGE, STARTTRAININGSESSION, CLOSEDOOR, ASKPERMISSIONFOROPENDOOR, ALERTNURSE, SHOWNEXTEXERCISE, ENCOURAGE, ASKUSERINTENT, NOTIFYSESSIONEND, DONOTHING, SHAREDATA, DENYDATASHARINGWITHEXPLANATION, REMINDUSERMEALTIME, WAKEUPUSER, INFORMNURSE, EXPLAINNOFOOD, GIVEDIETARYSNACK, DELIVERMEAL, EXPLAINDIETADHERENCEREASON, DELIVERDIETARYALTERNATIVE}
	
	domain RoomTemperatureRange subsetof Integer
	
	
	
	//functions
	//Events and sensed variables
	//SLEEC 1:
	monitored timeOfDay: TimeOfDay // There's the function to compute if it's time for exercising
	monitored userPrefersPrivacy: Boolean
	monitored roomTemperature: RoomTemperatureRange // There's the function to compute if the room is too hot
	//SLEEC 1a + SLEEC 1b:
	monitored userDoorOpenConsent: Boolean
	//SLEEC 2:
	monitored userExercising: Boolean
	monitored fewerExerciseRepetitions: Boolean
	monitored userEncouraged: Boolean
	monitored userPhysicalIssues: Boolean 
	//SLEEC 2a:
	monitored userComplains: Boolean
	monitored userSilentExercisePreference: Boolean
	//SLEEC 3:
	monitored requestUserData: Boolean
	monitored userDataConsentGranted: Boolean
	monitored unauthorizedPerson: Boolean
	//SLEEC 4:
	monitored userReadyToEat: Boolean
	monitored userIsSleeping: Boolean
	monitored userInRemSleep: Boolean
	monitored glucoseLevel: GlucoseLevel
	//SLEEC 5:
	monitored userRequestsFood: Boolean
	//SLEEC 6:
	monitored medicalEmergencyAlert: Boolean
	monitored userDietRefusal: Boolean
	monitored differentFoodAllowed: Boolean
	
	//Capabilities
	//SLEEC 1 + 1a:
	static greetInUserLanguage: Capability
	static startTrainingSession: Capability
	static closeDoor: Capability
	static askPermissionForOpenDoor: Capability
	//SLEEC 1b:
	static alertNurse: Capability
	//SLEEC 2:
	static showNextExercise: Capability
	static encourage: Capability
	static askUserIntent: Capability
	static notifySessionEnd: Capability
	//SLEEC 3:
	static shareData: Capability
	static denyDataSharingWithExplanation: Capability
	//SLEEC 4:
	static remindUserMealTime: Capability
	static wakeUpUser: Capability
	static informNurse: Capability
	//SLEEC 5:
	static explainNoFood: Capability
	static giveDietarySnack: Capability
	//SLEEC 6:
	static deliverMeal: Capability
	static explainDietAdherenceReason: Capability
	static deliverDietaryAlternative:Capability
	
	static id: Capability -> CapabilityID

	//utility functions
	static tooWarm: RoomTemperatureRange  -> Boolean
	static isMealTime: TimeOfDay -> Boolean
	static isTimeForStartingTrainingSession: TimeOfDay -> Boolean
	static isTrainingTime: TimeOfDay -> Boolean

	
	/* DOMAIN-GENERAL SIGNATURE */	
	out outObligation: CapabilityID -> Boolean //any due obligation (there could be more than one) is activated through a flag
	out outConstraint: CapabilityID -> Prod(TCType,Integer,TimerUnit,CapabilityID)	

	
	
definitions:
		
/* DOMAIN-SPECIFIC DEFINITIONS*/
	
	domain RoomTemperatureRange = {0:50}  
	
	function id($c in Capability) = 
		switch $c
			case greetInUserLanguage: GREETINUSERLANGUAGE
			case startTrainingSession: STARTTRAININGSESSION
			case closeDoor: CLOSEDOOR
			case askPermissionForOpenDoor: ASKPERMISSIONFOROPENDOOR
			case alertNurse: ALERTNURSE
			case showNextExercise: SHOWNEXTEXERCISE
			case encourage: ENCOURAGE
			case askUserIntent: ASKUSERINTENT
			case notifySessionEnd: NOTIFYSESSIONEND
			case doNothing: DONOTHING
			case shareData: SHAREDATA
			case denyDataSharingWithExplanation: DENYDATASHARINGWITHEXPLANATION
			case remindUserMealTime: REMINDUSERMEALTIME
			case wakeUpUser: WAKEUPUSER
			case informNurse: INFORMNURSE
			case explainNoFood: EXPLAINNOFOOD
			case giveDietarySnack: GIVEDIETARYSNACK
			case deliverMeal: DELIVERMEAL
			case explainDietAdherenceReason: EXPLAINDIETADHERENCEREASON
			case deliverDietaryAlternative: DELIVERDIETARYALTERNATIVE
		endswitch	
	
    function tooWarm($t in RoomTemperatureRange) =  ($t>=26) //Above 26°C → Too warm — can cause discomfort or heat stress
    function isMealTime($t in TimeOfDay) = ($t = MEALTIME) 
    function isTimeForStartingTrainingSession($t in TimeOfDay) = ($t = STARTTRAININGTIME)
    function isTrainingTime($t in TimeOfDay) = ($t = TRAININGTIME)
 
/* DOMAIN-GENERAL DEFINITIONS */	
 
    //with no time constraint
	rule r_setObligation($c in Capability) = 
	par  
		constraint($c) := none
		//prepare out locations
		outObligation(id($c)) := true //true if doObligation is true 
		outConstraint(id($c)) := undef 
	endpar

	
	//overloading with an alternative obligation in case of constraint unsatisfied
	rule r_setObligation($c in Capability, $type in TCType, $t in Integer, $u in TimerUnit, $alt in Capability) = 
	par 
		r_setTimeConstraint[$c,$type,$t,$u]
		if isDef($alt) then otherwiseC($c) := $alt endif
		//prepare out locations
		outObligation(id($c)) := true 
		outConstraint(id($c)) := ($type,$t,$u,id($alt))
	endpar	
	
	
		
		