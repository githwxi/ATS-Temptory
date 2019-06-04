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

#staload
"libats/temp/bucs320/SATS/mylist.sats"
#staload _ =
"libats/temp/bucs320/DATS/mylist.dats"

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
    list0_split$choose<int>(x0) = abs(x0%2)
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

val xs =
g0ofg1
($list1{int}(0,1,2,3))
val () =
println!
( "nchoose(xs) = "
, list0_vt2t(listize(list0_nchoose(xs, 2))))
val () =
println!
( "nchoose_rest(xs) = "
, list0_vt2t(listize(list0_nchoose_rest(xs, 2))))

(* ****** ****** *)

fun
{a:tflt}
permute
(xs: list(INV(a))): list(list(a)) =
(
if
iseqz(xs)
then sing(nil())
else
(
list0_mapjoin<t0><t1>
(
list0_vt2t
(listize(list0_nchoose_rest(xs, 1)))
)
) where
{
  typedef t0 =
  (list0(a), list0(a))
  typedef t1 = list0(a)
  impltmp
  list0_mapjoin$fopr<t0><t1>(t0) = list0_mcons(head(t0.0), permute(t0.1))
}
)
val xss =
permute<int>(0::1::2::3::nil{int}())
val ( ) =
println!("permute(0,1,2,3) = ", xss)

(* ****** ****** *)

(* end of [test25.dats] *)
