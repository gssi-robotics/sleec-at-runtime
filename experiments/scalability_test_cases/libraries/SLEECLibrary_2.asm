
// definition of SLEEC rule 
//version: Multi obligation
// THIS IS AUTOMATICALLY GENERATED
module SLEECLibrary_2

import StandardLibrary
export *


signature:
	enum domain TimerUnit={NANOSEC, MILLISEC, SEC, MIN, HOUR}//lib
	enum domain TCType = {AFTER, WITHIN} //lib
	abstract domain Capability //lib
	dynamic abstract domain TimeConstraint //lib
	controlled value: TimeConstraint -> Integer //lib
	controlled unit: TimeConstraint -> TimerUnit //lib
	controlled type: TimeConstraint -> TCType //lib
	controlled otherwiseC: Capability -> Capability //lib, applicable only with WITHIN time constraint
	controlled constraint: Capability -> TimeConstraint //lib
	static doNothing : Capability //lib	
	static none : TimeConstraint //lib	

	//Obligations to act
	//controlled doObligation: Capability //lib; one obligation as output
	//NEW
	controlled doObligation: Capability -> Boolean //lib; to allow more obligations as output; only capabilities flagged to true are to be executed

definitions:

	rule r_skip = skip // named rule for doing nothing

	//lib
	rule r_setTimeConstraint($c in Capability, $type in TCType, $t in Integer, $u in TimerUnit) = 
	extend TimeConstraint with $tc do
		par
			value($tc) := $t
			unit($tc) := $u
			type($tc) := $type 
			constraint($c) := $tc
		endpar

	 //SLEEC constructor for 1 condition
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule) =
	 if $c0 then $o0 endif

	 //SLEEC constructor for 2 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 then $o1 endif endif


	// End of generated constructors
