#include
"share/HATS\
/temptory_staload_bucs320.hats"

#staload "libats/SATS/gnum.sats"
#staload "libats/SATS/gord.sats"
#staload _ = "libats/DATS/gnum.dats"
#staload _ = "libats/DATS/gord.dats"

(*
fun
dotprod
(A: &(@[double][3]), B: &(@[double][3])) : double =
(
  A[0] * B[0] + A[1] * B[1] + A[2] * B[2]
)
*)

fun
{a:tflt}
dotprod3(A: &(@[a][3]), B: &(@[a][3])) : a = r0 where
{
  #symload * with g_mul
  #symload + with g_add
  val m0 = (A[0] * B[0]) : a
  val m1 = (A[1] * B[1]) : a
  val m2 = (A[2] * B[2]) : a
  val r0 = m0 + m1 + m2
}

(*
  // verbose alternative
  val m0 = g_mul<a>(A[0], B[0])
  val m1 = g_mul<a>(A[1], B[1])
  val m2 = g_mul<a>(A[2], B[2])
  val r2 = g_add<a>(g_add<a>(m0, m1), m2)
*)

implement main0() =
{
  var A0 = @[double][3](1.)
  var B0 = @[double][3](3.14)
  val R0 = dotprod3<double>(A0, B0)

  var A1 = @[int][3](1)
  var B1 = @[int][3](2)
  val R1 = dotprod3<int>(A1, B1)

  val cmp = g_cmp<double>(R0,g_todbl<int>(R1))

  val () = println!("R0 = A0 * B0 = ", R0)
  val () = println!("R1 = A1 * B1 = ", R1)
  val () = println!("R0 cmp R1 = ", cmp)
}
