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
            cond = " and ".join(f"$c{i}" for i in range(j + 1))
            cond = cond + f" and not $c{j+1}"
            action = f"$o{j}"
            lines.append(f"\t else if {cond} then {action}\n")
        else:
            cond = " and ".join(f"$c{i}" for i in range(k))
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
module SLEECLibrary_{N}

import StandardLibrary
export *

'''

SIGNATURES = '''
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

'''

FOOTER = """\n\t// End of generated constructors\n"""


def main(argv: list[str] | None = None) -> int:
	parser = argparse.ArgumentParser(description="Generate a SLEECLibrary.asm containing constructors 1..N.")
	parser.add_argument("-n", "--num", type=int, required=True, help="Generate constructors 1..N")
	parser.add_argument("--outdir", type=Path, default=os.path.join(Path(__file__).parent.parent, "libraries"), help="Output directory (defaults to script dir)")
	args = parser.parse_args(argv)

	n = args.num
	outdir = args.outdir
	generate_sleeclibrary(n, outdir)
	return 0


def generate_sleeclibrary(n: int, outdir: Path | str) -> Path:
	"""Generate a SLEECLibrary file with constructors 1..n into `outdir` and return the Path."""
	if n < 1:
		raise ValueError("n must be >= 1")

	outdir = Path(outdir)
	outdir.mkdir(parents=True, exist_ok=True)
	outfile = outdir / f"SLEECLibrary_{n}.asm"

	generated = generate_block(n)
	final_text = BASE_HEADER.format(N=n) + SIGNATURES + generated + FOOTER

	outfile.write_text(final_text, encoding="utf-8")
	print(f"Wrote {outfile} (constructors 1..{n})")
	return outfile


if __name__ == "__main__":
	raise SystemExit(main())


if __name__ == "__main__":
    raise SystemExit(main())
