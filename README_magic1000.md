# MAGIC-1000 · RTL to GDSII Physical Design

[![Platform](https://img.shields.io/badge/Platform-ASAP7%207nm-00C8D7?style=flat-square)]()
[![Flow](https://img.shields.io/badge/Flow-OpenROAD--flow--scripts-0D2137?style=flat-square)]()
[![TNS](https://img.shields.io/badge/TNS-0.00%20ps-00D68F?style=flat-square)]()
[![WNS](https://img.shields.io/badge/WNS-0.00%20ps-00D68F?style=flat-square)]()
[![DRC](https://img.shields.io/badge/DRC-Clean-00D68F?style=flat-square)]()
[![Power](https://img.shields.io/badge/Power-49.4%20µW-FFB830?style=flat-square)]()
[![fmax](https://img.shields.io/badge/fmax-~2%20GHz-00D68F?style=flat-square)]()

Complete **RTL-to-GDSII physical design** of the **MAGIC-1000 4-bit MoS₂ processor**, a hardware replica of the computer described in *Nature Electronics*. The design flows from synthesisable Verilog through Yosys synthesis and the full OpenROAD physical design flow, producing a DRC-clean GDSII layout targeting the ASAP7 7nm FinFET predictive PDK.

---

## Repository Structure

```
rtl-to-gdsii-flow/
│
├── README.md
│
├── rtl/
│   ├── magic1000_defines.vh       # Shared opcode constants
│   ├── magic1000_decoder.v        # Instruction Decoder  ← focus block
│   ├── magic1000_alu.v            # 4-bit ALU (XOR/AND/OR/ADD)
│   ├── magic1000_regfile.v        # Register file (R0–R3, 4-bit)
│   ├── magic1000_core_orfs.v      # ASIC/ORFS top-level (external ROM)
│   └── magic1000_core.v           # Simulation-only top (internal ROM)
│
├── sim/
│   └── magic1000_tb.v             # Testbench — runs paper's example program
│
├── flow/
│   ├── config.mk                  # OpenROAD-flow-scripts configuration
│   └── constraint.sdc             # Timing constraints
│
├── synthesis/
│   └── synth_stat.txt             # Yosys cell count and area report
│
├── reports/
│   ├── 2_floorplan_final.rpt      # Floorplan area and utilisation
│   ├── 3_detailed_place.rpt       # Placement timing
│   ├── 4_cts_final.rpt            # CTS skew report
│   ├── 5_route_drc.rpt            # Post-route DRC (0 violations)
│   └── 6_finish.rpt               # Final signoff: TNS/WNS/Power/fmax
│
├── results/
│   ├── 6_final.gds                # ← GDSII layout (final deliverable)
│   ├── 6_final.def
│   ├── 6_final.v                  # Gate-level netlist
│   └── 6_final.spef               # Extracted parasitics
│
└── images/
    ├── final_all.webp             # Full layout view
    ├── final_placement.webp       # Placement view
    ├── final_routing.webp         # Routing view
    ├── cts_clk.webp               # Clock tree view
    ├── final_ir_drop.webp         # IR drop analysis
    └── final_worst_path.webp      # Worst timing path highlight
```

---

## Architecture

### MAGIC-1000 Block Diagram

```
clk / rst / run ──►┌─────────────────────────────────────────────┐
                   │         magic1000_core_orfs                  │
instr_in[15:0] ───►│  PC → [instr_addr] → external ROM           │
                   │          ↓                                   │
                   │  ┌─── Instruction Decoder ───┐              │──► instr_addr[3:0]
                   │  │   opcode·rd·ra·rb·mem_addr │              │
                   │  └───────────┬───────────────┘              │──► data_addr[3:0]
data_in[3:0] ─────►│              ↓                               │──► out_a[3:0]
                   │  Register File (R0–R3, 4-bit)                │──► out_b[3:0]
                   │       ↓ opA    ↓ opB                         │──► out_valid
                   │    4-bit ALU (XOR/AND/OR/ADD)                │──► halted
                   │       ↓ result                               │──► reg0..3[3:0]
                   │    Write-back MUX (LD/MOV/ALU)               │
                   └─────────────────────────────────────────────┘
```

### 16-bit Instruction Format

```
 15      12  11  10   9    8   7    6   5    4   3        0
┌──────────┬──────┬──────┬──────┬──────┬────────────────┐
│ opcode   │  rd  │  ra  │  rb  │  -- │    mem_addr    │
│  [3:0]   │ [1:0]│ [1:0]│ [1:0]│ [1:0]│     [3:0]     │
└──────────┴──────┴──────┴──────┴──────┴────────────────┘
```

### Instruction Set

| Opcode | Mnemonic | Operation |
|---|---|---|
| `4'h0` | NOP | No operation |
| `4'h1` | LD | `R[rd] ← ext_data_mem[mem_addr]` |
| `4'h2` | MOV | `R[rd] ← R[ra]` |
| `4'h3` | DISP | `out_a←R[ra]`, `out_b←R[rb]`, `out_valid=1` |
| `4'h4` | XOR | `R[rd] ← R[ra] ^ R[rb]` |
| `4'h5` | AND | `R[rd] ← R[ra] & R[rb]` |
| `4'h6` | OR | `R[rd] ← R[ra] \| R[rb]` |
| `4'h7` | ADD | `R[rd] ← R[ra] + R[rb]` (4-bit, carry out) |

---

## RTL Design

The **Instruction Decoder** is the focus block — purely combinational, zero latches:

```verilog
// Field extraction
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

---

## Flow

```
RTL (Verilog)
    │
    ▼ verilator --lint-only     → 0 warnings  ✅
    │
    ▼ Yosys synthesis           → 271 cells, 31.55 µm²
    │   (ASAP7 RVT library)
    │
    ▼ OpenROAD-flow-scripts
    │   ├─ 2. Floorplan         → 76.52 µm² core, 41% utilisation
    │   ├─ 3. Placement         → TNS 0.00, WNS 0.00
    │   ├─ 4. CTS               → skew 3.31 ps
    │   ├─ 5. Routing           → DRC clean, 0 antenna violations
    │   └─ 6. Signoff           → GDSII + SPEF + timing + power
    │
    ▼ 6_final.gds               ← manufacturable GDSII  ✅
```

---

## Synthesis Results

| Metric | Value |
|---|---|
| Total cells | **271** |
| Chip area | **31.55 µm²** |
| Sequential area | 8.75 µm² (30 flip-flops) |
| Synthesis check | **0 problems** |

Key cells: `DFFHQNx1` (30), `INVx1` (50), `OA211x2` (24), `AO21x1` (17), `NAND2x1` (23)

---

## Physical Design Results

### Floorplan

| Parameter | Value |
|---|---|
| Core area | 76.52 µm² |
| Instance area | 31.55 µm² |
| Utilisation | **41%** |

### Signoff — Timing

| Metric | Value | Status |
|---|---|---|
| TNS | **0.00 ps** | ✅ |
| WNS | **0.00 ps** | ✅ |
| Worst slack (reg-to-reg) | **+1715 ps** | ✅ |
| Hold violations | **0** | ✅ |
| Max slew violations | **0** | ✅ |

**Critical path:** `regfile → NAND → OA211 → OR → INV → HA → XOR → AO21 → AND4 → regfile = 316 ps`

**Maximum frequency:** `fmax = 1999.67 MHz (~2 GHz)` at ASAP7 7nm

### Signoff — Power

| Domain | Power | % |
|---|---|---|
| Sequential (FFs) | 23.4 µW | 47.3% |
| Clock network | 16.1 µW | 32.6% |
| Combinational | 9.91 µW | 20.1% |
| **Total** | **49.4 µW** | |

### Clock Tree

```
Skew  : 3.31 ps  (source − target latency, post-CRPR)
Depth : 2 buffer levels  (clkbuf_0 → clkbuf_2)
```

---

## How to Run

### 1. Set up OpenROAD-flow-scripts

```bash
git clone https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
cd OpenROAD-flow-scripts && ./build_openroad.sh
```

### 2. Copy files

```bash
mkdir -p flow/designs/src/magic1000 flow/designs/asap7/magic1000
cp rtl/*.v rtl/*.vh flow/designs/src/magic1000/
cp flow/config.mk flow/flow/designs/asap7/magic1000/
cp flow/constraint.sdc flow/designs/asap7/magic1000/
```

### 3. Run

```bash
cd OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/asap7/magic1000/config.mk
```

### RTL simulation

```bash
verilator --lint-only -Wall -I./rtl rtl/magic1000_core_orfs.v
verilator --binary -j 0 --trace -Wall -I./rtl \
    rtl/magic1000_decoder.v rtl/magic1000_alu.v \
    rtl/magic1000_regfile.v rtl/magic1000_core.v \
    sim/magic1000_tb.v --top-module magic1000_tb
./obj_dir/Vmagic1000_tb && gtkwave sim/dump.vcd
```

---

## Reference

> MAGIC-1000: A 4-bit computer from MoS₂ transistors — *Nature Electronics*

---

## Tools

| Tool | Purpose |
|---|---|
| Verilator ≥ 4.224 | RTL lint and simulation |
| Yosys ≥ 0.23 | Logic synthesis (bundled in ORFS) |
| OpenROAD-flow-scripts | RTL-to-GDSII flow |
| KLayout ≥ 0.27 | GDSII inspection and DRC |
