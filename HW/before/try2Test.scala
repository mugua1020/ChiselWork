package examples
import chisel3.iotesters.{PeekPokeTester,Driver,ChiselFlatSpec}

//what Driver CFS?

class try2Test(c:hi) extends PeekPokeTester(c){
  //poke(c.io.data_in,3)
  //how can i use it
  //if i want a num?b or h
  val num = 3
  poke(c.io.data_in,num)
    //why?
}