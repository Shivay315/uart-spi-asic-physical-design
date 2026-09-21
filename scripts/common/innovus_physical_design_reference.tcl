# Generic Innovus physical-design reference flow for UART/SPI.
# Reconstructed from the SCL report and standard Cadence flow structure.
# NOT the exact original SCL script.

# init_design
# floorPlan -site <SITE> -r <ASPECT> <UTILIZATION> <MARGIN_L> <MARGIN_B> <MARGIN_R> <MARGIN_T>
# addRing ...
# addStripe ...
# placeDesign
# optDesign -preCTS
# ccopt_design
# optDesign -postCTS
# routeDesign
# optDesign -postRoute
# report_timing
# report_area
# report_power
# verify_drc
# verifyConnectivity -type all
# streamOut <OUT_GDS> -mapFile <LAYER_MAP> -libName <LIB> -units 1000 -mode ALL
