package mytry

import chisel3._
import scala.collection.mutable._
import chisel3.util._
//import scala.collection.immutable
//import chisel3.internal.InternalDontCare.:=
//import myscala.{adder, myIO}





class myIO(val n:Int) extends Bundle{
  val A = Input(UInt(n.W))
  val B = Input(UInt(n.W))
  val Cin = Input(UInt(1.W))
  val Sum = Output(UInt(n.W))
  val Cout = Output(UInt(1.W))
}

class adder(val n:Int) extends Module{
  val io = IO(new myIO(n))
  val temp = Wire(UInt((n+1).W))
   temp := io.A +& io.B + io.Cin//+& !!
  io.Sum := temp(n-1,0)
  io.Cout := temp(n)
}

class mypipeline_try1(val adder_n:Int , val pipe_n:Int ) extends Module {
  val io = IO(new Bundle() {
    //   val A = Input(UInt(n.W))
    //   val B = Input(UInt(n.W))
    //   val Cin = Input(UInt(1.W))
    //   val Sum = Output(UInt(n.W))
    //   val Cout = Output(UInt(1.W))
    val rdy_in = Input(UInt(1.W)) // if it is ok?
    val rdy_out = Output(UInt(1.W)) //i think there need one buffer
    val vld_in = Input(UInt(1.W))
    val vld_out = Output(UInt(1.W))
    //val try1_io = Vec(pipe_n,new myIO(adder_n))  //cannot
    val try1_io = new myIO(adder_n * pipe_n)
  //  val myout = Output(UInt((adder_n*pipe_n).W))

  })



  val Adders = Array.fill(pipe_n)(Module(new adder(adder_n)).io)

  // control path
  val rdy = io.rdy_in //can not
  // var try_it = Wire(Bool) //use var
  //try_it = io.rdy_in //try it
  val vld = RegInit(VecInit(Seq.fill(pipe_n)(false.B)))
  val handshake = Wire(Vec(pipe_n, UInt(1.W))) //cannot be bool?
  val fresh = Wire(Vec(pipe_n, UInt(1.W)))
  // val vld_init = RegInit(false.B)

  io.rdy_out := rdy

  handshake := vld.map(i => (i.asUInt() & io.rdy_in)) //cannot be &&
  //ok Seq?  var??
  fresh := handshake.zip(vld).map { case (h, v) => h | !v }
  // fresh := handshake.zip(vld).map((i => i._1 | !i._2))
  for (i <- 0 until pipe_n) {

    when(fresh(i).asBool) {
      if (i != 0)
        vld(i) := vld(i - 1)
      else
        vld(i) := io.vld_in
    }.otherwise {
      vld(i) := vld(i)
    }

  }

  // not use the parameterized ?
val A_reg = ArrayBuffer[UInt]()
  val B_reg = ArrayBuffer[UInt]()
  val S_reg = ArrayBuffer[UInt]()
  for(i <- 0 until pipe_n-1)
    {
      A_reg += RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))).asUInt())
      B_reg += RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))).asUInt())
      RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))).asUInt()) +=: S_reg
    }
  val temp = RegInit(VecInit(Seq.fill(pipe_n-1)(0.U(1.W))))

 // io.myout := Cat(S_reg(2)(adder_n-1,0),S_reg(1)(adder_n-1,0),S_reg(0)(adder_n-1,0),Adders(0).Sum)



//  Adders(0).A := io.try1_io.A(adder_n - 1, 0)
//  Adders(0).B := io.try1_io.A(adder_n-1,0)
//  Adders(0).Cin := io.try1_io.Cin(adder_n-1,0)
   when(io.vld_in.asBool) {
     Adders(0).A := io.try1_io.A(adder_n - 1, 0)
     Adders(0).B := io.try1_io.B(adder_n-1,0)
     Adders(0).Cin := io.try1_io.Cin
     A_reg(0) := io.try1_io.A(pipe_n*adder_n-1,adder_n) // hope you are ok
     B_reg(0) := io.try1_io.B(pipe_n*adder_n-1,adder_n)
    temp(0) := Adders(0).Cout
     S_reg(0) := Adders(0).Sum
   }.otherwise
  {
    Adders(0).A := 0.U
      Adders(0).B := 0.U
      Adders(0).Cin := 0.U
  }

  for(i<- 0 until pipe_n-1)
    {

      Adders(i+1).A := A_reg(i)(adder_n-1,0)
      Adders(i+1).B := B_reg(i)(adder_n-1,0)
      Adders(i+1).Cin := temp(i)
      when(vld(i))
      {
      //  Adders(i+1).A := A_reg(i)(adder_n-1,0)
      //  Adders(i+1).B := B_reg(i)(adder_n-1,0)
      //  Adders(i+1).Cin := temp(i)
        if(i<pipe_n-2)
          {
            A_reg(i+1) := A_reg(i)((pipe_n-1-i)*adder_n-1,adder_n)
            B_reg(i+1) := B_reg(i)((pipe_n-1-i)*adder_n-1,adder_n)
            temp(i+1) := Adders(i+1).Cout
            S_reg(i+1) := Cat(Adders(i+1).Sum,S_reg(i))
          }
        else
          {

          }

      }.otherwise
      {

      }

    }


  //io.vld_out := vld(pipe_n-1)
  val Cout_reg = RegInit(0.U(1.W))
  val Sum_reg = RegInit(0.U((pipe_n*adder_n).W))
