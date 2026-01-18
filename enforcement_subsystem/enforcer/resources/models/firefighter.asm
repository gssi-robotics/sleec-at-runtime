//Version: Multiple obligation
// Sample SLEEC rules for a firefighter UAV
//CaseStudies/FireFighter/jss_running_example.sleec

asm firefighter

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary
import firefighterHeader

signature: 
	
definitions:
	

	/* DOMAIN-SPECIFIC CONTROL RULES*/
    
	 
    //default: no obligation to do
	rule r_doNothing = r_setObligation[doNothing]
	
	rule r_soundAlarm = r_setObligation[soundAlarm]
			
	rule r_soundAlarmWithinTwoSeconds = r_setObligation[soundAlarm,WITHIN,2,SEC,doNothing]
	
	rule r_goHome = r_setObligation[goHome]
		
	rule r_goHomeAfterFiveMinutes = r_setObligation[goHome,AFTER,5,MIN,doNothing]

	rule r_goHomeWithinOneMinute = r_setObligation[goHome,WITHIN,1,MIN,doNothing]
	
	
	//legal, social
	rule r_Rule1 =
		if cameraStart and personNearby then r_soundAlarm[] endif 	
	
	//legal, ethical	
	rule r_Rule2 =
		if cameraStart and personNearby then r_soundAlarmWithinTwoSeconds[] endif
			
	//legal		
	rule r_Rule3 =
       //if alarmRinging then r_goHomeAfterFiveMinutes[] endif 
		r_SLEEC[alarmRinging,<<r_goHomeAfterFiveMinutes>>]
		
	rule r_RuleA =
	   //if batteryCritical and temperature < 25.0 then r_goHomeWithinOneMinute[] endif 
		r_SLEEC[batteryCritical and temperature < 25.0,<<r_goHomeWithinOneMinute>>]
		
	//emphatatic	
	rule r_Rule4 =
		r_SLEEC[cameraStart, <<r_soundAlarm>>, personNearby, <<r_goHome>>, temperature > 35.0, <<r_doNothing>>]
		
	  
	/* CONSTANT (DOMAIN-GENERAL) RULES*/
	

	//reset of all locations that contribute to the out location output
	rule r_Reset =
	 	forall $c in Capability do 
	 		par
				info($c) := (undef,undef,undef,undef,undef)
				outConstraint(id($c)) := undef //(undef,undef,undef,undef)
				doObligation($c) := false //NEW
			    outObligation(id($c)) := false //NEW
				constraint($c) := undef
				otherwiseC($c) := undef
			endpar
	
	
	invariant inv_I0 over  doObligation, outObligation: (forall $c in Capability with (doObligation($c) = outObligation(id($c)) ))
	
	
	
	/* DOMAIN-SPECIFIC RULES*/
		
	main rule r_Main =  
		seq	
			r_Reset[] //reset of out locations in sequential order, otherwise the function resetting updates will not be visible to the other rules in one machine step
			//par 
			//Rule1 and Rule2 are redundant (inconsistent update on secondary attributes of the doOblication) 
			//r_Rule1[]
			//r_Rule2[]
			//r_Rule3[] //Rule1 and RuleA are in conflict (inconsistent update on doOblication: e.g. doObligation updated to soundAlarm and goHome) [From the source spec: they are conflicting rules: RuleA requires GoHome to take place, but Rule3 forbids it.
			r_Rule4[] 
			r_RuleA[]
			//example of SLEEC rule covering all modeling constructs
			//r_SLEEC[cameraStart, <<r_soundAlarm>>, personNearby, <<r_goHomeWithinOneMinute>>, temperature > 35.0, <<r_goHomeAfterFiveMinutes>>]
			//endpar
		endseq

default init s0:


