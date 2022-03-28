package mytry

import scala.util._
import chisel3.iotesters._

class Try1Test(c:mypipeline_try1) extends PeekPokeTester(c) {
  val randNum = new Random
  for (i <- 0 until 10) {
    val a = randNum.nextInt(1 << c.pipe_n * c.adder_n)
    val b = randNum.nextInt(1 << c.pipe_n * c.adder_n)

  //  val a = randNum.nextInt(1 << 2)
  //  val b = randNum.nextInt(1 << 2)
    val cin = randNum.nextInt(1)
    poke(c.io.try1_io.A, a)
    poke(c.io.try1_io.B, b)
    poke(c.io.try1_io.Cin, cin)
    poke(c.io.vld_in, 1)
    poke(c.io.rdy_in, 1)

    step(1)
    peek(c.io.try1_io.Sum)
    peek(c.io.try1_io.Cout)
    peek(c.io.rdy_out)
    peek(c.io.vld_out)
    //peek(c.io.myout)
   // peek(c.temp(0))
   // peek(c.temp(1))
    //peek(c.Adders(0).A)
    //peek(c.Adders(0).B)
    //peek(c.Adders(1).Sum)
    //peek(c.Adders(1).Cout)

  }
}
object Try1TestGen extends App {
  Driver.execute(args,()=>
    new mypipeline_try1(adder_n = 2,pipe_n = 4))(c =>
    new Try1Test(c))

}

//test:runMain mytry.Try1TestGen -td ./generated/addertest --is-verbose

//have another try
