(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
list0_vt_mergesort(xs) =
g0ofg1
(
list1_vt_mergesort<a>(g1ofg0(xs))
) where
{
impltmp
list1_vt_mergesort$fcmp<a>
(x1, x2) =
list0_vt_mergesort$fcmp<a>(x1, x2)
}
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_vt_mergesort$fcmp
  (x1, x2) =
(
  gcompare$ref<a>(x1, x2)
) // end of [list0_vt_mergesort$fcmp]
impltmp
{a}(*tmp*)
list1_vt_mergesort$fcmp
  (x1, x2) =
(
  gcompare$ref<a>(x1, x2)
) // end of [list0_vt_mergesort$fcmp]

(* ****** ****** *)
//
extern
fun
{a:vtflt}
list1_vt_insort
{n:int}(xs: list1_vt(a, n)): list1_vt(a, n)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
list1_vt_insort
  (xs) =
(
let
var ys: ptr?
val () =
ys := list1_vt_nil{a}() in loop(xs, ys); ys
end
) where
{
//
fun
insord
{l0,l1,l2:addr}{n:nat} .<n>.
(
  pf1: a @ l1
, pf2: list1_vt(a, 0)? @ l2
| xs0: &list1_vt(a, n) >> list1_vt(a, n+1)
, nx0: list1_vt_cons_unfold(l0, l1, l2), p1: ptr(l1), p2: ptr(l2)
) : void =
(
case+ xs0 of
| @list1_vt_cons
    (x0, xs1) => let
    val
    sgn =
    list1_vt_mergesort$fcmp<a> (x0, !p1)
  in
    if
    (sgn <= 0)
    then let
      val () =
      insord
      (pf1, pf2 | xs1, nx0, p1, p2)
    prval () = fold@ (xs0)
    in
      // nothing
    end // end of [then]
    else let
    prval () = fold@ (xs0)
      val () = (!p2 := xs0; xs0 := nx0)
    prval () = fold@ (xs0)
    in
      // nothing
    end // end of [else]
  end // end of [list1_vt_cons]
| ~list1_vt_nil () =>
  {
    val () = xs0 := nx0
    val () = !p2 := list1_vt_nil(); prval () = fold@(xs0)
  }
) (* end of [insord] *)
//
fun
loop{m,n:nat} .<m>.
( xs: list1_vt(a, m)
, ys: &list1_vt(a, n) >> list1_vt(a, m+n)
) : void =
(
case+ xs of
| ~list1_vt_nil
    ((*void*)) => ()
| @list1_vt_cons
    (x, xs1) => let
    val xs1_ = xs1
    val ((*void*)) =
      insord (view@x, view@xs1 | ys, xs, addr@x, addr@xs1)
    // end of [val]
  in
    loop (xs1_, ys)
  end // end of [list1_vt_cons]
) (* end of [loop] *)
//
prval () =
lemma_list1_vt_param{a}(xs)
//
} (* end of [list1_vt_insort] *)
//
(* ****** ****** *)

#define CUTOFF 12

(* ****** ****** *)

impltmp
{a}(*tmp*)
list1_vt_mergesort
  {n}(xs) = let
//
fun
half
{n:nat}
(n: int(n)): int(n/2) = n/2
//
fun
split
{n,n1:int |
 n >= n1; n1 >= 0} .<n1>.
(
  xs: &list1_vt(a, n) >> list1_vt(a, n1)
, n1: int n1, res: &ptr? >> list1_vt(a, n-n1)
) : void = let
in
//
if n1 > 0 then let
  val+
  @list1_vt_cons(_, xs1) = xs
  val () = split(xs1, n1-1, res)
in
  fold@ (xs)
end else let
  val () = (res := xs)
  val () = (xs := list1_vt_nil()) in // nothing
end // end of [if]
//
end // end of [split]
//
fun
merge
{n1,n2:nat} .<n1+n2>.
(
  xs1: list1_vt(a, n1)
, xs2: list1_vt(a, n2)
, res: &ptr? >> list1_vt(a, n1+n2)
) : void =
(
case+ xs1 of
| ~list1_vt_nil
    ((*void*)) => (res := xs2)
   // list1_vt_nil
| @list1_vt_cons
    (x1, xs11) =>
  (
    case+ xs2 of
    | ~list1_vt_nil
        ((*void*)) =>
        (fold@ (xs1); res := xs1)
    | @list1_vt_cons
        (x2, xs21) => let
        val sgn =
          list1_vt_mergesort$fcmp<a> (x1, x2)
        // end of [val]
      in
        if sgn <= 0 then let
            val () = res := xs1
          prval () = fold@{a}(xs2)
            val () = merge (xs11, xs2, xs11)
          prval () = fold@{a}(res)
        in
          // nothing
        end else let
            val () = res := xs2
          prval () = fold@{a}(xs1)
            val () = merge (xs1, xs21, xs21)
          prval () = fold@{a}(res)
        in
          // nothing
        end // end of [if]
      end // end of [list1_vt_cons]
  ) // end of [list1_vt_cons]
) (* end of [merge] *)
//
fun
msort{n:nat} .<n>.
(
xs: list1_vt(a, n), n: int(n)
) : list1_vt(a, n) =
(
if
n >= CUTOFF
then let
  val n1 = half(n+1)
  val+
  @list1_vt_cons (_, xs1) = xs
  var res: ptr? // uninitialized
  val () = split (xs1, n1-1, res)
  prval () = fold@ (xs)
  val xs1 = msort (xs, n1)
  and xs2 = msort (res, n-n1)
  val () = merge (xs1, xs2, res)
in
  res
end // end of [then]
else list1_vt_insort<a> (xs)
) (* end of [msort] *)
//
prval () = lemma_list1_vt_param(xs)
//
in
  msort (xs, list1_vt_length<a>(xs))
end // end of [list1_vt_mergesort]

(* ****** ****** *)

(* end of [list_vt_mergesort.dats] *)
