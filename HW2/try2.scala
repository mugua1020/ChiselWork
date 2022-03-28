package examples

import chisel3._

class hi extends Module{
  val io = IO(new Bundle() {
    val data_in = Input(Vec(4,UInt(1.W)))
    val data_out = Output(Bool())
  })
  io.data_out := io.data_in.reduceLeft((x: UInt, y: UInt) => x + y).toBool()


}