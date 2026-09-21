# SPI Genus synthesis reference flow.
# The original SPI TCL was not supplied; this is a documented reproduction template.

set DESIGN spi_master_top
set RTL_DIR ../../rtl
set OUT_DIR ../../build/genus
file mkdir $OUT_DIR

# Authorized PDK/library setup:
# set_db init_lib_search_path {<SCL_LIB_PATH>}
# set_db library {tsl18fs120_scl_ss_1.lib}
# set_db hdl_search_path [list $RTL_DIR]

# Supply the authorized SPI RTL here.
# read_hdl -sv [glob $RTL_DIR/*.v]
# elaborate $DESIGN
# create_clock -name clk -period <PERIOD_NS> [get_ports clk]
# check_design -unresolved
# syn_generic
# syn_map
# syn_opt
# report_timing > $OUT_DIR/timing.rpt
# report_area > $OUT_DIR/area.rpt
# report_power > $OUT_DIR/power.rpt
# write_hdl > $OUT_DIR/${DESIGN}_synth.v
# write_sdc > $OUT_DIR/${DESIGN}.sdc

puts "SPI reference flow: provide authorized RTL/PDK inputs before execution."
