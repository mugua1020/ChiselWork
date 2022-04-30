module ct_ifu_l0_btb_entry(
  input         io_cp0_ifu_btb_en,
  input         io_cp0_ifu_icg_en,
  input         io_cp0_ifu_l0btb_en,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_entry_update,
  input         io_entry_update_cnt,
  input  [36:0] io_entry_update_data,
  input         io_entry_update_ras,
  input         io_entry_update_vld,
  input  [3:0]  io_entry_wen,
  input         io_forever_cpuclk,
  input         io_pad_yy_icg_scan_en,
  output        io_entry_cnt,
  output        io_entry_ras,
  output [14:0] io_entry_tag,
  output [19:0] io_entry_target,
  output        io_entry_vld,
  output [1:0]  io_entry_way_pred
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  gatedclk_clk_in; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_global_en; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_module_en; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_local_en; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_external_en; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  gatedclk_clk_out; // @[ct_ifu_l0_btb_entry.scala 35:24]
  wire  entry_clk_en = io_entry_update & io_cp0_ifu_btb_en & io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb_entry.scala 37:61]
  wire  _T_1 = ~io_cpurst_b; // @[ct_ifu_l0_btb_entry.scala 46:47]
  reg [36:0] entry_signal; // @[ct_ifu_l0_btb_entry.scala 71:33]
  reg  entry_signal_1; // @[ct_ifu_l0_btb_entry.scala 71:33]
  reg  entry_signal_2; // @[ct_ifu_l0_btb_entry.scala 71:33]
  reg  entry_signal_3; // @[ct_ifu_l0_btb_entry.scala 71:33]
  gated_clk_cell gatedclk ( // @[ct_ifu_l0_btb_entry.scala 35:24]
    .clk_in(gatedclk_clk_in),
    .global_en(gatedclk_global_en),
    .module_en(gatedclk_module_en),
    .local_en(gatedclk_local_en),
    .external_en(gatedclk_external_en),
    .pad_yy_icg_scan_en(gatedclk_pad_yy_icg_scan_en),
    .clk_out(gatedclk_clk_out)
  );
  assign io_entry_cnt = entry_signal_2; // @[ct_ifu_l0_btb_entry.scala 75:9]
  assign io_entry_ras = entry_signal_1; // @[ct_ifu_l0_btb_entry.scala 75:9]
  assign io_entry_tag = entry_signal[36:22]; // @[ct_ifu_l0_btb_entry.scala 49:36]
  assign io_entry_target = entry_signal[19:0]; // @[ct_ifu_l0_btb_entry.scala 51:36]
  assign io_entry_vld = entry_signal_3; // @[ct_ifu_l0_btb_entry.scala 75:9]
  assign io_entry_way_pred = entry_signal[21:20]; // @[ct_ifu_l0_btb_entry.scala 50:36]
  assign gatedclk_clk_in = io_forever_cpuclk; // @[ct_ifu_l0_btb_entry.scala 39:27]
  assign gatedclk_global_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb_entry.scala 41:27]
  assign gatedclk_module_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb_entry.scala 43:27]
  assign gatedclk_local_en = io_entry_update & io_cp0_ifu_btb_en & io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb_entry.scala 37:61]
  assign gatedclk_external_en = 1'h0; // @[ct_ifu_l0_btb_entry.scala 40:27]
  assign gatedclk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb_entry.scala 44:34]
  always @(posedge gatedclk_clk_out or posedge _T_1) begin
    if (_T_1) begin // @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal <= 37'h0; // @[ct_ifu_l0_btb_entry.scala 73:22]
    end else if (entry_clk_en & io_entry_wen[0]) begin // @[ct_ifu_l0_btb_entry.scala 71:33]
      entry_signal <= io_entry_update_data;
    end
  end
  always @(posedge gatedclk_clk_out or posedge _T_1) begin
    if (_T_1) begin // @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_1 <= 1'h0; // @[ct_ifu_l0_btb_entry.scala 73:22]
    end else if (entry_clk_en & io_entry_wen[1]) begin // @[ct_ifu_l0_btb_entry.scala 71:33]
      entry_signal_1 <= io_entry_update_ras;
    end
  end
  always @(posedge gatedclk_clk_out or posedge _T_1) begin
    if (_T_1) begin // @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_2 <= 1'h0; // @[ct_ifu_l0_btb_entry.scala 73:22]
    end else if (entry_clk_en & io_entry_wen[2]) begin // @[ct_ifu_l0_btb_entry.scala 71:33]
      entry_signal_2 <= io_entry_update_cnt;
    end
  end
  always @(posedge gatedclk_clk_out or posedge _T_1) begin
    if (_T_1) begin // @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_3 <= 1'h0; // @[ct_ifu_l0_btb_entry.scala 73:22]
    end else if (entry_clk_en & io_entry_wen[3]) begin // @[ct_ifu_l0_btb_entry.scala 71:33]
      entry_signal_3 <= io_entry_update_vld;
    end
  end
