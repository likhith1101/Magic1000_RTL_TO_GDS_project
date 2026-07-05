###############################################################################
#  config.mk  —  MAGIC-1000 Processor Core
#  OpenROAD-flow-scripts (ORFS) design configuration
#
#  Place this file at:
#    OpenROAD-flow-scripts/flow/designs/asap7/magic1000/config.mk
#
#  Then run from the flow/ directory:
#    make DESIGN_CONFIG=designs/asap7/magic1000/config.mk
###############################################################################

###############################################################################
# 1. PLATFORM & DESIGN IDENTITY
###############################################################################
# ASAP7 is the open-source 7 nm FinFET predictive PDK.
# It is the standard academic PDK shipped with ORFS.
export DESIGN_HOME = .

export DESIGN_NAME      = magic1000_core_orfs
export DESIGN_NICKNAME  = magic1000_core_orfs
export PLATFORM         = asap7

# Human-readable nickname (appears in reports and logs).
DESIGN_NICKNAME = magic1000

###############################################################################
# 2. RTL SOURCE FILES
###############################################################################
# List every synthesisable RTL file.
# magic1000_defines.vh is a header — not listed here but found via VERILOG_INCLUDE_DIRS.
# magic1000_core.v is simulation-only — excluded intentionally.
export VERILOG_FILES = /home/likhit/complete_processor/asap7/proc_design/magic1000_alu.v \
                       /home/likhit/complete_processor/asap7/proc_design/magic1000_decoder.v \
                       /home/likhit/complete_processor/asap7/proc_design/magic1000_regfile.v \
                      /home/likhit/complete_processor/asap7/proc_design/magic1000_core_orfs.v

# Include directory so Yosys finds `magic1000_defines.vh` from `include directives.
export VERILOG_INCLUDE_DIRS = /home/likhit/complete_processor/asap7/proc_design

# SDC timing constraints (generated alongside this config.mk).
export SDC_FILE = /home/likhit/complete_processor/asap7/proc_design/constraint.sdc


export CLOCK_PERIOD = 2000
export CLOCK_PORT   = clk
 
export CORE_UTILIZATION = 40
export CORE_MARGIN      = 5
 
export TNS_END_PERCENT = 100
