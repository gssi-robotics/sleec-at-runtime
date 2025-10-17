//Ethic controller for ARI-based assistive companion robot 
//ARI is capable of supporting patients that have diabet and have to follow 
//a diet and training program
// Sample SLEEC rules 

asm ARIEC

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary
import ARIECHeader

signature: 
	
definitions:

    //default: no obligation to do
	rule r_doNothing = r_setObligation[doNothing]
	
	/* DOMAIN-SPECIFIC CONTROL RULES*/ 
	
	rule r_greetAndStartTraining = par r_setObligation[greetInUserLanguage] r_setObligation[startTrainingSession] endpar

	rule r_greetCloseAndStartTraining = par r_setObligation[greetInUserLanguage] r_setObligation[closeDoor] r_setObligation[startTrainingSession] endpar

	rule r_askPermissionForOpenDoor = r_setObligation[askPermissionForOpenDoor]

	rule r_alertAndCloseDoor = par r_setObligation[alertNurse] r_setObligation[closeDoor] endpar

	rule r_showNextExercise = r_setObligation[showNextExercise,AFTER,1,MIN,doNothing]
	
	rule r_encourage = r_setObligation[encourage]
			
	rule r_askUserIntent = r_setObligation[askUserIntent]
	
	rule r_notifySessionEndAndAlert = par r_setObligation[notifySessionEnd] r_setObligation[alertNurse] endpar
    
    rule r_shareData = r_setObligation[shareData]
    
    rule r_denyDataSharingWithExplanation = r_setObligation[denyDataSharingWithExplanation]
    
    rule r_remindUserMealTime = r_setObligation[remindUserMealTime] 

    rule r_wakeUpUserOrAlert = r_setObligation[wakeUpUser,WITHIN,5,MIN,alertNurse]

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
