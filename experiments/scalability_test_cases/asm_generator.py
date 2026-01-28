#!/usr/bin/env python3
"""
Generate ASM files with a specified number of rules and clauses.

Usage: asm_generator.py -n name -r R -c C [-o output_dir]

The script produces a file named <name>_R_C.asm in the output directory (current dir by default).
"""
import argparse
import os
import sys


TEMPLATE_PREFIX = """
// Sample SLEEC rules 
asm {name}_{R}_{C}

import ../libraries/StandardLibrary
import ../libraries/SLEECLibrary

signature:
	/* DOMAIN-SPECIFIC SIGNATURE */

	//domains
	enum domain CapabilityID = {{{caps}}}

	//functions
	//Events and sensed variables
	{monitored}

	//Capabilities
	{static_caps}

	static id: Capability -> CapabilityID

	/* DOMAIN-GENERAL SIGNATURE */	
	out outObligation: CapabilityID -> Boolean //any due obligation (there could be more than one) is activated through a flag
	out outConstraint: CapabilityID -> Prod(TCType,Integer,TimerUnit,CapabilityID)

definitions:
/* DOMAIN-SPECIFIC DEFINITIONS*/

	function id($c in Capability) = 
		switch $c
		{cases}
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

	{r_obligations}
	
	/*
	 * IF condition THEN obligation
	 * UNLESS condition IN WHICH CASE obligation
	 */
	{r_rules}
	
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
				{r_main_par}
			endpar
		endseq

default init s0:
"""


def generate(name:str, rules: int, clauses: int) -> str:
    total = rules * clauses

    # caps list for enum: CAPABILITY1, CAPABILITY2, ...
    caps = ", ".join(f"CAPABILITY{i}" for i in range(1, total + 1))

    # monitored conditions: monitored condition1: Boolean ...
    monitored = "\n\t".join(f"monitored condition{i}: Boolean" for i in range(1, total + 1))

    # static capabilities
    static_caps = "\n\t".join(f"static capability{i}: Capability" for i in range(1, total + 1))

    # function id switch cases
    cases = "\n\t\t" + "\n\t\t".join(
        f"case capability{i}: CAPABILITY{i}" for i in range(1, total + 1)
    )

    # r_obligation rules
    r_obligations = "\n\t".join(
        f"rule r_obligation{i} = r_setObligation[capability{i}]" for i in range(1, total + 1)
    )

    # r_rules: N rules each containing M pairs
    r_rules_blocks = []
    for rule_idx in range(1, rules + 1):
        # for each rule, compute M pairs. We number conditions and obligations sequentially
        pairs = []
        for j in range(1, clauses + 1):
            idx = (rule_idx - 1) * clauses + j
            pairs.append((f"condition{idx}", f"<<r_obligation{idx}>>"))

        # format pairs with indentation similar to template
        if pairs:
            lines = []
            for k, (cond, obl) in enumerate(pairs):
                comma = "," if k < len(pairs) - 1 else ""
                if k == 0:
                    lines.append(f"\t\tr_SLEEC[{cond}, {obl}{comma}")
                else:
                    lines.append(f"\t\t\t{cond}, {obl}{comma}")
            lines.append("\t\t]")
            block = "\n".join(lines)
        else:
            block = "\t\tr_SLEEC[]"

        r_rules_blocks.append(f"\trule r_Rule{rule_idx} = \n{block}\n")

    r_rules = "\n".join(r_rules_blocks)

    # r_main_par: list r_Rule1[] ... r_RuleN[]
    r_main_par = "\n\t\t\t".join(f"r_Rule{i}[]" for i in range(1, rules + 1))

    return TEMPLATE_PREFIX.format(
        name=name,
        R=rules,
        C=clauses,
        caps=caps,
        monitored=monitored,
        static_caps=static_caps,
        cases=cases,
        r_obligations=r_obligations,
        r_rules=r_rules,
        r_main_par=r_main_par,
    )


def write_out(content: str, name:str, out_dir: str, R: int, C: int) -> str:
    os.makedirs(out_dir, exist_ok=True)
    filename = f"{name}_{R}_{C}.asm"
    path = os.path.join(out_dir, filename)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
    return path


def main(argv=None):
    p = argparse.ArgumentParser(description="Generate ASM file")
    p.add_argument("-n", "--name", type=str, required=True, help="Name of test model")
    p.add_argument("-r", "--rules", type=int, required=True, help="Number of rules")
    p.add_argument("-c", "--clauses", type=int, required=True, help="Clauses per rule (base rule + hedge clauses)")
    p.add_argument("-o", "--out", default="models", help="Output directory relative to script (default: models)")
    args = p.parse_args(argv)

    name = args.name

    # normalize output dir relative to this script location
    script_dir = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(script_dir, args.out)

    content = generate(args.name, args.rules, args.clauses)
    out_path = write_out(content, name, out_dir, args.rules, args.clauses)
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
