module ct_ifu_l0_btb_entry(
  input         clock,
  input         reset,
  input         io_cp0_ifu_btb_en,
  input         io_cp0_ifu_icg_en,
  input         io_cp0_ifu_l0btb_en,
  input         io_cp0_yy_clk_en,
  input         io_cpurst_b,
  input         io_entry_inv,
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
