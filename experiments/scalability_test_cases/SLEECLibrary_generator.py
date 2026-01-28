#!/usr/bin/env python3
#!/usr/bin/env python3
from __future__ import annotations
import argparse
from pathlib import Path
import sys
import os


def gen_constructor(k: int) -> str:
    """Generate the r_SLEEC constructor for k conditions."""
    params = ", ".join(f"$c{i} in Boolean, $o{i} in Rule" for i in range(k))
    lines = []
    lines.append(f"\t //SLEEC constructor for {k} condition{'s' if k!=1 else ''}\n")
    lines.append(f"\t rule r_SLEEC({params}) =\n")

    if k == 1:
        lines.append("\t if $c0 then $o0 endif\n\n")
        return "".join(lines)

    # build the chain of if / else if branches
    for j in range(k):
        if j == 0:
            cond = "$c0 and not $c1"
            action = "$o0"
            lines.append(f"\t if {cond} then {action}\n")
        elif j < k - 1:
            cond = " and ".join(f"${{c{i}}}" for i in range(j + 1))
            cond = cond + f" and not $c{j+1}"
            action = f"$o{j}"
            lines.append(f"\t else if {cond} then {action}\n")
        else:
            cond = " and ".join(f"${{c{i}}}" for i in range(k))
            action = f"$o{j}"
            endif_suffix = " endif" * k
            lines.append(f"\t else if {cond} then {action}{endif_suffix}\n\n")

    return "".join(lines)


def generate_block(n: int) -> str:
    parts = [gen_constructor(i) for i in range(1, n + 1)]
    return "".join(parts)


# Embedded base header from SLEECLibrary.asm up to before the SLEEC constructors.
# This makes the script self-contained and avoids reading/replacing the original file.
BASE_HEADER = '''
// definition of SLEEC rule 
//version: Multi obligation
// THIS IS AUTOMATICALLY GENERATED
module SLEECLibrary

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
	 if ($c0 and not $c1) then $o0 
	 else if ($c0 and $c1 and not $c2) then $o1 
     else if ($c0 and $c1 and $c2 and not $c3) then $o2
     else if ($c0 and $c1 and $c2 and $c3) then $o3 endif endif endif endif

	 //SLEEC constructor for 5 conditions
	 rule r_SLEEC($c0 in Boolean, $o0 in Rule, $c1 in Boolean, $o1 in Rule, $c2 in Boolean, $o2 in Rule, $c3 in Boolean, $o3 in Rule, $c4 in Boolean, $o4 in Rule) =
	 	if $c0 and not $c1 then $o0 
		else if $c0 and $c1 and not $c2 then $o1 
		else if $c0 and $c1 and $c2 and not $c3 then $o2
		else if $c0 and $c1 and $c2 and $c3 and not $c4 then $o3
		else if $c0 and $c1 and $c2 and $c3 and $c4 then $o4
	    endif endif endif endif endif

'''

FOOTER = """\n\t// End of generated constructors\n"""


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Generate a SLEECLibrary.asm containing constructors 1..N.")
    parser.add_argument("-n", "--num", type=int, required=True, help="Generate constructors 1..N")
    parser.add_argument("--outdir", type=Path, default=os.path.join(Path(__file__).parent,"libraries"), help="Output directory (defaults to script dir)")
    args = parser.parse_args(argv)

    n = args.num
    if n < 1:
        print("n must be >= 1", file=sys.stderr)
        return 2

    outdir = args.outdir
    outdir.mkdir(parents=True, exist_ok=True)
    outfile = outdir / f"SLEECLibrary_{n}.asm"

    generated = generate_block(n)

    final_text = BASE_HEADER + generated + FOOTER

    outfile.write_text(final_text, encoding="utf-8")
    print(f"Wrote {outfile} (constructors 1..{n})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
