
// Sample SLEEC rules 
asm test_10_2

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary_2

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {CAPABILITY1, CAPABILITY2, CAPABILITY3, CAPABILITY4, CAPABILITY5, CAPABILITY6, CAPABILITY7, CAPABILITY8, CAPABILITY9, CAPABILITY10, CAPABILITY11, CAPABILITY12, CAPABILITY13, CAPABILITY14, CAPABILITY15, CAPABILITY16, CAPABILITY17, CAPABILITY18, CAPABILITY19, CAPABILITY20}

	//functions
	//Events and sensed variables
	monitored condition1: Boolean
	monitored condition2: Boolean
	monitored condition3: Boolean
	monitored condition4: Boolean
	monitored condition5: Boolean
	monitored condition6: Boolean
	monitored condition7: Boolean
	monitored condition8: Boolean
	monitored condition9: Boolean
	monitored condition10: Boolean
	monitored condition11: Boolean
	monitored condition12: Boolean
	monitored condition13: Boolean
	monitored condition14: Boolean
	monitored condition15: Boolean
	monitored condition16: Boolean
	monitored condition17: Boolean
	monitored condition18: Boolean
	monitored condition19: Boolean
	monitored condition20: Boolean

	//Capabilities
	static capability1: Capability
	static capability2: Capability
	static capability3: Capability
	static capability4: Capability
	static capability5: Capability
	static capability6: Capability
	static capability7: Capability
	static capability8: Capability
	static capability9: Capability
	static capability10: Capability
	static capability11: Capability
	static capability12: Capability
	static capability13: Capability
	static capability14: Capability
	static capability15: Capability
	static capability16: Capability
	static capability17: Capability
	static capability18: Capability
	static capability19: Capability
	static capability20: Capability

	static id: Capability -> CapabilityID

	/* DOMAIN-GENERAL SIGNATURE */	
	out outObligation: CapabilityID -> Boolean //any due obligation (there could be more than one) is activated through a flag
	out outConstraint: CapabilityID -> Prod(TCType,Integer,TimerUnit,CapabilityID)

definitions:
/* DOMAIN-SPECIFIC DEFINITIONS*/

	function id($c in Capability) = 
		switch $c
		
		case capability1: CAPABILITY1
		case capability2: CAPABILITY2
		case capability3: CAPABILITY3
		case capability4: CAPABILITY4
		case capability5: CAPABILITY5
		case capability6: CAPABILITY6
		case capability7: CAPABILITY7
		case capability8: CAPABILITY8
		case capability9: CAPABILITY9
		case capability10: CAPABILITY10
		case capability11: CAPABILITY11
		case capability12: CAPABILITY12
		case capability13: CAPABILITY13
		case capability14: CAPABILITY14
		case capability15: CAPABILITY15
		case capability16: CAPABILITY16
		case capability17: CAPABILITY17
		case capability18: CAPABILITY18
		case capability19: CAPABILITY19
		case capability20: CAPABILITY20
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
	rule r_obligation5 = r_setObligation[capability5]
	rule r_obligation6 = r_setObligation[capability6]
	rule r_obligation7 = r_setObligation[capability7]
	rule r_obligation8 = r_setObligation[capability8]
	rule r_obligation9 = r_setObligation[capability9]
	rule r_obligation10 = r_setObligation[capability10]
	rule r_obligation11 = r_setObligation[capability11]
	rule r_obligation12 = r_setObligation[capability12]
	rule r_obligation13 = r_setObligation[capability13]
	rule r_obligation14 = r_setObligation[capability14]
	rule r_obligation15 = r_setObligation[capability15]
	rule r_obligation16 = r_setObligation[capability16]
	rule r_obligation17 = r_setObligation[capability17]
	rule r_obligation18 = r_setObligation[capability18]
	rule r_obligation19 = r_setObligation[capability19]
	rule r_obligation20 = r_setObligation[capability20]
	
	/*
	 * IF condition THEN obligation
	 * UNLESS condition IN WHICH CASE obligation
	 */
		rule r_Rule1 = 
		r_SLEEC[condition1, <<r_obligation1>>,
			condition2, <<r_obligation2>>
		]

	rule r_Rule2 = 
		r_SLEEC[condition3, <<r_obligation3>>,
			condition4, <<r_obligation4>>
		]

	rule r_Rule3 = 
		r_SLEEC[condition5, <<r_obligation5>>,
			condition6, <<r_obligation6>>
		]

	rule r_Rule4 = 
		r_SLEEC[condition7, <<r_obligation7>>,
			condition8, <<r_obligation8>>
		]

	rule r_Rule5 = 
		r_SLEEC[condition9, <<r_obligation9>>,
			condition10, <<r_obligation10>>
		]

	rule r_Rule6 = 
		r_SLEEC[condition11, <<r_obligation11>>,
			condition12, <<r_obligation12>>
		]

	rule r_Rule7 = 
		r_SLEEC[condition13, <<r_obligation13>>,
			condition14, <<r_obligation14>>
		]

	rule r_Rule8 = 
		r_SLEEC[condition15, <<r_obligation15>>,
			condition16, <<r_obligation16>>
		]

	rule r_Rule9 = 
		r_SLEEC[condition17, <<r_obligation17>>,
			condition18, <<r_obligation18>>
		]

	rule r_Rule10 = 
		r_SLEEC[condition19, <<r_obligation19>>,
			condition20, <<r_obligation20>>
		]

	
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
			r_Rule3[]
			r_Rule4[]
			r_Rule5[]
			r_Rule6[]
			r_Rule7[]
			r_Rule8[]
			r_Rule9[]
			r_Rule10[]
			endpar
		endseq

default init s0:
