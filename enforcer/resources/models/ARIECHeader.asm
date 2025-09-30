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
	enum domain GlucoseLevel = {LOW, NORMAL, HIGH}
	//A value representing a specific time during the daily routine; ANOTHER TIME is any other time excluding the previous ones 
	enum domain TimeOfDay = {MEALTIME, STARTTRAININGTIME, TRAININGTIME, ANOTHERTIME} 
	
	enum domain CapabilityID = {SHOWNEXTEXERCISE, ENCOURAGE, ASKUSERINTENT, ENDSESSION, STARTTRAININGSESSION, CLOSEDOOR, OPENDOOR, INFORMNURSE, ALERTNURSE, SHAREDATA, DONOTHING, DENYDATASHARINGWITHEXPLANATION, REMINDMEALTIME, WAKEUPUSER, EXPLAINNOFOOD, DELIVERMEAL, EXPLAINDIETADHERENCE, DELIVERDIETARYCHEATMEAL, GREETINUSERLANGUAGE, EXPLAINWARMSTART, GIVEDIETARYSNACK}
	
	domain RoomTemperatureRange subsetof Integer
	
	
	
	//functions
	//Events and sensed variables
	//SLEEC1:
	monitored userExercising: Boolean
	monitored fewerExerciseRepetitions: Boolean
	monitored userEncouraged: Boolean
	monitored userIsTired: Boolean 
	monitored userComplains: Boolean
	monitored userReadyToEat: Boolean
	monitored userPrefersPrivacy: Boolean 
	monitored medicalEmergencyAlert: Boolean
	monitored requestUserData: Boolean
	monitored userConsentGranted: Boolean
	monitored unauthorizedPerson: Boolean
	monitored userIsSleeping: Boolean
	monitored userInRemSleep: Boolean
	monitored riskOfHypoglycemia: Boolean
	monitored userRequestsFood: Boolean
	monitored userDietRefusal: Boolean
	monitored morningExerciseAllowsCheatMeal: Boolean
	monitored glucoseLevel: GlucoseLevel
	monitored roomTemperature: RoomTemperatureRange 
	monitored timeOfDay: TimeOfDay
	
	//Capabilities
	static showNextExercise: Capability
	static encourage: Capability
	static askUserIntent: Capability
	static notifySessionEnd: Capability
	static greetInUserLanguage: Capability
	static closeDoor: Capability
	static openDoor: Capability
	static startTrainingSession: Capability
	static informNurse: Capability
	static alertNurse: Capability //includes sound alarm
	static shareData: Capability
	static denyDataSharingWithExplanation: Capability
	static remindUserMealTime: Capability
	static wakeUpUser: Capability
	static explainNoFood: Capability
	static deliverMeal: Capability
	static explainDietAdherenceReason: Capability
	static deliverDietaryCheatMeal:Capability
	static explainUserWarmStart: Capability //explainWarmStart — indicates that the session begins with a delay and door open due to excessive heat.
	static giveDietarySnack: Capability
	
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
			case showNextExercise : SHOWNEXTEXERCISE
			case encourage : ENCOURAGE
			case askUserIntent : ASKUSERINTENT
			case notifySessionEnd: ENDSESSION
			case startTrainingSession: STARTTRAININGSESSION
			case closeDoor: CLOSEDOOR
			case openDoor: OPENDOOR
			case informNurse: INFORMNURSE
			case alertNurse: ALERTNURSE
			case shareData: SHAREDATA
			case denyDataSharingWithExplanation: DENYDATASHARINGWITHEXPLANATION
			case remindUserMealTime: REMINDMEALTIME
			case wakeUpUser: WAKEUPUSER
			case explainNoFood: EXPLAINNOFOOD
			case deliverMeal: DELIVERMEAL
			case explainDietAdherenceReason: EXPLAINDIETADHERENCE
			case deliverDietaryCheatMeal: DELIVERDIETARYCHEATMEAL
			case greetInUserLanguage: GREETINUSERLANGUAGE
			case explainUserWarmStart: EXPLAINWARMSTART
			case giveDietarySnack: GIVEDIETARYSNACK
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
	
	
		
		