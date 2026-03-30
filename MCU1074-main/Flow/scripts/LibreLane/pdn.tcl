# ===========================================================================
# Power grid generation script, executed in the OpenROAD.GeneratePDN step
# Alfonso Cortés - Inria AIO
#
# ===========================================================================

# stdcell power pins
add_global_connection -net {VDD} -pin_pattern {^VDD$} -power
#add_global_connection -net {VDD} -pin_pattern {^VDDPE$}
#add_global_connection -net {VDD} -pin_pattern {^VDDCE$}
add_global_connection -net {VSS} -pin_pattern {^VSS$} -ground
#add_global_connection -net {VSS} -pin_pattern {^VSSE$}
# padframe core power pins
add_global_connection -net {VDD} -pin_pattern {^vdd$} -power
add_global_connection -net {VSS} -pin_pattern {^vss$} -ground
# padframe io power pins
add_global_connection -net {IOVDD} -pin_pattern {^iovdd$} -power
add_global_connection -net {IOVSS} -pin_pattern {^iovss$} -ground
# supply pads power bondpads
add_global_connection -net {VDD} -inst_pattern {^IO_BOND.*_vdd$} -pin_pattern {pad} -power
add_global_connection -net {VSS} -inst_pattern {^IO_BOND.*_vss$} -pin_pattern {pad} -ground
add_global_connection -net {IOVDD} -inst_pattern {^IO_BOND.*_vddio$} -pin_pattern {pad} -power
add_global_connection -net {IOVSS} -inst_pattern {^IO_BOND.*_vssio$} -pin_pattern {pad} -ground
global_connect


# core voltage domain
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

# stdcell grid
define_pdn_grid -name {grid} -voltage_domains {CORE}
add_pdn_ring -grid {grid} -layers {TopMetal1 TopMetal2} -widths {15.0} -spacings {5.0} -core_offsets {4.5} -connect_to_pads
add_pdn_stripe -grid {grid} -layer {Metal1} -width {0.44} -pitch {7.56} -offset {0} -followpins -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal1} -width {7.000} -pitch {82} -offset {42.72} -starts_with POWER -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal2} -width {8.000} -pitch {83} -offset {39.84} -starts_with POWER -extend_to_core_ring
add_pdn_connect -grid {grid} -layers {Metal1 TopMetal1}
add_pdn_connect -grid {grid} -layers {TopMetal1 TopMetal2}

# sram macro grid, hierarchical method
define_pdn_grid -macro -name {sram_grid} -voltage_domains {CORE} -cells {RM_IHPSG13_1P_512x32_c2_bm_bist RM_IHPSG13_1P_256x32_c2_bm_bist RM_IHPSG13_1P_64x64_c2_bm_bist}
add_pdn_stripe -grid {sram_grid} -layer {Metal5} -width {3} -pitch {20} -offset {1.5} -starts_with GROUND
add_pdn_connect -grid {sram_grid} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {sram_grid} -layers {Metal4 Metal5}
# sram macro grid, ring method
define_pdn_grid -macro -name {sram_grid_2} -voltage_domains {CORE} -cells {RM_IHPSG13_1P_4096x16_c3_bm_bist}
add_pdn_ring -grid {sram_grid_2} -layers {Metal4 Metal5} -widths {5.0} -spacings {2.0} -core_offsets {2.0}
add_pdn_stripe -grid {sram_grid_2} -layer {Metal5} -width {3} -pitch {20} -offset {1.5} -starts_with POWER -extend_to_core_ring
add_pdn_connect -grid {sram_grid_2} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {sram_grid_2} -layers {Metal4 Metal5}


pdngen

# PUF macro grid, hierarchical method

set_voltage_domain -name {CORE} -power {VDD} -ground {VSS} -secondary_power {PUF_SUPPLY}
define_pdn_grid -macro -name {puf_grid} -voltage_domains {CORE} -cells {my_RM_IHPSG13_1P_256x8_c3_bm_bist}
#add_pdn_ring -grid {sram_grid_2} -layers {Metal4 Metal5} -widths {3.5} -spacings {1.5} -core_offsets {1.5}
add_pdn_stripe -grid {puf_grid} -layer {Metal5} -width {3} -pitch {12} -offset {1.5} -starts_with POWER
add_pdn_connect -grid {puf_grid} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {puf_grid} -layers {Metal4 Metal5}
