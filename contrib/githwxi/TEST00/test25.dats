(* ****** ****** *)
//
// HX-2019-05-29:
// For ATS-Temptory
//
(* ****** ****** *)
%{^
#include <time.h>
%} (* %{^ *)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

val () =
$extfcall
( void
, "srand"
, $extfcall(uint, "time", 0)
)

(* ****** ****** *)

val () =
(
assertloc
(xs = reverse(reverse(xs)))
) where
{
  val xs = list0_rand<int>()
}

(* ****** ****** *)

val () =
(
assertloc
(
revapp(xs, ys)
=
append(reverse(xs), ys)
)
) where
{
  val xs = list0_rand<int>()
  val ys = list0_rand<int>()
}

(* ****** ****** *)

val () =
(
assertloc
(
append(xs, append(ys, zs))
=
append(append(xs, ys), zs)
)
) where
{
  val xs = list0_rand<int>()
  val ys = list0_rand<int>()
  val zs = list0_rand<int>()
}

(* ****** ****** *)

val () =
(
assertloc
(
reverse(append(xs, ys))
=
append(reverse(ys), reverse(xs))
)
) where
{
  val xs = list0_rand<int>()
  val ys = list0_rand<int>()
}

(* ****** ****** *)

val () =
(
assertloc
(
reverse(extend(xs, x0))
=
list0_cons(x0, reverse(xs))
)
) where
{
  val x0 = sint_rand<>()
  val xs = list0_rand<int>()
}

(* ****** ****** *)

val () =
(
assertloc
(
reverse(concat(xss)) = concat(reverse(yss))
)
) where
{
  val xss =
  list0_rand<list0(int)>()
(*
  val ( ) =
  println!
  ("|xss| = ", length(xss))
*)
  val yss = list0_map<xs><ys>(xss) where
  {
  typedef xs = list0(int)
  typedef ys = list0(int)
  implate
  list0_map$fopr<xs><ys>(xs) = reverse(xs)
  }
}

(* ****** ****** *)

val () =
(
assertloc
(
mergesort(xs) =
list0_vt2t(mergesort(append(ys, zs)))
)
) where
{
  val xs =
  list0_rand<int>()
  val (ys, zs) =
  (
    list0_split(xs)
  ) where
  {
    implate
    list0_split$choose<int>(x0) = abs(x0 % 2)
  }
(*
  val () = println!("ys = ", ys)
  val () = println!("zs = ", zs)
*)
  val-true =
  (
  list0_vt_forall1(ys)
  ) where
  {
  implate list0_vt_forall1$test<int>(y0) = (y0%2 = 0)
  }
  val-true =
  (
  list0_vt_forall1(zs)
  ) where
  {
  implate list0_vt_forall1$test<int>(z0) = (z0%2 != 0)
  }
}

(* ****** ****** *)

(* end of [test25.dats] *)