// Register and memory initialization
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
  _RAND_0 = {2{`RANDOM}};
  entry_signal = _RAND_0[36:0];
  _RAND_1 = {1{`RANDOM}};
  entry_signal_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entry_signal_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entry_signal_3 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_1) begin
    entry_signal = 37'h0;
  end
  if (_T_1) begin
    entry_signal_1 = 1'h0;
  end
  if (_T_1) begin
    entry_signal_2 = 1'h0;
  end
  if (_T_1) begin
    entry_signal_3 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ct_ifu_l0_btb(
  input         clock,
  input         reset,
  input  [15:0] io_addrgen_l0_btb_update_entry,
  input         io_addrgen_l0_btb_update_vld,
  input         io_addrgen_l0_btb_update_vld_bit,
  input  [3:0]  io_addrgen_l0_btb_wen,
  input         io_cp0_ifu_btb_en,
  input         io_cp0_ifu_icg_en,
  input         io_cp0_ifu_l0btb_en,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_forever_cpuclk,
  input         io_ibdp_l0_btb_fifo_update_vld,
  input         io_ibdp_l0_btb_update_cnt_bit,
  input  [36:0] io_ibdp_l0_btb_update_data,
  input  [15:0] io_ibdp_l0_btb_update_entry,
  input         io_ibdp_l0_btb_update_ras_bit,
  input         io_ibdp_l0_btb_update_vld,
  input         io_ibdp_l0_btb_update_vld_bit,
  input  [3:0]  io_ibdp_l0_btb_wen,
  input         io_ifctrl_l0_btb_inv,
  input         io_ifctrl_l0_btb_stall,
  input         io_ipctrl_l0_btb_chgflw_vld,
  input         io_ipctrl_l0_btb_ip_vld,
  input         io_ipctrl_l0_btb_wait_next,
  input  [38:0] io_ipdp_l0_btb_ras_pc,
  input         io_ipdp_l0_btb_ras_push,
  input         io_l0_btb_update_vld_for_gateclk,
  input         io_pad_yy_icg_scan_en,
  input         io_pcgen_l0_btb_chgflw_mask,
  input  [14:0] io_pcgen_l0_btb_chgflw_pc,
  input         io_pcgen_l0_btb_chgflw_vld,
  input  [38:0] io_pcgen_l0_btb_if_pc,
  input  [38:0] io_ras_l0_btb_pc,
  input  [38:0] io_ras_l0_btb_push_pc,
  input         io_ras_l0_btb_ras_push,
  output [1:0]  io_l0_btb_debug_cur_state,
  output [15:0] io_l0_btb_ibdp_entry_fifo,
  output [38:0] io_l0_btb_ifctrl_chgflw_pc,
  output [1:0]  io_l0_btb_ifctrl_chgflw_way_pred,
  output        io_l0_btb_ifctrl_chglfw_vld,
  output [38:0] io_l0_btb_ifdp_chgflw_pc,
  output [1:0]  io_l0_btb_ifdp_chgflw_way_pred,
  output        io_l0_btb_ifdp_counter,
  output [15:0] io_l0_btb_ifdp_entry_hit,
  output        io_l0_btb_ifdp_hit,
  output        io_l0_btb_ifdp_ras,
  output        io_l0_btb_ipctrl_st_wait
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  x_l0_btb_pipe_clk_clk_in; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_global_en; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_module_en; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_local_en; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_external_en; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_pipe_clk_clk_out; // @[ct_ifu_l0_btb.scala 126:31]
  wire  x_l0_btb_clk_clk_in; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_global_en; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_module_en; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_local_en; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_external_en; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_clk_clk_out; // @[ct_ifu_l0_btb.scala 190:28]
  wire  x_l0_btb_create_clk_clk_in; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_global_en; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_module_en; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_local_en; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_external_en; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_create_clk_clk_out; // @[ct_ifu_l0_btb.scala 219:35]
  wire  x_l0_btb_inv_reg_upd_clk_clk_in; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_global_en; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_module_en; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_local_en; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_external_en; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 284:40]
  wire  x_l0_btb_inv_reg_upd_clk_clk_out; // @[ct_ifu_l0_btb.scala 284:40]
  wire  ct_ifu_l0_btb_entry_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_1_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_1_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_1_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_1_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_1_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_1_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_2_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_2_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_2_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_2_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_2_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_2_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_3_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_3_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_3_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_3_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_3_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_3_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_4_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_4_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_4_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_4_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_4_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_4_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_5_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_5_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_5_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_5_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_5_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_5_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_6_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_6_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_6_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_6_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_6_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_6_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_7_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_7_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_7_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_7_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_7_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_7_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_8_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_8_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_8_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_8_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_8_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_8_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_9_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_9_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_9_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_9_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_9_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_9_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_10_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_10_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_10_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_10_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_10_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_10_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_11_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_11_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_11_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_11_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_11_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_11_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_12_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_12_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_12_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_12_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_12_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_12_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_13_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_13_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_13_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_13_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_13_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_13_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_14_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_14_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_14_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_14_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_14_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_14_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_cpurst_b; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_update; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_update_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire [36:0] ct_ifu_l0_btb_entry_15_io_entry_update_data; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_update_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_update_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [3:0] ct_ifu_l0_btb_entry_15_io_entry_wen; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_cnt; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_ras; // @[ct_ifu_l0_btb.scala 310:43]
  wire [14:0] ct_ifu_l0_btb_entry_15_io_entry_tag; // @[ct_ifu_l0_btb.scala 310:43]
  wire [19:0] ct_ifu_l0_btb_entry_15_io_entry_target; // @[ct_ifu_l0_btb.scala 310:43]
  wire  ct_ifu_l0_btb_entry_15_io_entry_vld; // @[ct_ifu_l0_btb.scala 310:43]
  wire [1:0] ct_ifu_l0_btb_entry_15_io_entry_way_pred; // @[ct_ifu_l0_btb.scala 310:43]
  wire  _l0_btb_rd_T = io_cp0_ifu_btb_en & io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 72:45]
  wire  _l0_btb_rd_T_1 = ~io_pcgen_l0_btb_chgflw_mask; // @[ct_ifu_l0_btb.scala 74:31]
  wire  _l0_btb_rd_T_2 = _l0_btb_rd_T & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 73:51]
  wire  _l0_btb_rd_T_3 = ~io_ifctrl_l0_btb_stall; // @[ct_ifu_l0_btb.scala 76:34]
  wire  _l0_btb_rd_T_4 = io_pcgen_l0_btb_chgflw_vld | ~io_ifctrl_l0_btb_stall; // @[ct_ifu_l0_btb.scala 76:31]
  wire  l0_btb_rd = _l0_btb_rd_T_2 & _l0_btb_rd_T_4; // @[ct_ifu_l0_btb.scala 74:59]
  reg  l0_btb_rd_flop; // @[ct_ifu_l0_btb.scala 79:25]
  wire  _T_1 = ~io_cpurst_b; // @[ct_ifu_l0_btb.scala 80:46]
  reg  l0_btb_rd_flop_REG; // @[ct_ifu_l0_btb.scala 82:30]
  wire [14:0] entry_tag_0 = ct_ifu_l0_btb_entry_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_0 = ct_ifu_l0_btb_entry_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_0_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_0 & entry_vld_0; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_0 = _entry_rd_hit_0_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_1 = ct_ifu_l0_btb_entry_1_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_1 = ct_ifu_l0_btb_entry_1_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_1_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_1 & entry_vld_1; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_1 = _entry_rd_hit_1_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_2 = ct_ifu_l0_btb_entry_2_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_2 = ct_ifu_l0_btb_entry_2_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_2_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_2 & entry_vld_2; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_2 = _entry_rd_hit_2_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_3 = ct_ifu_l0_btb_entry_3_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_3 = ct_ifu_l0_btb_entry_3_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_3_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_3 & entry_vld_3; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_3 = _entry_rd_hit_3_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_4 = ct_ifu_l0_btb_entry_4_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_4 = ct_ifu_l0_btb_entry_4_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_4_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_4 & entry_vld_4; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_4 = _entry_rd_hit_4_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_5 = ct_ifu_l0_btb_entry_5_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_5 = ct_ifu_l0_btb_entry_5_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_5_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_5 & entry_vld_5; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_5 = _entry_rd_hit_5_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_6 = ct_ifu_l0_btb_entry_6_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_6 = ct_ifu_l0_btb_entry_6_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_6_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_6 & entry_vld_6; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_6 = _entry_rd_hit_6_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_7 = ct_ifu_l0_btb_entry_7_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_7 = ct_ifu_l0_btb_entry_7_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_7_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_7 & entry_vld_7; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_7 = _entry_rd_hit_7_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_8 = ct_ifu_l0_btb_entry_8_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_8 = ct_ifu_l0_btb_entry_8_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_8_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_8 & entry_vld_8; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_8 = _entry_rd_hit_8_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_9 = ct_ifu_l0_btb_entry_9_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_9 = ct_ifu_l0_btb_entry_9_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_9_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_9 & entry_vld_9; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_9 = _entry_rd_hit_9_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_10 = ct_ifu_l0_btb_entry_10_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_10 = ct_ifu_l0_btb_entry_10_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_10_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_10 & entry_vld_10; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_10 = _entry_rd_hit_10_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_11 = ct_ifu_l0_btb_entry_11_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_11 = ct_ifu_l0_btb_entry_11_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_11_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_11 & entry_vld_11; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_11 = _entry_rd_hit_11_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_12 = ct_ifu_l0_btb_entry_12_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_12 = ct_ifu_l0_btb_entry_12_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_12_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_12 & entry_vld_12; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_12 = _entry_rd_hit_12_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_13 = ct_ifu_l0_btb_entry_13_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_13 = ct_ifu_l0_btb_entry_13_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_13_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_13 & entry_vld_13; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_13 = _entry_rd_hit_13_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_14 = ct_ifu_l0_btb_entry_14_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_14 = ct_ifu_l0_btb_entry_14_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_14_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_14 & entry_vld_14; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_14 = _entry_rd_hit_14_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  wire [14:0] entry_tag_15 = ct_ifu_l0_btb_entry_15_io_entry_tag; // @[ct_ifu_l0_btb.scala 320:18 90:23]
  wire  entry_vld_15 = ct_ifu_l0_btb_entry_15_io_entry_vld; // @[ct_ifu_l0_btb.scala 333:18 91:25]
  wire  _entry_rd_hit_15_T_1 = io_pcgen_l0_btb_chgflw_pc == entry_tag_15 & entry_vld_15; // @[ct_ifu_l0_btb.scala 92:97]
  wire  entry_rd_hit_15 = _entry_rd_hit_15_T_1 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 93:56]
  reg [36:0] l0_btb_update_data; // @[ct_ifu_l0_btb.scala 98:29]
  reg  l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 99:32]
  wire  _bypass_rd_hit_T_3 = io_pcgen_l0_btb_chgflw_pc == l0_btb_update_data[36:22] & l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 100:67]
  wire  bypass_rd_hit = _bypass_rd_hit_T_3 & _l0_btb_rd_T_1; // @[ct_ifu_l0_btb.scala 101:32]
  wire  entry_bypass_hit_0 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[0]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_1 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[1]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_2 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[2]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_3 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[3]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_4 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[4]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_5 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[5]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_6 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[6]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_7 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[7]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_8 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[8]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_9 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[9]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_10 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[10]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_11 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[11]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_12 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[12]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_13 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[13]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_14 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[14]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_bypass_hit_15 = bypass_rd_hit & io_ibdp_l0_btb_update_entry[15]; // @[ct_ifu_l0_btb.scala 106:67]
  wire  entry_hit_0 = entry_bypass_hit_0 | entry_rd_hit_0; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_1 = entry_bypass_hit_1 | entry_rd_hit_1; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_2 = entry_bypass_hit_2 | entry_rd_hit_2; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_3 = entry_bypass_hit_3 | entry_rd_hit_3; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_4 = entry_bypass_hit_4 | entry_rd_hit_4; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_5 = entry_bypass_hit_5 | entry_rd_hit_5; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_6 = entry_bypass_hit_6 | entry_rd_hit_6; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_7 = entry_bypass_hit_7 | entry_rd_hit_7; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_8 = entry_bypass_hit_8 | entry_rd_hit_8; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_9 = entry_bypass_hit_9 | entry_rd_hit_9; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_10 = entry_bypass_hit_10 | entry_rd_hit_10; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_11 = entry_bypass_hit_11 | entry_rd_hit_11; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_12 = entry_bypass_hit_12 | entry_rd_hit_12; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_13 = entry_bypass_hit_13 | entry_rd_hit_13; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_14 = entry_bypass_hit_14 | entry_rd_hit_14; // @[ct_ifu_l0_btb.scala 110:81]
  wire  entry_hit_15 = entry_bypass_hit_15 | entry_rd_hit_15; // @[ct_ifu_l0_btb.scala 110:81]
  reg [15:0] entry_hit_flop; // @[ct_ifu_l0_btb.scala 114:27]
  wire [7:0] entry_hit_flop_lo = {entry_hit_7,entry_hit_6,entry_hit_5,entry_hit_4,entry_hit_3,entry_hit_2,entry_hit_1,
    entry_hit_0}; // @[ct_ifu_l0_btb.scala 118:37]
  wire [15:0] _entry_hit_flop_T = {entry_hit_15,entry_hit_14,entry_hit_13,entry_hit_12,entry_hit_11,entry_hit_10,
    entry_hit_9,entry_hit_8,entry_hit_flop_lo}; // @[ct_ifu_l0_btb.scala 118:37]
  reg [38:0] ras_pc; // @[ct_ifu_l0_btb.scala 141:18]
  wire  entry_cnt_1 = ct_ifu_l0_btb_entry_1_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_0 = ct_ifu_l0_btb_entry_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_3 = ct_ifu_l0_btb_entry_3_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_2 = ct_ifu_l0_btb_entry_2_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_5 = ct_ifu_l0_btb_entry_5_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_4 = ct_ifu_l0_btb_entry_4_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_7 = ct_ifu_l0_btb_entry_7_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_6 = ct_ifu_l0_btb_entry_6_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire [7:0] entry_hit_counter_lo = {entry_cnt_7,entry_cnt_6,entry_cnt_5,entry_cnt_4,entry_cnt_3,entry_cnt_2,entry_cnt_1
    ,entry_cnt_0}; // @[ct_ifu_l0_btb.scala 160:51]
  wire  entry_cnt_9 = ct_ifu_l0_btb_entry_9_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_8 = ct_ifu_l0_btb_entry_8_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_11 = ct_ifu_l0_btb_entry_11_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_10 = ct_ifu_l0_btb_entry_10_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_13 = ct_ifu_l0_btb_entry_13_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_12 = ct_ifu_l0_btb_entry_12_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_15 = ct_ifu_l0_btb_entry_15_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire  entry_cnt_14 = ct_ifu_l0_btb_entry_14_io_entry_cnt; // @[ct_ifu_l0_btb.scala 159:21 317:18]
  wire [15:0] _entry_hit_counter_T = {entry_cnt_15,entry_cnt_14,entry_cnt_13,entry_cnt_12,entry_cnt_11,entry_cnt_10,
    entry_cnt_9,entry_cnt_8,entry_hit_counter_lo}; // @[ct_ifu_l0_btb.scala 160:51]
  wire [15:0] _entry_hit_counter_T_1 = entry_hit_flop & _entry_hit_counter_T; // @[ct_ifu_l0_btb.scala 160:39]
  wire  entry_hit_counter = _entry_hit_counter_T_1[0] | _entry_hit_counter_T_1[1] | _entry_hit_counter_T_1[2] |
    _entry_hit_counter_T_1[3] | _entry_hit_counter_T_1[4] | _entry_hit_counter_T_1[5] | _entry_hit_counter_T_1[6] |
    _entry_hit_counter_T_1[7] | _entry_hit_counter_T_1[8] | _entry_hit_counter_T_1[9] | _entry_hit_counter_T_1[10] |
    _entry_hit_counter_T_1[11] | _entry_hit_counter_T_1[12] | _entry_hit_counter_T_1[13] | _entry_hit_counter_T_1[14] |
    _entry_hit_counter_T_1[15]; // @[ct_ifu_l0_btb.scala 160:75]
  wire  entry_ras_1 = ct_ifu_l0_btb_entry_1_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_0 = ct_ifu_l0_btb_entry_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_3 = ct_ifu_l0_btb_entry_3_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_2 = ct_ifu_l0_btb_entry_2_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_5 = ct_ifu_l0_btb_entry_5_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_4 = ct_ifu_l0_btb_entry_4_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_7 = ct_ifu_l0_btb_entry_7_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_6 = ct_ifu_l0_btb_entry_6_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire [7:0] entry_hit_ras_lo = {entry_ras_7,entry_ras_6,entry_ras_5,entry_ras_4,entry_ras_3,entry_ras_2,entry_ras_1,
    entry_ras_0}; // @[ct_ifu_l0_btb.scala 163:46]
  wire  entry_ras_9 = ct_ifu_l0_btb_entry_9_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_8 = ct_ifu_l0_btb_entry_8_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_11 = ct_ifu_l0_btb_entry_11_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_10 = ct_ifu_l0_btb_entry_10_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_13 = ct_ifu_l0_btb_entry_13_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_12 = ct_ifu_l0_btb_entry_12_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_15 = ct_ifu_l0_btb_entry_15_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire  entry_ras_14 = ct_ifu_l0_btb_entry_14_io_entry_ras; // @[ct_ifu_l0_btb.scala 162:21 319:20]
  wire [15:0] _entry_hit_ras_T = {entry_ras_15,entry_ras_14,entry_ras_13,entry_ras_12,entry_ras_11,entry_ras_10,
    entry_ras_9,entry_ras_8,entry_hit_ras_lo}; // @[ct_ifu_l0_btb.scala 163:46]
  wire [15:0] _entry_hit_ras_T_1 = entry_hit_flop & _entry_hit_ras_T; // @[ct_ifu_l0_btb.scala 163:34]
  wire  entry_hit_ras = _entry_hit_ras_T_1[0] | _entry_hit_ras_T_1[1] | _entry_hit_ras_T_1[2] | _entry_hit_ras_T_1[3] |
    _entry_hit_ras_T_1[4] | _entry_hit_ras_T_1[5] | _entry_hit_ras_T_1[6] | _entry_hit_ras_T_1[7] | _entry_hit_ras_T_1[8
    ] | _entry_hit_ras_T_1[9] | _entry_hit_ras_T_1[10] | _entry_hit_ras_T_1[11] | _entry_hit_ras_T_1[12] |
    _entry_hit_ras_T_1[13] | _entry_hit_ras_T_1[14] | _entry_hit_ras_T_1[15]; // @[ct_ifu_l0_btb.scala 163:70]
  wire  entry_way_pred_1_1 = ct_ifu_l0_btb_entry_1_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_0 = ct_ifu_l0_btb_entry_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_3 = ct_ifu_l0_btb_entry_3_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_2 = ct_ifu_l0_btb_entry_2_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_5 = ct_ifu_l0_btb_entry_5_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_4 = ct_ifu_l0_btb_entry_4_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_7 = ct_ifu_l0_btb_entry_7_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_6 = ct_ifu_l0_btb_entry_6_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire [7:0] entry_hit_way_pred_1_lo = {entry_way_pred_1_7,entry_way_pred_1_6,entry_way_pred_1_5,entry_way_pred_1_4,
    entry_way_pred_1_3,entry_way_pred_1_2,entry_way_pred_1_1,entry_way_pred_1_0}; // @[ct_ifu_l0_btb.scala 168:60]
  wire  entry_way_pred_1_9 = ct_ifu_l0_btb_entry_9_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_8 = ct_ifu_l0_btb_entry_8_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_11 = ct_ifu_l0_btb_entry_11_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_10 = ct_ifu_l0_btb_entry_10_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_13 = ct_ifu_l0_btb_entry_13_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_12 = ct_ifu_l0_btb_entry_12_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_15 = ct_ifu_l0_btb_entry_15_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire  entry_way_pred_1_14 = ct_ifu_l0_btb_entry_14_io_entry_way_pred[0]; // @[ct_ifu_l0_btb.scala 334:56]
  wire [15:0] _entry_hit_way_pred_1_T = {entry_way_pred_1_15,entry_way_pred_1_14,entry_way_pred_1_13,entry_way_pred_1_12
    ,entry_way_pred_1_11,entry_way_pred_1_10,entry_way_pred_1_9,entry_way_pred_1_8,entry_hit_way_pred_1_lo}; // @[ct_ifu_l0_btb.scala 168:60]
  wire [15:0] _entry_hit_way_pred_1_T_1 = entry_hit_flop & _entry_hit_way_pred_1_T; // @[ct_ifu_l0_btb.scala 168:41]
  wire  entry_hit_way_pred_1 = _entry_hit_way_pred_1_T_1[0] | _entry_hit_way_pred_1_T_1[1] | _entry_hit_way_pred_1_T_1[2
    ] | _entry_hit_way_pred_1_T_1[3] | _entry_hit_way_pred_1_T_1[4] | _entry_hit_way_pred_1_T_1[5] |
    _entry_hit_way_pred_1_T_1[6] | _entry_hit_way_pred_1_T_1[7] | _entry_hit_way_pred_1_T_1[8] |
    _entry_hit_way_pred_1_T_1[9] | _entry_hit_way_pred_1_T_1[10] | _entry_hit_way_pred_1_T_1[11] |
    _entry_hit_way_pred_1_T_1[12] | _entry_hit_way_pred_1_T_1[13] | _entry_hit_way_pred_1_T_1[14] |
    _entry_hit_way_pred_1_T_1[15]; // @[ct_ifu_l0_btb.scala 168:84]
  wire  entry_way_pred_2_1 = ct_ifu_l0_btb_entry_1_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_0 = ct_ifu_l0_btb_entry_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_3 = ct_ifu_l0_btb_entry_3_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_2 = ct_ifu_l0_btb_entry_2_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_5 = ct_ifu_l0_btb_entry_5_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_4 = ct_ifu_l0_btb_entry_4_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_7 = ct_ifu_l0_btb_entry_7_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_6 = ct_ifu_l0_btb_entry_6_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire [7:0] entry_hit_way_pred_2_lo = {entry_way_pred_2_7,entry_way_pred_2_6,entry_way_pred_2_5,entry_way_pred_2_4,
    entry_way_pred_2_3,entry_way_pred_2_2,entry_way_pred_2_1,entry_way_pred_2_0}; // @[ct_ifu_l0_btb.scala 169:62]
  wire  entry_way_pred_2_9 = ct_ifu_l0_btb_entry_9_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_8 = ct_ifu_l0_btb_entry_8_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_11 = ct_ifu_l0_btb_entry_11_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_10 = ct_ifu_l0_btb_entry_10_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_13 = ct_ifu_l0_btb_entry_13_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_12 = ct_ifu_l0_btb_entry_12_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_15 = ct_ifu_l0_btb_entry_15_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire  entry_way_pred_2_14 = ct_ifu_l0_btb_entry_14_io_entry_way_pred[1]; // @[ct_ifu_l0_btb.scala 335:56]
  wire [15:0] _entry_hit_way_pred_2_T = {entry_way_pred_2_15,entry_way_pred_2_14,entry_way_pred_2_13,entry_way_pred_2_12
    ,entry_way_pred_2_11,entry_way_pred_2_10,entry_way_pred_2_9,entry_way_pred_2_8,entry_hit_way_pred_2_lo}; // @[ct_ifu_l0_btb.scala 169:62]
  wire [15:0] _entry_hit_way_pred_2_T_1 = entry_hit_flop & _entry_hit_way_pred_2_T; // @[ct_ifu_l0_btb.scala 169:43]
  wire  entry_hit_way_pred_2 = _entry_hit_way_pred_2_T_1[0] | _entry_hit_way_pred_2_T_1[1] | _entry_hit_way_pred_2_T_1[2
    ] | _entry_hit_way_pred_2_T_1[3] | _entry_hit_way_pred_2_T_1[4] | _entry_hit_way_pred_2_T_1[5] |
    _entry_hit_way_pred_2_T_1[6] | _entry_hit_way_pred_2_T_1[7] | _entry_hit_way_pred_2_T_1[8] |
    _entry_hit_way_pred_2_T_1[9] | _entry_hit_way_pred_2_T_1[10] | _entry_hit_way_pred_2_T_1[11] |
    _entry_hit_way_pred_2_T_1[12] | _entry_hit_way_pred_2_T_1[13] | _entry_hit_way_pred_2_T_1[14] |
    _entry_hit_way_pred_2_T_1[15]; // @[ct_ifu_l0_btb.scala 169:86]
  wire  entry_targets_0_1 = ct_ifu_l0_btb_entry_1_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_0 = ct_ifu_l0_btb_entry_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_3 = ct_ifu_l0_btb_entry_3_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_2 = ct_ifu_l0_btb_entry_2_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_5 = ct_ifu_l0_btb_entry_5_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_4 = ct_ifu_l0_btb_entry_4_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_7 = ct_ifu_l0_btb_entry_7_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_6 = ct_ifu_l0_btb_entry_6_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_0_lo = {entry_targets_0_7,entry_targets_0_6,entry_targets_0_5,entry_targets_0_4,
    entry_targets_0_3,entry_targets_0_2,entry_targets_0_1,entry_targets_0_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_0_9 = ct_ifu_l0_btb_entry_9_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_8 = ct_ifu_l0_btb_entry_8_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_11 = ct_ifu_l0_btb_entry_11_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_10 = ct_ifu_l0_btb_entry_10_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_13 = ct_ifu_l0_btb_entry_13_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_12 = ct_ifu_l0_btb_entry_12_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_15 = ct_ifu_l0_btb_entry_15_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_0_14 = ct_ifu_l0_btb_entry_14_io_entry_target[0]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_0_T = {entry_targets_0_15,entry_targets_0_14,entry_targets_0_13,entry_targets_0_12,
    entry_targets_0_11,entry_targets_0_10,entry_targets_0_9,entry_targets_0_8,entry_hit_pcs_0_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_0_T_1 = entry_hit_flop & _entry_hit_pcs_0_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_0 = _entry_hit_pcs_0_T_1[0] | _entry_hit_pcs_0_T_1[1] | _entry_hit_pcs_0_T_1[2] |
    _entry_hit_pcs_0_T_1[3] | _entry_hit_pcs_0_T_1[4] | _entry_hit_pcs_0_T_1[5] | _entry_hit_pcs_0_T_1[6] |
    _entry_hit_pcs_0_T_1[7] | _entry_hit_pcs_0_T_1[8] | _entry_hit_pcs_0_T_1[9] | _entry_hit_pcs_0_T_1[10] |
    _entry_hit_pcs_0_T_1[11] | _entry_hit_pcs_0_T_1[12] | _entry_hit_pcs_0_T_1[13] | _entry_hit_pcs_0_T_1[14] |
    _entry_hit_pcs_0_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_1_1 = ct_ifu_l0_btb_entry_1_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_0 = ct_ifu_l0_btb_entry_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_3 = ct_ifu_l0_btb_entry_3_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_2 = ct_ifu_l0_btb_entry_2_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_5 = ct_ifu_l0_btb_entry_5_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_4 = ct_ifu_l0_btb_entry_4_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_7 = ct_ifu_l0_btb_entry_7_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_6 = ct_ifu_l0_btb_entry_6_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_1_lo = {entry_targets_1_7,entry_targets_1_6,entry_targets_1_5,entry_targets_1_4,
    entry_targets_1_3,entry_targets_1_2,entry_targets_1_1,entry_targets_1_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_1_9 = ct_ifu_l0_btb_entry_9_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_8 = ct_ifu_l0_btb_entry_8_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_11 = ct_ifu_l0_btb_entry_11_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_10 = ct_ifu_l0_btb_entry_10_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_13 = ct_ifu_l0_btb_entry_13_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_12 = ct_ifu_l0_btb_entry_12_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_15 = ct_ifu_l0_btb_entry_15_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_1_14 = ct_ifu_l0_btb_entry_14_io_entry_target[1]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_1_T = {entry_targets_1_15,entry_targets_1_14,entry_targets_1_13,entry_targets_1_12,
    entry_targets_1_11,entry_targets_1_10,entry_targets_1_9,entry_targets_1_8,entry_hit_pcs_1_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_1_T_1 = entry_hit_flop & _entry_hit_pcs_1_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_1 = _entry_hit_pcs_1_T_1[0] | _entry_hit_pcs_1_T_1[1] | _entry_hit_pcs_1_T_1[2] |
    _entry_hit_pcs_1_T_1[3] | _entry_hit_pcs_1_T_1[4] | _entry_hit_pcs_1_T_1[5] | _entry_hit_pcs_1_T_1[6] |
    _entry_hit_pcs_1_T_1[7] | _entry_hit_pcs_1_T_1[8] | _entry_hit_pcs_1_T_1[9] | _entry_hit_pcs_1_T_1[10] |
    _entry_hit_pcs_1_T_1[11] | _entry_hit_pcs_1_T_1[12] | _entry_hit_pcs_1_T_1[13] | _entry_hit_pcs_1_T_1[14] |
    _entry_hit_pcs_1_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_2_1 = ct_ifu_l0_btb_entry_1_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_0 = ct_ifu_l0_btb_entry_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_3 = ct_ifu_l0_btb_entry_3_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_2 = ct_ifu_l0_btb_entry_2_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_5 = ct_ifu_l0_btb_entry_5_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_4 = ct_ifu_l0_btb_entry_4_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_7 = ct_ifu_l0_btb_entry_7_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_6 = ct_ifu_l0_btb_entry_6_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_2_lo = {entry_targets_2_7,entry_targets_2_6,entry_targets_2_5,entry_targets_2_4,
    entry_targets_2_3,entry_targets_2_2,entry_targets_2_1,entry_targets_2_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_2_9 = ct_ifu_l0_btb_entry_9_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_8 = ct_ifu_l0_btb_entry_8_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_11 = ct_ifu_l0_btb_entry_11_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_10 = ct_ifu_l0_btb_entry_10_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_13 = ct_ifu_l0_btb_entry_13_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_12 = ct_ifu_l0_btb_entry_12_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_15 = ct_ifu_l0_btb_entry_15_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_2_14 = ct_ifu_l0_btb_entry_14_io_entry_target[2]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_2_T = {entry_targets_2_15,entry_targets_2_14,entry_targets_2_13,entry_targets_2_12,
    entry_targets_2_11,entry_targets_2_10,entry_targets_2_9,entry_targets_2_8,entry_hit_pcs_2_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_2_T_1 = entry_hit_flop & _entry_hit_pcs_2_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_2 = _entry_hit_pcs_2_T_1[0] | _entry_hit_pcs_2_T_1[1] | _entry_hit_pcs_2_T_1[2] |
    _entry_hit_pcs_2_T_1[3] | _entry_hit_pcs_2_T_1[4] | _entry_hit_pcs_2_T_1[5] | _entry_hit_pcs_2_T_1[6] |
    _entry_hit_pcs_2_T_1[7] | _entry_hit_pcs_2_T_1[8] | _entry_hit_pcs_2_T_1[9] | _entry_hit_pcs_2_T_1[10] |
    _entry_hit_pcs_2_T_1[11] | _entry_hit_pcs_2_T_1[12] | _entry_hit_pcs_2_T_1[13] | _entry_hit_pcs_2_T_1[14] |
    _entry_hit_pcs_2_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_3_1 = ct_ifu_l0_btb_entry_1_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_0 = ct_ifu_l0_btb_entry_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_3 = ct_ifu_l0_btb_entry_3_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_2 = ct_ifu_l0_btb_entry_2_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_5 = ct_ifu_l0_btb_entry_5_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_4 = ct_ifu_l0_btb_entry_4_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_7 = ct_ifu_l0_btb_entry_7_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_6 = ct_ifu_l0_btb_entry_6_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_3_lo = {entry_targets_3_7,entry_targets_3_6,entry_targets_3_5,entry_targets_3_4,
    entry_targets_3_3,entry_targets_3_2,entry_targets_3_1,entry_targets_3_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_3_9 = ct_ifu_l0_btb_entry_9_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_8 = ct_ifu_l0_btb_entry_8_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_11 = ct_ifu_l0_btb_entry_11_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_10 = ct_ifu_l0_btb_entry_10_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_13 = ct_ifu_l0_btb_entry_13_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_12 = ct_ifu_l0_btb_entry_12_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_15 = ct_ifu_l0_btb_entry_15_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_3_14 = ct_ifu_l0_btb_entry_14_io_entry_target[3]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_3_T = {entry_targets_3_15,entry_targets_3_14,entry_targets_3_13,entry_targets_3_12,
    entry_targets_3_11,entry_targets_3_10,entry_targets_3_9,entry_targets_3_8,entry_hit_pcs_3_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_3_T_1 = entry_hit_flop & _entry_hit_pcs_3_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_3 = _entry_hit_pcs_3_T_1[0] | _entry_hit_pcs_3_T_1[1] | _entry_hit_pcs_3_T_1[2] |
    _entry_hit_pcs_3_T_1[3] | _entry_hit_pcs_3_T_1[4] | _entry_hit_pcs_3_T_1[5] | _entry_hit_pcs_3_T_1[6] |
    _entry_hit_pcs_3_T_1[7] | _entry_hit_pcs_3_T_1[8] | _entry_hit_pcs_3_T_1[9] | _entry_hit_pcs_3_T_1[10] |
    _entry_hit_pcs_3_T_1[11] | _entry_hit_pcs_3_T_1[12] | _entry_hit_pcs_3_T_1[13] | _entry_hit_pcs_3_T_1[14] |
    _entry_hit_pcs_3_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_4_1 = ct_ifu_l0_btb_entry_1_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_0 = ct_ifu_l0_btb_entry_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_3 = ct_ifu_l0_btb_entry_3_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_2 = ct_ifu_l0_btb_entry_2_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_5 = ct_ifu_l0_btb_entry_5_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_4 = ct_ifu_l0_btb_entry_4_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_7 = ct_ifu_l0_btb_entry_7_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_6 = ct_ifu_l0_btb_entry_6_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_4_lo = {entry_targets_4_7,entry_targets_4_6,entry_targets_4_5,entry_targets_4_4,
    entry_targets_4_3,entry_targets_4_2,entry_targets_4_1,entry_targets_4_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_4_9 = ct_ifu_l0_btb_entry_9_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_8 = ct_ifu_l0_btb_entry_8_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_11 = ct_ifu_l0_btb_entry_11_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_10 = ct_ifu_l0_btb_entry_10_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_13 = ct_ifu_l0_btb_entry_13_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_12 = ct_ifu_l0_btb_entry_12_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_15 = ct_ifu_l0_btb_entry_15_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_4_14 = ct_ifu_l0_btb_entry_14_io_entry_target[4]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_4_T = {entry_targets_4_15,entry_targets_4_14,entry_targets_4_13,entry_targets_4_12,
    entry_targets_4_11,entry_targets_4_10,entry_targets_4_9,entry_targets_4_8,entry_hit_pcs_4_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_4_T_1 = entry_hit_flop & _entry_hit_pcs_4_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_4 = _entry_hit_pcs_4_T_1[0] | _entry_hit_pcs_4_T_1[1] | _entry_hit_pcs_4_T_1[2] |
    _entry_hit_pcs_4_T_1[3] | _entry_hit_pcs_4_T_1[4] | _entry_hit_pcs_4_T_1[5] | _entry_hit_pcs_4_T_1[6] |
    _entry_hit_pcs_4_T_1[7] | _entry_hit_pcs_4_T_1[8] | _entry_hit_pcs_4_T_1[9] | _entry_hit_pcs_4_T_1[10] |
    _entry_hit_pcs_4_T_1[11] | _entry_hit_pcs_4_T_1[12] | _entry_hit_pcs_4_T_1[13] | _entry_hit_pcs_4_T_1[14] |
    _entry_hit_pcs_4_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_5_1 = ct_ifu_l0_btb_entry_1_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_0 = ct_ifu_l0_btb_entry_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_3 = ct_ifu_l0_btb_entry_3_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_2 = ct_ifu_l0_btb_entry_2_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_5 = ct_ifu_l0_btb_entry_5_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_4 = ct_ifu_l0_btb_entry_4_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_7 = ct_ifu_l0_btb_entry_7_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_6 = ct_ifu_l0_btb_entry_6_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_5_lo = {entry_targets_5_7,entry_targets_5_6,entry_targets_5_5,entry_targets_5_4,
    entry_targets_5_3,entry_targets_5_2,entry_targets_5_1,entry_targets_5_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_5_9 = ct_ifu_l0_btb_entry_9_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_8 = ct_ifu_l0_btb_entry_8_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_11 = ct_ifu_l0_btb_entry_11_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_10 = ct_ifu_l0_btb_entry_10_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_13 = ct_ifu_l0_btb_entry_13_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_12 = ct_ifu_l0_btb_entry_12_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_15 = ct_ifu_l0_btb_entry_15_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_5_14 = ct_ifu_l0_btb_entry_14_io_entry_target[5]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_5_T = {entry_targets_5_15,entry_targets_5_14,entry_targets_5_13,entry_targets_5_12,
    entry_targets_5_11,entry_targets_5_10,entry_targets_5_9,entry_targets_5_8,entry_hit_pcs_5_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_5_T_1 = entry_hit_flop & _entry_hit_pcs_5_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_5 = _entry_hit_pcs_5_T_1[0] | _entry_hit_pcs_5_T_1[1] | _entry_hit_pcs_5_T_1[2] |
    _entry_hit_pcs_5_T_1[3] | _entry_hit_pcs_5_T_1[4] | _entry_hit_pcs_5_T_1[5] | _entry_hit_pcs_5_T_1[6] |
    _entry_hit_pcs_5_T_1[7] | _entry_hit_pcs_5_T_1[8] | _entry_hit_pcs_5_T_1[9] | _entry_hit_pcs_5_T_1[10] |
    _entry_hit_pcs_5_T_1[11] | _entry_hit_pcs_5_T_1[12] | _entry_hit_pcs_5_T_1[13] | _entry_hit_pcs_5_T_1[14] |
    _entry_hit_pcs_5_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_6_1 = ct_ifu_l0_btb_entry_1_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_0 = ct_ifu_l0_btb_entry_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_3 = ct_ifu_l0_btb_entry_3_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_2 = ct_ifu_l0_btb_entry_2_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_5 = ct_ifu_l0_btb_entry_5_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_4 = ct_ifu_l0_btb_entry_4_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_7 = ct_ifu_l0_btb_entry_7_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_6 = ct_ifu_l0_btb_entry_6_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_6_lo = {entry_targets_6_7,entry_targets_6_6,entry_targets_6_5,entry_targets_6_4,
    entry_targets_6_3,entry_targets_6_2,entry_targets_6_1,entry_targets_6_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_6_9 = ct_ifu_l0_btb_entry_9_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_8 = ct_ifu_l0_btb_entry_8_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_11 = ct_ifu_l0_btb_entry_11_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_10 = ct_ifu_l0_btb_entry_10_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_13 = ct_ifu_l0_btb_entry_13_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_12 = ct_ifu_l0_btb_entry_12_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_15 = ct_ifu_l0_btb_entry_15_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_6_14 = ct_ifu_l0_btb_entry_14_io_entry_target[6]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_6_T = {entry_targets_6_15,entry_targets_6_14,entry_targets_6_13,entry_targets_6_12,
    entry_targets_6_11,entry_targets_6_10,entry_targets_6_9,entry_targets_6_8,entry_hit_pcs_6_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_6_T_1 = entry_hit_flop & _entry_hit_pcs_6_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_6 = _entry_hit_pcs_6_T_1[0] | _entry_hit_pcs_6_T_1[1] | _entry_hit_pcs_6_T_1[2] |
    _entry_hit_pcs_6_T_1[3] | _entry_hit_pcs_6_T_1[4] | _entry_hit_pcs_6_T_1[5] | _entry_hit_pcs_6_T_1[6] |
    _entry_hit_pcs_6_T_1[7] | _entry_hit_pcs_6_T_1[8] | _entry_hit_pcs_6_T_1[9] | _entry_hit_pcs_6_T_1[10] |
    _entry_hit_pcs_6_T_1[11] | _entry_hit_pcs_6_T_1[12] | _entry_hit_pcs_6_T_1[13] | _entry_hit_pcs_6_T_1[14] |
    _entry_hit_pcs_6_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_7_1 = ct_ifu_l0_btb_entry_1_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_0 = ct_ifu_l0_btb_entry_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_3 = ct_ifu_l0_btb_entry_3_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_2 = ct_ifu_l0_btb_entry_2_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_5 = ct_ifu_l0_btb_entry_5_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_4 = ct_ifu_l0_btb_entry_4_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_7 = ct_ifu_l0_btb_entry_7_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_6 = ct_ifu_l0_btb_entry_6_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_7_lo = {entry_targets_7_7,entry_targets_7_6,entry_targets_7_5,entry_targets_7_4,
    entry_targets_7_3,entry_targets_7_2,entry_targets_7_1,entry_targets_7_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_7_9 = ct_ifu_l0_btb_entry_9_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_8 = ct_ifu_l0_btb_entry_8_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_11 = ct_ifu_l0_btb_entry_11_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_10 = ct_ifu_l0_btb_entry_10_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_13 = ct_ifu_l0_btb_entry_13_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_12 = ct_ifu_l0_btb_entry_12_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_15 = ct_ifu_l0_btb_entry_15_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_7_14 = ct_ifu_l0_btb_entry_14_io_entry_target[7]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_7_T = {entry_targets_7_15,entry_targets_7_14,entry_targets_7_13,entry_targets_7_12,
    entry_targets_7_11,entry_targets_7_10,entry_targets_7_9,entry_targets_7_8,entry_hit_pcs_7_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_7_T_1 = entry_hit_flop & _entry_hit_pcs_7_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_7 = _entry_hit_pcs_7_T_1[0] | _entry_hit_pcs_7_T_1[1] | _entry_hit_pcs_7_T_1[2] |
    _entry_hit_pcs_7_T_1[3] | _entry_hit_pcs_7_T_1[4] | _entry_hit_pcs_7_T_1[5] | _entry_hit_pcs_7_T_1[6] |
    _entry_hit_pcs_7_T_1[7] | _entry_hit_pcs_7_T_1[8] | _entry_hit_pcs_7_T_1[9] | _entry_hit_pcs_7_T_1[10] |
    _entry_hit_pcs_7_T_1[11] | _entry_hit_pcs_7_T_1[12] | _entry_hit_pcs_7_T_1[13] | _entry_hit_pcs_7_T_1[14] |
    _entry_hit_pcs_7_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_8_1 = ct_ifu_l0_btb_entry_1_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_0 = ct_ifu_l0_btb_entry_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_3 = ct_ifu_l0_btb_entry_3_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_2 = ct_ifu_l0_btb_entry_2_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_5 = ct_ifu_l0_btb_entry_5_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_4 = ct_ifu_l0_btb_entry_4_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_7 = ct_ifu_l0_btb_entry_7_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_6 = ct_ifu_l0_btb_entry_6_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_8_lo = {entry_targets_8_7,entry_targets_8_6,entry_targets_8_5,entry_targets_8_4,
    entry_targets_8_3,entry_targets_8_2,entry_targets_8_1,entry_targets_8_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_8_9 = ct_ifu_l0_btb_entry_9_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_8 = ct_ifu_l0_btb_entry_8_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_11 = ct_ifu_l0_btb_entry_11_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_10 = ct_ifu_l0_btb_entry_10_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_13 = ct_ifu_l0_btb_entry_13_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_12 = ct_ifu_l0_btb_entry_12_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_15 = ct_ifu_l0_btb_entry_15_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_8_14 = ct_ifu_l0_btb_entry_14_io_entry_target[8]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_8_T = {entry_targets_8_15,entry_targets_8_14,entry_targets_8_13,entry_targets_8_12,
    entry_targets_8_11,entry_targets_8_10,entry_targets_8_9,entry_targets_8_8,entry_hit_pcs_8_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_8_T_1 = entry_hit_flop & _entry_hit_pcs_8_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_8 = _entry_hit_pcs_8_T_1[0] | _entry_hit_pcs_8_T_1[1] | _entry_hit_pcs_8_T_1[2] |
    _entry_hit_pcs_8_T_1[3] | _entry_hit_pcs_8_T_1[4] | _entry_hit_pcs_8_T_1[5] | _entry_hit_pcs_8_T_1[6] |
    _entry_hit_pcs_8_T_1[7] | _entry_hit_pcs_8_T_1[8] | _entry_hit_pcs_8_T_1[9] | _entry_hit_pcs_8_T_1[10] |
    _entry_hit_pcs_8_T_1[11] | _entry_hit_pcs_8_T_1[12] | _entry_hit_pcs_8_T_1[13] | _entry_hit_pcs_8_T_1[14] |
    _entry_hit_pcs_8_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_9_1 = ct_ifu_l0_btb_entry_1_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_0 = ct_ifu_l0_btb_entry_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_3 = ct_ifu_l0_btb_entry_3_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_2 = ct_ifu_l0_btb_entry_2_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_5 = ct_ifu_l0_btb_entry_5_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_4 = ct_ifu_l0_btb_entry_4_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_7 = ct_ifu_l0_btb_entry_7_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_6 = ct_ifu_l0_btb_entry_6_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_9_lo = {entry_targets_9_7,entry_targets_9_6,entry_targets_9_5,entry_targets_9_4,
    entry_targets_9_3,entry_targets_9_2,entry_targets_9_1,entry_targets_9_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_9_9 = ct_ifu_l0_btb_entry_9_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_8 = ct_ifu_l0_btb_entry_8_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_11 = ct_ifu_l0_btb_entry_11_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_10 = ct_ifu_l0_btb_entry_10_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_13 = ct_ifu_l0_btb_entry_13_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_12 = ct_ifu_l0_btb_entry_12_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_15 = ct_ifu_l0_btb_entry_15_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_9_14 = ct_ifu_l0_btb_entry_14_io_entry_target[9]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_9_T = {entry_targets_9_15,entry_targets_9_14,entry_targets_9_13,entry_targets_9_12,
    entry_targets_9_11,entry_targets_9_10,entry_targets_9_9,entry_targets_9_8,entry_hit_pcs_9_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_9_T_1 = entry_hit_flop & _entry_hit_pcs_9_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_9 = _entry_hit_pcs_9_T_1[0] | _entry_hit_pcs_9_T_1[1] | _entry_hit_pcs_9_T_1[2] |
    _entry_hit_pcs_9_T_1[3] | _entry_hit_pcs_9_T_1[4] | _entry_hit_pcs_9_T_1[5] | _entry_hit_pcs_9_T_1[6] |
    _entry_hit_pcs_9_T_1[7] | _entry_hit_pcs_9_T_1[8] | _entry_hit_pcs_9_T_1[9] | _entry_hit_pcs_9_T_1[10] |
    _entry_hit_pcs_9_T_1[11] | _entry_hit_pcs_9_T_1[12] | _entry_hit_pcs_9_T_1[13] | _entry_hit_pcs_9_T_1[14] |
    _entry_hit_pcs_9_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_10_1 = ct_ifu_l0_btb_entry_1_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_0 = ct_ifu_l0_btb_entry_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_3 = ct_ifu_l0_btb_entry_3_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_2 = ct_ifu_l0_btb_entry_2_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_5 = ct_ifu_l0_btb_entry_5_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_4 = ct_ifu_l0_btb_entry_4_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_7 = ct_ifu_l0_btb_entry_7_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_6 = ct_ifu_l0_btb_entry_6_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_10_lo = {entry_targets_10_7,entry_targets_10_6,entry_targets_10_5,entry_targets_10_4,
    entry_targets_10_3,entry_targets_10_2,entry_targets_10_1,entry_targets_10_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_10_9 = ct_ifu_l0_btb_entry_9_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_8 = ct_ifu_l0_btb_entry_8_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_11 = ct_ifu_l0_btb_entry_11_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_10 = ct_ifu_l0_btb_entry_10_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_13 = ct_ifu_l0_btb_entry_13_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_12 = ct_ifu_l0_btb_entry_12_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_15 = ct_ifu_l0_btb_entry_15_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_10_14 = ct_ifu_l0_btb_entry_14_io_entry_target[10]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_10_T = {entry_targets_10_15,entry_targets_10_14,entry_targets_10_13,entry_targets_10_12,
    entry_targets_10_11,entry_targets_10_10,entry_targets_10_9,entry_targets_10_8,entry_hit_pcs_10_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_10_T_1 = entry_hit_flop & _entry_hit_pcs_10_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_10 = _entry_hit_pcs_10_T_1[0] | _entry_hit_pcs_10_T_1[1] | _entry_hit_pcs_10_T_1[2] |
    _entry_hit_pcs_10_T_1[3] | _entry_hit_pcs_10_T_1[4] | _entry_hit_pcs_10_T_1[5] | _entry_hit_pcs_10_T_1[6] |
    _entry_hit_pcs_10_T_1[7] | _entry_hit_pcs_10_T_1[8] | _entry_hit_pcs_10_T_1[9] | _entry_hit_pcs_10_T_1[10] |
    _entry_hit_pcs_10_T_1[11] | _entry_hit_pcs_10_T_1[12] | _entry_hit_pcs_10_T_1[13] | _entry_hit_pcs_10_T_1[14] |
    _entry_hit_pcs_10_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_11_1 = ct_ifu_l0_btb_entry_1_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_0 = ct_ifu_l0_btb_entry_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_3 = ct_ifu_l0_btb_entry_3_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_2 = ct_ifu_l0_btb_entry_2_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_5 = ct_ifu_l0_btb_entry_5_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_4 = ct_ifu_l0_btb_entry_4_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_7 = ct_ifu_l0_btb_entry_7_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_6 = ct_ifu_l0_btb_entry_6_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_11_lo = {entry_targets_11_7,entry_targets_11_6,entry_targets_11_5,entry_targets_11_4,
    entry_targets_11_3,entry_targets_11_2,entry_targets_11_1,entry_targets_11_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_11_9 = ct_ifu_l0_btb_entry_9_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_8 = ct_ifu_l0_btb_entry_8_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_11 = ct_ifu_l0_btb_entry_11_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_10 = ct_ifu_l0_btb_entry_10_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_13 = ct_ifu_l0_btb_entry_13_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_12 = ct_ifu_l0_btb_entry_12_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_15 = ct_ifu_l0_btb_entry_15_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_11_14 = ct_ifu_l0_btb_entry_14_io_entry_target[11]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_11_T = {entry_targets_11_15,entry_targets_11_14,entry_targets_11_13,entry_targets_11_12,
    entry_targets_11_11,entry_targets_11_10,entry_targets_11_9,entry_targets_11_8,entry_hit_pcs_11_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_11_T_1 = entry_hit_flop & _entry_hit_pcs_11_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_11 = _entry_hit_pcs_11_T_1[0] | _entry_hit_pcs_11_T_1[1] | _entry_hit_pcs_11_T_1[2] |
    _entry_hit_pcs_11_T_1[3] | _entry_hit_pcs_11_T_1[4] | _entry_hit_pcs_11_T_1[5] | _entry_hit_pcs_11_T_1[6] |
    _entry_hit_pcs_11_T_1[7] | _entry_hit_pcs_11_T_1[8] | _entry_hit_pcs_11_T_1[9] | _entry_hit_pcs_11_T_1[10] |
    _entry_hit_pcs_11_T_1[11] | _entry_hit_pcs_11_T_1[12] | _entry_hit_pcs_11_T_1[13] | _entry_hit_pcs_11_T_1[14] |
    _entry_hit_pcs_11_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_12_1 = ct_ifu_l0_btb_entry_1_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_0 = ct_ifu_l0_btb_entry_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_3 = ct_ifu_l0_btb_entry_3_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_2 = ct_ifu_l0_btb_entry_2_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_5 = ct_ifu_l0_btb_entry_5_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_4 = ct_ifu_l0_btb_entry_4_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_7 = ct_ifu_l0_btb_entry_7_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_6 = ct_ifu_l0_btb_entry_6_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_12_lo = {entry_targets_12_7,entry_targets_12_6,entry_targets_12_5,entry_targets_12_4,
    entry_targets_12_3,entry_targets_12_2,entry_targets_12_1,entry_targets_12_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_12_9 = ct_ifu_l0_btb_entry_9_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_8 = ct_ifu_l0_btb_entry_8_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_11 = ct_ifu_l0_btb_entry_11_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_10 = ct_ifu_l0_btb_entry_10_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_13 = ct_ifu_l0_btb_entry_13_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_12 = ct_ifu_l0_btb_entry_12_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_15 = ct_ifu_l0_btb_entry_15_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_12_14 = ct_ifu_l0_btb_entry_14_io_entry_target[12]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_12_T = {entry_targets_12_15,entry_targets_12_14,entry_targets_12_13,entry_targets_12_12,
    entry_targets_12_11,entry_targets_12_10,entry_targets_12_9,entry_targets_12_8,entry_hit_pcs_12_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_12_T_1 = entry_hit_flop & _entry_hit_pcs_12_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_12 = _entry_hit_pcs_12_T_1[0] | _entry_hit_pcs_12_T_1[1] | _entry_hit_pcs_12_T_1[2] |
    _entry_hit_pcs_12_T_1[3] | _entry_hit_pcs_12_T_1[4] | _entry_hit_pcs_12_T_1[5] | _entry_hit_pcs_12_T_1[6] |
    _entry_hit_pcs_12_T_1[7] | _entry_hit_pcs_12_T_1[8] | _entry_hit_pcs_12_T_1[9] | _entry_hit_pcs_12_T_1[10] |
    _entry_hit_pcs_12_T_1[11] | _entry_hit_pcs_12_T_1[12] | _entry_hit_pcs_12_T_1[13] | _entry_hit_pcs_12_T_1[14] |
    _entry_hit_pcs_12_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_13_1 = ct_ifu_l0_btb_entry_1_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_0 = ct_ifu_l0_btb_entry_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_3 = ct_ifu_l0_btb_entry_3_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_2 = ct_ifu_l0_btb_entry_2_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_5 = ct_ifu_l0_btb_entry_5_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_4 = ct_ifu_l0_btb_entry_4_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_7 = ct_ifu_l0_btb_entry_7_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_6 = ct_ifu_l0_btb_entry_6_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_13_lo = {entry_targets_13_7,entry_targets_13_6,entry_targets_13_5,entry_targets_13_4,
    entry_targets_13_3,entry_targets_13_2,entry_targets_13_1,entry_targets_13_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_13_9 = ct_ifu_l0_btb_entry_9_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_8 = ct_ifu_l0_btb_entry_8_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_11 = ct_ifu_l0_btb_entry_11_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_10 = ct_ifu_l0_btb_entry_10_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_13 = ct_ifu_l0_btb_entry_13_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_12 = ct_ifu_l0_btb_entry_12_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_15 = ct_ifu_l0_btb_entry_15_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_13_14 = ct_ifu_l0_btb_entry_14_io_entry_target[13]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_13_T = {entry_targets_13_15,entry_targets_13_14,entry_targets_13_13,entry_targets_13_12,
    entry_targets_13_11,entry_targets_13_10,entry_targets_13_9,entry_targets_13_8,entry_hit_pcs_13_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_13_T_1 = entry_hit_flop & _entry_hit_pcs_13_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_13 = _entry_hit_pcs_13_T_1[0] | _entry_hit_pcs_13_T_1[1] | _entry_hit_pcs_13_T_1[2] |
    _entry_hit_pcs_13_T_1[3] | _entry_hit_pcs_13_T_1[4] | _entry_hit_pcs_13_T_1[5] | _entry_hit_pcs_13_T_1[6] |
    _entry_hit_pcs_13_T_1[7] | _entry_hit_pcs_13_T_1[8] | _entry_hit_pcs_13_T_1[9] | _entry_hit_pcs_13_T_1[10] |
    _entry_hit_pcs_13_T_1[11] | _entry_hit_pcs_13_T_1[12] | _entry_hit_pcs_13_T_1[13] | _entry_hit_pcs_13_T_1[14] |
    _entry_hit_pcs_13_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_14_1 = ct_ifu_l0_btb_entry_1_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_0 = ct_ifu_l0_btb_entry_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_3 = ct_ifu_l0_btb_entry_3_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_2 = ct_ifu_l0_btb_entry_2_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_5 = ct_ifu_l0_btb_entry_5_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_4 = ct_ifu_l0_btb_entry_4_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_7 = ct_ifu_l0_btb_entry_7_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_6 = ct_ifu_l0_btb_entry_6_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_14_lo = {entry_targets_14_7,entry_targets_14_6,entry_targets_14_5,entry_targets_14_4,
    entry_targets_14_3,entry_targets_14_2,entry_targets_14_1,entry_targets_14_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_14_9 = ct_ifu_l0_btb_entry_9_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_8 = ct_ifu_l0_btb_entry_8_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_11 = ct_ifu_l0_btb_entry_11_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_10 = ct_ifu_l0_btb_entry_10_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_13 = ct_ifu_l0_btb_entry_13_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_12 = ct_ifu_l0_btb_entry_12_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_15 = ct_ifu_l0_btb_entry_15_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_14_14 = ct_ifu_l0_btb_entry_14_io_entry_target[14]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_14_T = {entry_targets_14_15,entry_targets_14_14,entry_targets_14_13,entry_targets_14_12,
    entry_targets_14_11,entry_targets_14_10,entry_targets_14_9,entry_targets_14_8,entry_hit_pcs_14_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_14_T_1 = entry_hit_flop & _entry_hit_pcs_14_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_14 = _entry_hit_pcs_14_T_1[0] | _entry_hit_pcs_14_T_1[1] | _entry_hit_pcs_14_T_1[2] |
    _entry_hit_pcs_14_T_1[3] | _entry_hit_pcs_14_T_1[4] | _entry_hit_pcs_14_T_1[5] | _entry_hit_pcs_14_T_1[6] |
    _entry_hit_pcs_14_T_1[7] | _entry_hit_pcs_14_T_1[8] | _entry_hit_pcs_14_T_1[9] | _entry_hit_pcs_14_T_1[10] |
    _entry_hit_pcs_14_T_1[11] | _entry_hit_pcs_14_T_1[12] | _entry_hit_pcs_14_T_1[13] | _entry_hit_pcs_14_T_1[14] |
    _entry_hit_pcs_14_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_15_1 = ct_ifu_l0_btb_entry_1_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_0 = ct_ifu_l0_btb_entry_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_3 = ct_ifu_l0_btb_entry_3_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_2 = ct_ifu_l0_btb_entry_2_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_5 = ct_ifu_l0_btb_entry_5_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_4 = ct_ifu_l0_btb_entry_4_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_7 = ct_ifu_l0_btb_entry_7_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_6 = ct_ifu_l0_btb_entry_6_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_15_lo = {entry_targets_15_7,entry_targets_15_6,entry_targets_15_5,entry_targets_15_4,
    entry_targets_15_3,entry_targets_15_2,entry_targets_15_1,entry_targets_15_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_15_9 = ct_ifu_l0_btb_entry_9_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_8 = ct_ifu_l0_btb_entry_8_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_11 = ct_ifu_l0_btb_entry_11_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_10 = ct_ifu_l0_btb_entry_10_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_13 = ct_ifu_l0_btb_entry_13_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_12 = ct_ifu_l0_btb_entry_12_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_15 = ct_ifu_l0_btb_entry_15_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_15_14 = ct_ifu_l0_btb_entry_14_io_entry_target[15]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_15_T = {entry_targets_15_15,entry_targets_15_14,entry_targets_15_13,entry_targets_15_12,
    entry_targets_15_11,entry_targets_15_10,entry_targets_15_9,entry_targets_15_8,entry_hit_pcs_15_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_15_T_1 = entry_hit_flop & _entry_hit_pcs_15_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_15 = _entry_hit_pcs_15_T_1[0] | _entry_hit_pcs_15_T_1[1] | _entry_hit_pcs_15_T_1[2] |
    _entry_hit_pcs_15_T_1[3] | _entry_hit_pcs_15_T_1[4] | _entry_hit_pcs_15_T_1[5] | _entry_hit_pcs_15_T_1[6] |
    _entry_hit_pcs_15_T_1[7] | _entry_hit_pcs_15_T_1[8] | _entry_hit_pcs_15_T_1[9] | _entry_hit_pcs_15_T_1[10] |
    _entry_hit_pcs_15_T_1[11] | _entry_hit_pcs_15_T_1[12] | _entry_hit_pcs_15_T_1[13] | _entry_hit_pcs_15_T_1[14] |
    _entry_hit_pcs_15_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_16_1 = ct_ifu_l0_btb_entry_1_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_0 = ct_ifu_l0_btb_entry_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_3 = ct_ifu_l0_btb_entry_3_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_2 = ct_ifu_l0_btb_entry_2_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_5 = ct_ifu_l0_btb_entry_5_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_4 = ct_ifu_l0_btb_entry_4_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_7 = ct_ifu_l0_btb_entry_7_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_6 = ct_ifu_l0_btb_entry_6_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_16_lo = {entry_targets_16_7,entry_targets_16_6,entry_targets_16_5,entry_targets_16_4,
    entry_targets_16_3,entry_targets_16_2,entry_targets_16_1,entry_targets_16_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_16_9 = ct_ifu_l0_btb_entry_9_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_8 = ct_ifu_l0_btb_entry_8_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_11 = ct_ifu_l0_btb_entry_11_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_10 = ct_ifu_l0_btb_entry_10_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_13 = ct_ifu_l0_btb_entry_13_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_12 = ct_ifu_l0_btb_entry_12_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_15 = ct_ifu_l0_btb_entry_15_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_16_14 = ct_ifu_l0_btb_entry_14_io_entry_target[16]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_16_T = {entry_targets_16_15,entry_targets_16_14,entry_targets_16_13,entry_targets_16_12,
    entry_targets_16_11,entry_targets_16_10,entry_targets_16_9,entry_targets_16_8,entry_hit_pcs_16_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_16_T_1 = entry_hit_flop & _entry_hit_pcs_16_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_16 = _entry_hit_pcs_16_T_1[0] | _entry_hit_pcs_16_T_1[1] | _entry_hit_pcs_16_T_1[2] |
    _entry_hit_pcs_16_T_1[3] | _entry_hit_pcs_16_T_1[4] | _entry_hit_pcs_16_T_1[5] | _entry_hit_pcs_16_T_1[6] |
    _entry_hit_pcs_16_T_1[7] | _entry_hit_pcs_16_T_1[8] | _entry_hit_pcs_16_T_1[9] | _entry_hit_pcs_16_T_1[10] |
    _entry_hit_pcs_16_T_1[11] | _entry_hit_pcs_16_T_1[12] | _entry_hit_pcs_16_T_1[13] | _entry_hit_pcs_16_T_1[14] |
    _entry_hit_pcs_16_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_17_1 = ct_ifu_l0_btb_entry_1_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_0 = ct_ifu_l0_btb_entry_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_3 = ct_ifu_l0_btb_entry_3_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_2 = ct_ifu_l0_btb_entry_2_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_5 = ct_ifu_l0_btb_entry_5_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_4 = ct_ifu_l0_btb_entry_4_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_7 = ct_ifu_l0_btb_entry_7_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_6 = ct_ifu_l0_btb_entry_6_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_17_lo = {entry_targets_17_7,entry_targets_17_6,entry_targets_17_5,entry_targets_17_4,
    entry_targets_17_3,entry_targets_17_2,entry_targets_17_1,entry_targets_17_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_17_9 = ct_ifu_l0_btb_entry_9_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_8 = ct_ifu_l0_btb_entry_8_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_11 = ct_ifu_l0_btb_entry_11_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_10 = ct_ifu_l0_btb_entry_10_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_13 = ct_ifu_l0_btb_entry_13_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_12 = ct_ifu_l0_btb_entry_12_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_15 = ct_ifu_l0_btb_entry_15_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_17_14 = ct_ifu_l0_btb_entry_14_io_entry_target[17]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_17_T = {entry_targets_17_15,entry_targets_17_14,entry_targets_17_13,entry_targets_17_12,
    entry_targets_17_11,entry_targets_17_10,entry_targets_17_9,entry_targets_17_8,entry_hit_pcs_17_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_17_T_1 = entry_hit_flop & _entry_hit_pcs_17_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_17 = _entry_hit_pcs_17_T_1[0] | _entry_hit_pcs_17_T_1[1] | _entry_hit_pcs_17_T_1[2] |
    _entry_hit_pcs_17_T_1[3] | _entry_hit_pcs_17_T_1[4] | _entry_hit_pcs_17_T_1[5] | _entry_hit_pcs_17_T_1[6] |
    _entry_hit_pcs_17_T_1[7] | _entry_hit_pcs_17_T_1[8] | _entry_hit_pcs_17_T_1[9] | _entry_hit_pcs_17_T_1[10] |
    _entry_hit_pcs_17_T_1[11] | _entry_hit_pcs_17_T_1[12] | _entry_hit_pcs_17_T_1[13] | _entry_hit_pcs_17_T_1[14] |
    _entry_hit_pcs_17_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_18_1 = ct_ifu_l0_btb_entry_1_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_0 = ct_ifu_l0_btb_entry_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_3 = ct_ifu_l0_btb_entry_3_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_2 = ct_ifu_l0_btb_entry_2_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_5 = ct_ifu_l0_btb_entry_5_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_4 = ct_ifu_l0_btb_entry_4_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_7 = ct_ifu_l0_btb_entry_7_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_6 = ct_ifu_l0_btb_entry_6_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_18_lo = {entry_targets_18_7,entry_targets_18_6,entry_targets_18_5,entry_targets_18_4,
    entry_targets_18_3,entry_targets_18_2,entry_targets_18_1,entry_targets_18_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_18_9 = ct_ifu_l0_btb_entry_9_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_8 = ct_ifu_l0_btb_entry_8_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_11 = ct_ifu_l0_btb_entry_11_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_10 = ct_ifu_l0_btb_entry_10_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_13 = ct_ifu_l0_btb_entry_13_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_12 = ct_ifu_l0_btb_entry_12_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_15 = ct_ifu_l0_btb_entry_15_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_18_14 = ct_ifu_l0_btb_entry_14_io_entry_target[18]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_18_T = {entry_targets_18_15,entry_targets_18_14,entry_targets_18_13,entry_targets_18_12,
    entry_targets_18_11,entry_targets_18_10,entry_targets_18_9,entry_targets_18_8,entry_hit_pcs_18_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_18_T_1 = entry_hit_flop & _entry_hit_pcs_18_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_18 = _entry_hit_pcs_18_T_1[0] | _entry_hit_pcs_18_T_1[1] | _entry_hit_pcs_18_T_1[2] |
    _entry_hit_pcs_18_T_1[3] | _entry_hit_pcs_18_T_1[4] | _entry_hit_pcs_18_T_1[5] | _entry_hit_pcs_18_T_1[6] |
    _entry_hit_pcs_18_T_1[7] | _entry_hit_pcs_18_T_1[8] | _entry_hit_pcs_18_T_1[9] | _entry_hit_pcs_18_T_1[10] |
    _entry_hit_pcs_18_T_1[11] | _entry_hit_pcs_18_T_1[12] | _entry_hit_pcs_18_T_1[13] | _entry_hit_pcs_18_T_1[14] |
    _entry_hit_pcs_18_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_targets_19_1 = ct_ifu_l0_btb_entry_1_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_0 = ct_ifu_l0_btb_entry_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_3 = ct_ifu_l0_btb_entry_3_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_2 = ct_ifu_l0_btb_entry_2_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_5 = ct_ifu_l0_btb_entry_5_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_4 = ct_ifu_l0_btb_entry_4_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_7 = ct_ifu_l0_btb_entry_7_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_6 = ct_ifu_l0_btb_entry_6_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [7:0] entry_hit_pcs_19_lo = {entry_targets_19_7,entry_targets_19_6,entry_targets_19_5,entry_targets_19_4,
    entry_targets_19_3,entry_targets_19_2,entry_targets_19_1,entry_targets_19_0}; // @[ct_ifu_l0_btb.scala 178:81]
  wire  entry_targets_19_9 = ct_ifu_l0_btb_entry_9_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_8 = ct_ifu_l0_btb_entry_8_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_11 = ct_ifu_l0_btb_entry_11_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_10 = ct_ifu_l0_btb_entry_10_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_13 = ct_ifu_l0_btb_entry_13_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_12 = ct_ifu_l0_btb_entry_12_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_15 = ct_ifu_l0_btb_entry_15_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire  entry_targets_19_14 = ct_ifu_l0_btb_entry_14_io_entry_target[19]; // @[ct_ifu_l0_btb.scala 326:59]
  wire [15:0] _entry_hit_pcs_19_T = {entry_targets_19_15,entry_targets_19_14,entry_targets_19_13,entry_targets_19_12,
    entry_targets_19_11,entry_targets_19_10,entry_targets_19_9,entry_targets_19_8,entry_hit_pcs_19_lo}; // @[ct_ifu_l0_btb.scala 178:81]
  wire [15:0] _entry_hit_pcs_19_T_1 = entry_hit_flop & _entry_hit_pcs_19_T; // @[ct_ifu_l0_btb.scala 178:74]
  wire  entry_hit_pcs_19 = _entry_hit_pcs_19_T_1[0] | _entry_hit_pcs_19_T_1[1] | _entry_hit_pcs_19_T_1[2] |
    _entry_hit_pcs_19_T_1[3] | _entry_hit_pcs_19_T_1[4] | _entry_hit_pcs_19_T_1[5] | _entry_hit_pcs_19_T_1[6] |
    _entry_hit_pcs_19_T_1[7] | _entry_hit_pcs_19_T_1[8] | _entry_hit_pcs_19_T_1[9] | _entry_hit_pcs_19_T_1[10] |
    _entry_hit_pcs_19_T_1[11] | _entry_hit_pcs_19_T_1[12] | _entry_hit_pcs_19_T_1[13] | _entry_hit_pcs_19_T_1[14] |
    _entry_hit_pcs_19_T_1[15]; // @[ct_ifu_l0_btb.scala 178:105]
  wire  entry_if_hit = entry_hit_flop[0] | entry_hit_flop[1] | entry_hit_flop[2] | entry_hit_flop[3] | entry_hit_flop[4]
     | entry_hit_flop[5] | entry_hit_flop[6] | entry_hit_flop[7] | entry_hit_flop[8] | entry_hit_flop[9] |
    entry_hit_flop[10] | entry_hit_flop[11] | entry_hit_flop[12] | entry_hit_flop[13] | entry_hit_flop[14] |
    entry_hit_flop[15]; // @[ct_ifu_l0_btb.scala 180:51]
  wire [9:0] entry_hit_target_temp_lo = {entry_hit_pcs_10,entry_hit_pcs_11,entry_hit_pcs_12,entry_hit_pcs_13,
    entry_hit_pcs_14,entry_hit_pcs_15,entry_hit_pcs_16,entry_hit_pcs_17,entry_hit_pcs_18,entry_hit_pcs_19}; // @[Cat.scala 31:58]
  wire [9:0] entry_hit_target_temp_hi = {entry_hit_pcs_0,entry_hit_pcs_1,entry_hit_pcs_2,entry_hit_pcs_3,entry_hit_pcs_4
    ,entry_hit_pcs_5,entry_hit_pcs_6,entry_hit_pcs_7,entry_hit_pcs_8,entry_hit_pcs_9}; // @[Cat.scala 31:58]
  wire [38:0] _entry_hit_target_T_1 = {io_pcgen_l0_btb_if_pc[38:20],entry_hit_target_temp_hi,entry_hit_target_temp_lo}; // @[Cat.scala 31:58]
  reg [1:0] l0_btb_cur_state; // @[ct_ifu_l0_btb.scala 200:29]
  reg [1:0] l0_btb_next_state; // @[ct_ifu_l0_btb.scala 201:30]
  reg [1:0] l0_btb_cur_state_REG; // @[ct_ifu_l0_btb.scala 203:32]
  wire  _l0_btb_next_state_T_1 = ~io_ipctrl_l0_btb_ip_vld; // @[ct_ifu_l0_btb.scala 210:42]
  wire [1:0] _l0_btb_next_state_T_2 = _l0_btb_next_state_T_1 ? 2'h2 : 2'h1; // @[Mux.scala 101:16]
  wire [1:0] _l0_btb_next_state_T_3 = io_ipctrl_l0_btb_wait_next ? 2'h2 : _l0_btb_next_state_T_2; // @[Mux.scala 101:16]
  wire  l0_btb_create_en = _l0_btb_rd_T & io_ibdp_l0_btb_fifo_update_vld; // @[ct_ifu_l0_btb.scala 221:67]
  reg [15:0] entry_fifo; // @[ct_ifu_l0_btb.scala 229:23]
  wire [15:0] _entry_fifo_T_2 = {entry_fifo[14:0],entry_fifo[15]}; // @[Cat.scala 31:58]
  wire  _l0_btb_update_entry_0_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[0]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_1_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[1]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_2_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[2]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_3_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[3]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_4_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[4]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_5_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[5]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_6_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[6]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_7_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[7]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_8_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[8]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_9_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[9]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_10_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[10]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_11_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[11]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_12_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[12]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_13_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[13]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_14_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[14]; // @[ct_ifu_l0_btb.scala 250:39]
  wire  _l0_btb_update_entry_15_T_1 = io_l0_btb_update_vld_for_gateclk & io_ibdp_l0_btb_update_entry[15]; // @[ct_ifu_l0_btb.scala 250:39]
  reg [3:0] l0_btb_wen; // @[ct_ifu_l0_btb.scala 253:23]
  reg  l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 255:38]
  reg  l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 256:38]
  wire  _GEN_7 = io_ibdp_l0_btb_update_vld & io_ibdp_l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 266:48 268:27 274:27]
  wire  _GEN_8 = io_ibdp_l0_btb_update_vld & io_ibdp_l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 266:48 269:27 275:27]
  wire  _GEN_9 = io_ibdp_l0_btb_update_vld & io_ibdp_l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 266:48 270:27 276:27]
  reg  l0_btb_entry_inv; // @[ct_ifu_l0_btb.scala 287:29]
  wire  _GEN_16 = io_ifctrl_l0_btb_inv | l0_btb_entry_inv; // @[ct_ifu_l0_btb.scala 300:37 301:24 303:24]
  gated_clk_cell x_l0_btb_pipe_clk ( // @[ct_ifu_l0_btb.scala 126:31]
    .clk_in(x_l0_btb_pipe_clk_clk_in),
    .global_en(x_l0_btb_pipe_clk_global_en),
    .module_en(x_l0_btb_pipe_clk_module_en),
    .local_en(x_l0_btb_pipe_clk_local_en),
    .external_en(x_l0_btb_pipe_clk_external_en),
    .pad_yy_icg_scan_en(x_l0_btb_pipe_clk_pad_yy_icg_scan_en),
    .clk_out(x_l0_btb_pipe_clk_clk_out)
  );
  gated_clk_cell x_l0_btb_clk ( // @[ct_ifu_l0_btb.scala 190:28]
    .clk_in(x_l0_btb_clk_clk_in),
    .global_en(x_l0_btb_clk_global_en),
    .module_en(x_l0_btb_clk_module_en),
    .local_en(x_l0_btb_clk_local_en),
    .external_en(x_l0_btb_clk_external_en),
    .pad_yy_icg_scan_en(x_l0_btb_clk_pad_yy_icg_scan_en),
    .clk_out(x_l0_btb_clk_clk_out)
  );
  gated_clk_cell x_l0_btb_create_clk ( // @[ct_ifu_l0_btb.scala 219:35]
    .clk_in(x_l0_btb_create_clk_clk_in),
    .global_en(x_l0_btb_create_clk_global_en),
    .module_en(x_l0_btb_create_clk_module_en),
    .local_en(x_l0_btb_create_clk_local_en),
    .external_en(x_l0_btb_create_clk_external_en),
    .pad_yy_icg_scan_en(x_l0_btb_create_clk_pad_yy_icg_scan_en),
    .clk_out(x_l0_btb_create_clk_clk_out)
  );
  gated_clk_cell x_l0_btb_inv_reg_upd_clk ( // @[ct_ifu_l0_btb.scala 284:40]
    .clk_in(x_l0_btb_inv_reg_upd_clk_clk_in),
    .global_en(x_l0_btb_inv_reg_upd_clk_global_en),
    .module_en(x_l0_btb_inv_reg_upd_clk_module_en),
    .local_en(x_l0_btb_inv_reg_upd_clk_local_en),
    .external_en(x_l0_btb_inv_reg_upd_clk_external_en),
    .pad_yy_icg_scan_en(x_l0_btb_inv_reg_upd_clk_pad_yy_icg_scan_en),
    .clk_out(x_l0_btb_inv_reg_upd_clk_clk_out)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_1 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_1_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_1_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_1_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_1_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_1_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_1_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_1_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_1_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_1_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_1_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_1_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_1_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_1_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_1_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_1_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_1_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_1_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_1_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_1_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_2 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_2_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_2_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_2_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_2_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_2_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_2_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_2_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_2_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_2_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_2_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_2_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_2_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_2_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_2_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_2_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_2_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_2_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_2_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_2_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_3 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_3_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_3_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_3_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_3_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_3_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_3_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_3_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_3_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_3_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_3_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_3_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_3_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_3_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_3_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_3_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_3_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_3_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_3_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_3_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_4 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_4_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_4_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_4_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_4_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_4_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_4_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_4_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_4_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_4_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_4_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_4_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_4_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_4_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_4_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_4_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_4_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_4_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_4_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_4_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_5 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_5_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_5_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_5_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_5_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_5_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_5_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_5_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_5_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_5_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_5_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_5_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_5_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_5_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_5_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_5_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_5_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_5_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_5_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_5_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_6 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_6_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_6_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_6_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_6_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_6_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_6_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_6_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_6_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_6_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_6_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_6_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_6_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_6_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_6_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_6_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_6_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_6_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_6_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_6_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_7 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_7_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_7_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_7_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_7_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_7_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_7_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_7_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_7_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_7_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_7_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_7_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_7_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_7_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_7_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_7_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_7_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_7_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_7_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_7_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_8 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_8_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_8_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_8_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_8_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_8_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_8_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_8_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_8_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_8_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_8_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_8_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_8_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_8_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_8_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_8_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_8_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_8_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_8_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_8_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_9 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_9_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_9_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_9_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_9_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_9_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_9_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_9_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_9_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_9_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_9_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_9_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_9_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_9_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_9_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_9_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_9_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_9_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_9_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_9_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_10 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_10_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_10_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_10_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_10_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_10_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_10_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_10_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_10_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_10_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_10_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_10_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_10_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_10_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_10_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_10_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_10_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_10_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_10_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_10_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_11 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_11_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_11_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_11_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_11_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_11_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_11_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_11_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_11_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_11_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_11_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_11_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_11_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_11_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_11_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_11_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_11_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_11_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_11_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_11_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_12 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_12_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_12_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_12_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_12_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_12_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_12_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_12_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_12_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_12_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_12_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_12_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_12_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_12_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_12_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_12_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_12_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_12_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_12_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_12_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_13 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_13_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_13_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_13_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_13_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_13_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_13_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_13_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_13_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_13_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_13_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_13_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_13_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_13_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_13_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_13_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_13_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_13_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_13_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_13_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_14 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_14_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_14_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_14_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_14_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_14_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_14_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_14_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_14_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_14_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_14_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_14_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_14_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_14_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_14_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_14_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_14_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_14_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_14_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_14_io_entry_way_pred)
  );
  ct_ifu_l0_btb_entry ct_ifu_l0_btb_entry_15 ( // @[ct_ifu_l0_btb.scala 310:43]
    .io_cp0_ifu_btb_en(ct_ifu_l0_btb_entry_15_io_cp0_ifu_btb_en),
    .io_cp0_ifu_icg_en(ct_ifu_l0_btb_entry_15_io_cp0_ifu_icg_en),
    .io_cp0_ifu_l0btb_en(ct_ifu_l0_btb_entry_15_io_cp0_ifu_l0btb_en),
    .io_cp0_yy_clk_en(ct_ifu_l0_btb_entry_15_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_ifu_l0_btb_entry_15_io_cpurst_b),
    .io_entry_update(ct_ifu_l0_btb_entry_15_io_entry_update),
    .io_entry_update_cnt(ct_ifu_l0_btb_entry_15_io_entry_update_cnt),
    .io_entry_update_data(ct_ifu_l0_btb_entry_15_io_entry_update_data),
    .io_entry_update_ras(ct_ifu_l0_btb_entry_15_io_entry_update_ras),
    .io_entry_update_vld(ct_ifu_l0_btb_entry_15_io_entry_update_vld),
    .io_entry_wen(ct_ifu_l0_btb_entry_15_io_entry_wen),
    .io_forever_cpuclk(ct_ifu_l0_btb_entry_15_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_ifu_l0_btb_entry_15_io_pad_yy_icg_scan_en),
    .io_entry_cnt(ct_ifu_l0_btb_entry_15_io_entry_cnt),
    .io_entry_ras(ct_ifu_l0_btb_entry_15_io_entry_ras),
    .io_entry_tag(ct_ifu_l0_btb_entry_15_io_entry_tag),
    .io_entry_target(ct_ifu_l0_btb_entry_15_io_entry_target),
    .io_entry_vld(ct_ifu_l0_btb_entry_15_io_entry_vld),
    .io_entry_way_pred(ct_ifu_l0_btb_entry_15_io_entry_way_pred)
  );
  assign io_l0_btb_debug_cur_state = l0_btb_cur_state; // @[ct_ifu_l0_btb.scala 350:29]
  assign io_l0_btb_ibdp_entry_fifo = entry_fifo; // @[ct_ifu_l0_btb.scala 240:29]
  assign io_l0_btb_ifctrl_chgflw_pc = entry_hit_ras ? ras_pc : _entry_hit_target_T_1; // @[ct_ifu_l0_btb.scala 184:26]
  assign io_l0_btb_ifctrl_chgflw_way_pred = {entry_hit_way_pred_2,entry_hit_way_pred_1}; // @[Cat.scala 31:58]
  assign io_l0_btb_ifctrl_chglfw_vld = entry_if_hit & entry_hit_counter; // @[ct_ifu_l0_btb.scala 181:37]
  assign io_l0_btb_ifdp_chgflw_pc = entry_hit_ras ? ras_pc : _entry_hit_target_T_1; // @[ct_ifu_l0_btb.scala 184:26]
  assign io_l0_btb_ifdp_chgflw_way_pred = {entry_hit_way_pred_2,entry_hit_way_pred_1}; // @[Cat.scala 31:58]
  assign io_l0_btb_ifdp_counter = _entry_hit_counter_T_1[0] | _entry_hit_counter_T_1[1] | _entry_hit_counter_T_1[2] |
    _entry_hit_counter_T_1[3] | _entry_hit_counter_T_1[4] | _entry_hit_counter_T_1[5] | _entry_hit_counter_T_1[6] |
    _entry_hit_counter_T_1[7] | _entry_hit_counter_T_1[8] | _entry_hit_counter_T_1[9] | _entry_hit_counter_T_1[10] |
    _entry_hit_counter_T_1[11] | _entry_hit_counter_T_1[12] | _entry_hit_counter_T_1[13] | _entry_hit_counter_T_1[14] |
    _entry_hit_counter_T_1[15]; // @[ct_ifu_l0_btb.scala 160:75]
  assign io_l0_btb_ifdp_entry_hit = entry_hit_flop; // @[ct_ifu_l0_btb.scala 346:28]
  assign io_l0_btb_ifdp_hit = entry_hit_flop[0] | entry_hit_flop[1] | entry_hit_flop[2] | entry_hit_flop[3] |
    entry_hit_flop[4] | entry_hit_flop[5] | entry_hit_flop[6] | entry_hit_flop[7] | entry_hit_flop[8] | entry_hit_flop[9
    ] | entry_hit_flop[10] | entry_hit_flop[11] | entry_hit_flop[12] | entry_hit_flop[13] | entry_hit_flop[14] |
    entry_hit_flop[15]; // @[ct_ifu_l0_btb.scala 180:51]
  assign io_l0_btb_ifdp_ras = _entry_hit_ras_T_1[0] | _entry_hit_ras_T_1[1] | _entry_hit_ras_T_1[2] | _entry_hit_ras_T_1
    [3] | _entry_hit_ras_T_1[4] | _entry_hit_ras_T_1[5] | _entry_hit_ras_T_1[6] | _entry_hit_ras_T_1[7] |
    _entry_hit_ras_T_1[8] | _entry_hit_ras_T_1[9] | _entry_hit_ras_T_1[10] | _entry_hit_ras_T_1[11] | _entry_hit_ras_T_1
    [12] | _entry_hit_ras_T_1[13] | _entry_hit_ras_T_1[14] | _entry_hit_ras_T_1[15]; // @[ct_ifu_l0_btb.scala 163:70]
  assign io_l0_btb_ipctrl_st_wait = l0_btb_cur_state == 2'h2; // @[ct_ifu_l0_btb.scala 213:49]
  assign x_l0_btb_pipe_clk_clk_in = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 129:57]
  assign x_l0_btb_pipe_clk_global_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 131:36]
  assign x_l0_btb_pipe_clk_module_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 133:36]
  assign x_l0_btb_pipe_clk_local_en = io_cp0_ifu_btb_en & io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 128:40]
  assign x_l0_btb_pipe_clk_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 130:36]
  assign x_l0_btb_pipe_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 134:43]
  assign x_l0_btb_clk_clk_in = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 193:52]
  assign x_l0_btb_clk_global_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 195:31]
  assign x_l0_btb_clk_module_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 197:31]
  assign x_l0_btb_clk_local_en = io_cp0_ifu_btb_en & io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 192:41]
  assign x_l0_btb_clk_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 194:31]
  assign x_l0_btb_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 198:38]
  assign x_l0_btb_create_clk_clk_in = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 222:59]
  assign x_l0_btb_create_clk_global_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 224:38]
  assign x_l0_btb_create_clk_module_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 226:38]
  assign x_l0_btb_create_clk_local_en = _l0_btb_rd_T & io_ibdp_l0_btb_fifo_update_vld; // @[ct_ifu_l0_btb.scala 221:67]
  assign x_l0_btb_create_clk_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 223:38]
  assign x_l0_btb_create_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 227:45]
  assign x_l0_btb_inv_reg_upd_clk_clk_in = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 289:64]
  assign x_l0_btb_inv_reg_upd_clk_global_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 291:43]
  assign x_l0_btb_inv_reg_upd_clk_module_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 293:43]
  assign x_l0_btb_inv_reg_upd_clk_local_en = l0_btb_entry_inv | io_ifctrl_l0_btb_inv; // @[ct_ifu_l0_btb.scala 288:51]
  assign x_l0_btb_inv_reg_upd_clk_external_en = 1'h0; // @[ct_ifu_l0_btb.scala 290:43]
  assign x_l0_btb_inv_reg_upd_clk_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 294:50]
  assign ct_ifu_l0_btb_entry_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[0] |
    _l0_btb_update_entry_0_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_1_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_1_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_1_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_1_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_1_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_1_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[1] |
    _l0_btb_update_entry_1_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_1_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_1_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_1_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_1_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_1_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_1_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_1_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_2_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_2_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_2_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_2_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_2_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_2_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[2] |
    _l0_btb_update_entry_2_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_2_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_2_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_2_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_2_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_2_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_2_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_2_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_3_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_3_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_3_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_3_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_3_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_3_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[3] |
    _l0_btb_update_entry_3_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_3_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_3_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_3_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_3_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_3_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_3_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_3_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_4_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_4_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_4_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_4_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_4_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_4_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[4] |
    _l0_btb_update_entry_4_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_4_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_4_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_4_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_4_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_4_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_4_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_4_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_5_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_5_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_5_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_5_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_5_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_5_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[5] |
    _l0_btb_update_entry_5_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_5_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_5_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_5_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_5_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_5_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_5_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_5_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_6_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_6_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_6_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_6_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_6_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_6_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[6] |
    _l0_btb_update_entry_6_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_6_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_6_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_6_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_6_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_6_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_6_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_6_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_7_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_7_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_7_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_7_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_7_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_7_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[7] |
    _l0_btb_update_entry_7_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_7_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_7_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_7_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_7_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_7_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_7_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_7_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_8_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_8_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_8_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_8_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_8_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_8_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[8] |
    _l0_btb_update_entry_8_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_8_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_8_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_8_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_8_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_8_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_8_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_8_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_9_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_9_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_9_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_9_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_9_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_9_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[9] |
    _l0_btb_update_entry_9_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_9_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_9_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_9_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_9_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_9_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_9_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_9_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_10_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_10_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_10_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_10_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_10_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_10_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[10] |
    _l0_btb_update_entry_10_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_10_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_10_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_10_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_10_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_10_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_10_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_10_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_11_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_11_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_11_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_11_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_11_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_11_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[11] |
    _l0_btb_update_entry_11_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_11_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_11_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_11_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_11_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_11_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_11_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_11_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_12_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_12_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_12_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_12_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_12_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_12_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[12] |
    _l0_btb_update_entry_12_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_12_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_12_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_12_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_12_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_12_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_12_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_12_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_13_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_13_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_13_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_13_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_13_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_13_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[13] |
    _l0_btb_update_entry_13_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_13_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_13_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_13_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_13_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_13_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_13_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_13_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_14_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_14_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_14_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_14_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_14_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_14_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[14] |
    _l0_btb_update_entry_14_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_14_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_14_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_14_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_14_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_14_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_14_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_14_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  assign ct_ifu_l0_btb_entry_15_io_cp0_ifu_btb_en = io_cp0_ifu_btb_en; // @[ct_ifu_l0_btb.scala 312:36]
  assign ct_ifu_l0_btb_entry_15_io_cp0_ifu_icg_en = io_cp0_ifu_icg_en; // @[ct_ifu_l0_btb.scala 313:36]
  assign ct_ifu_l0_btb_entry_15_io_cp0_ifu_l0btb_en = io_cp0_ifu_l0btb_en; // @[ct_ifu_l0_btb.scala 314:38]
  assign ct_ifu_l0_btb_entry_15_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[ct_ifu_l0_btb.scala 315:35]
  assign ct_ifu_l0_btb_entry_15_io_cpurst_b = io_cpurst_b; // @[ct_ifu_l0_btb.scala 316:31]
  assign ct_ifu_l0_btb_entry_15_io_entry_update = io_addrgen_l0_btb_update_vld & io_addrgen_l0_btb_update_entry[15] |
    _l0_btb_update_entry_15_T_1; // @[ct_ifu_l0_btb.scala 249:108]
  assign ct_ifu_l0_btb_entry_15_io_entry_update_cnt = l0_btb_update_cnt_bit; // @[ct_ifu_l0_btb.scala 329:38]
  assign ct_ifu_l0_btb_entry_15_io_entry_update_data = l0_btb_update_data; // @[ct_ifu_l0_btb.scala 330:39]
  assign ct_ifu_l0_btb_entry_15_io_entry_update_ras = l0_btb_update_ras_bit; // @[ct_ifu_l0_btb.scala 331:38]
  assign ct_ifu_l0_btb_entry_15_io_entry_update_vld = l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 332:38]
  assign ct_ifu_l0_btb_entry_15_io_entry_wen = l0_btb_wen; // @[ct_ifu_l0_btb.scala 336:33]
  assign ct_ifu_l0_btb_entry_15_io_forever_cpuclk = io_forever_cpuclk; // @[ct_ifu_l0_btb.scala 337:57]
  assign ct_ifu_l0_btb_entry_15_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[ct_ifu_l0_btb.scala 338:40]
  always @(posedge clock) begin
    l0_btb_rd_flop <= l0_btb_rd_flop_REG; // @[ct_ifu_l0_btb.scala 82:20]
    if (io_addrgen_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 259:45]
      l0_btb_update_data <= 37'h0; // @[ct_ifu_l0_btb.scala 265:28]
    end else if (io_ibdp_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 266:48]
      l0_btb_update_data <= io_ibdp_l0_btb_update_data; // @[ct_ifu_l0_btb.scala 271:27]
    end else begin
      l0_btb_update_data <= 37'h0; // @[ct_ifu_l0_btb.scala 277:27]
    end
    if (io_addrgen_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 259:45]
      l0_btb_update_vld_bit <= io_addrgen_l0_btb_update_vld_bit; // @[ct_ifu_l0_btb.scala 262:28]
    end else begin
      l0_btb_update_vld_bit <= _GEN_7;
    end
    if (l0_btb_rd) begin // @[ct_ifu_l0_btb.scala 117:20]
      entry_hit_flop <= _entry_hit_flop_T; // @[ct_ifu_l0_btb.scala 118:24]
    end else if (l0_btb_rd_flop & _l0_btb_rd_T_3) begin // @[ct_ifu_l0_btb.scala 119:64]
      entry_hit_flop <= _entry_hit_flop_T; // @[ct_ifu_l0_btb.scala 120:24]
    end
    if (l0_btb_rd | l0_btb_rd_flop) begin // @[ct_ifu_l0_btb.scala 145:45]
      if (io_ras_l0_btb_ras_push) begin // @[Mux.scala 101:16]
        ras_pc <= io_ras_l0_btb_push_pc;
      end else if (io_ipdp_l0_btb_ras_push) begin // @[Mux.scala 101:16]
        ras_pc <= io_ipdp_l0_btb_ras_pc;
      end else begin
        ras_pc <= io_ras_l0_btb_pc;
      end
    end
    l0_btb_cur_state <= l0_btb_cur_state_REG; // @[ct_ifu_l0_btb.scala 203:22]
    if (l0_btb_cur_state == 2'h1) begin // @[ct_ifu_l0_btb.scala 206:34]
      if (io_pcgen_l0_btb_chgflw_vld) begin // @[ct_ifu_l0_btb.scala 207:29]
        l0_btb_next_state <= 2'h2;
      end else begin
        l0_btb_next_state <= 2'h1;
      end
    end else if (l0_btb_cur_state == 2'h2) begin // @[ct_ifu_l0_btb.scala 208:40]
      if (io_pcgen_l0_btb_chgflw_mask) begin // @[Mux.scala 101:16]
        l0_btb_next_state <= 2'h1;
      end else if (io_ipctrl_l0_btb_chgflw_vld) begin // @[Mux.scala 101:16]
        l0_btb_next_state <= 2'h2;
      end else begin
        l0_btb_next_state <= _l0_btb_next_state_T_3;
      end
    end
    if (l0_btb_create_en) begin // @[ct_ifu_l0_btb.scala 233:25]
      entry_fifo <= _entry_fifo_T_2; // @[ct_ifu_l0_btb.scala 234:16]
    end
    if (io_addrgen_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 259:45]
      l0_btb_wen <= io_addrgen_l0_btb_wen; // @[ct_ifu_l0_btb.scala 261:17]
    end else if (io_ibdp_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 266:48]
      l0_btb_wen <= io_ibdp_l0_btb_wen; // @[ct_ifu_l0_btb.scala 267:16]
    end else begin
      l0_btb_wen <= 4'h0; // @[ct_ifu_l0_btb.scala 273:16]
    end
    if (io_addrgen_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 259:45]
      l0_btb_update_cnt_bit <= 1'h0; // @[ct_ifu_l0_btb.scala 263:28]
    end else begin
      l0_btb_update_cnt_bit <= _GEN_8;
    end
    if (io_addrgen_l0_btb_update_vld) begin // @[ct_ifu_l0_btb.scala 259:45]
      l0_btb_update_ras_bit <= 1'h0; // @[ct_ifu_l0_btb.scala 264:28]
    end else begin
      l0_btb_update_ras_bit <= _GEN_9;
    end
    if (l0_btb_entry_inv) begin // @[ct_ifu_l0_btb.scala 298:34]
      l0_btb_entry_inv <= 1'h0; // @[ct_ifu_l0_btb.scala 299:24]
    end else begin
      l0_btb_entry_inv <= _GEN_16;
    end
  end
  always @(posedge io_forever_cpuclk) begin
    if (_T_1) begin // @[ct_ifu_l0_btb.scala 82:30]
      l0_btb_rd_flop_REG <= 1'h0; // @[ct_ifu_l0_btb.scala 82:30]
    end else begin
      l0_btb_rd_flop_REG <= l0_btb_rd; // @[ct_ifu_l0_btb.scala 82:30]
    end
  end
  always @(posedge x_l0_btb_clk_clk_out) begin
    if (_T_1) begin // @[ct_ifu_l0_btb.scala 203:32]
      l0_btb_cur_state_REG <= 2'h1; // @[ct_ifu_l0_btb.scala 203:32]
    end else begin
      l0_btb_cur_state_REG <= l0_btb_next_state; // @[ct_ifu_l0_btb.scala 203:32]
    end
  end
// Register and memory initialization
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
  l0_btb_rd_flop = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  l0_btb_rd_flop_REG = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  l0_btb_update_data = _RAND_2[36:0];
  _RAND_3 = {1{`RANDOM}};
  l0_btb_update_vld_bit = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_hit_flop = _RAND_4[15:0];
  _RAND_5 = {2{`RANDOM}};
  ras_pc = _RAND_5[38:0];
  _RAND_6 = {1{`RANDOM}};
  l0_btb_cur_state = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  l0_btb_next_state = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  l0_btb_cur_state_REG = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  entry_fifo = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  l0_btb_wen = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  l0_btb_update_cnt_bit = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  l0_btb_update_ras_bit = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  l0_btb_entry_inv = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
