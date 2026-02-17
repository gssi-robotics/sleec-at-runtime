
// definition of SLEEC rule 
//version: Multi obligation
// THIS IS AUTOMATICALLY GENERATED
module SLEECLibrary_12

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

	 //SLEEC constructor for 3 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 then $o2 endif endif endif

	 //SLEEC constructor for 4 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 then $o3 endif endif endif endif

	 //SLEEC constructor for 5 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 then $o4 endif endif endif endif endif

	 //SLEEC constructor for 6 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 then $o5 endif endif endif endif endif endif

	 //SLEEC constructor for 7 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 then $o6 endif endif endif endif endif endif endif

	 //SLEEC constructor for 8 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule, $c7 in Boolean, $o7 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and not $c7 then $o6
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 then $o7 endif endif endif endif endif endif endif endif

	 //SLEEC constructor for 9 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule, $c7 in Boolean, $o7 in Rule, $c8 in Boolean, $o8 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and not $c7 then $o6
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and not $c8 then $o7
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 then $o8 endif endif endif endif endif endif endif endif endif

	 //SLEEC constructor for 10 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule, $c7 in Boolean, $o7 in Rule, $c8 in Boolean, $o8 in Rule, $c9 in Boolean, $o9 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and not $c7 then $o6
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and not $c8 then $o7
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and not $c9 then $o8
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 then $o9 endif endif endif endif endif endif endif endif endif endif

	 //SLEEC constructor for 11 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule, $c7 in Boolean, $o7 in Rule, $c8 in Boolean, $o8 in Rule, $c9 in Boolean, $o9 in Rule, $c10 in Boolean, $o10 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and not $c7 then $o6
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and not $c8 then $o7
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and not $c9 then $o8
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 and not $c10 then $o9
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 and $c10 then $o10 endif endif endif endif endif endif endif endif endif endif endif

	 //SLEEC constructor for 12 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule, $c5 in Boolean, $o5 in Rule, $c6 in Boolean, $o6 in Rule, $c7 in Boolean, $o7 in Rule, $c8 in Boolean, $o8 in Rule, $c9 in Boolean, $o9 in Rule, $c10 in Boolean, $o10 in Rule, $c11 in Boolean, $o11 in Rule) =
	 if $c0 and not $c1 then $o0
	 else if $c0 and $c1 and not $c2 then $o1
	 else if $c0 and $c1 and $c2 and not $c3 then $o2
	 else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and not $c5 then $o4
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and not $c6 then $o5
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and not $c7 then $o6
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and not $c8 then $o7
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and not $c9 then $o8
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 and not $c10 then $o9
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 and $c10 and not $c11 then $o10
	 else if $c0 and $c1 and $c2 and $c3 and $c4 and $c5 and $c6 and $c7 and $c8 and $c9 and $c10 and $c11 then $o11 endif endif endif endif endif endif endif endif endif endif endif endif


	// End of generated constructors
