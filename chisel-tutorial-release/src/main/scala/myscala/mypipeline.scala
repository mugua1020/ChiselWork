package myscala

import chisel3._

class mypipeline(val n:Int) extends Module{
  val io = IO(new Bundle() {
    val A = Input(UInt(n.W))
    val B = Input(UInt(n.W))
    val Cin = Input(UInt(1.W))
    val Sum = Output(UInt(n.W))
    val Cout = Output(UInt(1.W))
    val rdy_in = Input(UInt(1.W))// if it is ok?

    val vld_in = Input(UInt(1.W))
    val vld_out = Output(UInt(1.W))
  })



  val Adders = Array.fill(n)(Module(new adder()).io)


  //control path
  //and there are rdy_in from the next module as rdy(n-1)
  val rdy = Wire(Vec(n,UInt(1.W)))
  val ena = Wire(Vec(n,UInt(1.W)))
  val handshake = Wire(Vec(n,UInt(1.W)))
  val vld = RegInit(VecInit(Seq.fill(n)(false.B)))// my pipeline control,need vecinit!
  val vld_w = Wire(UInt(n.W))

  vld_w := vld.asUInt
  //rdy(n-1) := rdy_in   cannot add this sentence
  //vld(0) := vld_in
  //vld(n-1) := vld_out

  for(i <- 0 until n){


    if(i<n-1) {
      rdy(i) := ena(i + 1)
    }
    else
      {
        rdy(i) := io.rdy_in
      }//if it is ok?


    handshake(i) := rdy(i) & vld_w(i)

    ena(i) := handshake(i) | (!vld_w(i))//ok ! not ~

    if(i == 0)
      {

        vld(i) := io.vld_in

      }
    else {
      when(ena(i).asBool) {
        vld(i) := vld(i-1)
      }
    }

  }


  //my pipeline
  //are executed concurrently?

  //input data -> stage1
  val A_reg = RegInit(0.U(n.W))
  val B_reg = RegInit(0.U(n.W))


  val temp = RegInit(VecInit(Seq.fill(n+1)(0.U(1.W))))
  val sum = RegInit(VecInit(Seq.fill(n)(false.B)))//why bool?


  when(io.vld_in.asBool)
  {
    A_reg := io.A
    B_reg := io.B
    temp(0) := io.Cin
  }


//mypipeline


  for(i <- 0 until n)
    {
      Adders(i).A := A_reg(i)
      Adders(i).B := B_reg(i)
      Adders(i).Cin := temp(i)
      when(vld(i).asBool)//if ok?
      {

        temp(i+1) := Adders(i).Cout
        sum(i) := Adders(i).Sum.asBool
      }


    }

  io.Sum := sum.asUInt
  io.Cout := temp(n)
  io.vld_out := vld(n-1)
}