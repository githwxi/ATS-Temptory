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

extern
fun
{a:tflt}
mergesort(xs: list0(a)): list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
mergesort(xs) =
(
(
let
val xs = g1ofg0(xs)
val n0 = length(xs)
in
  msort(xs, n0)
end
) where
{
//
fun
msort
{n:int}
( xs
: list1(a, n), n0: int(n)) =
(
  divconq_solve<i><o>(@(xs, n0))
) where
{
  val xs = g0ofg1(xs) and n0 = n0
}
}
) where
{
//
typedef o = list0(a)
typedef i = (list0(a), int)
//
(*
fun
merge
( xs: list0(a)
, ys: list0(a)): list0(a) =
(
case+ xs of
| nil() => ys
| cons(x0, xs1) =>
  (
  case+ ys of
  | nil() => xs
  | cons(y0, ys1) =>
    if
    gcompare$val<a>(x0, y0) <= 0
    then cons(x0, merge(xs1, ys))
    else cons(y0, merge(xs, ys1))
  )
)
*)
//
implement
divconq_solve_opt<i><o>
  (inp) =
(
  if
  (inp.1 >= 2)
  then none_vt() else some_vt(inp.0)
)
//
implement
divconq_divide<i><o>
  (inp) = let
//
  val xs = inp.0
  val n0 = inp.1
//
  val ys =
  list0_take(xs, n0/2)
  val zs =
  list0_drop(xs, n0/2)
//
  val ys = list0_vt2t(ys)
//
in
  g0ofg1
  ($list1{i}((ys, n0/2), (zs, n0-n0/2)))
end
//
implement
divconq_conquer_cmb<i><o>
  (xs, rs) =
(
list0_vt2t
(list0_merge<a>(r1, r2))
) where
{
  val-cons(r1, rs) = rs
  val-cons(r2, rs) = rs
//
  implement
  list0_merge$choose<a>(x1, x2) = gcompare$val<a>(x1, x2)
//
}
//
} (* end of [mergesort] *)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

val xs =
$list1{int}
(0,3,2,1,5,9,8,3,4,5,7)
val xs = g0ofg1(xs)
val ys = mergesort<int>(xs)
val () = println!("xs = ", xs)
val () = println!("ys = ", ys)

(* ****** ****** *)

(* end of [test04.dats] *)
