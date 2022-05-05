package c910.bpu

import chisel3._
import chisel3.util._
import chisel3.experimental._
import c910.common._
import c910.common.Constants._
import c910.common.Config._

class IpCtrlBhtBundle extends Bundle with HasGatedClkEn with ConBr with HasConBrVld {
  val more_br = Bool()
  val vld     = Bool()
}

class IfCtrlBhtBundle extends Bundle {
  val inv      = Bool()
  val pipedown = Bool()
  val stall    = Bool() 
}

class LbufBhtBundle extends Bundle with ConBr with HasConBrVld {
  val active_state = Bool()
}

class IuIfuBhtBundle extends Bundle {
  val check_vld    = Bool()
  val condbr_taken = Bool()
  val pred         = Bool()
  val chgflw_vld   = Bool()
  val chk_idx      = UInt(25.W)
  val cur_pc       = UInt(PC_WIDTH.W)
}

class PcgenBhtBundle extends Bundle {
  val chgflw = Bool()
  val chgflw_short = Bool()
  val ifpc = UInt(7.W)
  val pcindex = UInt(10.W)
  val seq_read = Bool()
}

class DualCondBr extends Bundle {
  val condbr = Bool()
  val condbr_taken = Bool()
}

class RtuIfuBundle extends Bundle {
  val flush = Bool()
  val retire = Vec(3, new DualCondBr)
}

class BhtIndBtbBundle extends Bundle {
  val rtu_ghr = UInt(8.W)
  val vghr    = UInt(8.W)
}

class BhtIpdpBundle extends Bundle {
  val pre_array_data_ntake = UInt(WORD_WIDTH.W)
  val pre_array_data_taken = UInt(HWORD_WIDTH.W)
  val pre_offset_onehot    = UInt(16.W)
  val sel_array_result     = UInt(2.W)
  val vghr                 = UInt(22.W)
}

class BhtLbufBundle extends Bundle {
  val pre_ntaken_result = Bool()
  val pre_taken_resutl  = Bool()
}

class ct_ifu_bht extends Module {
  val io = IO(new Bundle {
    // Input
    val cp0                = Input(new Cp0IfuCtrlBundle)
    val cpurst_b           = Input(Bool())
    val forever_cpuclk     = Input(Clock())
    val ifctrl_bht         = Input(new IfCtrlBhtBundle)
    val ipctrl_bht         = Input(new IpCtrlBhtBundle)
    val ipdp_bht_h0_con_br = Input(Bool())
    val ipdp_bht_vpc       = Input(Bool())
    val iu_ifu             = Input(new IuIfuBundle)
    val lbuf_bht           = Input(new LbufBhtBundle)
    val pad_yy_icg_scan_en = Input(Bool())
    val pc_gen_chgflw      = Input(Bool())
    val pcgen_bht          = Input(new PcgenBhtBundle)
    val rtu_ifu            = Input(new RtuIfuBundle)
    // Output
    val bht_ind_btb        = Output(new BhtIndBtbBundle)
    val bht_ipdp           = Output(new BhtIpdpBundle)
    val bht_lbuf           = Output(new BhtLbufBundle)
  })
  
  private def genLocalGatedClk(local_en: Bool): Clock = {
    val _gated_clk_cell = Module(new gated_clk_cell)
    val clk_out = _gated_clk_cell.io.clk_out
    _gated_clk_cell.io.clk_in      := io.forever_cpuclk
    _gated_clk_cell.io.external_en := false.B
    _gated_clk_cell.io.global_en   := io.cp0.yy_clk_en
    _gated_clk_cell.io.local_en    := local_en
    _gated_clk_cell.io.module_en   := io.cp0.ifu_icg_en
    _gated_clk_cell.io.pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    clk_out
  }
  
}

object ct_ifu_bht {
  def doubleWidth(x: UInt): UInt = {
    val vec = Vec(2 * x.getWidth, UInt(1.W))
    for(i <- 0 until vec.length) {
      vec(i) := x(i / 2)
    }
    vec.asUInt
  }
}