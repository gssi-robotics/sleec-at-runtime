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

	rule r_showNextExercise = r_setObligation[showNextExercise,AFTER,1,MIN,doNothing]
	
	rule r_encourage = r_setObligation[encourage]
			
	rule r_askUserIntent = r_setObligation[askUserIntent]
	
	rule r_notifySessionEnd = r_setObligation[notifySessionEnd] 
	
	rule r_startTrainingSession = par r_setObligation[greetInUserLanguage] r_setObligation[startTrainingSession] endpar
	 
	rule r_startSessionWithDoorClosed = par r_setObligation[greetInUserLanguage] r_setObligation[closeDoor] r_setObligation[startTrainingSession] endpar
   
    rule r_startSessionWithDoorOpen = par r_setObligation[openDoor] r_setObligation[startTrainingSession,AFTER,5,MIN,doNothing] r_setObligation[explainUserWarmStart] endpar
    
    rule r_informNurse = r_setObligation[informNurse] 
    
    rule r_alertNurse = r_setObligation[alertNurse] 
    
    rule r_shareData = r_setObligation[shareData] 
    
    rule r_denyDataSharingWithExplanation= r_setObligation[denyDataSharingWithExplanation]
    
    rule r_remindUserMealTime = r_setObligation[remindUserMealTime] 
    
    rule r_explainUserWhenToHaveMeal = par r_setObligation[remindUserMealTime] r_setObligation[explainNoFood] endpar
    
    rule r_giveDietarySnackAndInform = par r_setObligation[giveDietarySnack] r_setObligation[informNurse] endpar 
       
    rule r_wakeUpUser = r_setObligation[wakeUpUser,WITHIN,5,MIN,alertNurse] 
    
    rule r_deliverMealPortions = r_setObligation[deliverMeal] 
     	
    rule r_explainUserDietAdherenceReason = par r_setObligation[explainDietAdherenceReason] r_setObligation[deliverMeal] endpar
    
    rule r_deliverDietaryApprovedCheatMeal = r_setObligation[deliverDietaryCheatMeal]
    
   
    
    /*
	* IF It's time for excersing session THEN (Greet in the user language AND Start session
	* UNLESS  The user cares about privacy  IN WHICH CASE (Greet in the user language AND Close the door AND Start session
	* UNLESS The room is too warm IN WHICH CASE (keep door open AND Start session AFTER 5 MIN AND Explain why)))
	*/
	rule r_Rule1 = 
		r_SLEEC[isTimeForStartingTrainingSession(timeOfDay), <<r_startTrainingSession>>, 
				userPrefersPrivacy, <<r_startSessionWithDoorClosed>>, 
				tooWarm(roomTemperature), <<r_startSessionWithDoorOpen>>] 
    
    /*
     * IF The user is not exercising THEN (Show the next exercise AFTER 1 min, 
     * UNLESS The user did less exercise repetitions than expected IN WHICH CASE (Encourage the user
     * UNLESS The user has been already encouraged IN WHICH CASE (Ask the user what they want to do 
     * UNLESS The user is tired IN WHICH CASE (Notify the user that the session is ending)))) 
     */
	rule r_Rule2 = 
		r_SLEEC[isTrainingTime(timeOfDay) and not userExercising, <<r_showNextExercise>>,  
				fewerExerciseRepetitions, <<r_encourage>>, 
				userEncouraged, <<r_askUserIntent>>,
				userIsTired, <<r_notifySessionEnd>>]
							 
	/*
	 * IF The user is exercising AND complains THEN (Encourage the user)
	 */
	rule r_Rule2a = 
		r_SLEEC[isTrainingTime(timeOfDay) and userExercising and userComplains, <<r_encourage>>]
		
    /*
	 * IF A person asks for user data THEN (Share data
	 * UNLESS The user did not grant the consent OR the person is unauthorized 
	 * IN WHICH CASE (Do not share data AND Explain why)) 
	 */
	rule r_Rule3 = 
		r_SLEEC[requestUserData, <<r_shareData>>,
				not userConsentGranted or unauthorizedPerson, <<r_denyDataSharingWithExplanation>>]	

	/*
	 IF It's meal time AND The user is not yet ready THEN (Remember to the user to eat 
	 * UNLESS The user is sleeping 
	 * IN WHICH CASE (Gently wake up the user WITHIN 5 minutes OTHERWISE Alert the nurse 
	 * UNLESS The user is in the REM stage of sleep IN WHICH CASE (Do not wake up the user AND Inform the nurse
	 * UNLESS The user is at risk of hypoglycemia IN WHICH CASE (Alert the nurse))))
	 */
	rule r_Rule4 = 
		r_SLEEC[isMealTime(timeOfDay) and not userReadyToEat, <<r_remindUserMealTime>>, 
				userIsSleeping, <<r_wakeUpUser>>,
				userInRemSleep, <<r_informNurse>>,
				riskOfHypoglycemia, <<r_alertNurse>>] //sound an alarm
	
	
	/*
	 * IF The user asks for food AND it is not meal time 
	 * THEN (Remind meal time AND Explain why the user cannot eat at the moment 
	 * UNLESS The user has low glucose level IN WHICH CASE (Give a dietary-approved snack AND Inform the nurse))
	 */
	rule r_Rule5 = 
		r_SLEEC[userRequestsFood and not isMealTime(timeOfDay), <<r_explainUserWhenToHaveMeal>>,
			glucoseLevel = LOW, <<r_giveDietarySnackAndInform>>] 

	
	/*
	 * IF It's meal time AND The user is ready THEN (Deliver meal portions
	 * UNLESS The user does not want to follow the daily diet 
	 * IN WHICH CASE (Explain why the user should adhere to the diet AND Deliver meal portions
	 * UNLESS The results of training exercise allows for a cheat meal 
	 * IN WHICH CASE (Deliver dietary-approved cheat meals)))"	 
	  */
	rule r_Rule6 = 
		r_SLEEC[isMealTime(timeOfDay) and userReadyToEat, <<r_deliverMealPortions>>,
				userDietRefusal, <<r_explainUserDietAdherenceReason>>,
				morningExerciseAllowsCheatMeal, <<r_deliverDietaryApprovedCheatMeal>>] 
	 
	
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
				r_Rule2[]
				r_Rule2a[]
				r_Rule3[]
				r_Rule4[]
				r_Rule5[]
				r_Rule6[]
			endpar
		endseq

default init s0:
