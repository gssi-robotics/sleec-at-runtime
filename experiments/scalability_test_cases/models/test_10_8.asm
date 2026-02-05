
// Sample SLEEC rules 
asm test_10_8

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary_8

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {CAPABILITY1, CAPABILITY2, CAPABILITY3, CAPABILITY4, CAPABILITY5, CAPABILITY6, CAPABILITY7, CAPABILITY8, CAPABILITY9, CAPABILITY10, CAPABILITY11, CAPABILITY12, CAPABILITY13, CAPABILITY14, CAPABILITY15, CAPABILITY16, CAPABILITY17, CAPABILITY18, CAPABILITY19, CAPABILITY20, CAPABILITY21, CAPABILITY22, CAPABILITY23, CAPABILITY24, CAPABILITY25, CAPABILITY26, CAPABILITY27, CAPABILITY28, CAPABILITY29, CAPABILITY30, CAPABILITY31, CAPABILITY32, CAPABILITY33, CAPABILITY34, CAPABILITY35, CAPABILITY36, CAPABILITY37, CAPABILITY38, CAPABILITY39, CAPABILITY40, CAPABILITY41, CAPABILITY42, CAPABILITY43, CAPABILITY44, CAPABILITY45, CAPABILITY46, CAPABILITY47, CAPABILITY48, CAPABILITY49, CAPABILITY50, CAPABILITY51, CAPABILITY52, CAPABILITY53, CAPABILITY54, CAPABILITY55, CAPABILITY56, CAPABILITY57, CAPABILITY58, CAPABILITY59, CAPABILITY60, CAPABILITY61, CAPABILITY62, CAPABILITY63, CAPABILITY64, CAPABILITY65, CAPABILITY66, CAPABILITY67, CAPABILITY68, CAPABILITY69, CAPABILITY70, CAPABILITY71, CAPABILITY72, CAPABILITY73, CAPABILITY74, CAPABILITY75, CAPABILITY76, CAPABILITY77, CAPABILITY78, CAPABILITY79, CAPABILITY80}

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
	monitored condition21: Boolean
	monitored condition22: Boolean
	monitored condition23: Boolean
	monitored condition24: Boolean
	monitored condition25: Boolean
	monitored condition26: Boolean
	monitored condition27: Boolean
	monitored condition28: Boolean
	monitored condition29: Boolean
	monitored condition30: Boolean
	monitored condition31: Boolean
	monitored condition32: Boolean
	monitored condition33: Boolean
	monitored condition34: Boolean
	monitored condition35: Boolean
	monitored condition36: Boolean
	monitored condition37: Boolean
	monitored condition38: Boolean
	monitored condition39: Boolean
	monitored condition40: Boolean
	monitored condition41: Boolean
	monitored condition42: Boolean
	monitored condition43: Boolean
	monitored condition44: Boolean
	monitored condition45: Boolean
	monitored condition46: Boolean
	monitored condition47: Boolean
	monitored condition48: Boolean
	monitored condition49: Boolean
	monitored condition50: Boolean
	monitored condition51: Boolean
	monitored condition52: Boolean
	monitored condition53: Boolean
	monitored condition54: Boolean
	monitored condition55: Boolean
	monitored condition56: Boolean
	monitored condition57: Boolean
	monitored condition58: Boolean
	monitored condition59: Boolean
	monitored condition60: Boolean
	monitored condition61: Boolean
	monitored condition62: Boolean
	monitored condition63: Boolean
	monitored condition64: Boolean
	monitored condition65: Boolean
	monitored condition66: Boolean
	monitored condition67: Boolean
	monitored condition68: Boolean
	monitored condition69: Boolean
	monitored condition70: Boolean
	monitored condition71: Boolean
	monitored condition72: Boolean
	monitored condition73: Boolean
	monitored condition74: Boolean
	monitored condition75: Boolean
	monitored condition76: Boolean
	monitored condition77: Boolean
	monitored condition78: Boolean
	monitored condition79: Boolean
	monitored condition80: Boolean

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
	static capability21: Capability
	static capability22: Capability
	static capability23: Capability
	static capability24: Capability
	static capability25: Capability
	static capability26: Capability
	static capability27: Capability
	static capability28: Capability
	static capability29: Capability
	static capability30: Capability
	static capability31: Capability
	static capability32: Capability
	static capability33: Capability
	static capability34: Capability
	static capability35: Capability
	static capability36: Capability
	static capability37: Capability
	static capability38: Capability
	static capability39: Capability
	static capability40: Capability
	static capability41: Capability
	static capability42: Capability
	static capability43: Capability
	static capability44: Capability
	static capability45: Capability
	static capability46: Capability
	static capability47: Capability
	static capability48: Capability
	static capability49: Capability
	static capability50: Capability
	static capability51: Capability
	static capability52: Capability
	static capability53: Capability
	static capability54: Capability
	static capability55: Capability
	static capability56: Capability
	static capability57: Capability
	static capability58: Capability
	static capability59: Capability
	static capability60: Capability
	static capability61: Capability
	static capability62: Capability
	static capability63: Capability
	static capability64: Capability
	static capability65: Capability
	static capability66: Capability
	static capability67: Capability
	static capability68: Capability
	static capability69: Capability
	static capability70: Capability
	static capability71: Capability
	static capability72: Capability
	static capability73: Capability
	static capability74: Capability
	static capability75: Capability
	static capability76: Capability
	static capability77: Capability
	static capability78: Capability
	static capability79: Capability
	static capability80: Capability

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
		case capability21: CAPABILITY21
		case capability22: CAPABILITY22
		case capability23: CAPABILITY23
		case capability24: CAPABILITY24
		case capability25: CAPABILITY25
		case capability26: CAPABILITY26
		case capability27: CAPABILITY27
		case capability28: CAPABILITY28
		case capability29: CAPABILITY29
		case capability30: CAPABILITY30
		case capability31: CAPABILITY31
		case capability32: CAPABILITY32
		case capability33: CAPABILITY33
		case capability34: CAPABILITY34
		case capability35: CAPABILITY35
		case capability36: CAPABILITY36
		case capability37: CAPABILITY37
		case capability38: CAPABILITY38
		case capability39: CAPABILITY39
		case capability40: CAPABILITY40
		case capability41: CAPABILITY41
		case capability42: CAPABILITY42
		case capability43: CAPABILITY43
		case capability44: CAPABILITY44
		case capability45: CAPABILITY45
		case capability46: CAPABILITY46
		case capability47: CAPABILITY47
		case capability48: CAPABILITY48
		case capability49: CAPABILITY49
		case capability50: CAPABILITY50
		case capability51: CAPABILITY51
		case capability52: CAPABILITY52
		case capability53: CAPABILITY53
		case capability54: CAPABILITY54
		case capability55: CAPABILITY55
		case capability56: CAPABILITY56
		case capability57: CAPABILITY57
		case capability58: CAPABILITY58
		case capability59: CAPABILITY59
		case capability60: CAPABILITY60
		case capability61: CAPABILITY61
		case capability62: CAPABILITY62
		case capability63: CAPABILITY63
		case capability64: CAPABILITY64
		case capability65: CAPABILITY65
		case capability66: CAPABILITY66
		case capability67: CAPABILITY67
		case capability68: CAPABILITY68
		case capability69: CAPABILITY69
		case capability70: CAPABILITY70
		case capability71: CAPABILITY71
		case capability72: CAPABILITY72
		case capability73: CAPABILITY73
		case capability74: CAPABILITY74
		case capability75: CAPABILITY75
		case capability76: CAPABILITY76
		case capability77: CAPABILITY77
		case capability78: CAPABILITY78
		case capability79: CAPABILITY79
		case capability80: CAPABILITY80
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
	rule r_obligation21 = r_setObligation[capability21]
	rule r_obligation22 = r_setObligation[capability22]
	rule r_obligation23 = r_setObligation[capability23]
	rule r_obligation24 = r_setObligation[capability24]
	rule r_obligation25 = r_setObligation[capability25]
	rule r_obligation26 = r_setObligation[capability26]
	rule r_obligation27 = r_setObligation[capability27]
	rule r_obligation28 = r_setObligation[capability28]
	rule r_obligation29 = r_setObligation[capability29]
	rule r_obligation30 = r_setObligation[capability30]
	rule r_obligation31 = r_setObligation[capability31]
	rule r_obligation32 = r_setObligation[capability32]
	rule r_obligation33 = r_setObligation[capability33]
	rule r_obligation34 = r_setObligation[capability34]
	rule r_obligation35 = r_setObligation[capability35]
	rule r_obligation36 = r_setObligation[capability36]
	rule r_obligation37 = r_setObligation[capability37]
	rule r_obligation38 = r_setObligation[capability38]
	rule r_obligation39 = r_setObligation[capability39]
	rule r_obligation40 = r_setObligation[capability40]
	rule r_obligation41 = r_setObligation[capability41]
	rule r_obligation42 = r_setObligation[capability42]
	rule r_obligation43 = r_setObligation[capability43]
	rule r_obligation44 = r_setObligation[capability44]
	rule r_obligation45 = r_setObligation[capability45]
	rule r_obligation46 = r_setObligation[capability46]
	rule r_obligation47 = r_setObligation[capability47]
	rule r_obligation48 = r_setObligation[capability48]
	rule r_obligation49 = r_setObligation[capability49]
	rule r_obligation50 = r_setObligation[capability50]
	rule r_obligation51 = r_setObligation[capability51]
	rule r_obligation52 = r_setObligation[capability52]
	rule r_obligation53 = r_setObligation[capability53]
	rule r_obligation54 = r_setObligation[capability54]
	rule r_obligation55 = r_setObligation[capability55]
	rule r_obligation56 = r_setObligation[capability56]
	rule r_obligation57 = r_setObligation[capability57]
	rule r_obligation58 = r_setObligation[capability58]
	rule r_obligation59 = r_setObligation[capability59]
	rule r_obligation60 = r_setObligation[capability60]
	rule r_obligation61 = r_setObligation[capability61]
	rule r_obligation62 = r_setObligation[capability62]
	rule r_obligation63 = r_setObligation[capability63]
	rule r_obligation64 = r_setObligation[capability64]
	rule r_obligation65 = r_setObligation[capability65]
	rule r_obligation66 = r_setObligation[capability66]
	rule r_obligation67 = r_setObligation[capability67]
	rule r_obligation68 = r_setObligation[capability68]
	rule r_obligation69 = r_setObligation[capability69]
	rule r_obligation70 = r_setObligation[capability70]
	rule r_obligation71 = r_setObligation[capability71]
	rule r_obligation72 = r_setObligation[capability72]
	rule r_obligation73 = r_setObligation[capability73]
	rule r_obligation74 = r_setObligation[capability74]
	rule r_obligation75 = r_setObligation[capability75]
	rule r_obligation76 = r_setObligation[capability76]
	rule r_obligation77 = r_setObligation[capability77]
	rule r_obligation78 = r_setObligation[capability78]
	rule r_obligation79 = r_setObligation[capability79]
	rule r_obligation80 = r_setObligation[capability80]
	
	/*
	 * IF condition THEN obligation
	 * UNLESS condition IN WHICH CASE obligation
	 */
		rule r_Rule1 = 
		r_SLEEC[condition1, <<r_obligation1>>,
			condition2, <<r_obligation2>>,
			condition3, <<r_obligation3>>,
			condition4, <<r_obligation4>>,
			condition5, <<r_obligation5>>,
			condition6, <<r_obligation6>>,
			condition7, <<r_obligation7>>,
			condition8, <<r_obligation8>>
		]

	rule r_Rule2 = 
		r_SLEEC[condition9, <<r_obligation9>>,
			condition10, <<r_obligation10>>,
			condition11, <<r_obligation11>>,
			condition12, <<r_obligation12>>,
			condition13, <<r_obligation13>>,
			condition14, <<r_obligation14>>,
			condition15, <<r_obligation15>>,
			condition16, <<r_obligation16>>
		]

	rule r_Rule3 = 
		r_SLEEC[condition17, <<r_obligation17>>,
			condition18, <<r_obligation18>>,
			condition19, <<r_obligation19>>,
			condition20, <<r_obligation20>>,
			condition21, <<r_obligation21>>,
			condition22, <<r_obligation22>>,
			condition23, <<r_obligation23>>,
			condition24, <<r_obligation24>>
		]

	rule r_Rule4 = 
		r_SLEEC[condition25, <<r_obligation25>>,
			condition26, <<r_obligation26>>,
			condition27, <<r_obligation27>>,
			condition28, <<r_obligation28>>,
			condition29, <<r_obligation29>>,
			condition30, <<r_obligation30>>,
			condition31, <<r_obligation31>>,
			condition32, <<r_obligation32>>
		]

	rule r_Rule5 = 
		r_SLEEC[condition33, <<r_obligation33>>,
			condition34, <<r_obligation34>>,
			condition35, <<r_obligation35>>,
			condition36, <<r_obligation36>>,
			condition37, <<r_obligation37>>,
			condition38, <<r_obligation38>>,
			condition39, <<r_obligation39>>,
			condition40, <<r_obligation40>>
		]

	rule r_Rule6 = 
		r_SLEEC[condition41, <<r_obligation41>>,
			condition42, <<r_obligation42>>,
			condition43, <<r_obligation43>>,
			condition44, <<r_obligation44>>,
			condition45, <<r_obligation45>>,
			condition46, <<r_obligation46>>,
			condition47, <<r_obligation47>>,
			condition48, <<r_obligation48>>
		]

	rule r_Rule7 = 
		r_SLEEC[condition49, <<r_obligation49>>,
			condition50, <<r_obligation50>>,
			condition51, <<r_obligation51>>,
			condition52, <<r_obligation52>>,
			condition53, <<r_obligation53>>,
			condition54, <<r_obligation54>>,
			condition55, <<r_obligation55>>,
			condition56, <<r_obligation56>>
		]

	rule r_Rule8 = 
		r_SLEEC[condition57, <<r_obligation57>>,
			condition58, <<r_obligation58>>,
			condition59, <<r_obligation59>>,
			condition60, <<r_obligation60>>,
			condition61, <<r_obligation61>>,
			condition62, <<r_obligation62>>,
			condition63, <<r_obligation63>>,
			condition64, <<r_obligation64>>
		]

	rule r_Rule9 = 
		r_SLEEC[condition65, <<r_obligation65>>,
			condition66, <<r_obligation66>>,
			condition67, <<r_obligation67>>,
			condition68, <<r_obligation68>>,
			condition69, <<r_obligation69>>,
			condition70, <<r_obligation70>>,
			condition71, <<r_obligation71>>,
			condition72, <<r_obligation72>>
		]

	rule r_Rule10 = 
		r_SLEEC[condition73, <<r_obligation73>>,
			condition74, <<r_obligation74>>,
			condition75, <<r_obligation75>>,
			condition76, <<r_obligation76>>,
			condition77, <<r_obligation77>>,
			condition78, <<r_obligation78>>,
			condition79, <<r_obligation79>>,
			condition80, <<r_obligation80>>
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
