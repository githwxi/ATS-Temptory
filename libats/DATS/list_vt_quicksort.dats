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
#staload "./../SATS/gptr.sats"
#staload "./../SATS/array.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
list0_vt_quicksort$cmp
  (x1, x2) =
(
  gcompare$ref<a>(x1, x2)
) (* list_vt_quicksort$cmp *)
//
impltmp
{a}(*tmp*)
list0_vt_quicksort(xs) =
g0ofg1
(list1_vt_quicksort<a>(g1ofg0(xs)))
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
list1_vt_quicksort$cmp
  (x1, x2) =
(
  gcompare$ref<a>(x1, x2)
) // end of [list_vt_quicksort$cmp]

(* ****** ****** *)
(*
** HX-2012-05:
** (1) Copying a list into an array
** (2) Performing quicksort on the array
** (3) Copying it back into the list
*)
impltmp
{a}(*tmp*)
list1_vt_quicksort
  {n}(xs) = xs where
{
//
fun
copyouta
  {n:nat} .<n>.
( xs
: !list1_vt (a, n), p: ptr
) : void =
(
case+ xs of
| list1_vt_nil
    () => ((*void*))
| @list1_vt_cons
    (x, xs1) => let
    val () =
    $UN.ptr0_set<a>
    (p, $UN.ptr0_get<a>(addr@(x)))
    val () =
    copyouta(xs1, ptr0_succ<a>(p))
  in
    fold@ (xs)
  end // end of [list1_vt_cons]
) (* end of [copyouta] *)
//
fun
copyinto
{n:nat} .<n>.
( xs
: !list1_vt (a, n), p: ptr
) : void =
(
case+ xs of
| list1_vt_nil
    () => ((*void*))
| @list1_vt_cons
    (x, xs1) => let
    val () =
    $UN.ptr0_set<a>
    (addr@(x), $UN.ptr0_get<a>(p))
    val () =
    copyinto(xs1, ptr0_succ<a>(p))
  in
    fold@ (xs)
  end // end of [list1_vt_cons]
) (* end of [copyinto] *)
//
prval() =
lemma_list1_vt_param(xs)
//
val n0 = list1_vt_length<a>(xs)
//
val
[l:addr]
( pfat
, pfgc | p0) =
  array_ptr_alloc<a>(i2sz(n0))
//
extern
praxi
_outa_
(pf: !array_v(a?, l, n)
   >> array_v(a , l, n)): void
extern
praxi
_into_
(pf: !array_v(a , l, n)
   >> array_v(a?, l, n)): void
//
val () = copyouta (xs, p0)
//
prval () = _outa_(pfat)
  val () =
  (
  array_quicksort<a>(!p0, i2sz(n0))
  ) where
  {
  impltmp
  array_quicksort$cmp<a>
    (x1, x2) =
    list1_vt_quicksort$cmp<a>(x1, x2)
  } (* end of [val] *)
prval () = _into_(pfat)
//
val () = copyinto(xs, p0)
//
val () = array_ptr_mfree{a}(pfat, pfgc | p0)
//
} (* end of [list1_vt_quicksort] *)

(* ****** ****** *)

(* end of [list1_vt_quicksort.dats] *)
