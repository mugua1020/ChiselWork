package c910.bpu

import chisel3._
import chisel3.util._
import chisel3.experimental._
import c910.common._

class ct_ifu_l0_btb_io extends Bundle {
val    addrgen_l0_btb_update_entry   = Input(UInt(16.W))
val          addrgen_l0_btb_update_vld     = Input(Bool())
val          addrgen_l0_btb_update_vld_bit = Input(Bool()) 
val    addrgen_l0_btb_wen            = Input(UInt(4.W))
val          cp0_ifu_btb_en                = Input(Bool())
val          cp0_ifu_icg_en                = Input(Bool())
val          cp0_ifu_l0btb_en              = Input(Bool())
val          cp0_yy_clk_en                 = Input(Bool())
val          cpurst_b                      = Input(Bool())
val          forever_cpuclk                = Input(Bool())
val          ibdp_l0_btb_fifo_update_vld   = Input(Bool())
val          ibdp_l0_btb_update_cnt_bit    = Input(Bool())
val    ibdp_l0_btb_update_data       = Input(UInt(37.W))
val    ibdp_l0_btb_update_entry      = Input(UInt(16.W))
val          ibdp_l0_btb_update_ras_bit    = Input(Bool())
val          ibdp_l0_btb_update_vld        = Input(Bool())
val          ibdp_l0_btb_update_vld_bit    = Input(Bool())
val    ibdp_l0_btb_wen               = Input(UInt(4.W))
val          ifctrl_l0_btb_inv             = Input(Bool())
val          ifctrl_l0_btb_stall           = Input(Bool())
val          ipctrl_l0_btb_chgflw_vld      = Input(Bool())
val          ipctrl_l0_btb_ip_vld          = Input(Bool())
val          ipctrl_l0_btb_wait_next       = Input(Bool())
val    ipdp_l0_btb_ras_pc            = Input(UInt(39.W))
val          ipdp_l0_btb_ras_push          = Input(Bool())
val          l0_btb_update_vld_for_gateclk = Input(Bool()) 
val          pad_yy_icg_scan_en            = Input(Bool())
val          pcgen_l0_btb_chgflw_mask      = Input(Bool())
val    pcgen_l0_btb_chgflw_pc        = Input(UInt(15.W))
val          pcgen_l0_btb_chgflw_vld       = Input(Bool())
val    pcgen_l0_btb_if_pc            = Input(UInt(39.W))
val    ras_l0_btb_pc                 = Input(UInt(39.W))
val    ras_l0_btb_push_pc            = Input(UInt(39.W))
val          ras_l0_btb_ras_push           = Input(Bool())
val l0_btb_debug_cur_state       = Output(UInt(2.W))
val l0_btb_ibdp_entry_fifo       = Output(UInt(16.W))
val l0_btb_ifctrl_chgflw_pc      = Output(UInt(39))
val l0_btb_ifctrl_chgflw_way_pred= Output(UInt(2)) 
val l0_btb_ifctrl_chglfw_vld     = Output(Bool())
val l0_btb_ifdp_chgflw_pc        = Output(UInt(39))
val l0_btb_ifdp_chgflw_way_pred  = Output(UInt(2))
val l0_btb_ifdp_counter          = Output(Bool())
val l0_btb_ifdp_entry_hit        = Output(UInt(16))
val l0_btb_ifdp_hit              = Output(Bool())
val l0_btb_ifdp_ras              = Output(Bool())
val l0_btb_ipctrl_st_wait        = Output(Bool())
}

val PC_WIDTH = 40

//parameter PC_WIDTH = 40;
//parameter IDLE     = 2'b01;
//parameter WAIT     = 2'b10;
//how can i do it?

class ct_ifu_l0_btb extends Module{
    val io = IO(new ct_ifu_l0_btb_io)

//==========================================================
//                 Read Enable Signal
//==========================================================
//1. Read enable

val l0_btb_rd           := io.cp0_ifu_btb_en
                          && io.cp0_ifu_l0btb_en
                          && !io.pcgen_l0_btb_chgflw_mask
                          && (io.pcgen_l0_btb_chgflw_vld 
                              || !io.ifctrl_l0_btb_stall)

val l0_btb_rd_tag := io.pcgen_l0_btb_chgflw_pc

withClockAndReset(io.forever_cpuclk,(~io.cpurst_b)){
    val l0_btb_rd_flop = Reg(UInt(1.W))
    l0_btb_rd_flop := RegNext(io.l0_btb_rd,0.U)
    
    // I don't know if it is ok
}

val entry_rd_hit = Seq.fill(16)(UInt(1.W))
val entry_tag   = Seq.fill(16)(UInt(15.W))
val entry_vld   = Seq.fill(16)(UInt(1.W))
entry_rd_hit.zip(entry_tag).zip(entry_vld).foreach(x => {x._1 := (l0_btb_rd_tag === x._2) && x._3 && !io.pcgen_l0_btb_chgflw_mask})

val l0_btb_update_data = Reg(UInt(37.W))
val l0_btb_update_vld_bit = Reg(UInt(1.W))
val bypass_rd_hit := (l0_btb_rd_tag == l0_btb_update_data(36:22))
                    && l0_btb_update_vld_bit && !pcgen_l0_btb_chgflw_mask


//only ib ras miss will cause bypass hit
val entry_bypass_hit = Seq.fill(16)(UInt(1.W))
entry_bypass_hit.zipWithIndex.foreach(x => {x._1 := bypass_rd_hit && ibdp_l0_btb_update_entry(x._2) })
val entry_hit := entry_rd_hit | entry_bypass_hit


withClockAndReset(io.forever_cpuclk, (~io.cpurst_b)){
    val entry_hit_flop = RegInit(UInt(16.w),0.U)
    when(l0_btb_rd){
        entry_hit_flop := entry_hit.UInt //ok?
    }.elsewhen(l0_btb_rd_flop && !ifctrl_l0_btb_stall){
        entry_hit_flop := entry_hit.UInt //why? forwhat?
    }.otherwise{
        entry_hit_flop := entry_hit_flop // if need?
    }
}

val x_l0_btb_pipe_clk = Module(new gated_clk_cell())
val l0_btb_pipe_clk = x_l0_btb_pipe_clk.io.clk_out
val l0_btb_pipe_en = io.cp0_ifu_btb_en && io.cp0_ifu_l0btb_en
  x_l0_btb_pipe_clk.io.clk_in      := io.forever_cpuclk
  x_l0_btb_pipe_clk.io.external_en := false.B
  x_l0_btb_pipe_clk.io.global_en   := io.cp0_yy_clk_en
  x_l0_btb_pipe_clk.io.local_en    := l0_btb_pipe_en
  x_l0_btb_pipe_clk.io.module_en   := io.cp0_ifu_icg_en
  x_l0_btb_pipe_clk.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en

val l0_btb_ras_pc = UInt((PC_WIDTH-1).W)
l0_btb_ras_pc := (ras_l0_btb_ras_push)//ib call
                ? ras_l0_btb_push_pc//ib ras
                : (ipdp_l0_btb_ras_push)//ip call
                ? ipdp_l0_btb_ras_pc//ip ras
                : ras_l0_btb_pc   //ras top
}

withClockAndReset(l0_btb_pipe_clk, (~io.cpurst_b)){
val ras_pc = RegInit(UInt(39.W),0.U)
when(l0_btb_rd || l0_btb_rd_flop){
    ras_pc := l0_btb_ras_pc
}.otherwise{
    ras_pc := ras_pc
}
}

//==========================================================
//                 Entry Hit Logic
//==========================================================
//Only when Counter == 1,L0 BTB can be hit