//    when(vld(pipe_n-1)) {
//       Cout_reg := Adders(pipe_n-1).Cout
//       Sum_reg := Cat(Adders(pipe_n-1).Sum,S_reg(pipe_n-2))
//  }.otherwise{
//
//    }

  Cout_reg := Adders(pipe_n-1).Cout
  Sum_reg := Cat(Adders(pipe_n-1).Sum,S_reg(pipe_n-2))
  io.vld_out := vld(pipe_n-1)
when(vld(pipe_n-1))
  {

    io.try1_io.Sum := Sum_reg
    io.try1_io.Cout := Cout_reg
  }.otherwise{
  io.try1_io.Cout := 0.U
  io.try1_io.Sum := 0.U
}



//when(vld(pipe_n-1)){
//    io.vld_out := vld(pipe_n-1)
//    io.try1_io.Cout := Adders(pipe_n-1).Cout
//    io.try1_io.Sum := Cat(Adders(pipe_n-1).Sum,S_reg(pipe_n-2)
//  }.otherwise{
//      io.try1_io.Cout := 0.U
//        io.try1_io.Sum := 0.U
//    }

//  io.vld_out := vld(pipe_n-1)
//  io.try1_io.Cout := Adders(pipe_n-1).Cout
//  io.try1_io.Sum := Cat(Adders(pipe_n-1).Sum,S_reg(pipe_n-2))

}



  //my pipeline
//  var A_reg(pipe_n-1)
//  for (i<- 0 until pipe_n-1)
//    {
//      val  = RegInit(VecInit(Seq.fill(pipe_n-1-i)(0.U(adder_n.W))))
//      val B_reg = RegInit(VecInit(Seq.fill(pipe_n-1-i)(0.U(adder_n.W))))
//    }

//  val A_reg = List()
//for(i<- 0 until pipe_n-1) {
//  val x = RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))))
//  A_reg :+ x
//}
//val B_reg = List()
//  for(i<- 0 until pipe_n-1) {
//    val x = RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))))
//    B_reg :+ x
//  }
//
//  val S_reg = List()
//  for(i<- 0 until pipe_n-1){
//    val x = RegInit(VecInit(Seq.fill(pipe_n - 1 - i)(0.U(adder_n.W))))
//    x +: S_reg
//  }
//
//val temp = RegInit(VecInit(Seq.fill(pipe_n)(0.U(1.W))))
//
//
//
//  when(io.vld_in.asBool)
//  {
//    Adders(0).A := io.try1_io.A(adder_n-1,0)
//    Adders(0).B := io.try1_io.A(adder_n-1,0)
//    Adders(0).Cin := io.try1_io.Cin(adder_n-1,0)
//    immutable.List(A_reg)(0) := io.try1_io.A(pipe_n*adder_n-1,adder_n)
//
//
//
//
//  }.otherwise{
//
//  }
//
//
//
//}
  //my pipeline
//  val A_reg = RegInit(VecInit(Seq.fill(pipe_n)(0.U(adder_n.W))))
//  val B_reg = RegInit(VecInit(Seq.fill(pipe_n)(0.U(adder_n.W))))

//  val temp = RegInit(VecInit(Seq.fill(pipe_n + 1)(0.U(1.W))))
//  val sum = RegInit(VecInit(Seq.fill(pipe_n)(0.U(adder_n.W))))

////  when(io.vld_in.asBool()) {
////    A_reg := io.try1_io.A
////    B_reg := io.try1_io.B
////    temp(0) := io.try1_io.Cin
//  when(io.vld_in.asBool){
//    for(i<- 0 until pipe_n) {
//      {
//        A_reg(i) := io.try1_io.A(i*adder_n+adder_n-1,i*adder_n)
//        B_reg(i) := io.try1_io.B(i*adder_n+adder_n-1,i*adder_n)
//      }
//
//  } temp(0) := io.try1_io.Cin
//     // vld_init := io.vld_in
//  }.otherwise
//  {
//    A_reg := 0.U
//    B_reg := 0.U
//    temp(0) := 0.U
//  }

//  for (i <- 0 until pipe_n) {
//    Adders(i).A := A_reg(i)
//    Adders(i).B := B_reg(i)
//    Adders(i).Cin := temp(i)
//    when(vld(i)) //if ok?
//    {

//      temp(i + 1) := Adders(i).Cout
//      sum(i) := Adders(i).Sum
//    }.otherwise
//    {
//
//    }
//  }

// // io.try1_io.Sum := sum.asUInt// important!
// // io.try1_io.Cout := temp(pipe_n)
//  io.vld_out := vld(pipe_n-1)
//  when(io.vld_out.asBool)
//  {
//    io.try1_io.Sum := sum.asUInt// important!
//     io.try1_io.Cout := temp(pipe_n)
//  }.otherwise
//  {
//    io.try1_io.Sum := 0.U
//    io.try1_io.Cout := 0.U
//  }
//}


