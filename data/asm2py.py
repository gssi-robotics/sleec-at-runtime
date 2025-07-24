import os
import json
from converter import *
from typing import Dict

# base paths
CURRENT_DIR = os.getcwd()
CONFIG_PATH = os.path.join(CURRENT_DIR, 'enforcer', 'enforcer', 'config.json')
ASM_BASE_PATH = os.path.join(CURRENT_DIR, 'enforcer', 'resources', 'models')


def load_config(config_path):
    '''Load ASMETA config file.'''
    with open(config_path, 'r') as file:
        config = json.load(file)
    return config

def read_asm_files(file_list, base_path):
    '''Read ASM files from the specified base path.'''
    asm_contents = {}
    for filename in file_list:
        file_path = os.path.join(base_path, filename)
        try:
            with open(file_path, 'r') as f:
                asm_contents[filename] = f.read()
        except FileNotFoundError:
            print(f"[ERROR] File not found: {file_path}")
    return asm_contents


def asm_to_py_type(asm_type: str, domain_map: Dict[str, str]) -> str:
    '''Convert ASMETA type to Python type.'''
    # basic mapping
    base_types = {
        "Boolean": "bool",
        "Integer": "int",
        "Real": "float",
    }

    # convert custom domain types
    while asm_type in domain_map:
        asm_type = domain_map[asm_type]

    return base_types.get(asm_type, asm_type)  # Fall back to original if unknown

def extract_id_function_mapping(content: str) -> Dict[str, str]:
    '''Extract the mapping from the id() capability function in ASMETA content.'''
    match = re.search(r'function id\(.*?\)\s*=\s*switch.*?endswitch', content, re.DOTALL)
    if not match:
        return {}

    switch_block = match.group(0)
    cases = re.findall(r'case (\w+)\s*:\s*(\w+)', switch_block)
    return {lhs: rhs for lhs, rhs in cases}


def generate_data_struct(probe: Condition, obligation: Obligation, id_mapping: Dict[str, str]) -> str:
    '''Generate the full Python code (for data structures) from the Condition and Obligation data.'''
    lines = [
        "from enum import Enum",
        "from typing import Optional",
        "from dataclasses import dataclass\n",
        "# === ENUMS ==="
    ]
    
    # Enums from domain
    for enum_name, values in probe.enums.items():
        lines.append(f"class {enum_name}(str, Enum):")
        for val in values:
            lines.append(f"    {val.upper()} = \"{val}\"")
        lines.append("")

    # Capability enum
    lines.append("class Capability(str, Enum):")
    for cap in obligation.capabilities:
        lines.append(f"    {cap.upper()} = \"{cap}\"")
    lines.append("")

    # Condition class
    lines.append("@dataclass")
    lines.append("class Condition:")
    for var, typ in probe.monitored.items():
        py_type = asm_to_py_type(typ, probe.domains)
        lines.append(f"    {var}: {py_type}")
    for var, typ in probe.constants.items():
        py_type = asm_to_py_type(typ, probe.domains)
        lines.append(f"    {var}: {py_type}")
    lines.append("")

    # Obligation dataclass with get_capability() from id
    lines.append("@dataclass")
    lines.append("class Obligation:")
    lines.append("    capability_id: CapabilityID\n")
    lines.append("    mapping = {")
    for cid, cap in id_mapping.items():
        lines.append(f"        CapabilityID.{cid.upper()}: Capability.{cap.upper()}.value,")
    lines.append("    }\n")
    lines.append("    def get_capability(self) -> str:")
    lines.append("        return self.mapping[self.capability_id]")

    return "\n".join(lines)


def main(asmHeaderFile):
    config = load_config(CONFIG_PATH)
    other_models = config.get("asmeta_server", {}).get("other_models", [])
    
    if not other_models:
        print("No 'other_models' found in config.")
        return

    asm_data = read_asm_files(other_models, ASM_BASE_PATH)
    
    content = asm_data[asmHeaderFile]
    
    signature_block = extract_signature_block(content)
    probe, obligation = parse_signature_block(signature_block)

    
    # Extract id() mapping from asm
    id_mapping = extract_id_function_mapping(content)

    # Generate data structure Python code
    full_code = generate_data_struct(probe, obligation, id_mapping)

    # Save to single output file
    output_path = os.path.join(CURRENT_DIR, 'data', "model_structures.py")
    with open(output_path, "w") as f:
        f.write(full_code)

    print(f"Condition & Obligation data structures written to {output_path}")



if __name__ == "__main__":
    main("firefighterHeader.asm")
