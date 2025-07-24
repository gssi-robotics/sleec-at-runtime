from dataclasses import dataclass, field
from typing import List, Dict
import re

@dataclass
class Condition:
    domains: Dict[str, str] = field(default_factory=dict)
    enums: Dict[str, List[str]] = field(default_factory=dict)
    monitored: Dict[str, str] = field(default_factory=dict)
    constants: Dict[str, str] = field(default_factory=dict)

@dataclass
class Obligation:
    capabilities: List[str] = field(default_factory=list)
    capability_map: Dict[str, str] = field(default_factory=dict)



def extract_signature_block(content: str) -> str:
    '''Searches for the first match of the 'signature:' pattern in the text.'''
    match = re.search(r'signature:\s*(.*?)\ndefinitions:', content, re.DOTALL)
    if match:
        return match.group(1)
    else:
        print("[ERROR] Signature block not found.")
        return ""


def parse_signature_block(signature: str):
    '''Parses the signature block to extract domains, enums, monitored variables, constants, and capabilities.'''
    probe = Condition()
    obligation = Obligation()

    for line in signature.splitlines():
        '''Processes each line in the signature block to extract relevant information and populate Condition and Obligation objects.'''
        line = line.strip()
        if line.startswith('domain ') and 'subsetof' in line:
            name, base = re.findall(r'domain (\w+)\s+subsetof\s+(\w+)', line)[0]
            probe.domains[name] = base
        elif line.startswith('enum domain'):
            name, values = re.findall(r'enum domain (\w+)\s*=\s*{(.+)}', line)[0]
            enum_values = [v.strip() for v in values.split('|')]
            probe.enums[name] = enum_values
        elif line.startswith('monitored'):
            var, var_type = re.findall(r'monitored (\w+):\s*(\w+)', line)[0]
            probe.monitored[var] = var_type
        elif line.startswith('static') and ':' in line and 'Capability' not in line:
            const, const_type = re.findall(r'static (\w+):\s*(\w+)', line)[0]
            probe.constants[const] = const_type
        elif re.match(r'static \w+: Capability$', line):  # only get capability declarations and not the -> function
            cap = re.findall(r'static (\w+): Capability', line)[0]
            obligation.capabilities.append(cap)
        elif 'Capability -> CapabilityID' in line:
            var = re.findall(r'static (\w+): Capability -> CapabilityID', line)[0]
            obligation.capability_map[var] = 'CapabilityID'

    return probe, obligation
