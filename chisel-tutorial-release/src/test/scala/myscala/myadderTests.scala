package myscala

import chisel3.iotesters.{PeekPokeTester,Driver,ChiselFlatSpec}

class myadderTests(c: myadder) extends PeekPokeTester(c) {
  for (t <- 0 until (1 << (c.n + 1))) {
    val rnd0 = rnd.nextInt(1 << c.n)
    val rnd1 = rnd.nextInt(1 << c.n)
    val rnd2 = rnd.nextInt(2) //0 or 1, <2

    poke(c.io.A, rnd0)
    poke(c.io.B, rnd1)
    poke(c.io.Cin, rnd2)
    step(1)
    val rsum = rnd0 + rnd1 + rnd2
    //创建 bigint 的方式有两种：在一个整数字面量后面加 n 或者调用 BigInt 函数，该函数从字符串、数字等中生成 bigint。
    // const bigint = 1234567890123456789012345678901234567890n;
    //
    // const sameBigint = BigInt("1234567890123456789012345678901234567890");
    //
    // const bigintFromNumber = BigInt(10); // 与 10n 相同
    val mask = BigInt("1" * c.n, 2) //what 2?
    expect(c.io.Sum, rsum & mask) // why &?
    expect(c.io.Cout, ((1 << c.n) & rsum) >> c.n)     //binary?

  

  }
}

class myadderTester extends ChiselFlatSpec{
  behavior of "myadder"
  backends foreach{backend =>
    it should s"correctly add randomly generated numbers $backend" in {
      Driver(() => new myadder(8))(c => new myadderTests(c)) should be (true)
    }
  }
}

