#!/usr/bin/env python3
"""
Fool-proof automatic .save generator for ngspice

Strategy:
- Run ngspice in batch mode
- Execute 'op' + 'display all'
- Parse ngspice-exposed device vectors
- Generate correct .save statements

Works across all PDKs and hierarchy styles.

Author: You
"""

import subprocess
import sys
import re
import tempfile
from pathlib import Path

# ============================================================
# CONFIG
# ============================================================

NGSPICE_BIN = "ngspice"

MOS_PARAMS = {
    "gm",
    "ids",
    "vgs",
    "vds",
    "vth",
    "vdsat",
    "cgg",
    "cgd",
}

# Regex matching ngspice MOS vectors exactly
MOS_RE = re.compile(
    r'^@n\.(.+)\[(\w+)\]\s*:'
)

# ============================================================
# NGSPICE RUNNER
# ============================================================

def run_ngspice_display(netlist_path):
    """
    Runs ngspice headless and returns 'display all' output lines
    """

    with tempfile.NamedTemporaryFile(
        mode="w",
        suffix=".spice",
        delete=False
    ) as tmp:
        tmp.write(f"""
* Auto-generated ngspice control file
.include "{netlist_path}"

.control
set nomoremode
op
display all
quit
.endc

.end
""")
        tmp_path = tmp.name

    try:
        proc = subprocess.run(
            [NGSPICE_BIN, "-b", tmp_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            check=True,
        )
        return proc.stdout.splitlines()

    finally:
        Path(tmp_path).unlink(missing_ok=True)

# ============================================================
# PARSER
# ============================================================

def extract_mos_saves(display_lines):
    saves = set()

    for line in display_lines:
        line = line.strip()

        m = MOS_RE.match(line)
        if not m:
            continue

        full_path = m.group(1)
        param = m.group(2)

        if param in MOS_PARAMS:
            saves.add(f".save @n.{full_path}[{param}]")

    return sorted(saves)

# ============================================================
# CLI
# ============================================================

def main():
    if len(sys.argv) != 2:
        print("Usage: python spice_autosave_from_ngspice.py <netlist.spice>")
        sys.exit(1)

    netlist = Path(sys.argv[1]).resolve()

    if not netlist.exists():
        print(f"Error: {netlist} not found")
        sys.exit(1)

    display_lines = run_ngspice_display(netlist)
    saves = extract_mos_saves(display_lines)

    print("* ==== AUTO-GENERATED SAVE STATEMENTS (ngspice truth) ====")
    for s in saves:
        print(s)


if __name__ == "__main__":
    main()

