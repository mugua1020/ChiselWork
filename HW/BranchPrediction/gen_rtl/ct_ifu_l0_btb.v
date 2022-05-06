module ct_ifu_l0_btb(
  input         addrgen_l0_btb_update_vld,
  input         addrgen_l0_btb_update_vld_bit,
  input         cp0_ifu_btb_en,
  input         cp0_ifu_icg_en,
  input         cp0_ifu_l0btb_en,
  input         cp0_yy_clk_en,
  input         cpurst_b,
  input         forever_cpuclk,
  input         ibdp_l0_btb_fifo_update_vld,
  input         ibdp_l0_btb_update_cnt_bit,
  input         ibdp_l0_btb_update_ras_bit,
  input         ibdp_l0_btb_update_vld,
  input         ibdp_l0_btb_update_vld_bit,
  input         ifctrl_l0_btb_inv,
  input         ifctrl_l0_btb_stall,
  input         ipctrl_l0_btb_chgflw_vld,
  input         ipctrl_l0_btb_ip_vld,
  input         ipctrl_l0_btb_wait_next,
  input         pcgen_l0_btb_chgflw_mask,
  input         pcgen_l0_btb_chgflw_vld,
  input         ras_l0_btb_ras_push,
  output        l0_btb_ifctrl_chglfw_vld,
  output        l0_btb_ifdp_counter,
  output        l0_btb_ifdp_hit,
  output        l0_btb_ifdp_ras,
  input  [15:0] addrgen_l0_btb_update_entry,
  input  [3:0]  addrgen_l0_btb_wen,
  input  [36:0] ibdp_l0_btb_update_data,
  input  [15:0] ibdp_l0_btb_update_entry,
  input  [3:0]  ibdp_l0_btb_wen,
  input  [38:0] ipdp_l0_btb_ras_pc,
  input         ipdp_l0_btb_ras_push,
  input         l0_btb_update_vld_for_gateclk,
  input         pad_yy_icg_scan_en,
  input  [14:0] pcgen_l0_btb_chgflw_pc,
  input  [38:0] pcgen_l0_btb_if_pc,
  input  [38:0] ras_l0_btb_pc,
  input  [38:0] ras_l0_btb_push_pc,
  output [1:0]  l0_btb_debug_cur_state,
  output [15:0] l0_btb_ibdp_entry_fifo,
  output [38:0] l0_btb_ifctrl_chgflw_pc,
  output [1:0]  l0_btb_ifctrl_chgflw_way_pred,
  output [38:0] l0_btb_ifdp_chgflw_pc,
  output [1:0]  l0_btb_ifdp_chgflw_way_pred,
  output [15:0] l0_btb_ifdp_entry_hit,
  output        l0_btb_ipctrl_st_wait
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  l0_btb_pipe_clk__gated_clk_cell_clk_in; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_global_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_module_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_local_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_external_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_pipe_clk__gated_clk_cell_clk_out; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_clk_in; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_global_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_module_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_local_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_external_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_clk__gated_clk_cell_clk_out; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_clk_in; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_global_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_module_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_local_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_external_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_create_clk__gated_clk_cell_clk_out; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_in; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_global_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_module_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_local_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_external_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 43:33]
  wire  l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_out; // @[ct_ifu_l0_btb.scala 43:33]
  wire  ct_ifu_l0_btb_entry_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_1_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_1_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_1_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_1_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_1_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_1_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_2_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_2_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_2_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_2_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_2_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_2_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_3_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_3_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_3_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_3_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_3_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_3_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_4_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_4_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_4_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_4_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_4_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_4_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_5_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_5_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_5_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_5_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_5_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_5_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_6_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_6_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_6_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_6_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_6_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_6_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_7_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_7_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_7_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_7_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_7_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_7_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_8_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_8_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_8_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_8_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_8_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_8_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_9_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_9_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_9_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_9_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_9_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_9_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_10_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_10_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_10_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_10_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_10_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_10_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_11_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_11_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_11_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_11_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_11_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_11_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_12_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_12_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_12_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_12_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_12_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_12_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_13_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_13_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_13_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_13_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_13_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_13_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_14_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_14_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_14_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_14_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_14_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_14_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_cpurst_b; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_inv; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_update; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_update_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire [36:0] ct_ifu_l0_btb_entry_15_entry_update_data; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_update_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_update_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [3:0] ct_ifu_l0_btb_entry_15_entry_wen; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_forever_cpuclk; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_cnt; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_ras; // @[ct_ifu_l0_btb.scala 260:51]
  wire [14:0] ct_ifu_l0_btb_entry_15_entry_tag; // @[ct_ifu_l0_btb.scala 260:51]
  wire [19:0] ct_ifu_l0_btb_entry_15_entry_target; // @[ct_ifu_l0_btb.scala 260:51]
  wire  ct_ifu_l0_btb_entry_15_entry_vld; // @[ct_ifu_l0_btb.scala 260:51]
  wire [1:0] ct_ifu_l0_btb_entry_15_entry_way_pred; // @[ct_ifu_l0_btb.scala 260:51]
  wire  _l0_btb_rd_T = cp0_ifu_btb_en & cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 59:45]
  wire  _l0_btb_rd_T_1 = ~pcgen_l0_btb_chgflw_mask; // @[ct_ifu_l0_btb.scala 61:31]
  wire  _l0_btb_rd_T_2 = _l0_btb_rd_T & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 60:51]
  wire  _l0_btb_rd_T_3 = ~ifctrl_l0_btb_stall; // @[ct_ifu_l0_btb.scala 63:34]
  wire  _l0_btb_rd_T_4 = pcgen_l0_btb_chgflw_vld | ~ifctrl_l0_btb_stall; // @[ct_ifu_l0_btb.scala 63:31]
  wire  l0_btb_rd = _l0_btb_rd_T_2 & _l0_btb_rd_T_4; // @[ct_ifu_l0_btb.scala 61:59]
  wire  _T_2 = ~cpurst_b; // @[ct_ifu_l0_btb.scala 67:60]
  reg  l0_btb_rd_flop_temp; // @[ct_ifu_l0_btb.scala 69:38]
  wire [14:0] entry_tag_0 = ct_ifu_l0_btb_entry_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_0 = ct_ifu_l0_btb_entry_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_0_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_0 & entry_vld_0; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_0 = _entry_rd_hit_0_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_1 = ct_ifu_l0_btb_entry_1_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_1 = ct_ifu_l0_btb_entry_1_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_1_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_1 & entry_vld_1; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_1 = _entry_rd_hit_1_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_2 = ct_ifu_l0_btb_entry_2_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_2 = ct_ifu_l0_btb_entry_2_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_2_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_2 & entry_vld_2; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_2 = _entry_rd_hit_2_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_3 = ct_ifu_l0_btb_entry_3_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_3 = ct_ifu_l0_btb_entry_3_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_3_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_3 & entry_vld_3; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_3 = _entry_rd_hit_3_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_4 = ct_ifu_l0_btb_entry_4_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_4 = ct_ifu_l0_btb_entry_4_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_4_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_4 & entry_vld_4; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_4 = _entry_rd_hit_4_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_5 = ct_ifu_l0_btb_entry_5_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_5 = ct_ifu_l0_btb_entry_5_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_5_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_5 & entry_vld_5; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_5 = _entry_rd_hit_5_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_6 = ct_ifu_l0_btb_entry_6_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_6 = ct_ifu_l0_btb_entry_6_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_6_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_6 & entry_vld_6; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_6 = _entry_rd_hit_6_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_7 = ct_ifu_l0_btb_entry_7_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_7 = ct_ifu_l0_btb_entry_7_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_7_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_7 & entry_vld_7; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_7 = _entry_rd_hit_7_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_8 = ct_ifu_l0_btb_entry_8_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_8 = ct_ifu_l0_btb_entry_8_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_8_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_8 & entry_vld_8; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_8 = _entry_rd_hit_8_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_9 = ct_ifu_l0_btb_entry_9_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_9 = ct_ifu_l0_btb_entry_9_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_9_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_9 & entry_vld_9; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_9 = _entry_rd_hit_9_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_10 = ct_ifu_l0_btb_entry_10_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_10 = ct_ifu_l0_btb_entry_10_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_10_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_10 & entry_vld_10; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_10 = _entry_rd_hit_10_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_11 = ct_ifu_l0_btb_entry_11_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_11 = ct_ifu_l0_btb_entry_11_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_11_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_11 & entry_vld_11; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_11 = _entry_rd_hit_11_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_12 = ct_ifu_l0_btb_entry_12_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_12 = ct_ifu_l0_btb_entry_12_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_12_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_12 & entry_vld_12; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_12 = _entry_rd_hit_12_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_13 = ct_ifu_l0_btb_entry_13_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_13 = ct_ifu_l0_btb_entry_13_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_13_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_13 & entry_vld_13; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_13 = _entry_rd_hit_13_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_14 = ct_ifu_l0_btb_entry_14_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_14 = ct_ifu_l0_btb_entry_14_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_14_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_14 & entry_vld_14; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_14 = _entry_rd_hit_14_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [14:0] entry_tag_15 = ct_ifu_l0_btb_entry_15_entry_tag; // @[ct_ifu_l0_btb.scala 270:18 75:23]
  wire  entry_vld_15 = ct_ifu_l0_btb_entry_15_entry_vld; // @[ct_ifu_l0_btb.scala 280:18 76:23]
  wire  _entry_rd_hit_15_T_1 = pcgen_l0_btb_chgflw_pc == entry_tag_15 & entry_vld_15; // @[ct_ifu_l0_btb.scala 77:97]
  wire  entry_rd_hit_15 = _entry_rd_hit_15_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 78:56]
  wire [36:0] _GEN_10 = ibdp_l0_btb_update_vld ? ibdp_l0_btb_update_data : 37'h0; // @[ct_ifu_l0_btb.scala 224:48 229:27 235:27]
  wire [36:0] l0_btb_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  wire  _GEN_7 = ibdp_l0_btb_update_vld & ibdp_l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 224:48 226:27 232:27]
  wire  l0_btb_update_vld_bit = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit : _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  wire  _bypass_rd_hit_T_3 = pcgen_l0_btb_chgflw_pc == l0_btb_update_data[36:22] & l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 85:67]
  wire  bypass_rd_hit = _bypass_rd_hit_T_3 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 86:32]
  wire  entry_bypass_hit_0 = bypass_rd_hit & ibdp_l0_btb_update_entry[0]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_1 = bypass_rd_hit & ibdp_l0_btb_update_entry[1]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_2 = bypass_rd_hit & ibdp_l0_btb_update_entry[2]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_3 = bypass_rd_hit & ibdp_l0_btb_update_entry[3]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_4 = bypass_rd_hit & ibdp_l0_btb_update_entry[4]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_5 = bypass_rd_hit & ibdp_l0_btb_update_entry[5]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_6 = bypass_rd_hit & ibdp_l0_btb_update_entry[6]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_7 = bypass_rd_hit & ibdp_l0_btb_update_entry[7]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_8 = bypass_rd_hit & ibdp_l0_btb_update_entry[8]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_9 = bypass_rd_hit & ibdp_l0_btb_update_entry[9]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_10 = bypass_rd_hit & ibdp_l0_btb_update_entry[10]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_11 = bypass_rd_hit & ibdp_l0_btb_update_entry[11]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_12 = bypass_rd_hit & ibdp_l0_btb_update_entry[12]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_13 = bypass_rd_hit & ibdp_l0_btb_update_entry[13]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_14 = bypass_rd_hit & ibdp_l0_btb_update_entry[14]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_bypass_hit_15 = bypass_rd_hit & ibdp_l0_btb_update_entry[15]; // @[ct_ifu_l0_btb.scala 91:67]
  wire  entry_hit_0 = entry_bypass_hit_0 | entry_rd_hit_0; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_1 = entry_bypass_hit_1 | entry_rd_hit_1; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_2 = entry_bypass_hit_2 | entry_rd_hit_2; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_3 = entry_bypass_hit_3 | entry_rd_hit_3; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_4 = entry_bypass_hit_4 | entry_rd_hit_4; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_5 = entry_bypass_hit_5 | entry_rd_hit_5; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_6 = entry_bypass_hit_6 | entry_rd_hit_6; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_7 = entry_bypass_hit_7 | entry_rd_hit_7; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_8 = entry_bypass_hit_8 | entry_rd_hit_8; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_9 = entry_bypass_hit_9 | entry_rd_hit_9; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_10 = entry_bypass_hit_10 | entry_rd_hit_10; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_11 = entry_bypass_hit_11 | entry_rd_hit_11; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_12 = entry_bypass_hit_12 | entry_rd_hit_12; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_13 = entry_bypass_hit_13 | entry_rd_hit_13; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_14 = entry_bypass_hit_14 | entry_rd_hit_14; // @[ct_ifu_l0_btb.scala 94:79]
  wire  entry_hit_15 = entry_bypass_hit_15 | entry_rd_hit_15; // @[ct_ifu_l0_btb.scala 94:79]
  reg [15:0] entry_hit_flop_temp; // @[ct_ifu_l0_btb.scala 100:38]
  wire [7:0] entry_hit_flop_temp_lo = {entry_hit_7,entry_hit_6,entry_hit_5,entry_hit_4,entry_hit_3,entry_hit_2,
    entry_hit_1,entry_hit_0}; // @[ct_ifu_l0_btb.scala 102:42]
  wire [15:0] _entry_hit_flop_temp_T = {entry_hit_15,entry_hit_14,entry_hit_13,entry_hit_12,entry_hit_11,entry_hit_10,
    entry_hit_9,entry_hit_8,entry_hit_flop_temp_lo}; // @[ct_ifu_l0_btb.scala 102:42]
  reg [38:0] ras_pc_temp; // @[ct_ifu_l0_btb.scala 120:30]
  wire  entry_cnt_1 = ct_ifu_l0_btb_entry_1_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_0 = ct_ifu_l0_btb_entry_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_3 = ct_ifu_l0_btb_entry_3_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_2 = ct_ifu_l0_btb_entry_2_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_5 = ct_ifu_l0_btb_entry_5_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_4 = ct_ifu_l0_btb_entry_4_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_7 = ct_ifu_l0_btb_entry_7_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_6 = ct_ifu_l0_btb_entry_6_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire [7:0] entry_hit_counter_lo = {entry_cnt_7,entry_cnt_6,entry_cnt_5,entry_cnt_4,entry_cnt_3,entry_cnt_2,entry_cnt_1
    ,entry_cnt_0}; // @[ct_ifu_l0_btb.scala 137:49]
  wire  entry_cnt_9 = ct_ifu_l0_btb_entry_9_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_8 = ct_ifu_l0_btb_entry_8_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_11 = ct_ifu_l0_btb_entry_11_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_10 = ct_ifu_l0_btb_entry_10_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_13 = ct_ifu_l0_btb_entry_13_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_12 = ct_ifu_l0_btb_entry_12_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_15 = ct_ifu_l0_btb_entry_15_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire  entry_cnt_14 = ct_ifu_l0_btb_entry_14_entry_cnt; // @[ct_ifu_l0_btb.scala 136:21 267:18]
  wire [15:0] _entry_hit_counter_T = {entry_cnt_15,entry_cnt_14,entry_cnt_13,entry_cnt_12,entry_cnt_11,entry_cnt_10,
    entry_cnt_9,entry_cnt_8,entry_hit_counter_lo}; // @[ct_ifu_l0_btb.scala 137:49]
  wire [15:0] _entry_hit_counter_T_1 = entry_hit_flop_temp & _entry_hit_counter_T; // @[ct_ifu_l0_btb.scala 137:37]
  wire  entry_hit_counter = _entry_hit_counter_T_1[0] | _entry_hit_counter_T_1[1] | _entry_hit_counter_T_1[2] |
    _entry_hit_counter_T_1[3] | _entry_hit_counter_T_1[4] | _entry_hit_counter_T_1[5] | _entry_hit_counter_T_1[6] |
    _entry_hit_counter_T_1[7] | _entry_hit_counter_T_1[8] | _entry_hit_counter_T_1[9] | _entry_hit_counter_T_1[10] |
    _entry_hit_counter_T_1[11] | _entry_hit_counter_T_1[12] | _entry_hit_counter_T_1[13] | _entry_hit_counter_T_1[14] |
    _entry_hit_counter_T_1[15]; // @[ct_ifu_l0_btb.scala 137:73]
  wire  entry_ras_1 = ct_ifu_l0_btb_entry_1_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_0 = ct_ifu_l0_btb_entry_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_3 = ct_ifu_l0_btb_entry_3_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_2 = ct_ifu_l0_btb_entry_2_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_5 = ct_ifu_l0_btb_entry_5_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_4 = ct_ifu_l0_btb_entry_4_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_7 = ct_ifu_l0_btb_entry_7_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_6 = ct_ifu_l0_btb_entry_6_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire [7:0] entry_hit_ras_lo = {entry_ras_7,entry_ras_6,entry_ras_5,entry_ras_4,entry_ras_3,entry_ras_2,entry_ras_1,
    entry_ras_0}; // @[ct_ifu_l0_btb.scala 140:46]
  wire  entry_ras_9 = ct_ifu_l0_btb_entry_9_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_8 = ct_ifu_l0_btb_entry_8_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_11 = ct_ifu_l0_btb_entry_11_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_10 = ct_ifu_l0_btb_entry_10_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_13 = ct_ifu_l0_btb_entry_13_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_12 = ct_ifu_l0_btb_entry_12_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_15 = ct_ifu_l0_btb_entry_15_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire  entry_ras_14 = ct_ifu_l0_btb_entry_14_entry_ras; // @[ct_ifu_l0_btb.scala 139:21 269:18]
  wire [15:0] _entry_hit_ras_T = {entry_ras_15,entry_ras_14,entry_ras_13,entry_ras_12,entry_ras_11,entry_ras_10,
    entry_ras_9,entry_ras_8,entry_hit_ras_lo}; // @[ct_ifu_l0_btb.scala 140:46]
  wire [15:0] _entry_hit_ras_T_1 = entry_hit_flop_temp & _entry_hit_ras_T; // @[ct_ifu_l0_btb.scala 140:34]
  wire  entry_hit_ras = _entry_hit_ras_T_1[0] | _entry_hit_ras_T_1[1] | _entry_hit_ras_T_1[2] | _entry_hit_ras_T_1[3] |
    _entry_hit_ras_T_1[4] | _entry_hit_ras_T_1[5] | _entry_hit_ras_T_1[6] | _entry_hit_ras_T_1[7] | _entry_hit_ras_T_1[8
    ] | _entry_hit_ras_T_1[9] | _entry_hit_ras_T_1[10] | _entry_hit_ras_T_1[11] | _entry_hit_ras_T_1[12] |
    _entry_hit_ras_T_1[13] | _entry_hit_ras_T_1[14] | _entry_hit_ras_T_1[15]; // @[ct_ifu_l0_btb.scala 140:70]
  wire  entry_way_pred_1_1 = ct_ifu_l0_btb_entry_1_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_0 = ct_ifu_l0_btb_entry_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_3 = ct_ifu_l0_btb_entry_3_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_2 = ct_ifu_l0_btb_entry_2_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_5 = ct_ifu_l0_btb_entry_5_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_4 = ct_ifu_l0_btb_entry_4_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_7 = ct_ifu_l0_btb_entry_7_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_6 = ct_ifu_l0_btb_entry_6_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire [7:0] entry_hit_way_pred_1_lo = {entry_way_pred_1_7,entry_way_pred_1_6,entry_way_pred_1_5,entry_way_pred_1_4,
    entry_way_pred_1_3,entry_way_pred_1_2,entry_way_pred_1_1,entry_way_pred_1_0}; // @[ct_ifu_l0_btb.scala 145:60]
  wire  entry_way_pred_1_9 = ct_ifu_l0_btb_entry_9_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_8 = ct_ifu_l0_btb_entry_8_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_11 = ct_ifu_l0_btb_entry_11_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_10 = ct_ifu_l0_btb_entry_10_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_13 = ct_ifu_l0_btb_entry_13_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_12 = ct_ifu_l0_btb_entry_12_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_15 = ct_ifu_l0_btb_entry_15_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire  entry_way_pred_1_14 = ct_ifu_l0_btb_entry_14_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 281:56]
  wire [15:0] _entry_hit_way_pred_1_T = {entry_way_pred_1_15,entry_way_pred_1_14,entry_way_pred_1_13,entry_way_pred_1_12
    ,entry_way_pred_1_11,entry_way_pred_1_10,entry_way_pred_1_9,entry_way_pred_1_8,entry_hit_way_pred_1_lo}; // @[ct_ifu_l0_btb.scala 145:60]
  wire [15:0] _entry_hit_way_pred_1_T_1 = entry_hit_flop_temp & _entry_hit_way_pred_1_T; // @[ct_ifu_l0_btb.scala 145:41]
  wire  entry_hit_way_pred_1 = _entry_hit_way_pred_1_T_1[0] | _entry_hit_way_pred_1_T_1[1] | _entry_hit_way_pred_1_T_1[2
    ] | _entry_hit_way_pred_1_T_1[3] | _entry_hit_way_pred_1_T_1[4] | _entry_hit_way_pred_1_T_1[5] |
    _entry_hit_way_pred_1_T_1[6] | _entry_hit_way_pred_1_T_1[7] | _entry_hit_way_pred_1_T_1[8] |
    _entry_hit_way_pred_1_T_1[9] | _entry_hit_way_pred_1_T_1[10] | _entry_hit_way_pred_1_T_1[11] |
    _entry_hit_way_pred_1_T_1[12] | _entry_hit_way_pred_1_T_1[13] | _entry_hit_way_pred_1_T_1[14] |
    _entry_hit_way_pred_1_T_1[15]; // @[ct_ifu_l0_btb.scala 145:84]
  wire  entry_way_pred_2_1 = ct_ifu_l0_btb_entry_1_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_0 = ct_ifu_l0_btb_entry_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_3 = ct_ifu_l0_btb_entry_3_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_2 = ct_ifu_l0_btb_entry_2_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_5 = ct_ifu_l0_btb_entry_5_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_4 = ct_ifu_l0_btb_entry_4_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_7 = ct_ifu_l0_btb_entry_7_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_6 = ct_ifu_l0_btb_entry_6_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire [7:0] entry_hit_way_pred_2_lo = {entry_way_pred_2_7,entry_way_pred_2_6,entry_way_pred_2_5,entry_way_pred_2_4,
    entry_way_pred_2_3,entry_way_pred_2_2,entry_way_pred_2_1,entry_way_pred_2_0}; // @[ct_ifu_l0_btb.scala 146:60]
  wire  entry_way_pred_2_9 = ct_ifu_l0_btb_entry_9_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_8 = ct_ifu_l0_btb_entry_8_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_11 = ct_ifu_l0_btb_entry_11_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_10 = ct_ifu_l0_btb_entry_10_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_13 = ct_ifu_l0_btb_entry_13_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_12 = ct_ifu_l0_btb_entry_12_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_15 = ct_ifu_l0_btb_entry_15_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire  entry_way_pred_2_14 = ct_ifu_l0_btb_entry_14_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 282:56]
  wire [15:0] _entry_hit_way_pred_2_T = {entry_way_pred_2_15,entry_way_pred_2_14,entry_way_pred_2_13,entry_way_pred_2_12
    ,entry_way_pred_2_11,entry_way_pred_2_10,entry_way_pred_2_9,entry_way_pred_2_8,entry_hit_way_pred_2_lo}; // @[ct_ifu_l0_btb.scala 146:60]
  wire [15:0] _entry_hit_way_pred_2_T_1 = entry_hit_flop_temp & _entry_hit_way_pred_2_T; // @[ct_ifu_l0_btb.scala 146:41]
  wire  entry_hit_way_pred_2 = _entry_hit_way_pred_2_T_1[0] | _entry_hit_way_pred_2_T_1[1] | _entry_hit_way_pred_2_T_1[2
    ] | _entry_hit_way_pred_2_T_1[3] | _entry_hit_way_pred_2_T_1[4] | _entry_hit_way_pred_2_T_1[5] |
    _entry_hit_way_pred_2_T_1[6] | _entry_hit_way_pred_2_T_1[7] | _entry_hit_way_pred_2_T_1[8] |
    _entry_hit_way_pred_2_T_1[9] | _entry_hit_way_pred_2_T_1[10] | _entry_hit_way_pred_2_T_1[11] |
    _entry_hit_way_pred_2_T_1[12] | _entry_hit_way_pred_2_T_1[13] | _entry_hit_way_pred_2_T_1[14] |
    _entry_hit_way_pred_2_T_1[15]; // @[ct_ifu_l0_btb.scala 146:84]
  wire  entry_targets_0_1 = ct_ifu_l0_btb_entry_1_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_0 = ct_ifu_l0_btb_entry_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_3 = ct_ifu_l0_btb_entry_3_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_2 = ct_ifu_l0_btb_entry_2_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_5 = ct_ifu_l0_btb_entry_5_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_4 = ct_ifu_l0_btb_entry_4_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_7 = ct_ifu_l0_btb_entry_7_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_6 = ct_ifu_l0_btb_entry_6_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_0_lo = {entry_targets_0_7,entry_targets_0_6,entry_targets_0_5,entry_targets_0_4,
    entry_targets_0_3,entry_targets_0_2,entry_targets_0_1,entry_targets_0_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_0_9 = ct_ifu_l0_btb_entry_9_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_8 = ct_ifu_l0_btb_entry_8_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_11 = ct_ifu_l0_btb_entry_11_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_10 = ct_ifu_l0_btb_entry_10_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_13 = ct_ifu_l0_btb_entry_13_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_12 = ct_ifu_l0_btb_entry_12_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_15 = ct_ifu_l0_btb_entry_15_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_0_14 = ct_ifu_l0_btb_entry_14_entry_target[0]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_0_T = {entry_targets_0_15,entry_targets_0_14,entry_targets_0_13,entry_targets_0_12,
    entry_targets_0_11,entry_targets_0_10,entry_targets_0_9,entry_targets_0_8,entry_hit_pcs_0_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_0_T_1 = entry_hit_flop_temp & _entry_hit_pcs_0_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_0 = _entry_hit_pcs_0_T_1[0] | _entry_hit_pcs_0_T_1[1] | _entry_hit_pcs_0_T_1[2] |
    _entry_hit_pcs_0_T_1[3] | _entry_hit_pcs_0_T_1[4] | _entry_hit_pcs_0_T_1[5] | _entry_hit_pcs_0_T_1[6] |
    _entry_hit_pcs_0_T_1[7] | _entry_hit_pcs_0_T_1[8] | _entry_hit_pcs_0_T_1[9] | _entry_hit_pcs_0_T_1[10] |
    _entry_hit_pcs_0_T_1[11] | _entry_hit_pcs_0_T_1[12] | _entry_hit_pcs_0_T_1[13] | _entry_hit_pcs_0_T_1[14] |
    _entry_hit_pcs_0_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_1_1 = ct_ifu_l0_btb_entry_1_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_0 = ct_ifu_l0_btb_entry_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_3 = ct_ifu_l0_btb_entry_3_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_2 = ct_ifu_l0_btb_entry_2_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_5 = ct_ifu_l0_btb_entry_5_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_4 = ct_ifu_l0_btb_entry_4_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_7 = ct_ifu_l0_btb_entry_7_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_6 = ct_ifu_l0_btb_entry_6_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_1_lo = {entry_targets_1_7,entry_targets_1_6,entry_targets_1_5,entry_targets_1_4,
    entry_targets_1_3,entry_targets_1_2,entry_targets_1_1,entry_targets_1_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_1_9 = ct_ifu_l0_btb_entry_9_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_8 = ct_ifu_l0_btb_entry_8_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_11 = ct_ifu_l0_btb_entry_11_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_10 = ct_ifu_l0_btb_entry_10_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_13 = ct_ifu_l0_btb_entry_13_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_12 = ct_ifu_l0_btb_entry_12_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_15 = ct_ifu_l0_btb_entry_15_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_1_14 = ct_ifu_l0_btb_entry_14_entry_target[1]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_1_T = {entry_targets_1_15,entry_targets_1_14,entry_targets_1_13,entry_targets_1_12,
    entry_targets_1_11,entry_targets_1_10,entry_targets_1_9,entry_targets_1_8,entry_hit_pcs_1_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_1_T_1 = entry_hit_flop_temp & _entry_hit_pcs_1_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_1 = _entry_hit_pcs_1_T_1[0] | _entry_hit_pcs_1_T_1[1] | _entry_hit_pcs_1_T_1[2] |
    _entry_hit_pcs_1_T_1[3] | _entry_hit_pcs_1_T_1[4] | _entry_hit_pcs_1_T_1[5] | _entry_hit_pcs_1_T_1[6] |
    _entry_hit_pcs_1_T_1[7] | _entry_hit_pcs_1_T_1[8] | _entry_hit_pcs_1_T_1[9] | _entry_hit_pcs_1_T_1[10] |
    _entry_hit_pcs_1_T_1[11] | _entry_hit_pcs_1_T_1[12] | _entry_hit_pcs_1_T_1[13] | _entry_hit_pcs_1_T_1[14] |
    _entry_hit_pcs_1_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_2_1 = ct_ifu_l0_btb_entry_1_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_0 = ct_ifu_l0_btb_entry_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_3 = ct_ifu_l0_btb_entry_3_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_2 = ct_ifu_l0_btb_entry_2_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_5 = ct_ifu_l0_btb_entry_5_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_4 = ct_ifu_l0_btb_entry_4_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_7 = ct_ifu_l0_btb_entry_7_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_6 = ct_ifu_l0_btb_entry_6_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_2_lo = {entry_targets_2_7,entry_targets_2_6,entry_targets_2_5,entry_targets_2_4,
    entry_targets_2_3,entry_targets_2_2,entry_targets_2_1,entry_targets_2_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_2_9 = ct_ifu_l0_btb_entry_9_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_8 = ct_ifu_l0_btb_entry_8_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_11 = ct_ifu_l0_btb_entry_11_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_10 = ct_ifu_l0_btb_entry_10_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_13 = ct_ifu_l0_btb_entry_13_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_12 = ct_ifu_l0_btb_entry_12_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_15 = ct_ifu_l0_btb_entry_15_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_2_14 = ct_ifu_l0_btb_entry_14_entry_target[2]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_2_T = {entry_targets_2_15,entry_targets_2_14,entry_targets_2_13,entry_targets_2_12,
    entry_targets_2_11,entry_targets_2_10,entry_targets_2_9,entry_targets_2_8,entry_hit_pcs_2_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_2_T_1 = entry_hit_flop_temp & _entry_hit_pcs_2_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_2 = _entry_hit_pcs_2_T_1[0] | _entry_hit_pcs_2_T_1[1] | _entry_hit_pcs_2_T_1[2] |
    _entry_hit_pcs_2_T_1[3] | _entry_hit_pcs_2_T_1[4] | _entry_hit_pcs_2_T_1[5] | _entry_hit_pcs_2_T_1[6] |
    _entry_hit_pcs_2_T_1[7] | _entry_hit_pcs_2_T_1[8] | _entry_hit_pcs_2_T_1[9] | _entry_hit_pcs_2_T_1[10] |
    _entry_hit_pcs_2_T_1[11] | _entry_hit_pcs_2_T_1[12] | _entry_hit_pcs_2_T_1[13] | _entry_hit_pcs_2_T_1[14] |
    _entry_hit_pcs_2_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_3_1 = ct_ifu_l0_btb_entry_1_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_0 = ct_ifu_l0_btb_entry_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_3 = ct_ifu_l0_btb_entry_3_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_2 = ct_ifu_l0_btb_entry_2_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_5 = ct_ifu_l0_btb_entry_5_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_4 = ct_ifu_l0_btb_entry_4_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_7 = ct_ifu_l0_btb_entry_7_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_6 = ct_ifu_l0_btb_entry_6_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_3_lo = {entry_targets_3_7,entry_targets_3_6,entry_targets_3_5,entry_targets_3_4,
    entry_targets_3_3,entry_targets_3_2,entry_targets_3_1,entry_targets_3_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_3_9 = ct_ifu_l0_btb_entry_9_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_8 = ct_ifu_l0_btb_entry_8_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_11 = ct_ifu_l0_btb_entry_11_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_10 = ct_ifu_l0_btb_entry_10_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_13 = ct_ifu_l0_btb_entry_13_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_12 = ct_ifu_l0_btb_entry_12_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_15 = ct_ifu_l0_btb_entry_15_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_3_14 = ct_ifu_l0_btb_entry_14_entry_target[3]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_3_T = {entry_targets_3_15,entry_targets_3_14,entry_targets_3_13,entry_targets_3_12,
    entry_targets_3_11,entry_targets_3_10,entry_targets_3_9,entry_targets_3_8,entry_hit_pcs_3_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_3_T_1 = entry_hit_flop_temp & _entry_hit_pcs_3_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_3 = _entry_hit_pcs_3_T_1[0] | _entry_hit_pcs_3_T_1[1] | _entry_hit_pcs_3_T_1[2] |
    _entry_hit_pcs_3_T_1[3] | _entry_hit_pcs_3_T_1[4] | _entry_hit_pcs_3_T_1[5] | _entry_hit_pcs_3_T_1[6] |
    _entry_hit_pcs_3_T_1[7] | _entry_hit_pcs_3_T_1[8] | _entry_hit_pcs_3_T_1[9] | _entry_hit_pcs_3_T_1[10] |
    _entry_hit_pcs_3_T_1[11] | _entry_hit_pcs_3_T_1[12] | _entry_hit_pcs_3_T_1[13] | _entry_hit_pcs_3_T_1[14] |
    _entry_hit_pcs_3_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_4_1 = ct_ifu_l0_btb_entry_1_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_0 = ct_ifu_l0_btb_entry_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_3 = ct_ifu_l0_btb_entry_3_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_2 = ct_ifu_l0_btb_entry_2_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_5 = ct_ifu_l0_btb_entry_5_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_4 = ct_ifu_l0_btb_entry_4_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_7 = ct_ifu_l0_btb_entry_7_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_6 = ct_ifu_l0_btb_entry_6_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_4_lo = {entry_targets_4_7,entry_targets_4_6,entry_targets_4_5,entry_targets_4_4,
    entry_targets_4_3,entry_targets_4_2,entry_targets_4_1,entry_targets_4_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_4_9 = ct_ifu_l0_btb_entry_9_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_8 = ct_ifu_l0_btb_entry_8_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_11 = ct_ifu_l0_btb_entry_11_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_10 = ct_ifu_l0_btb_entry_10_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_13 = ct_ifu_l0_btb_entry_13_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_12 = ct_ifu_l0_btb_entry_12_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_15 = ct_ifu_l0_btb_entry_15_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_4_14 = ct_ifu_l0_btb_entry_14_entry_target[4]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_4_T = {entry_targets_4_15,entry_targets_4_14,entry_targets_4_13,entry_targets_4_12,
    entry_targets_4_11,entry_targets_4_10,entry_targets_4_9,entry_targets_4_8,entry_hit_pcs_4_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_4_T_1 = entry_hit_flop_temp & _entry_hit_pcs_4_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_4 = _entry_hit_pcs_4_T_1[0] | _entry_hit_pcs_4_T_1[1] | _entry_hit_pcs_4_T_1[2] |
    _entry_hit_pcs_4_T_1[3] | _entry_hit_pcs_4_T_1[4] | _entry_hit_pcs_4_T_1[5] | _entry_hit_pcs_4_T_1[6] |
    _entry_hit_pcs_4_T_1[7] | _entry_hit_pcs_4_T_1[8] | _entry_hit_pcs_4_T_1[9] | _entry_hit_pcs_4_T_1[10] |
    _entry_hit_pcs_4_T_1[11] | _entry_hit_pcs_4_T_1[12] | _entry_hit_pcs_4_T_1[13] | _entry_hit_pcs_4_T_1[14] |
    _entry_hit_pcs_4_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_5_1 = ct_ifu_l0_btb_entry_1_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_0 = ct_ifu_l0_btb_entry_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_3 = ct_ifu_l0_btb_entry_3_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_2 = ct_ifu_l0_btb_entry_2_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_5 = ct_ifu_l0_btb_entry_5_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_4 = ct_ifu_l0_btb_entry_4_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_7 = ct_ifu_l0_btb_entry_7_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_6 = ct_ifu_l0_btb_entry_6_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_5_lo = {entry_targets_5_7,entry_targets_5_6,entry_targets_5_5,entry_targets_5_4,
    entry_targets_5_3,entry_targets_5_2,entry_targets_5_1,entry_targets_5_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_5_9 = ct_ifu_l0_btb_entry_9_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_8 = ct_ifu_l0_btb_entry_8_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_11 = ct_ifu_l0_btb_entry_11_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_10 = ct_ifu_l0_btb_entry_10_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_13 = ct_ifu_l0_btb_entry_13_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_12 = ct_ifu_l0_btb_entry_12_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_15 = ct_ifu_l0_btb_entry_15_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_5_14 = ct_ifu_l0_btb_entry_14_entry_target[5]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_5_T = {entry_targets_5_15,entry_targets_5_14,entry_targets_5_13,entry_targets_5_12,
    entry_targets_5_11,entry_targets_5_10,entry_targets_5_9,entry_targets_5_8,entry_hit_pcs_5_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_5_T_1 = entry_hit_flop_temp & _entry_hit_pcs_5_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_5 = _entry_hit_pcs_5_T_1[0] | _entry_hit_pcs_5_T_1[1] | _entry_hit_pcs_5_T_1[2] |
    _entry_hit_pcs_5_T_1[3] | _entry_hit_pcs_5_T_1[4] | _entry_hit_pcs_5_T_1[5] | _entry_hit_pcs_5_T_1[6] |
    _entry_hit_pcs_5_T_1[7] | _entry_hit_pcs_5_T_1[8] | _entry_hit_pcs_5_T_1[9] | _entry_hit_pcs_5_T_1[10] |
    _entry_hit_pcs_5_T_1[11] | _entry_hit_pcs_5_T_1[12] | _entry_hit_pcs_5_T_1[13] | _entry_hit_pcs_5_T_1[14] |
    _entry_hit_pcs_5_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_6_1 = ct_ifu_l0_btb_entry_1_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_0 = ct_ifu_l0_btb_entry_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_3 = ct_ifu_l0_btb_entry_3_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_2 = ct_ifu_l0_btb_entry_2_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_5 = ct_ifu_l0_btb_entry_5_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_4 = ct_ifu_l0_btb_entry_4_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_7 = ct_ifu_l0_btb_entry_7_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_6 = ct_ifu_l0_btb_entry_6_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_6_lo = {entry_targets_6_7,entry_targets_6_6,entry_targets_6_5,entry_targets_6_4,
    entry_targets_6_3,entry_targets_6_2,entry_targets_6_1,entry_targets_6_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_6_9 = ct_ifu_l0_btb_entry_9_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_8 = ct_ifu_l0_btb_entry_8_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_11 = ct_ifu_l0_btb_entry_11_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_10 = ct_ifu_l0_btb_entry_10_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_13 = ct_ifu_l0_btb_entry_13_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_12 = ct_ifu_l0_btb_entry_12_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_15 = ct_ifu_l0_btb_entry_15_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_6_14 = ct_ifu_l0_btb_entry_14_entry_target[6]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_6_T = {entry_targets_6_15,entry_targets_6_14,entry_targets_6_13,entry_targets_6_12,
    entry_targets_6_11,entry_targets_6_10,entry_targets_6_9,entry_targets_6_8,entry_hit_pcs_6_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_6_T_1 = entry_hit_flop_temp & _entry_hit_pcs_6_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_6 = _entry_hit_pcs_6_T_1[0] | _entry_hit_pcs_6_T_1[1] | _entry_hit_pcs_6_T_1[2] |
    _entry_hit_pcs_6_T_1[3] | _entry_hit_pcs_6_T_1[4] | _entry_hit_pcs_6_T_1[5] | _entry_hit_pcs_6_T_1[6] |
    _entry_hit_pcs_6_T_1[7] | _entry_hit_pcs_6_T_1[8] | _entry_hit_pcs_6_T_1[9] | _entry_hit_pcs_6_T_1[10] |
    _entry_hit_pcs_6_T_1[11] | _entry_hit_pcs_6_T_1[12] | _entry_hit_pcs_6_T_1[13] | _entry_hit_pcs_6_T_1[14] |
    _entry_hit_pcs_6_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_7_1 = ct_ifu_l0_btb_entry_1_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_0 = ct_ifu_l0_btb_entry_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_3 = ct_ifu_l0_btb_entry_3_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_2 = ct_ifu_l0_btb_entry_2_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_5 = ct_ifu_l0_btb_entry_5_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_4 = ct_ifu_l0_btb_entry_4_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_7 = ct_ifu_l0_btb_entry_7_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_6 = ct_ifu_l0_btb_entry_6_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_7_lo = {entry_targets_7_7,entry_targets_7_6,entry_targets_7_5,entry_targets_7_4,
    entry_targets_7_3,entry_targets_7_2,entry_targets_7_1,entry_targets_7_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_7_9 = ct_ifu_l0_btb_entry_9_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_8 = ct_ifu_l0_btb_entry_8_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_11 = ct_ifu_l0_btb_entry_11_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_10 = ct_ifu_l0_btb_entry_10_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_13 = ct_ifu_l0_btb_entry_13_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_12 = ct_ifu_l0_btb_entry_12_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_15 = ct_ifu_l0_btb_entry_15_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_7_14 = ct_ifu_l0_btb_entry_14_entry_target[7]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_7_T = {entry_targets_7_15,entry_targets_7_14,entry_targets_7_13,entry_targets_7_12,
    entry_targets_7_11,entry_targets_7_10,entry_targets_7_9,entry_targets_7_8,entry_hit_pcs_7_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_7_T_1 = entry_hit_flop_temp & _entry_hit_pcs_7_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_7 = _entry_hit_pcs_7_T_1[0] | _entry_hit_pcs_7_T_1[1] | _entry_hit_pcs_7_T_1[2] |
    _entry_hit_pcs_7_T_1[3] | _entry_hit_pcs_7_T_1[4] | _entry_hit_pcs_7_T_1[5] | _entry_hit_pcs_7_T_1[6] |
    _entry_hit_pcs_7_T_1[7] | _entry_hit_pcs_7_T_1[8] | _entry_hit_pcs_7_T_1[9] | _entry_hit_pcs_7_T_1[10] |
    _entry_hit_pcs_7_T_1[11] | _entry_hit_pcs_7_T_1[12] | _entry_hit_pcs_7_T_1[13] | _entry_hit_pcs_7_T_1[14] |
    _entry_hit_pcs_7_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_8_1 = ct_ifu_l0_btb_entry_1_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_0 = ct_ifu_l0_btb_entry_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_3 = ct_ifu_l0_btb_entry_3_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_2 = ct_ifu_l0_btb_entry_2_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_5 = ct_ifu_l0_btb_entry_5_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_4 = ct_ifu_l0_btb_entry_4_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_7 = ct_ifu_l0_btb_entry_7_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_6 = ct_ifu_l0_btb_entry_6_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_8_lo = {entry_targets_8_7,entry_targets_8_6,entry_targets_8_5,entry_targets_8_4,
    entry_targets_8_3,entry_targets_8_2,entry_targets_8_1,entry_targets_8_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_8_9 = ct_ifu_l0_btb_entry_9_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_8 = ct_ifu_l0_btb_entry_8_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_11 = ct_ifu_l0_btb_entry_11_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_10 = ct_ifu_l0_btb_entry_10_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_13 = ct_ifu_l0_btb_entry_13_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_12 = ct_ifu_l0_btb_entry_12_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_15 = ct_ifu_l0_btb_entry_15_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_8_14 = ct_ifu_l0_btb_entry_14_entry_target[8]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_8_T = {entry_targets_8_15,entry_targets_8_14,entry_targets_8_13,entry_targets_8_12,
    entry_targets_8_11,entry_targets_8_10,entry_targets_8_9,entry_targets_8_8,entry_hit_pcs_8_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_8_T_1 = entry_hit_flop_temp & _entry_hit_pcs_8_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_8 = _entry_hit_pcs_8_T_1[0] | _entry_hit_pcs_8_T_1[1] | _entry_hit_pcs_8_T_1[2] |
    _entry_hit_pcs_8_T_1[3] | _entry_hit_pcs_8_T_1[4] | _entry_hit_pcs_8_T_1[5] | _entry_hit_pcs_8_T_1[6] |
    _entry_hit_pcs_8_T_1[7] | _entry_hit_pcs_8_T_1[8] | _entry_hit_pcs_8_T_1[9] | _entry_hit_pcs_8_T_1[10] |
    _entry_hit_pcs_8_T_1[11] | _entry_hit_pcs_8_T_1[12] | _entry_hit_pcs_8_T_1[13] | _entry_hit_pcs_8_T_1[14] |
    _entry_hit_pcs_8_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_9_1 = ct_ifu_l0_btb_entry_1_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_0 = ct_ifu_l0_btb_entry_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_3 = ct_ifu_l0_btb_entry_3_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_2 = ct_ifu_l0_btb_entry_2_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_5 = ct_ifu_l0_btb_entry_5_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_4 = ct_ifu_l0_btb_entry_4_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_7 = ct_ifu_l0_btb_entry_7_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_6 = ct_ifu_l0_btb_entry_6_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_9_lo = {entry_targets_9_7,entry_targets_9_6,entry_targets_9_5,entry_targets_9_4,
    entry_targets_9_3,entry_targets_9_2,entry_targets_9_1,entry_targets_9_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_9_9 = ct_ifu_l0_btb_entry_9_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_8 = ct_ifu_l0_btb_entry_8_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_11 = ct_ifu_l0_btb_entry_11_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_10 = ct_ifu_l0_btb_entry_10_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_13 = ct_ifu_l0_btb_entry_13_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_12 = ct_ifu_l0_btb_entry_12_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_15 = ct_ifu_l0_btb_entry_15_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_9_14 = ct_ifu_l0_btb_entry_14_entry_target[9]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_9_T = {entry_targets_9_15,entry_targets_9_14,entry_targets_9_13,entry_targets_9_12,
    entry_targets_9_11,entry_targets_9_10,entry_targets_9_9,entry_targets_9_8,entry_hit_pcs_9_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_9_T_1 = entry_hit_flop_temp & _entry_hit_pcs_9_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_9 = _entry_hit_pcs_9_T_1[0] | _entry_hit_pcs_9_T_1[1] | _entry_hit_pcs_9_T_1[2] |
    _entry_hit_pcs_9_T_1[3] | _entry_hit_pcs_9_T_1[4] | _entry_hit_pcs_9_T_1[5] | _entry_hit_pcs_9_T_1[6] |
    _entry_hit_pcs_9_T_1[7] | _entry_hit_pcs_9_T_1[8] | _entry_hit_pcs_9_T_1[9] | _entry_hit_pcs_9_T_1[10] |
    _entry_hit_pcs_9_T_1[11] | _entry_hit_pcs_9_T_1[12] | _entry_hit_pcs_9_T_1[13] | _entry_hit_pcs_9_T_1[14] |
    _entry_hit_pcs_9_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_10_1 = ct_ifu_l0_btb_entry_1_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_0 = ct_ifu_l0_btb_entry_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_3 = ct_ifu_l0_btb_entry_3_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_2 = ct_ifu_l0_btb_entry_2_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_5 = ct_ifu_l0_btb_entry_5_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_4 = ct_ifu_l0_btb_entry_4_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_7 = ct_ifu_l0_btb_entry_7_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_6 = ct_ifu_l0_btb_entry_6_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_10_lo = {entry_targets_10_7,entry_targets_10_6,entry_targets_10_5,entry_targets_10_4,
    entry_targets_10_3,entry_targets_10_2,entry_targets_10_1,entry_targets_10_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_10_9 = ct_ifu_l0_btb_entry_9_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_8 = ct_ifu_l0_btb_entry_8_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_11 = ct_ifu_l0_btb_entry_11_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_10 = ct_ifu_l0_btb_entry_10_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_13 = ct_ifu_l0_btb_entry_13_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_12 = ct_ifu_l0_btb_entry_12_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_15 = ct_ifu_l0_btb_entry_15_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_10_14 = ct_ifu_l0_btb_entry_14_entry_target[10]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_10_T = {entry_targets_10_15,entry_targets_10_14,entry_targets_10_13,entry_targets_10_12,
    entry_targets_10_11,entry_targets_10_10,entry_targets_10_9,entry_targets_10_8,entry_hit_pcs_10_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_10_T_1 = entry_hit_flop_temp & _entry_hit_pcs_10_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_10 = _entry_hit_pcs_10_T_1[0] | _entry_hit_pcs_10_T_1[1] | _entry_hit_pcs_10_T_1[2] |
    _entry_hit_pcs_10_T_1[3] | _entry_hit_pcs_10_T_1[4] | _entry_hit_pcs_10_T_1[5] | _entry_hit_pcs_10_T_1[6] |
    _entry_hit_pcs_10_T_1[7] | _entry_hit_pcs_10_T_1[8] | _entry_hit_pcs_10_T_1[9] | _entry_hit_pcs_10_T_1[10] |
    _entry_hit_pcs_10_T_1[11] | _entry_hit_pcs_10_T_1[12] | _entry_hit_pcs_10_T_1[13] | _entry_hit_pcs_10_T_1[14] |
    _entry_hit_pcs_10_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_11_1 = ct_ifu_l0_btb_entry_1_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_0 = ct_ifu_l0_btb_entry_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_3 = ct_ifu_l0_btb_entry_3_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_2 = ct_ifu_l0_btb_entry_2_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_5 = ct_ifu_l0_btb_entry_5_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_4 = ct_ifu_l0_btb_entry_4_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_7 = ct_ifu_l0_btb_entry_7_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_6 = ct_ifu_l0_btb_entry_6_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_11_lo = {entry_targets_11_7,entry_targets_11_6,entry_targets_11_5,entry_targets_11_4,
    entry_targets_11_3,entry_targets_11_2,entry_targets_11_1,entry_targets_11_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_11_9 = ct_ifu_l0_btb_entry_9_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_8 = ct_ifu_l0_btb_entry_8_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_11 = ct_ifu_l0_btb_entry_11_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_10 = ct_ifu_l0_btb_entry_10_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_13 = ct_ifu_l0_btb_entry_13_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_12 = ct_ifu_l0_btb_entry_12_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_15 = ct_ifu_l0_btb_entry_15_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_11_14 = ct_ifu_l0_btb_entry_14_entry_target[11]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_11_T = {entry_targets_11_15,entry_targets_11_14,entry_targets_11_13,entry_targets_11_12,
    entry_targets_11_11,entry_targets_11_10,entry_targets_11_9,entry_targets_11_8,entry_hit_pcs_11_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_11_T_1 = entry_hit_flop_temp & _entry_hit_pcs_11_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_11 = _entry_hit_pcs_11_T_1[0] | _entry_hit_pcs_11_T_1[1] | _entry_hit_pcs_11_T_1[2] |
    _entry_hit_pcs_11_T_1[3] | _entry_hit_pcs_11_T_1[4] | _entry_hit_pcs_11_T_1[5] | _entry_hit_pcs_11_T_1[6] |
    _entry_hit_pcs_11_T_1[7] | _entry_hit_pcs_11_T_1[8] | _entry_hit_pcs_11_T_1[9] | _entry_hit_pcs_11_T_1[10] |
    _entry_hit_pcs_11_T_1[11] | _entry_hit_pcs_11_T_1[12] | _entry_hit_pcs_11_T_1[13] | _entry_hit_pcs_11_T_1[14] |
    _entry_hit_pcs_11_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_12_1 = ct_ifu_l0_btb_entry_1_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_0 = ct_ifu_l0_btb_entry_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_3 = ct_ifu_l0_btb_entry_3_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_2 = ct_ifu_l0_btb_entry_2_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_5 = ct_ifu_l0_btb_entry_5_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_4 = ct_ifu_l0_btb_entry_4_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_7 = ct_ifu_l0_btb_entry_7_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_6 = ct_ifu_l0_btb_entry_6_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_12_lo = {entry_targets_12_7,entry_targets_12_6,entry_targets_12_5,entry_targets_12_4,
    entry_targets_12_3,entry_targets_12_2,entry_targets_12_1,entry_targets_12_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_12_9 = ct_ifu_l0_btb_entry_9_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_8 = ct_ifu_l0_btb_entry_8_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_11 = ct_ifu_l0_btb_entry_11_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_10 = ct_ifu_l0_btb_entry_10_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_13 = ct_ifu_l0_btb_entry_13_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_12 = ct_ifu_l0_btb_entry_12_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_15 = ct_ifu_l0_btb_entry_15_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_12_14 = ct_ifu_l0_btb_entry_14_entry_target[12]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_12_T = {entry_targets_12_15,entry_targets_12_14,entry_targets_12_13,entry_targets_12_12,
    entry_targets_12_11,entry_targets_12_10,entry_targets_12_9,entry_targets_12_8,entry_hit_pcs_12_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_12_T_1 = entry_hit_flop_temp & _entry_hit_pcs_12_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_12 = _entry_hit_pcs_12_T_1[0] | _entry_hit_pcs_12_T_1[1] | _entry_hit_pcs_12_T_1[2] |
    _entry_hit_pcs_12_T_1[3] | _entry_hit_pcs_12_T_1[4] | _entry_hit_pcs_12_T_1[5] | _entry_hit_pcs_12_T_1[6] |
    _entry_hit_pcs_12_T_1[7] | _entry_hit_pcs_12_T_1[8] | _entry_hit_pcs_12_T_1[9] | _entry_hit_pcs_12_T_1[10] |
    _entry_hit_pcs_12_T_1[11] | _entry_hit_pcs_12_T_1[12] | _entry_hit_pcs_12_T_1[13] | _entry_hit_pcs_12_T_1[14] |
    _entry_hit_pcs_12_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_13_1 = ct_ifu_l0_btb_entry_1_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_0 = ct_ifu_l0_btb_entry_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_3 = ct_ifu_l0_btb_entry_3_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_2 = ct_ifu_l0_btb_entry_2_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_5 = ct_ifu_l0_btb_entry_5_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_4 = ct_ifu_l0_btb_entry_4_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_7 = ct_ifu_l0_btb_entry_7_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_6 = ct_ifu_l0_btb_entry_6_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_13_lo = {entry_targets_13_7,entry_targets_13_6,entry_targets_13_5,entry_targets_13_4,
    entry_targets_13_3,entry_targets_13_2,entry_targets_13_1,entry_targets_13_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_13_9 = ct_ifu_l0_btb_entry_9_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_8 = ct_ifu_l0_btb_entry_8_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_11 = ct_ifu_l0_btb_entry_11_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_10 = ct_ifu_l0_btb_entry_10_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_13 = ct_ifu_l0_btb_entry_13_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_12 = ct_ifu_l0_btb_entry_12_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_15 = ct_ifu_l0_btb_entry_15_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_13_14 = ct_ifu_l0_btb_entry_14_entry_target[13]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_13_T = {entry_targets_13_15,entry_targets_13_14,entry_targets_13_13,entry_targets_13_12,
    entry_targets_13_11,entry_targets_13_10,entry_targets_13_9,entry_targets_13_8,entry_hit_pcs_13_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_13_T_1 = entry_hit_flop_temp & _entry_hit_pcs_13_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_13 = _entry_hit_pcs_13_T_1[0] | _entry_hit_pcs_13_T_1[1] | _entry_hit_pcs_13_T_1[2] |
    _entry_hit_pcs_13_T_1[3] | _entry_hit_pcs_13_T_1[4] | _entry_hit_pcs_13_T_1[5] | _entry_hit_pcs_13_T_1[6] |
    _entry_hit_pcs_13_T_1[7] | _entry_hit_pcs_13_T_1[8] | _entry_hit_pcs_13_T_1[9] | _entry_hit_pcs_13_T_1[10] |
    _entry_hit_pcs_13_T_1[11] | _entry_hit_pcs_13_T_1[12] | _entry_hit_pcs_13_T_1[13] | _entry_hit_pcs_13_T_1[14] |
    _entry_hit_pcs_13_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_14_1 = ct_ifu_l0_btb_entry_1_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_0 = ct_ifu_l0_btb_entry_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_3 = ct_ifu_l0_btb_entry_3_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_2 = ct_ifu_l0_btb_entry_2_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_5 = ct_ifu_l0_btb_entry_5_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_4 = ct_ifu_l0_btb_entry_4_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_7 = ct_ifu_l0_btb_entry_7_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_6 = ct_ifu_l0_btb_entry_6_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_14_lo = {entry_targets_14_7,entry_targets_14_6,entry_targets_14_5,entry_targets_14_4,
    entry_targets_14_3,entry_targets_14_2,entry_targets_14_1,entry_targets_14_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_14_9 = ct_ifu_l0_btb_entry_9_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_8 = ct_ifu_l0_btb_entry_8_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_11 = ct_ifu_l0_btb_entry_11_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_10 = ct_ifu_l0_btb_entry_10_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_13 = ct_ifu_l0_btb_entry_13_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_12 = ct_ifu_l0_btb_entry_12_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_15 = ct_ifu_l0_btb_entry_15_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_14_14 = ct_ifu_l0_btb_entry_14_entry_target[14]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_14_T = {entry_targets_14_15,entry_targets_14_14,entry_targets_14_13,entry_targets_14_12,
    entry_targets_14_11,entry_targets_14_10,entry_targets_14_9,entry_targets_14_8,entry_hit_pcs_14_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_14_T_1 = entry_hit_flop_temp & _entry_hit_pcs_14_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_14 = _entry_hit_pcs_14_T_1[0] | _entry_hit_pcs_14_T_1[1] | _entry_hit_pcs_14_T_1[2] |
    _entry_hit_pcs_14_T_1[3] | _entry_hit_pcs_14_T_1[4] | _entry_hit_pcs_14_T_1[5] | _entry_hit_pcs_14_T_1[6] |
    _entry_hit_pcs_14_T_1[7] | _entry_hit_pcs_14_T_1[8] | _entry_hit_pcs_14_T_1[9] | _entry_hit_pcs_14_T_1[10] |
    _entry_hit_pcs_14_T_1[11] | _entry_hit_pcs_14_T_1[12] | _entry_hit_pcs_14_T_1[13] | _entry_hit_pcs_14_T_1[14] |
    _entry_hit_pcs_14_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_15_1 = ct_ifu_l0_btb_entry_1_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_0 = ct_ifu_l0_btb_entry_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_3 = ct_ifu_l0_btb_entry_3_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_2 = ct_ifu_l0_btb_entry_2_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_5 = ct_ifu_l0_btb_entry_5_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_4 = ct_ifu_l0_btb_entry_4_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_7 = ct_ifu_l0_btb_entry_7_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_6 = ct_ifu_l0_btb_entry_6_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_15_lo = {entry_targets_15_7,entry_targets_15_6,entry_targets_15_5,entry_targets_15_4,
    entry_targets_15_3,entry_targets_15_2,entry_targets_15_1,entry_targets_15_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_15_9 = ct_ifu_l0_btb_entry_9_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_8 = ct_ifu_l0_btb_entry_8_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_11 = ct_ifu_l0_btb_entry_11_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_10 = ct_ifu_l0_btb_entry_10_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_13 = ct_ifu_l0_btb_entry_13_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_12 = ct_ifu_l0_btb_entry_12_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_15 = ct_ifu_l0_btb_entry_15_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_15_14 = ct_ifu_l0_btb_entry_14_entry_target[15]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_15_T = {entry_targets_15_15,entry_targets_15_14,entry_targets_15_13,entry_targets_15_12,
    entry_targets_15_11,entry_targets_15_10,entry_targets_15_9,entry_targets_15_8,entry_hit_pcs_15_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_15_T_1 = entry_hit_flop_temp & _entry_hit_pcs_15_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_15 = _entry_hit_pcs_15_T_1[0] | _entry_hit_pcs_15_T_1[1] | _entry_hit_pcs_15_T_1[2] |
    _entry_hit_pcs_15_T_1[3] | _entry_hit_pcs_15_T_1[4] | _entry_hit_pcs_15_T_1[5] | _entry_hit_pcs_15_T_1[6] |
    _entry_hit_pcs_15_T_1[7] | _entry_hit_pcs_15_T_1[8] | _entry_hit_pcs_15_T_1[9] | _entry_hit_pcs_15_T_1[10] |
    _entry_hit_pcs_15_T_1[11] | _entry_hit_pcs_15_T_1[12] | _entry_hit_pcs_15_T_1[13] | _entry_hit_pcs_15_T_1[14] |
    _entry_hit_pcs_15_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_16_1 = ct_ifu_l0_btb_entry_1_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_0 = ct_ifu_l0_btb_entry_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_3 = ct_ifu_l0_btb_entry_3_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_2 = ct_ifu_l0_btb_entry_2_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_5 = ct_ifu_l0_btb_entry_5_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_4 = ct_ifu_l0_btb_entry_4_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_7 = ct_ifu_l0_btb_entry_7_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_6 = ct_ifu_l0_btb_entry_6_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_16_lo = {entry_targets_16_7,entry_targets_16_6,entry_targets_16_5,entry_targets_16_4,
    entry_targets_16_3,entry_targets_16_2,entry_targets_16_1,entry_targets_16_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_16_9 = ct_ifu_l0_btb_entry_9_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_8 = ct_ifu_l0_btb_entry_8_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_11 = ct_ifu_l0_btb_entry_11_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_10 = ct_ifu_l0_btb_entry_10_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_13 = ct_ifu_l0_btb_entry_13_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_12 = ct_ifu_l0_btb_entry_12_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_15 = ct_ifu_l0_btb_entry_15_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_16_14 = ct_ifu_l0_btb_entry_14_entry_target[16]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_16_T = {entry_targets_16_15,entry_targets_16_14,entry_targets_16_13,entry_targets_16_12,
    entry_targets_16_11,entry_targets_16_10,entry_targets_16_9,entry_targets_16_8,entry_hit_pcs_16_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_16_T_1 = entry_hit_flop_temp & _entry_hit_pcs_16_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_16 = _entry_hit_pcs_16_T_1[0] | _entry_hit_pcs_16_T_1[1] | _entry_hit_pcs_16_T_1[2] |
    _entry_hit_pcs_16_T_1[3] | _entry_hit_pcs_16_T_1[4] | _entry_hit_pcs_16_T_1[5] | _entry_hit_pcs_16_T_1[6] |
    _entry_hit_pcs_16_T_1[7] | _entry_hit_pcs_16_T_1[8] | _entry_hit_pcs_16_T_1[9] | _entry_hit_pcs_16_T_1[10] |
    _entry_hit_pcs_16_T_1[11] | _entry_hit_pcs_16_T_1[12] | _entry_hit_pcs_16_T_1[13] | _entry_hit_pcs_16_T_1[14] |
    _entry_hit_pcs_16_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_17_1 = ct_ifu_l0_btb_entry_1_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_0 = ct_ifu_l0_btb_entry_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_3 = ct_ifu_l0_btb_entry_3_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_2 = ct_ifu_l0_btb_entry_2_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_5 = ct_ifu_l0_btb_entry_5_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_4 = ct_ifu_l0_btb_entry_4_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_7 = ct_ifu_l0_btb_entry_7_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_6 = ct_ifu_l0_btb_entry_6_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_17_lo = {entry_targets_17_7,entry_targets_17_6,entry_targets_17_5,entry_targets_17_4,
    entry_targets_17_3,entry_targets_17_2,entry_targets_17_1,entry_targets_17_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_17_9 = ct_ifu_l0_btb_entry_9_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_8 = ct_ifu_l0_btb_entry_8_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_11 = ct_ifu_l0_btb_entry_11_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_10 = ct_ifu_l0_btb_entry_10_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_13 = ct_ifu_l0_btb_entry_13_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_12 = ct_ifu_l0_btb_entry_12_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_15 = ct_ifu_l0_btb_entry_15_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_17_14 = ct_ifu_l0_btb_entry_14_entry_target[17]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_17_T = {entry_targets_17_15,entry_targets_17_14,entry_targets_17_13,entry_targets_17_12,
    entry_targets_17_11,entry_targets_17_10,entry_targets_17_9,entry_targets_17_8,entry_hit_pcs_17_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_17_T_1 = entry_hit_flop_temp & _entry_hit_pcs_17_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_17 = _entry_hit_pcs_17_T_1[0] | _entry_hit_pcs_17_T_1[1] | _entry_hit_pcs_17_T_1[2] |
    _entry_hit_pcs_17_T_1[3] | _entry_hit_pcs_17_T_1[4] | _entry_hit_pcs_17_T_1[5] | _entry_hit_pcs_17_T_1[6] |
    _entry_hit_pcs_17_T_1[7] | _entry_hit_pcs_17_T_1[8] | _entry_hit_pcs_17_T_1[9] | _entry_hit_pcs_17_T_1[10] |
    _entry_hit_pcs_17_T_1[11] | _entry_hit_pcs_17_T_1[12] | _entry_hit_pcs_17_T_1[13] | _entry_hit_pcs_17_T_1[14] |
    _entry_hit_pcs_17_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_18_1 = ct_ifu_l0_btb_entry_1_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_0 = ct_ifu_l0_btb_entry_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_3 = ct_ifu_l0_btb_entry_3_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_2 = ct_ifu_l0_btb_entry_2_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_5 = ct_ifu_l0_btb_entry_5_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_4 = ct_ifu_l0_btb_entry_4_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_7 = ct_ifu_l0_btb_entry_7_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_6 = ct_ifu_l0_btb_entry_6_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_18_lo = {entry_targets_18_7,entry_targets_18_6,entry_targets_18_5,entry_targets_18_4,
    entry_targets_18_3,entry_targets_18_2,entry_targets_18_1,entry_targets_18_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_18_9 = ct_ifu_l0_btb_entry_9_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_8 = ct_ifu_l0_btb_entry_8_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_11 = ct_ifu_l0_btb_entry_11_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_10 = ct_ifu_l0_btb_entry_10_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_13 = ct_ifu_l0_btb_entry_13_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_12 = ct_ifu_l0_btb_entry_12_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_15 = ct_ifu_l0_btb_entry_15_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_18_14 = ct_ifu_l0_btb_entry_14_entry_target[18]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_18_T = {entry_targets_18_15,entry_targets_18_14,entry_targets_18_13,entry_targets_18_12,
    entry_targets_18_11,entry_targets_18_10,entry_targets_18_9,entry_targets_18_8,entry_hit_pcs_18_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_18_T_1 = entry_hit_flop_temp & _entry_hit_pcs_18_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_18 = _entry_hit_pcs_18_T_1[0] | _entry_hit_pcs_18_T_1[1] | _entry_hit_pcs_18_T_1[2] |
    _entry_hit_pcs_18_T_1[3] | _entry_hit_pcs_18_T_1[4] | _entry_hit_pcs_18_T_1[5] | _entry_hit_pcs_18_T_1[6] |
    _entry_hit_pcs_18_T_1[7] | _entry_hit_pcs_18_T_1[8] | _entry_hit_pcs_18_T_1[9] | _entry_hit_pcs_18_T_1[10] |
    _entry_hit_pcs_18_T_1[11] | _entry_hit_pcs_18_T_1[12] | _entry_hit_pcs_18_T_1[13] | _entry_hit_pcs_18_T_1[14] |
    _entry_hit_pcs_18_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_targets_19_1 = ct_ifu_l0_btb_entry_1_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_0 = ct_ifu_l0_btb_entry_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_3 = ct_ifu_l0_btb_entry_3_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_2 = ct_ifu_l0_btb_entry_2_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_5 = ct_ifu_l0_btb_entry_5_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_4 = ct_ifu_l0_btb_entry_4_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_7 = ct_ifu_l0_btb_entry_7_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_6 = ct_ifu_l0_btb_entry_6_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [7:0] entry_hit_pcs_19_lo = {entry_targets_19_7,entry_targets_19_6,entry_targets_19_5,entry_targets_19_4,
    entry_targets_19_3,entry_targets_19_2,entry_targets_19_1,entry_targets_19_0}; // @[ct_ifu_l0_btb.scala 150:77]
  wire  entry_targets_19_9 = ct_ifu_l0_btb_entry_9_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_8 = ct_ifu_l0_btb_entry_8_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_11 = ct_ifu_l0_btb_entry_11_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_10 = ct_ifu_l0_btb_entry_10_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_13 = ct_ifu_l0_btb_entry_13_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_12 = ct_ifu_l0_btb_entry_12_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_15 = ct_ifu_l0_btb_entry_15_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire  entry_targets_19_14 = ct_ifu_l0_btb_entry_14_entry_target[19]; // @[ct_ifu_l0_btb.scala 273:59]
  wire [15:0] _entry_hit_pcs_19_T = {entry_targets_19_15,entry_targets_19_14,entry_targets_19_13,entry_targets_19_12,
    entry_targets_19_11,entry_targets_19_10,entry_targets_19_9,entry_targets_19_8,entry_hit_pcs_19_lo}; // @[ct_ifu_l0_btb.scala 150:77]
  wire [15:0] _entry_hit_pcs_19_T_1 = entry_hit_flop_temp & _entry_hit_pcs_19_T; // @[ct_ifu_l0_btb.scala 150:70]
  wire  entry_hit_pcs_19 = _entry_hit_pcs_19_T_1[0] | _entry_hit_pcs_19_T_1[1] | _entry_hit_pcs_19_T_1[2] |
    _entry_hit_pcs_19_T_1[3] | _entry_hit_pcs_19_T_1[4] | _entry_hit_pcs_19_T_1[5] | _entry_hit_pcs_19_T_1[6] |
    _entry_hit_pcs_19_T_1[7] | _entry_hit_pcs_19_T_1[8] | _entry_hit_pcs_19_T_1[9] | _entry_hit_pcs_19_T_1[10] |
    _entry_hit_pcs_19_T_1[11] | _entry_hit_pcs_19_T_1[12] | _entry_hit_pcs_19_T_1[13] | _entry_hit_pcs_19_T_1[14] |
    _entry_hit_pcs_19_T_1[15]; // @[ct_ifu_l0_btb.scala 150:101]
  wire  entry_if_hit = entry_hit_flop_temp[0] | entry_hit_flop_temp[1] | entry_hit_flop_temp[2] | entry_hit_flop_temp[3]
     | entry_hit_flop_temp[4] | entry_hit_flop_temp[5] | entry_hit_flop_temp[6] | entry_hit_flop_temp[7] |
    entry_hit_flop_temp[8] | entry_hit_flop_temp[9] | entry_hit_flop_temp[10] | entry_hit_flop_temp[11] |
    entry_hit_flop_temp[12] | entry_hit_flop_temp[13] | entry_hit_flop_temp[14] | entry_hit_flop_temp[15]; // @[ct_ifu_l0_btb.scala 152:51]
  wire [9:0] entry_hit_target_temp_lo = {entry_hit_pcs_10,entry_hit_pcs_11,entry_hit_pcs_12,entry_hit_pcs_13,
    entry_hit_pcs_14,entry_hit_pcs_15,entry_hit_pcs_16,entry_hit_pcs_17,entry_hit_pcs_18,entry_hit_pcs_19}; // @[Cat.scala 31:58]
  wire [9:0] entry_hit_target_temp_hi = {entry_hit_pcs_0,entry_hit_pcs_1,entry_hit_pcs_2,entry_hit_pcs_3,entry_hit_pcs_4
    ,entry_hit_pcs_5,entry_hit_pcs_6,entry_hit_pcs_7,entry_hit_pcs_8,entry_hit_pcs_9}; // @[Cat.scala 31:58]
  wire [38:0] _entry_hit_target_T_1 = {pcgen_l0_btb_if_pc[38:20],entry_hit_target_temp_hi,entry_hit_target_temp_lo}; // @[Cat.scala 31:58]
  reg [1:0] l0_btb_cur_state_temp; // @[ct_ifu_l0_btb.scala 167:40]
  wire  _l0_btb_next_state_T_1 = ~ipctrl_l0_btb_ip_vld; // @[ct_ifu_l0_btb.scala 175:42]
  wire [1:0] _l0_btb_next_state_T_2 = _l0_btb_next_state_T_1 ? 2'h2 : 2'h1; // @[Mux.scala 101:16]
  wire [1:0] _l0_btb_next_state_T_3 = ipctrl_l0_btb_wait_next ? 2'h2 : _l0_btb_next_state_T_2; // @[Mux.scala 101:16]
  wire  l0_btb_create_en = _l0_btb_rd_T & ibdp_l0_btb_fifo_update_vld; // @[ct_ifu_l0_btb.scala 186:65]
  reg [15:0] entry_fifo_temp; // @[ct_ifu_l0_btb.scala 190:30]
  wire [15:0] _entry_fifo_temp_T_2 = {entry_fifo_temp[14:0],entry_fifo_temp[15]}; // @[Cat.scala 31:58]
  wire  _l0_btb_update_entry_0_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[0]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_1_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[1]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_2_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[2]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_3_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[3]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_4_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[4]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_5_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[5]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_6_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[6]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_7_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[7]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_8_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[8]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_9_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[9]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_10_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[10]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_11_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[11]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_12_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[12]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_13_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[13]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_14_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[14]; // @[ct_ifu_l0_btb.scala 208:39]
  wire  _l0_btb_update_entry_15_T_1 = l0_btb_update_vld_for_gateclk & ibdp_l0_btb_update_entry[15]; // @[ct_ifu_l0_btb.scala 208:39]
  wire [3:0] _GEN_6 = ibdp_l0_btb_update_vld ? ibdp_l0_btb_wen : 4'h0; // @[ct_ifu_l0_btb.scala 224:48 225:16 231:16]
  wire  _GEN_8 = ibdp_l0_btb_update_vld & ibdp_l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 224:48 227:27 233:27]
  wire  _GEN_9 = ibdp_l0_btb_update_vld & ibdp_l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 224:48 228:27 234:27]
  reg  l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 246:40]
  wire  _GEN_16 = ifctrl_l0_btb_inv | l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 250:37 251:29 253:29]
  gated_clk_cell l0_btb_pipe_clk__gated_clk_cell ( // @[ct_ifu_l0_btb.scala 43:33]
    .clk_in(l0_btb_pipe_clk__gated_clk_cell_clk_in),
    .global_en(l0_btb_pipe_clk__gated_clk_cell_global_en),
    .module_en(l0_btb_pipe_clk__gated_clk_cell_module_en),
    .local_en(l0_btb_pipe_clk__gated_clk_cell_local_en),
    .external_en(l0_btb_pipe_clk__gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(l0_btb_pipe_clk__gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(l0_btb_pipe_clk__gated_clk_cell_clk_out)
  );
  gated_clk_cell l0_btb_clk__gated_clk_cell ( // @[ct_ifu_l0_btb.scala 43:33]
    .clk_in(l0_btb_clk__gated_clk_cell_clk_in),
    .global_en(l0_btb_clk__gated_clk_cell_global_en),
    .module_en(l0_btb_clk__gated_clk_cell_module_en),
    .local_en(l0_btb_clk__gated_clk_cell_local_en),
    .external_en(l0_btb_clk__gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(l0_btb_clk__gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(l0_btb_clk__gated_clk_cell_clk_out)
  );
  gated_clk_cell l0_btb_create_clk__gated_clk_cell ( // @[ct_ifu_l0_btb.scala 43:33]
    .clk_in(l0_btb_create_clk__gated_clk_cell_clk_in),
    .global_en(l0_btb_create_clk__gated_clk_cell_global_en),
    .module_en(l0_btb_create_clk__gated_clk_cell_module_en),
    .local_en(l0_btb_create_clk__gated_clk_cell_local_en),
    .external_en(l0_btb_create_clk__gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(l0_btb_create_clk__gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(l0_btb_create_clk__gated_clk_cell_clk_out)
  );
  gated_clk_cell l0_btb_inv_reg_upd_clk__gated_clk_cell ( // @[ct_ifu_l0_btb.scala 43:33]
    .clk_in(l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_in),
    .global_en(l0_btb_inv_reg_upd_clk__gated_clk_cell_global_en),
    .module_en(l0_btb_inv_reg_upd_clk__gated_clk_cell_module_en),
    .local_en(l0_btb_inv_reg_upd_clk__gated_clk_cell_local_en),
    .external_en(l0_btb_inv_reg_upd_clk__gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(l0_btb_inv_reg_upd_clk__gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_out)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_1 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_1_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_1_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_1_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_1_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_1_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_1_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_1_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_1_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_1_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_1_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_1_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_1_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_1_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_1_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_1_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_1_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_1_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_1_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_1_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_1_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_2 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_2_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_2_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_2_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_2_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_2_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_2_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_2_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_2_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_2_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_2_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_2_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_2_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_2_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_2_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_2_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_2_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_2_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_2_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_2_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_2_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_3 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_3_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_3_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_3_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_3_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_3_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_3_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_3_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_3_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_3_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_3_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_3_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_3_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_3_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_3_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_3_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_3_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_3_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_3_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_3_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_3_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_4 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_4_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_4_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_4_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_4_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_4_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_4_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_4_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_4_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_4_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_4_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_4_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_4_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_4_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_4_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_4_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_4_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_4_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_4_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_4_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_4_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_5 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_5_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_5_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_5_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_5_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_5_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_5_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_5_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_5_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_5_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_5_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_5_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_5_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_5_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_5_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_5_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_5_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_5_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_5_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_5_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_5_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_6 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_6_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_6_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_6_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_6_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_6_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_6_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_6_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_6_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_6_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_6_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_6_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_6_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_6_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_6_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_6_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_6_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_6_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_6_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_6_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_6_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_7 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_7_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_7_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_7_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_7_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_7_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_7_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_7_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_7_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_7_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_7_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_7_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_7_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_7_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_7_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_7_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_7_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_7_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_7_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_7_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_7_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_8 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_8_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_8_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_8_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_8_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_8_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_8_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_8_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_8_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_8_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_8_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_8_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_8_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_8_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_8_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_8_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_8_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_8_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_8_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_8_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_8_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_9 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_9_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_9_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_9_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_9_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_9_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_9_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_9_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_9_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_9_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_9_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_9_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_9_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_9_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_9_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_9_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_9_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_9_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_9_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_9_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_9_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_10 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_10_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_10_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_10_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_10_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_10_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_10_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_10_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_10_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_10_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_10_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_10_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_10_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_10_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_10_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_10_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_10_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_10_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_10_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_10_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_10_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_11 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_11_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_11_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_11_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_11_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_11_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_11_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_11_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_11_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_11_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_11_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_11_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_11_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_11_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_11_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_11_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_11_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_11_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_11_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_11_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_11_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_12 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_12_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_12_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_12_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_12_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_12_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_12_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_12_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_12_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_12_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_12_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_12_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_12_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_12_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_12_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_12_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_12_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_12_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_12_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_12_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_12_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_13 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_13_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_13_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_13_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_13_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_13_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_13_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_13_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_13_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_13_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_13_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_13_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_13_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_13_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_13_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_13_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_13_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_13_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_13_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_13_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_13_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_14 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_14_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_14_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_14_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_14_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_14_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_14_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_14_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_14_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_14_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_14_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_14_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_14_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_14_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_14_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_14_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_14_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_14_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_14_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_14_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_14_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_15 ( // @[ct_ifu_l0_btb.scala 260:51]
    .cp0_ifu_btb_en(ct_ifu_l0_btb_entry_15_cp0_ifu_btb_en),
    .cp0_ifu_icg_en(ct_ifu_l0_btb_entry_15_cp0_ifu_icg_en),
    .cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_15_cp0_ifu_l0btb_en),
    .cp0_yy_clk_en(ct_ifu_l0_btb_entry_15_cp0_yy_clk_en),
    .cpurst_b(ct_ifu_l0_btb_entry_15_cpurst_b),
    .entry_inv(ct_ifu_l0_btb_entry_15_entry_inv),
    .entry_update(ct_ifu_l0_btb_entry_15_entry_update),
    .entry_update_cnt(ct_ifu_l0_btb_entry_15_entry_update_cnt),
    .entry_update_data(ct_ifu_l0_btb_entry_15_entry_update_data),
    .entry_update_ras(ct_ifu_l0_btb_entry_15_entry_update_ras),
    .entry_update_vld(ct_ifu_l0_btb_entry_15_entry_update_vld),
    .entry_wen(ct_ifu_l0_btb_entry_15_entry_wen),
    .forever_cpuclk(ct_ifu_l0_btb_entry_15_forever_cpuclk),
    .pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_15_pad_yy_icg_scan_en),
    .entry_cnt(ct_ifu_l0_btb_entry_15_entry_cnt),
    .entry_ras(ct_ifu_l0_btb_entry_15_entry_ras),
    .entry_tag(ct_ifu_l0_btb_entry_15_entry_tag),
    .entry_target(ct_ifu_l0_btb_entry_15_entry_target),
    .entry_vld(ct_ifu_l0_btb_entry_15_entry_vld),
    .entry_way_pred(ct_ifu_l0_btb_entry_15_entry_way_pred)
  );
  assign l0_btb_ifctrl_chglfw_vld = entry_if_hit & entry_hit_counter; // @[ct_ifu_l0_btb.scala 153:37]
  assign l0_btb_ifdp_counter = _entry_hit_counter_T_1[0] | _entry_hit_counter_T_1[1] | _entry_hit_counter_T_1[2] |
    _entry_hit_counter_T_1[3] | _entry_hit_counter_T_1[4] | _entry_hit_counter_T_1[5] | _entry_hit_counter_T_1[6] |
    _entry_hit_counter_T_1[7] | _entry_hit_counter_T_1[8] | _entry_hit_counter_T_1[9] | _entry_hit_counter_T_1[10] |
    _entry_hit_counter_T_1[11] | _entry_hit_counter_T_1[12] | _entry_hit_counter_T_1[13] | _entry_hit_counter_T_1[14] |
    _entry_hit_counter_T_1[15]; // @[ct_ifu_l0_btb.scala 137:73]
  assign l0_btb_ifdp_hit = entry_hit_flop_temp[0] | entry_hit_flop_temp[1] | entry_hit_flop_temp[2] |
    entry_hit_flop_temp[3] | entry_hit_flop_temp[4] | entry_hit_flop_temp[5] | entry_hit_flop_temp[6] |
    entry_hit_flop_temp[7] | entry_hit_flop_temp[8] | entry_hit_flop_temp[9] | entry_hit_flop_temp[10] |
    entry_hit_flop_temp[11] | entry_hit_flop_temp[12] | entry_hit_flop_temp[13] | entry_hit_flop_temp[14] |
    entry_hit_flop_temp[15]; // @[ct_ifu_l0_btb.scala 152:51]
  assign l0_btb_ifdp_ras = _entry_hit_ras_T_1[0] | _entry_hit_ras_T_1[1] | _entry_hit_ras_T_1[2] | _entry_hit_ras_T_1
    [3] | _entry_hit_ras_T_1[4] | _entry_hit_ras_T_1[5] | _entry_hit_ras_T_1[6] | _entry_hit_ras_T_1[7] |
    _entry_hit_ras_T_1[8] | _entry_hit_ras_T_1[9] | _entry_hit_ras_T_1[10] | _entry_hit_ras_T_1[11] | _entry_hit_ras_T_1
    [12] | _entry_hit_ras_T_1[13] | _entry_hit_ras_T_1[14] | _entry_hit_ras_T_1[15]; // @[ct_ifu_l0_btb.scala 140:70]
  assign l0_btb_debug_cur_state = l0_btb_cur_state_temp; // @[ct_ifu_l0_btb.scala 164:30 168:22]
  assign l0_btb_ibdp_entry_fifo = entry_fifo_temp; // @[ct_ifu_l0_btb.scala 188:22 191:12]
  assign l0_btb_ifctrl_chgflw_pc = entry_hit_ras ? ras_pc_temp : _entry_hit_target_T_1; // @[ct_ifu_l0_btb.scala 156:26]
  assign l0_btb_ifctrl_chgflw_way_pred = {entry_hit_way_pred_2,entry_hit_way_pred_1}; // @[Cat.scala 31:58]
  assign l0_btb_ifdp_chgflw_pc = entry_hit_ras ? ras_pc_temp : _entry_hit_target_T_1; // @[ct_ifu_l0_btb.scala 156:26]
  assign l0_btb_ifdp_chgflw_way_pred = {entry_hit_way_pred_2,entry_hit_way_pred_1}; // @[Cat.scala 31:58]
  assign l0_btb_ifdp_entry_hit = entry_hit_flop_temp; // @[ct_ifu_l0_btb.scala 108:20 98:26]
  assign l0_btb_ipctrl_st_wait = l0_btb_cur_state_temp == 2'h2; // @[ct_ifu_l0_btb.scala 180:49]
  assign l0_btb_pipe_clk__gated_clk_cell_clk_in = forever_cpuclk; // @[ct_ifu_l0_btb.scala 45:57]
  assign l0_btb_pipe_clk__gated_clk_cell_global_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 47:36]
  assign l0_btb_pipe_clk__gated_clk_cell_module_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 49:36]
  assign l0_btb_pipe_clk__gated_clk_cell_local_en = cp0_ifu_btb_en & cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 112:40]
  assign l0_btb_pipe_clk__gated_clk_cell_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 46:36]
  assign l0_btb_pipe_clk__gated_clk_cell_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 50:43]
  assign l0_btb_clk__gated_clk_cell_clk_in = forever_cpuclk; // @[ct_ifu_l0_btb.scala 45:57]
  assign l0_btb_clk__gated_clk_cell_global_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 47:36]
  assign l0_btb_clk__gated_clk_cell_module_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 49:36]
  assign l0_btb_clk__gated_clk_cell_local_en = cp0_ifu_btb_en & cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 162:41]
  assign l0_btb_clk__gated_clk_cell_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 46:36]
  assign l0_btb_clk__gated_clk_cell_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 50:43]
  assign l0_btb_create_clk__gated_clk_cell_clk_in = forever_cpuclk; // @[ct_ifu_l0_btb.scala 45:57]
  assign l0_btb_create_clk__gated_clk_cell_global_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 47:36]
  assign l0_btb_create_clk__gated_clk_cell_module_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 49:36]
  assign l0_btb_create_clk__gated_clk_cell_local_en = _l0_btb_rd_T & ibdp_l0_btb_fifo_update_vld; // @[ct_ifu_l0_btb.scala 186:65]
  assign l0_btb_create_clk__gated_clk_cell_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 46:36]
  assign l0_btb_create_clk__gated_clk_cell_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 50:43]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_in = forever_cpuclk; // @[ct_ifu_l0_btb.scala 45:57]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_global_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 47:36]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_module_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 49:36]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_local_en = l0_btb_entry_inv_temp | ifctrl_l0_btb_inv; // @[ct_ifu_l0_btb.scala 243:51]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 46:36]
  assign l0_btb_inv_reg_upd_clk__gated_clk_cell_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 50:43]
  assign ct_ifu_l0_btb_entry_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[0] |
    _l0_btb_update_entry_0_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit : _GEN_7
    ; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_1_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_1_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_1_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_1_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_1_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_1_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_1_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[1] |
    _l0_btb_update_entry_1_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_1_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_1_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_1_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_1_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_1_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_1_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_1_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_2_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_2_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_2_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_2_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_2_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_2_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_2_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[2] |
    _l0_btb_update_entry_2_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_2_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_2_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_2_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_2_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_2_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_2_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_2_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_3_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_3_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_3_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_3_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_3_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_3_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_3_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[3] |
    _l0_btb_update_entry_3_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_3_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_3_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_3_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_3_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_3_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_3_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_3_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_4_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_4_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_4_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_4_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_4_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_4_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_4_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[4] |
    _l0_btb_update_entry_4_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_4_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_4_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_4_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_4_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_4_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_4_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_4_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_5_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_5_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_5_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_5_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_5_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_5_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_5_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[5] |
    _l0_btb_update_entry_5_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_5_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_5_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_5_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_5_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_5_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_5_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_5_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_6_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_6_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_6_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_6_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_6_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_6_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_6_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[6] |
    _l0_btb_update_entry_6_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_6_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_6_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_6_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_6_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_6_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_6_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_6_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_7_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_7_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_7_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_7_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_7_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_7_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_7_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[7] |
    _l0_btb_update_entry_7_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_7_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_7_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_7_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_7_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_7_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_7_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_7_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_8_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_8_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_8_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_8_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_8_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_8_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_8_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[8] |
    _l0_btb_update_entry_8_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_8_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_8_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_8_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_8_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_8_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_8_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_8_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_9_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_9_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_9_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_9_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_9_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_9_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_9_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[9] |
    _l0_btb_update_entry_9_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_9_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_9_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_9_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_9_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_9_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_9_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_9_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_10_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_10_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_10_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_10_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_10_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_10_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_10_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[10] |
    _l0_btb_update_entry_10_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_10_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_10_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_10_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_10_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_10_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_10_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_10_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_11_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_11_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_11_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_11_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_11_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_11_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_11_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[11] |
    _l0_btb_update_entry_11_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_11_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_11_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_11_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_11_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_11_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_11_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_11_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_12_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_12_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_12_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_12_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_12_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_12_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_12_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[12] |
    _l0_btb_update_entry_12_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_12_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_12_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_12_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_12_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_12_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_12_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_12_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_13_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_13_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_13_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_13_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_13_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_13_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_13_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[13] |
    _l0_btb_update_entry_13_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_13_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_13_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_13_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_13_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_13_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_13_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_13_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_14_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_14_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_14_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_14_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_14_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_14_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_14_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[14] |
    _l0_btb_update_entry_14_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_14_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_14_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_14_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_14_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_14_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_14_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_14_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  assign ct_ifu_l0_btb_entry_15_cp0_ifu_btb_en = cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 262:36]
  assign ct_ifu_l0_btb_entry_15_cp0_ifu_icg_en = cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 263:36]
  assign ct_ifu_l0_btb_entry_15_cp0_ifu_l0btb_en = cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 264:38]
  assign ct_ifu_l0_btb_entry_15_cp0_yy_clk_en = cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 265:35]
  assign ct_ifu_l0_btb_entry_15_cpurst_b = cpurst_b; // @[ct_ifu_l0_btb.scala 266:31]
  assign ct_ifu_l0_btb_entry_15_entry_inv = l0_btb_entry_inv_temp; // @[ct_ifu_l0_btb.scala 242:30 247:22]
  assign ct_ifu_l0_btb_entry_15_entry_update = addrgen_l0_btb_update_vld & addrgen_l0_btb_update_entry[15] |
    _l0_btb_update_entry_15_T_1; // @[ct_ifu_l0_btb.scala 207:108]
  assign ct_ifu_l0_btb_entry_15_entry_update_cnt = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_8; // @[ct_ifu_l0_btb.scala 217:45 221:28]
  assign ct_ifu_l0_btb_entry_15_entry_update_data = addrgen_l0_btb_update_vld ? 37'h0 : _GEN_10; // @[ct_ifu_l0_btb.scala 217:45 223:28]
  assign ct_ifu_l0_btb_entry_15_entry_update_ras = addrgen_l0_btb_update_vld ? 1'h0 : _GEN_9; // @[ct_ifu_l0_btb.scala 217:45 222:28]
  assign ct_ifu_l0_btb_entry_15_entry_update_vld = addrgen_l0_btb_update_vld ? addrgen_l0_btb_update_vld_bit :
    _GEN_7; // @[ct_ifu_l0_btb.scala 217:45 220:28]
  assign ct_ifu_l0_btb_entry_15_entry_wen = addrgen_l0_btb_update_vld ? addrgen_l0_btb_wen : _GEN_6; // @[ct_ifu_l0_btb.scala 217:45 219:17]
  assign ct_ifu_l0_btb_entry_15_forever_cpuclk = forever_cpuclk; // @[ct_ifu_l0_btb.scala 284:57]
  assign ct_ifu_l0_btb_entry_15_pad_yy_icg_scan_en = pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 285:40]
  always @(posedge forever_cpuclk or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 61:59]
      l0_btb_rd_flop_temp <= 1'h0;
    end else begin
      l0_btb_rd_flop_temp <= _l0_btb_rd_T_2 & _l0_btb_rd_T_4;
    end
  end
  always @(posedge forever_cpuclk or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 101:20]
      entry_hit_flop_temp <= 16'h0; // @[ct_ifu_l0_btb.scala 102:29]
    end else if (l0_btb_rd) begin // @[ct_ifu_l0_btb.scala 103:64]
      entry_hit_flop_temp <= _entry_hit_flop_temp_T; // @[ct_ifu_l0_btb.scala 104:29]
    end else if (l0_btb_rd_flop_temp & _l0_btb_rd_T_3) begin // @[ct_ifu_l0_btb.scala 106:29]
      entry_hit_flop_temp <= _entry_hit_flop_temp_T;
    end
  end
  always @(posedge l0_btb_pipe_clk__gated_clk_cell_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 122:45]
      ras_pc_temp <= 39'h0; // @[Mux.scala 101:{16,16}]
    end else if (l0_btb_rd | l0_btb_rd_flop_temp) begin // @[ct_ifu_l0_btb.scala 125:19]
      if (ras_l0_btb_ras_push) begin
        ras_pc_temp <= ras_l0_btb_push_pc;
      end else if (ipdp_l0_btb_ras_push) begin
        ras_pc_temp <= ipdp_l0_btb_ras_pc;
      end else begin
        ras_pc_temp <= ras_l0_btb_pc;
      end
    end
  end
  always @(posedge l0_btb_clk__gated_clk_cell_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 171:34]
      l0_btb_cur_state_temp <= 2'h1; // @[ct_ifu_l0_btb.scala 172:29]
    end else if (l0_btb_cur_state_temp == 2'h1) begin // @[ct_ifu_l0_btb.scala 173:40]
      if (pcgen_l0_btb_chgflw_vld) begin // @[Mux.scala 101:16]
        l0_btb_cur_state_temp <= 2'h2;
      end else begin
        l0_btb_cur_state_temp <= 2'h1; // @[Mux.scala 101:16]
      end
    end else if (l0_btb_cur_state_temp == 2'h2) begin // @[ct_ifu_l0_btb.scala 177:23]
      if (pcgen_l0_btb_chgflw_mask) begin
        l0_btb_cur_state_temp <= 2'h1;
      end else if (ipctrl_l0_btb_chgflw_vld) begin
        l0_btb_cur_state_temp <= 2'h2;
      end else begin
        l0_btb_cur_state_temp <= _l0_btb_next_state_T_3;
      end
    end else begin
      l0_btb_cur_state_temp <= 2'h1;
    end
  end
  always @(posedge l0_btb_create_clk__gated_clk_cell_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 192:25]
      entry_fifo_temp <= 16'h1; // @[ct_ifu_l0_btb.scala 193:21]
    end else if (l0_btb_create_en) begin // @[ct_ifu_l0_btb.scala 195:21]
      entry_fifo_temp <= _entry_fifo_temp_T_2;
    end
  end
  always @(posedge l0_btb_inv_reg_upd_clk__gated_clk_cell_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[ct_ifu_l0_btb.scala 248:39]
      l0_btb_entry_inv_temp <= 1'h0; // @[ct_ifu_l0_btb.scala 249:29]
    end else if (l0_btb_entry_inv_temp) begin
      l0_btb_entry_inv_temp <= 1'h0;
    end else begin
      l0_btb_entry_inv_temp <= _GEN_16;
    end
  end

`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  l0_btb_rd_flop_temp = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entry_hit_flop_temp = _RAND_1[15:0];
  _RAND_2 = {2{`RANDOM}};
  ras_pc_temp = _RAND_2[38:0];
  _RAND_3 = {1{`RANDOM}};
  l0_btb_cur_state_temp = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  entry_fifo_temp = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  l0_btb_entry_inv_temp = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_2) begin
    l0_btb_rd_flop_temp = 1'h0;
  end
  if (_T_2) begin
    entry_hit_flop_temp = 16'h0;
  end
  if (_T_2) begin
    ras_pc_temp = 39'h0;
  end
  if (_T_2) begin
    l0_btb_cur_state_temp = 2'h1;
  end
  if (_T_2) begin
    entry_fifo_temp = 16'h1;
  end
  if (_T_2) begin
    l0_btb_entry_inv_temp = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
