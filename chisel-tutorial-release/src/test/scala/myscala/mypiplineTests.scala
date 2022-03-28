package myscala


import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3._

class mypipelineTests(c :mypipeline) extends PeekPokeTester(c){
  for (t <- 0 until (1 << (c.n + 1))) {
    val rnd0 = rnd.nextInt(1 << c.n)
    val rnd1 = rnd.nextInt(1 << c.n)
    val rnd2 = rnd.nextInt(2) //0 or 1, <2

    //poke (c.io.vld_in,0)
    //step(2*c.n)
    poke(c.io.vld_in, 1)
    poke(c.io.rdy_in,1)
    poke(c.io.A, rnd0)
    poke(c.io.B, rnd1)
    poke(c.io.Cin, rnd2)




    step(2*c.n)//if it ok?
    val rsum = rnd0 + rnd1 + rnd2
    val mask = BigInt("1" * c.n, 2)

  //  if(c.io.vld_out.toInt != 1)
  //    {
  //      step(1)
  //    }
  //  else
  //    {
  //      expect(c.io.Sum, rsum & mask)
  //      expect(c.io.Cout, ((1 << c.n) & rsum) >> c.n)
  //    }

    expect(c.io.Sum, rsum & mask) // why &?
    expect(c.io.Cout, ((1 << c.n) & rsum) >> c.n)     //binary?
  }
}

class mypipelineTester extends ChiselFlatSpec{
  behavior of "mypipeline"
  backends foreach {backend =>
    it should s"correct ! $backend" in{
      Driver(() => new mypipeline(8))(c => new mypipelineTests(c)) should be (true)
    }
  }
}