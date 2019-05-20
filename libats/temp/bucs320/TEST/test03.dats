(* ****** ****** *)
(*
HX:
For testing divconq
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

#staload "./../SATS/divconq.sats"
#staload "./../DATS/divconq.dats"

(* ****** ****** *)

fun
fibonacci(n: int) =
(
divconq_solve<i><o>(n)
) where
{
//
typedef i = int
typedef o = int
//
implement
divconq_divide<i><o>
(x) =
g0ofg1($list1{i}(x-1, x-2))
implement
divconq_conquer_cmb<i><o>(x0, rs) =
(
r1 + r2
) where
{
val-cons(r1, rs) = rs
val-cons(r2, rs) = rs
}
//
implement
divconq_solve_opt<i><o> =
lam(x) =>
if x >= 2 then none_vt() else some_vt(x)
//
} (* where *) // end of [fibonacci]

(* ****** ****** *)

#define N 10

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

val () =
println!
("fibonacci(", N, ") = ", fibonacci(N))

(* ****** ****** *)

(* end of [test03.dats] *)
