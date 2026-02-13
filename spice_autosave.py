#!/usr/bin/env python3
"""
Automatic .save generator for SPICE / ngspice netlists

Features:
- Device name agnostic
- Hierarchy aware
- Correct ngspice @n.x1.xm1.model[param] syntax
- Works with xschem-generated netlists
- Robust across PDKs (IHP, SKY130, GF, etc.)

Author: You
"""

from pathlib import Path
import sys

# ============================================================
# CONFIGURATION
# ============================================================

MOS_PARAMS = [
    "gm",
    "ids",
    "cgg",
    "cgd",
    "vth",
    "vdsat",
    "vgs",
    "vds",
]

MOS_KEYWORDS = ("nmos", "pmos")

# ============================================================
# DATA CLASSES
# ============================================================

class Mosfet:
    def __init__(self, name, model):
        self.name = name.lower()     # exact instance name
        self.model = model.lower()


class Instance:
    def __init__(self, name, subckt):
        self.name = name.lower()
        self.subckt = subckt


class Subckt:
    def __init__(self, name):
        self.name = name
        self.devices = []
        self.instances = []


# ============================================================
# NETLIST PARSER
# ============================================================

class SpiceNetlist:
    def __init__(self, filepath):
        self.filepath = Path(filepath)
        self.subckts = {}
        self.top = Subckt("__top__")
        self.mos_models = set()

    # ----------------------------
    # PASS 1: Collect MOS models
    # ----------------------------
    def collect_models(self):
        with open(self.filepath) as f:
            for raw in f:
                line = raw.strip()
                if not line or line.startswith("*"):
                    continue

                l = line.lower()

                # .model <name> nmos/pmos
                if l.startswith(".model"):
                    toks = l.split()
                    if len(toks) >= 3:
                        model = toks[1]
                        if any(k in toks[2] for k in MOS_KEYWORDS):
                            self.mos_models.add(model)

                # Fallback: PDK-style model names
                for tok in l.split():
                    if any(k in tok for k in MOS_KEYWORDS):
                        self.mos_models.add(tok)

    # ----------------------------
    # PASS 2: Parse hierarchy
    # ----------------------------
    def parse(self):
        current = self.top

        with open(self.filepath) as f:
            for raw in f:
                line = raw.strip()
                if not line or line.startswith("*"):
                    continue

                l = line.lower()
                tokens = line.split()

                if l.startswith(".subckt"):
                    name = tokens[1]
                    current = Subckt(name)
                    self.subckts[name] = current
                    continue

                if l.startswith(".ends"):
                    current = self.top
                    continue

                # Only X-lines can be MOS or subckt instances
                if tokens[0][0].lower() == "x" and len(tokens) >= 6:
                    inst_name = tokens[0]
                    model_candidate = tokens[5]

                    # MOS device
                    if model_candidate.lower() in self.mos_models:
                        current.devices.append(
                            Mosfet(inst_name, model_candidate)
                        )
                    else:
                        # Subckt instance
                        current.instances.append(
                            Instance(inst_name, tokens[-1])
                        )

    # ----------------------------
    # HIERARCHY WALK + SAVE GEN
    # ----------------------------
    def generate_saves(self, params):
        saves = []

        def walk(subckt, path):
            # Devices at this level
            for dev in subckt.devices:
                full_path = ".".join(path + [dev.name, dev.model])
                for p in params:
                    saves.append(f".save @n.{full_path}[{p}]")

            # Descend into subckt instances
            for inst in subckt.instances:
                if inst.subckt in self.subckts:
                    walk(
                        self.subckts[inst.subckt],
                        path + [inst.name]
                    )

        walk(self.top, [])
        return saves


# ============================================================
# CLI
# ============================================================

def main():
    if len(sys.argv) != 2:
        print("Usage: python spice_autosave.py <netlist.spice>")
        sys.exit(1)

    netlist = SpiceNetlist(sys.argv[1])
    netlist.collect_models()
    netlist.parse()

    saves = netlist.generate_saves(MOS_PARAMS)

    print("* ==== AUTO-GENERATED SAVE STATEMENTS ====")
    for s in saves:
        print(s)


if __name__ == "__main__":
    main()

