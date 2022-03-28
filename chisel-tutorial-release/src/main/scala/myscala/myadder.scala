package myscala

import chisel3._



class myIO(val n:Int) extends Bundle{
  val A = Input(UInt(n.W))
  val B = Input(UInt(n.W))
  val Cin = Input(UInt(1.W))
  val Sum = Output(UInt(n.W))
  val Cout = Output(UInt(1.W))
}

class adder() extends Module{
  val io = IO(new myIO(1))

  val a_xor_b = io.A ^ io.B
  io.Sum := a_xor_b ^ io.Cin

  io.Cout := (io.A&io.B) | io.Cin&a_xor_b //can not be +


}

class myadder(val n:Int) extends Module{
  val io = IO(new myIO(n))

  val Adders = Array.fill(n)(Module(new adder()).io)

  val temp = Wire(Vec(n+1, UInt(1.W)))
  val sum = Wire(Vec(n, Bool()))//why bool?

  temp(0) := io.Cin

  for (i <- 0 until n){
    Adders(i).A := io.A(i)
    Adders(i).B := io.B(i)
    Adders(i).Cin := temp(i)
    temp(i+1) := Adders(i).Cout
    sum(i) := Adders(i).Sum.asBool
  }


  io.Sum := sum.asUInt
  io.Cout := temp(n)

}