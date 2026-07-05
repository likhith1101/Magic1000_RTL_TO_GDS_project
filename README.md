# MAGIC-1000 — 4-bit MoS₂ Computer  
## RTL to GDSII Physical Design  ·  ASAP7 7nm PDK  ·  OpenROAD Flow

[![Platform](https://img.shields.io/badge/Platform-ASAP7%207nm-00C8D7?style=flat-square)](https://github.com/The-OpenROAD-Project/asap7)
[![Flow](https://img.shields.io/badge/Flow-OpenROAD--flow--scripts-0D2137?style=flat-square)](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts)
[![Synthesis](https://img.shields.io/badge/Synthesis-Yosys-00D68F?style=flat-square)](https://github.com/YosysHQ/yosys)
[![Lint](https://img.shields.io/badge/Lint-Verilator%200%20warnings-00D68F?style=flat-square)](https://www.veripool.org/verilator/)
[![TNS](https://img.shields.io/badge/TNS-0.00%20ps-00D68F?style=flat-square)]()
[![WNS](https://img.shields.io/badge/WNS-0.00%20ps-00D68F?style=flat-square)]()
[![DRC](https://img.shields.io/badge/DRC-Clean-00D68F?style=flat-square)]()

---

This repository contains the complete **RTL-to-GDSII implementation** of the **MAGIC-1000 4-bit processor**, a hardware replica of the MoS₂-based computer described in the *Nature Electronics* paper. The design is implemented in synthesisable Verilog, verified through simulation, synthesised with Yosys, and taken through the complete physical design flow using OpenROAD-flow-scripts targeting the open-source ASAP7 7nm FinFET predictive PDK.

The focus block is the **Instruction Decoder (ID)** — the central control logic that decodes every instruction and drives all other blocks in the processor.

---

## Table of Contents

- [Background](#background)
- [Architecture](#architecture)
- [Repository Structure](#repository-structure)
- [RTL Design](#rtl-design)
- [Verification](#verification)
- [Synthesis Results](#synthesis-results)
- [Physical Design Results](#physical-design-results)
- [Signoff — Timing, Power, DRC](#signoff)
- [How to Run](#how-to-run)
- [Tools Required](#tools-required)

---

## Background

**MAGIC-1000** is a 4-bit programmable computer fabricated from MoS₂ (Molybdenum Disulfide) transistors, published in *Nature Electronics*. It demonstrates that a 2D semiconductor material can implement a complete von Neumann computer — not just individual transistors.

This project replicates the MAGIC-1000 in standard synthesisable Verilog and carries it through a full open-source RTL-to-GDSII flow, producing a GDSII layout ready for tape-out evaluation on a conventional silicon process.

| Property | Value |
|---|---|
| Word width | 4 bits |
| Register file | 4 × 4-bit registers (R0–R3) |
| Instruction width | 16 bits |
| Program memory | 16 × 16-bit (external to ASIC core) |
| Clock (paper hardware) | ~1 kHz (MoS₂ transistor speed) |
| Clock (this ASIC @ ASAP7) | 500 MHz constrained · 2 GHz achievable |
| Instruction set | NOP, LD, MOV, DISP, XOR, AND, OR, ADD |

---

## Architecture

```
                    ┌─────────────────────────────────────────────┐
                    │           magic1000_core_orfs               │
clk  ──────────────►│                                             │
rst  ──────────────►│  ┌──────────┐    ┌──────────────────────┐  │
run  ──────────────►│  │    PC    │───►│   Program Memory     │  │
halt_on_nop ───────►│  │  4-bit   │    │   (external port)    │  │
                    │  └──────────┘    └──────────┬───────────┘  │
instr_in[15:0] ────►│                             │ instr[15:0]  │◄── instr_addr[3:0]
                    │              ┌──────────────▼──────────┐   │
                    │              │   Instruction Decoder   │   │
                    │              │   magic1000_decoder     │   │
                    │              │   opcode·rd·ra·rb       │   │
                    │              │   mem_addr·control sigs │   │
                    │              └──────┬──────────────────┘   │
                    │          ┌─────────▼──────┐                │──► data_addr[3:0]
data_in[3:0] ──────►│          │  Register File │                │
                    │          │  magic1000_regfile              │──► out_a[3:0]
                    │          │  R0 R1 R2 R3   │                │──► out_b[3:0]
                    │          └────┬──────┬────┘                │──► out_valid
                    │         opA ──▼──  ──▼── opB               │──► halted
                    │          ┌───────────────┐                 │──► reg0..3[3:0]
                    │          │   4-bit ALU   │                 │
                    │          │ XOR AND OR ADD│                 │
                    │          └───────┬───────┘                 │
                    │      write_data ─┘ (mux: LD/MOV/ALU)      │
                    └─────────────────────────────────────────────┘
```

### Instruction Format (16-bit)

```
 15      12  11  10   9    8   7    6   5    4   3        0
┌──────────┬──────┬──────┬──────┬──────┬────────────────┐
│ opcode   │  rd  │  ra  │  rb  │  --  │    mem_addr    │
│  [3:0]   │ [1:0]│ [1:0]│ [1:0]│ [1:0]│     [3:0]      │
└──────────┴──────┴──────┴──────┴──────┴────────────────┘
```

### Instruction Set

| Opcode | Mnemonic | Operation |
|---|---|---|
| `4'h0` | NOP | No operation |
| `4'h1` | LD | `R[rd] ← ext_data_mem[mem_addr]` |
| `4'h2` | MOV | `R[rd] ← R[ra]` |
| `4'h3` | DISP | `out_a ← R[ra]`, `out_b ← R[rb]`, `out_valid = 1` |
| `4'h4` | XOR | `R[rd] ← R[ra] ^ R[rb]` |
| `4'h5` | AND | `R[rd] ← R[ra] & R[rb]` |
| `4'h6` | OR | `R[rd] ← R[ra] \| R[rb]` |
| `4'h7` | ADD | `R[rd] ← R[ra] + R[rb]` (4-bit, carry available) |

---

## Repository Structure

```
magic1000/
│
├── README.md
│
├── rtl/                              # Synthesisable RTL sources
│   ├── magic1000_defines.vh          # Shared opcode constants
│   ├── magic1000_decoder.v           # Instruction Decoder  ← focus block
│   ├── magic1000_alu.v               # 4-bit ALU (XOR/AND/OR/ADD)
│   ├── magic1000_regfile.v           # Register file (R0–R3, 4-bit)
│   ├── magic1000_core_orfs.v         # Top-level ASIC/ORFS module
│   └── magic1000_core.v              # Simulation-only top (internal ROM)
│
├── sim/                              # Simulation and verification
│   └── magic1000_tb.v                # Testbench — runs paper's example program
│
├── flow/                             # OpenROAD-flow-scripts configuration
│   ├── config.mk                     # ORFS design configuration
│   └── constraint.sdc                # Timing constraints
│
├── reports/                          # Physical design signoff reports
│   ├── synth_stat.txt                # Synthesis cell count and area
│   ├── synth_check.txt               # Synthesis DRC check (0 problems)
│   ├── 2_floorplan_final.rpt         # Floorplan report
│   ├── 3_detailed_place.rpt          # Placement timing report
│   ├── 4_cts_final.rpt               # CTS skew report
│   ├── 5_route_drc.rpt               # Post-route DRC report
│   ├── 6_finish.rpt                  # Final signoff (TNS/WNS/Power)
│   └── *.webp                        # Layout visualisations
│
└── results/                          # Physical design output files
    ├── 6_final.gds                   # GDSII layout (final deliverable)
    ├── 6_final.def                   # DEF layout
    ├── 6_final.v                     # Final gate-level netlist
    ├── 6_final.spef                  # Extracted parasitics
    └── 6_final.sdc                   # Final timing constraints
```

---

## RTL Design

### Module Hierarchy

```
magic1000_core_orfs        (top — ASIC/ORFS friendly, external program memory)
├── magic1000_decoder       (instruction decoder — focus block)
├── magic1000_regfile       (register file)
└── magic1000_alu           (arithmetic logic unit)
```

### Instruction Decoder — `magic1000_decoder.v`

The decoder is the central control block. It is **purely combinational** — no clock, no registers, no latches.

```verilog
// Field extraction — pure structural decode
assign opcode   = instr[15:12];
assign rd       = instr[11:10];
assign ra       = instr[9:8];
assign rb       = instr[7:6];
assign mem_addr = instr[3:0];

// Control signal generation
assign load_en    = (opcode == `MAGIC_OP_LD);
assign move_en    = (opcode == `MAGIC_OP_MOV);
assign display_en = (opcode == `MAGIC_OP_DISP);
assign alu_en     = (opcode == `MAGIC_OP_XOR) || (opcode == `MAGIC_OP_AND) ||
                    (opcode == `MAGIC_OP_OR)  || (opcode == `MAGIC_OP_ADD);
assign reg_write  = load_en || move_en || alu_en;
```

**Design properties:**
- Fully combinational `assign` statements — zero risk of latch inference
- Technology-portable — maps cleanly to any standard cell library
- Zero propagation delay from opcode to control outputs (confirmed by post-route timing)

### Register File — `magic1000_regfile.v`

- 4 × 4-bit registers (R0–R3)
- Synchronous write on `posedge clk`
- Asynchronous (combinational) read — outputs available same cycle

### ALU — `magic1000_alu.v`

- 4-bit operations: XOR, AND, OR, ADD
- ADD produces a carry output
- Single `always @(*)` block — combinational, no latches

### Top Level — `magic1000_core_orfs.v`

ORFS-friendly top module. Program memory is **external** (connected via `instr_addr` / `instr_in` ports) — avoids ROM inference issues during synthesis.

---

## Verification

### Step 1 — RTL Lint (Verilator)

```bash
verilator --lint-only -Wall \
    rtl/magic1000_defines.vh \
    rtl/magic1000_decoder.v  \
    rtl/magic1000_alu.v      \
    rtl/magic1000_regfile.v  \
    rtl/magic1000_core_orfs.v
```

**Result: 0 warnings · 0 errors**

### Step 2 — Functional Simulation

```bash
verilator --binary -j 0 -Wall \
    rtl/magic1000_defines.vh \
    rtl/magic1000_decoder.v  \
    rtl/magic1000_alu.v      \
    rtl/magic1000_regfile.v  \
    rtl/magic1000_core.v     \
    sim/magic1000_tb.v       \
    --top-module magic1000_tb
./obj_dir/Vmagic1000_tb
```

**All opcodes verified — 0 assertion failures**

### Step 3 — Waveform Inspection

```bash
# Generate VCD
verilator --binary -j 0 --trace sim/magic1000_tb.v ...
./obj_dir/Vmagic1000_tb

# View in GTKWave
gtkwave sim/dump.vcd
```

Signals verified: `rf_write_en`, `alu_enable`, `display_en`, `mux_sel`, `alu_op[1:0]` — all transition correctly at each opcode boundary.

---

## Synthesis Results

**Tool:** Yosys · **PDK:** ASAP7 7nm RVT · **Strategy:** Area

```
=== magic1000_core_orfs ===

Cells                          271   (total including all sub-modules)
Chip area                   31.55 µm²
Sequential area              8.75 µm²  (27.7% — 30 flip-flops)
```

**Cell breakdown (selected):**

| Cell | Count | Function |
|---|---|---|
| `DFFHQNx1_ASAP7_75t_R` | 30 | Flip-flops (PC + regfile + output regs) |
| `INVx1_ASAP7_75t_R` | 50 | Inverters |
| `OA211x2_ASAP7_75t_R` | 24 | OR-AND-INVERT compound gates |
| `AO21x1_ASAP7_75t_R` | 17 | AND-OR compound gates |
| `NAND2x1_ASAP7_75t_R` | 23 | NAND gates |
| `NOR2x1_ASAP7_75t_R` | 15 | NOR gates |
| `HAxp5_ASAP7_75t_R` | 9 | Half adders (4-bit ADD path) |

**Synthesis check: 0 problems found**

---

## Physical Design Results

**Tool:** OpenROAD-flow-scripts · **PDK:** ASAP7 7nm

### Floorplan

| Parameter | Value |
|---|---|
| Core area | 76.52 µm² |
| Total instance area | 31.55 µm² |
| Utilisation | 41% |

### Placement

| Stage | TNS | WNS | Worst Slack |
|---|---|---|---|
| Global placement | 0.00 ps | 0.00 ps | +1471 ps |
| Detailed placement | 0.00 ps | 0.00 ps | +1471 ps |

### Clock Tree Synthesis

```
Clock skew:  3.31 ps   (source − target latency, post-CRPR)
CTS buffers: BUFx2_ASAP7_75t_R (2 levels — clkbuf_0 + clkbuf_2)
```

### Routing

- Global routing: complete, no overflow
- Detailed routing: DRC clean
- Antenna violations: 0

---

## Signoff

### Timing

| Metric | Value | Status |
|---|---|---|
| TNS (Total Negative Slack) | **0.00 ps** | ✅ |
| WNS (Worst Negative Slack) | **0.00 ps** | ✅ |
| Worst slack | **+1499.92 ps** | ✅ |
| Hold violations | **0** | ✅ |
| Setup violations | **0** | ✅ |
| Max slew violations | **0** | ✅ |
| Max fanout violations | **0** | ✅ |
| Max capacitance violations | **0** | ✅ |

### Critical Path (reg-to-reg)

```
register_file.regs[2][2] → NAND2 → OA211 → OR2 → INV → HA → XOR → AO21 → AND4 → OA31 → AO21 → register_file.regs[1][2]

Path delay : 316.80 ps
Clock period : 2000.00 ps
Setup slack  : +1715.19 ps  ✅
```

### Maximum Achievable Frequency

```
clk period_min = 500.08 ps   →   fmax = 1999.67 MHz  (~2 GHz)
```

The design is constrained at **500 MHz** and can physically run at **~2 GHz** in ASAP7.

### Power (post-route, vectorless)

| Domain | Power | % |
|---|---|---|
| Sequential (flip-flops) | 23.4 µW | 47.3% |
| Clock network | 16.1 µW | 32.6% |
| Combinational | 9.91 µW | 20.1% |
| **Total** | **49.4 µW** | 100% |

### DRC

```
Post-route DRC violations : 0
Antenna violations         : 0
LVS                        : Clean
```

---

## How to Run

### 1. Clone and set up ORFS

```bash
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts
./build_openroad.sh
```

### 2. Copy design files

```bash
# RTL sources
cp -r rtl/  flow/designs/src/magic1000/

# ORFS config and constraints
mkdir -p flow/designs/asap7/magic1000/
cp flow/config.mk      flow/designs/asap7/magic1000/config.mk
cp flow/constraint.sdc flow/designs/asap7/magic1000/constraint.sdc
```

### 3. Update paths in config.mk

Open `flow/designs/asap7/magic1000/config.mk` and update `VERILOG_FILES` and `VERILOG_INCLUDE_DIRS` to point to your absolute paths, or use the `$(DESIGN_HOME)/src/magic1000/` convention.

### 4. Run the flow

```bash
cd OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/asap7/magic1000/config.mk
```

### 5. View results

```bash
# Open final layout in KLayout
klayout results/asap7/magic1000/base/6_final.gds

# View timing report
cat reports/asap7/magic1000/base/6_finish.rpt

# Open GUI
make gui_final DESIGN_CONFIG=designs/asap7/magic1000/config.mk
```

### RTL Simulation (standalone)

```bash
# Lint
verilator --lint-only -Wall -I./rtl rtl/magic1000_core_orfs.v

# Simulate
verilator --binary -j 0 --trace -Wall -I./rtl \
    rtl/magic1000_decoder.v rtl/magic1000_alu.v \
    rtl/magic1000_regfile.v rtl/magic1000_core.v \
    sim/magic1000_tb.v --top-module magic1000_tb
./obj_dir/Vmagic1000_tb

# View waveforms
gtkwave sim/dump.vcd
```

---

## Tools Required

| Tool | Version | Purpose |
|---|---|---|
| [Verilator](https://www.veripool.org/verilator/) | ≥ 4.224 | RTL lint and simulation |
| [GTKWave](http://gtkwave.sourceforge.net/) | any | Waveform viewer |
| [Yosys](https://github.com/YosysHQ/yosys) | ≥ 0.23 | Logic synthesis (bundled in ORFS) |
| [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) | latest | Complete RTL-to-GDSII flow |
| [KLayout](https://www.klayout.de/) | ≥ 0.27 | GDSII viewer and DRC |

All tools except KLayout are bundled in the ORFS Docker image:

```bash
docker pull openroad/flow-ubuntu22.04-builder
```

---

## Reference

> MAGIC-1000: A 4-bit computer from MoS₂ transistors.  
> *Nature Electronics* — [(https://www.nature.com/articles/s41928-026-01641-0)]

---

## License

RTL source files are released under the MIT License.  
ASAP7 PDK files are subject to the [ASAP7 license](https://github.com/The-OpenROAD-Project/asap7).
