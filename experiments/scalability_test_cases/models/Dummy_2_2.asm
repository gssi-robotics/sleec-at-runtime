// Sample SLEEC rules 
asm Dummy_2_2

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {CAPABILITY1, CAPABILITY2, CAPABILITY3, CAPABILITY4}

	//functions
	//Events and sensed variables
	monitored condition1: Boolean
	monitored condition2: Boolean
	monitored condition3: Boolean
	monitored condition4: Boolean

	//Capabilities
	static capability1: Capability
	static capability2: Capability
	static capability3: Capability
	static capability4: Capability

	static id: Capability -> CapabilityID

	/* DOMAIN-GENERAL SIGNATURE */	
	out outObligation: CapabilityID -> Boolean //any due obligation (there could be more than one) is activated through a flag
	out outConstraint: CapabilityID -> Prod(TCType,Integer,TimerUnit,CapabilityID)
	
definitions:
/* DOMAIN-SPECIFIC DEFINITIONS*/
	
	function id($c in Capability) = 
		switch $c
			case capability1: CAPABILITY1
			case capability1: CAPABILITY2
			case capability1: CAPABILITY3
			case capability1: CAPABILITY4
		endswitch	
 
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

	rule r_obligation1 = r_setObligation[capability1]
	rule r_obligation2 = r_setObligation[capability2]
	rule r_obligation3 = r_setObligation[capability3]
	rule r_obligation4 = r_setObligation[capability4]
    
    /*
	 * IF condition1 THEN obligation1
	 * UNLESS condition2 IN WHICH CASE obligation2
	 */
	rule r_Rule1 = 
		r_SLEEC[condition1, <<r_obligation1>>, 
				condition2, <<r_obligation2>>]

    /*
	 * IF condition3 THEN obligation3
	 * UNLESS condition4 IN WHICH CASE obligation4
	 */
	rule r_Rule2 = 
		r_SLEEC[condition3, <<r_obligation3>>, 
				condition4, <<r_obligation4>>]
	
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
			endpar
		endseq

default init s0:
