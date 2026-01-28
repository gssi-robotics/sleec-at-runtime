//Ethic controller for ARI-based assistive companion robot 
//ARI is capable of supporting patients that have diabet and have to follow 
//a diet and training program
// Sample SLEEC rules 

asm ARIEC

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary
import ARIECHeader

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain GlucoseLevel = {VERYLOW, LOW, NORMAL, HIGH}
	//A value representing a specific time during the daily routine; ANOTHER TIME is any other time excluding the previous ones 
	enum domain TimeOfDay = {MEALTIME, STARTTRAININGTIME, TRAININGTIME, ANOTHERTIME} 
	enum domain Permission = {GRANTED, DENIED, UNKNOWN} 

	enum domain CapabilityID = {GREETINUSERLANGUAGE, STARTTRAININGSESSION, CLOSEDOOR, ASKPERMISSIONFOROPENDOOR, ALERTNURSE, SHOWNEXTEXERCISE, ENCOURAGE, ASKUSERINTENT, NOTIFYSESSIONEND, DONOTHING, SHAREDATA, DENYDATASHARINGWITHEXPLANATION, REMINDUSERMEALTIME, WAKEUPUSER, INFORMNURSE, EXPLAINNOFOOD, GIVEDIETARYSNACK, DELIVERMEAL, EXPLAINDIETADHERENCEREASON, DELIVERDIETARYALTERNATIVE}

	domain RoomTemperatureRange subsetof Integer

	//functions
	//Events and sensed variables
	//SLEEC 1:
	monitored timeOfDay: TimeOfDay // There's the function to compute if it's time for exercising
	monitored userPrefersPrivacy: Boolean
	monitored roomTemperature: RoomTemperatureRange // There's the function to compute if the room is too hot
	//SLEEC 1a + SLEEC 1b:
	monitored userDoorOpenConsent: Permission
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
	static isDoorOpenPermissionAsked: Permission  -> Boolean
	static isDoorOpenConsentGranted: Permission  -> Boolean
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
    function isDoorOpenPermissionAsked($t in Permission) = ($t != UNKNOWN)
    function isDoorOpenConsentGranted($t in Permission) = ($t = GRANTED)
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

    //default: no obligation to do
	rule r_doNothing = r_setObligation[doNothing]


	/* DOMAIN-SPECIFIC CONTROL RULES*/ 
	
	rule r_greetAndStartTraining = par r_setObligation[greetInUserLanguage] r_setObligation[startTrainingSession] endpar

	rule r_greetCloseAndStartTraining = par r_setObligation[greetInUserLanguage] r_setObligation[closeDoor] r_setObligation[startTrainingSession] endpar

	rule r_askPermissionForOpenDoor = r_setObligation[askPermissionForOpenDoor]

	rule r_alertAndCloseDoor = par r_setObligation[alertNurse] r_setObligation[closeDoor] endpar

	rule r_showNextExercise = r_setObligation[showNextExercise]
	
	rule r_encourage = r_setObligation[encourage]
			
	rule r_askUserIntent = r_setObligation[askUserIntent]
	
	rule r_notifySessionEndAndAlert = par r_setObligation[notifySessionEnd] r_setObligation[alertNurse] endpar
    
    rule r_shareData = r_setObligation[shareData]
    
    rule r_denyDataSharingWithExplanation = r_setObligation[denyDataSharingWithExplanation]
    
    rule r_remindUserMealTime = r_setObligation[remindUserMealTime] 

    rule r_wakeUpUserOrAlert = r_setObligation[wakeUpUser]

	rule r_informNurse = r_setObligation[informNurse]

	rule r_alertNurse = r_setObligation[alertNurse]
    
    rule r_remindMealtimeAndExplainNoFood = par r_setObligation[remindUserMealTime] r_setObligation[explainNoFood] endpar
    
    rule r_giveDietarySnackAndInform = par r_setObligation[giveDietarySnack] r_setObligation[informNurse] endpar 
    
    rule r_deliverMealPortions = r_setObligation[deliverMeal] 
     	
    rule r_explainUserDietAndDeliver = par r_setObligation[explainDietAdherenceReason] r_setObligation[deliverMeal] endpar
    
    rule r_deliverDietaryApprovedAlternative = r_setObligation[deliverDietaryAlternative]
    
   
    
    /*
	 * IF It's time for an exercise session THEN (Greet in the user language AND Start session
	 * UNLESS The user cares about privacy  IN WHICH CASE (Greet in the user language AND Close the door AND Start session
	 * UNLESS The room is too warm IN WHICH CASE (Ask for permission to keep the door open
	 * UNLESS The permission has beed already asked IN WHICH CASE (do nothing))))
	 */
	rule r_Rule1 = 
		r_SLEEC[isTimeForStartingTrainingSession(timeOfDay), <<r_greetAndStartTraining>>, 
				userPrefersPrivacy, <<r_greetCloseAndStartTraining>>, 
				tooWarm(roomTemperature), <<r_askPermissionForOpenDoor>>,
				isDoorOpenPermissionAsked(userDoorOpenConsent), <<r_doNothing>>] 

	/*
	 * IF It is time for an exercise session AND The room is too warm AND The permission for keeping door open has already been asked AND The user agrees to keep the door open THEN (Greet in the user's language AND Start the session)
	 */
	 rule r_Rule1a = 
	 	r_SLEEC[isTimeForStartingTrainingSession(timeOfDay) and tooWarm(roomTemperature) and isDoorOpenPermissionAsked(userDoorOpenConsent) and isDoorOpenConsentGranted(userDoorOpenConsent), <<r_greetAndStartTraining>>]

	/*
	 * IF It is time for an exercise session AND The room is too warm AND The permission for keeping door open has already been asked AND The user does not agree to keep the door open THEN (Alert the nurse AND Close the door)
	 */
	 rule r_Rule1b =
	 	r_SLEEC[isTimeForStartingTrainingSession(timeOfDay) and tooWarm(roomTemperature) and isDoorOpenPermissionAsked(userDoorOpenConsent) and not isDoorOpenConsentGranted(userDoorOpenConsent), <<r_alertAndCloseDoor>>]

    /*
     * IF The user is not exercising THEN (Show the next exercise AFTER 1 min, 
	 * UNLESS The user did fewer exercise repetitions than expected IN WHICH CASE (Encourage the user
	 * UNLESS The user has already been encouraged IN WHICH CASE (Get input from the user through a graphical interface 
	 * UNLESS The user has physical issues resulting from the exercises IN WHICH CASE (Notify the user that the session is suspended AND Alert the nurse))))

     */
	rule r_Rule2 = 
		r_SLEEC[isTrainingTime(timeOfDay) and not userExercising, <<r_showNextExercise>>,  
				fewerExerciseRepetitions, <<r_encourage>>, 
				userEncouraged, <<r_askUserIntent>>,
				userPhysicalIssues, <<r_notifySessionEndAndAlert>>]
							 
	/*
	 * IF The user is exercising AND complains THEN (Encourage the user)
	 * UNLESS The user expressed the preference to exercise in silence IN WHICH CASE doNothing	
	 */
	rule r_Rule2a = 
		r_SLEEC[userExercising and userComplains, <<r_encourage>>,
				userSilentExercisePreference, <<r_doNothing>>]
		
    /*
	 * IF A person asks for user data THEN (Share data
	 * UNLESS The user did not grant the consent OR the person is not authorized to access that data IN WHICH CASE (Do not share data AND Explain why))
	 */
	rule r_Rule3 = 
		r_SLEEC[requestUserData, <<r_shareData>>,
				not userDataConsentGranted or unauthorizedPerson, <<r_denyDataSharingWithExplanation>>]	

	/*
	 * IF It's meal time AND The user is not yet ready THEN (Remember the user to eat
	 * UNLESS The user is sleeping IN WHICH CASE (Gently wake up the user WITHIN 5 minutes OTHERWISE Alert the nurse 
	 * UNLESS The user is in the REM stage of sleep IN WHICH CASE (Do not wake up the user AND Inform the nurse
	 * UNLESS The user is at risk of hypoglycemia IN WHICH CASE (Alert the nurse))))
	 */
	rule r_Rule4 = 
		r_SLEEC[isMealTime(timeOfDay) and not userReadyToEat, <<r_remindUserMealTime>>, 
				userIsSleeping, <<r_wakeUpUserOrAlert>>,
				userInRemSleep, <<r_informNurse>>,
				glucoseLevel = VERYLOW, <<r_alertNurse>>]
	
	/*
	 * IF The user asks for food AND it is not meal time THEN (Remind meal time AND Explain why the user cannot eat at the moment 
	 * UNLESS The user has a low glucose level IN WHICH CASE (Give a dietary-approved snack AND Inform the nurse))
	 */
	rule r_Rule5 = 
		r_SLEEC[userRequestsFood and not isMealTime(timeOfDay), <<r_remindMealtimeAndExplainNoFood>>,
			glucoseLevel = LOW or glucoseLevel = VERYLOW, <<r_giveDietarySnackAndInform>>] 

	
	/*
	 * IF It's meal time AND The user is ready THEN (Deliver meal portions
	 * UNLESS The user wants to eat something outside the dietary plan IN WHICH CASE (Explain why the user should adhere to the diet AND Deliver meal portions
	 * UNLESS The results of the training exercise allow for a different food IN WHICH CASE (Deliver dietary-approved different food)))	 
	*/
	rule r_Rule6 = 
		r_SLEEC[isMealTime(timeOfDay) and userReadyToEat, <<r_deliverMealPortions>>,
				userDietRefusal, <<r_explainUserDietAndDeliver>>,
				differentFoodAllowed, <<r_deliverDietaryApprovedAlternative>>] 
	 
	
/* DOMAIN-GENERAL RULES*/
	
	//reset of all locations that contribute to the out location output
	rule r_Reset =
	 	forall $c in Capability do 
	 		par
				//info($c) := (undef,undef,undef,undef,undef)
				outConstraint(id($c)) := undef //(undef,undef,undef,undef)
				//doObligation($c) := false //NEW
			    outObligation(id($c)) := false //NEW
				constraint($c) := undef
				otherwiseC($c) := undef
			endpar
			
	main rule r_Main =  
		seq	
			r_Reset[] //reset of out locations in sequential order, otherwise the function resetting updates will not be visible to the other rules in one machine step
			par
				r_Rule1[]
				r_Rule1a[] 
				r_Rule1b[]
				r_Rule2[]
				r_Rule2a[]
				r_Rule3[]
				r_Rule4[]
				r_Rule5[]
				r_Rule6[]
			endpar
		endseq

default init s0:
