(* ****** ****** *)
//
// HX-2019-05-05:
// For ATS-Temptory
//
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/print.sats"
#staload _ =
"libats/DATS/print.dats"
#staload _ =
"libats/DATS/stdio.dats"
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
fun
fact1
(x: int): int =
if x > 0 then x * fact1(x-1) else 1
fun
fact2
{i:nat}
(x: int(i)): int =
if x > 0 then x * fact2(x-1) else 1
//
(* ****** ****** *)
//
extern
val
fact1_of_10 : int
and
fact2_of_10 : int
implval fact1_of_10 = fact1(10)
implmnt fact2_of_10 = fact2(10)
//
val () =
(
  assertloc(fact1(10) = fact2(10))
)
//
val () =
println!("fact1(10) = ", fact1_of_10)
val () =
println!("fact2(10) = ", fact2_of_10)
//
(* ****** ****** *)

(* end of [test01.dats] *)
