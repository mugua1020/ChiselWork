circuit ct_ifu_l0_btb_entry :
  extmodule gated_clk_cell :
    input clk_in : Clock
    input global_en : UInt<1>
    input module_en : UInt<1>
    input local_en : UInt<1>
    input external_en : UInt<1>
    input pad_yy_icg_scan_en : UInt<1>
    output clk_out : Clock
    defname = gated_clk_cell

  module ct_ifu_l0_btb_entry :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip cp0_ifu_btb_en : UInt<1>, flip cp0_ifu_icg_en : UInt<1>, flip cp0_ifu_l0btb_en : UInt<1>, flip cp0_yy_clk_en : UInt<1>, flip cpurst_b : UInt<1>, flip entry_inv : UInt<1>, flip entry_update : UInt<1>, flip entry_update_cnt : UInt<1>, flip entry_update_data : UInt<37>, flip entry_update_ras : UInt<1>, flip entry_update_vld : UInt<1>, flip entry_wen : UInt<4>, flip forever_cpuclk : Clock, flip pad_yy_icg_scan_en : UInt<1>, entry_cnt : UInt<1>, entry_ras : UInt<1>, entry_tag : UInt<15>, entry_target : UInt<20>, entry_vld : UInt<1>, entry_way_pred : UInt<2>}

    inst gatedclk of gated_clk_cell @[ct_ifu_l0_btb_entry.scala 35:24]
    gatedclk.clk_out is invalid
    gatedclk.pad_yy_icg_scan_en is invalid
    gatedclk.external_en is invalid
    gatedclk.local_en is invalid
    gatedclk.module_en is invalid
    gatedclk.global_en is invalid
    gatedclk.clk_in is invalid
    node _entry_update_en_T = and(io.entry_update, io.cp0_ifu_btb_en) @[ct_ifu_l0_btb_entry.scala 37:41]
    node entry_clk_en = and(_entry_update_en_T, io.cp0_ifu_l0btb_en) @[ct_ifu_l0_btb_entry.scala 37:61]
    gatedclk.clk_in <= io.forever_cpuclk @[ct_ifu_l0_btb_entry.scala 39:27]
    gatedclk.external_en <= UInt<1>("h0") @[ct_ifu_l0_btb_entry.scala 40:27]
    gatedclk.global_en <= io.cp0_yy_clk_en @[ct_ifu_l0_btb_entry.scala 41:27]
    gatedclk.local_en <= entry_clk_en @[ct_ifu_l0_btb_entry.scala 42:27]
    gatedclk.module_en <= io.cp0_ifu_icg_en @[ct_ifu_l0_btb_entry.scala 43:27]
    gatedclk.pad_yy_icg_scan_en <= io.pad_yy_icg_scan_en @[ct_ifu_l0_btb_entry.scala 44:34]
    node _T = not(io.cpurst_b) @[ct_ifu_l0_btb_entry.scala 46:33]
    node _T_1 = asAsyncReset(_T) @[ct_ifu_l0_btb_entry.scala 46:47]
    wire entry_data : UInt<37> @[ct_ifu_l0_btb_entry.scala 48:30]
    node _io_entry_tag_T = bits(entry_data, 36, 22) @[ct_ifu_l0_btb_entry.scala 49:36]
    io.entry_tag <= _io_entry_tag_T @[ct_ifu_l0_btb_entry.scala 49:23]
    node _io_entry_way_pred_T = bits(entry_data, 21, 20) @[ct_ifu_l0_btb_entry.scala 50:36]
    io.entry_way_pred <= _io_entry_way_pred_T @[ct_ifu_l0_btb_entry.scala 50:23]
    node _io_entry_target_T = bits(entry_data, 19, 0) @[ct_ifu_l0_btb_entry.scala 51:36]
    io.entry_target <= _io_entry_target_T @[ct_ifu_l0_btb_entry.scala 51:23]
    reg entry_signal : UInt, gatedclk.clk_out with :
      reset => (_T_1, UInt<1>("h0")) @[ct_ifu_l0_btb_entry.scala 71:33]
    node _T_2 = bits(io.entry_wen, 0, 0) @[ct_ifu_l0_btb_entry.scala 72:43]
    node _T_3 = and(entry_clk_en, _T_2) @[ct_ifu_l0_btb_entry.scala 72:29]
    when _T_3 : @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal <= io.entry_update_data @[ct_ifu_l0_btb_entry.scala 73:22]
    entry_data <= entry_signal @[ct_ifu_l0_btb_entry.scala 75:9]
    reg entry_signal_1 : UInt<1>, gatedclk.clk_out with :
      reset => (_T_1, UInt<1>("h0")) @[ct_ifu_l0_btb_entry.scala 71:33]
    node _T_4 = bits(io.entry_wen, 1, 1) @[ct_ifu_l0_btb_entry.scala 72:43]
    node _T_5 = and(entry_clk_en, _T_4) @[ct_ifu_l0_btb_entry.scala 72:29]
    when _T_5 : @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_1 <= io.entry_update_ras @[ct_ifu_l0_btb_entry.scala 73:22]
    io.entry_ras <= entry_signal_1 @[ct_ifu_l0_btb_entry.scala 75:9]
    reg entry_signal_2 : UInt<1>, gatedclk.clk_out with :
      reset => (_T_1, UInt<1>("h0")) @[ct_ifu_l0_btb_entry.scala 71:33]
    node _T_6 = bits(io.entry_wen, 2, 2) @[ct_ifu_l0_btb_entry.scala 72:43]
    node _T_7 = and(entry_clk_en, _T_6) @[ct_ifu_l0_btb_entry.scala 72:29]
    when _T_7 : @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_2 <= io.entry_update_cnt @[ct_ifu_l0_btb_entry.scala 73:22]
    io.entry_cnt <= entry_signal_2 @[ct_ifu_l0_btb_entry.scala 75:9]
    reg entry_signal_3 : UInt<1>, gatedclk.clk_out with :
      reset => (_T_1, UInt<1>("h0")) @[ct_ifu_l0_btb_entry.scala 71:33]
    node _T_8 = bits(io.entry_wen, 3, 3) @[ct_ifu_l0_btb_entry.scala 72:43]
    node _T_9 = and(entry_clk_en, _T_8) @[ct_ifu_l0_btb_entry.scala 72:29]
    when _T_9 : @[ct_ifu_l0_btb_entry.scala 72:48]
      entry_signal_3 <= io.entry_update_vld @[ct_ifu_l0_btb_entry.scala 73:22]
    io.entry_vld <= entry_signal_3 @[ct_ifu_l0_btb_entry.scala 75:9]

