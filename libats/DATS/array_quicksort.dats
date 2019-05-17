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

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
(*
//
// HX-2013-04:
// Instead of employing advanced types, I happily
// ventured into the typeless territory of unsafe
// pointer arithmetic!
//
*)
(* ****** ****** *)
//
implement
{a}(*tmp*)
array_quicksort$cmp
  (x1, x2) =
(
  gcompare$ref<a> (x1, x2)
) (* array_quicksort$cmp *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_quicksort
  (A, asz) = let
//
#symload + with g0add_ptr_size
#symload - with g0sub_ptr_size
//
(* ****** ****** *)
//
fun
half
(n: size): size = n/2
//
fun
ptrcmp
(
  p1: ptr, p2: ptr
) : int = (sgn) where
{
//
val p1 = g1ofg0_ptr(p1)
val p2 = g1ofg0_ptr(p2)
//
val
(
  pf1, fpf1 | p1
) = $UN.ptr0_vtake{a}(p1)
val
(
  pf2, fpf2 | p2
) = $UN.ptr0_vtake{a}(p2)
//
val sgn = array_quicksort$cmp<a>(!p1, !p2)
//
prval () = fpf1(pf1)
prval () = fpf2(pf2)
//
} (* end of [ptrcmp] *)
//
fun
ptr0_intch
(p1: ptr, p2: ptr): void =
{
  val x1 = $UN.ptr0_get<a>(p1)
  val x2 = $UN.ptr0_get<a>(p2)
  val () = $UN.ptr0_set<a>(p1, x2)
  val () = $UN.ptr0_set<a>(p2, x1)
}
//
(* ****** ****** *)
(*
//
// HX-2013-04:
// move min to the start
// HX-2013-04:
// this is not a safe approach
// in case [cmp] is not transitive!
//
fun auxmin
(
  pa: ptr, p0: ptr, tsz: size
) : void = let
in
//
if
pa < p0
then let
  val p1 = p0 - tsz
  val
  sgn = ptrcmp(p1, p0)
  val () =
  if sgn > 0 then ptr0_intch(p1, p0)
in
  auxmin(pa, p1, tsz)
end (* end of [if] *)
//
end (* end of [auxmin] *)
*)
//
// HX: one round of insertion
//
fun auxins
(
  pa: ptr, p0: ptr, tsz: size
) : void = let
in
//
if pa < p0 then let
  val p1 = p0 - tsz
  val sgn = ptrcmp(p1, p0)
in
  if
  (sgn > 0)
  then let
    val () = ptr0_intch(p1, p0) in auxins(pa, p1, tsz)
  end // end of [if]
end else () // end of [if]
//
end (* end of [auxins] *)
//
// HX: all rounds of insertion
//
fun auxinss
(
  pa: ptr, pz: ptr, p0: ptr, tsz: size
) : void = let
in
//
if p0 < pz then let
  val () = auxins(pa, p0, tsz) in auxinss(pa, pz, p0 + tsz, tsz)
end // end of [if]
//
end (* end of [auxinss] *)

(* ****** ****** *)
//
// HX: insertion sorting
//
fun auxinsort
(
  pa: ptr, asz: size, tsz: size
) : void = let
  val pz = pa + asz * tsz
in
//
if
pa < pz
then let
  val () = auxinss(pa, pz, pa + tsz, tsz)
in
  (* nothing *)
end else () // end of [if]
//
end (* end of [auxinsort] *)

(* ****** ****** *)
//
// HX: locate the middle of 3
//
fun auxmid
(
  p1: ptr, p2: ptr, p3: ptr
) : ptr = let
  val sgn12 = ptrcmp(p1, p2)
in
//
if
sgn12 <= 0
then
(
  if
  ptrcmp(p2, p3) <= 0
  then p2 else (if ptrcmp(p1, p3) <= 0 then p3 else p1)
)
else
(
  if
  ptrcmp(p1, p3) <= 0
  then p1 else (if ptrcmp(p2, p3) <= 0 then p3 else p2)
) // end of [if]
end (* end of [auxmid] *)
//
// HX: pivot to the start
//
fun auxpivot
(
  pa: ptr, asz: size, tsz: size
) : void = let
//
val pm = auxmid
(
  pa, pa + half(asz) * tsz, pa + pred(asz) * tsz
) (* end of [val] *)
//
in
  ptr0_intch(pa, pm)
end (* end of [auxpivot] *)

(* ****** ****** *)
//
// HX-2013-04:
// Invariants:
// 1. elements in [pa, pl) <= pivot
// 2. elements in (pr, pz) >= pivot
//
fun auxsplit_l
(
  pa: ptr, pl: ptr, pr: ptr, tsz: size
) : ptr =
(
if
pl <= pr
then let
  val sgn = ptrcmp(pl, pa)
in
//
if sgn <= 0 then auxsplit_l(pa, pl + tsz, pr, tsz) else pl
//
end else pl // end of [if]
) (* end of [auxsplit_l] *)

fun auxsplit_r
(
  pa: ptr, pl: ptr, pr: ptr, tsz: size
) : ptr =
(
if
pl <= pr
then let
  val sgn = ptrcmp(pa, pr)
in
//
if sgn <= 0 then auxsplit_r(pa, pl, pr - tsz, tsz) else pr
//
end else pr // end of [if]
) (* end of [auxsplit_r] *)

fun auxsplit_lr
(
  pa: ptr, pl: ptr, pr: ptr, tsz: size
) : ptr = let
  val pl = auxsplit_l(pa, pl, pr, tsz)
  val pr = auxsplit_r(pa, pl, pr, tsz)
in
//
if
pl < pr
then
let
  val () = ptr0_intch(pl, pr)
in
  auxsplit_lr(pa, pl + tsz, pr - tsz, tsz)
end else pl (* end of [if] *)
//
end (* end of [auxsplit_lr] *)

(* ****** ****** *)

#define CUTOFF 12

(* ****** ****** *)
//
// HX: quick-sorting
//
fun
auxqsort
(
  pa: ptr, asz: size, tsz: size
) : void = let
in
//
if
asz <= CUTOFF
then
(
auxinsort(pa, asz, tsz)
)
else let
  val () =
  auxpivot(pa, asz, tsz)
  val pz = pa + asz * tsz
  val pm =
  auxsplit_lr
  (pa, pa + tsz, pz - tsz, tsz)
  val pn = pm - tsz
  val () = ptr0_intch(pa, pn)
  val
  asz_f =
  $UN.cast{size}(pn-pa) / tsz
  val asz_r = pred(asz - asz_f)
in
  if
  (asz_f <= asz_r)
  then let
    val () = auxqsort(pa, asz_f, tsz)
    val () = auxqsort(pm, asz_r, tsz)
  in
    // nothing
  end // end of [then]
  else let
    val () = auxqsort(pm, asz_r, tsz)
    val () = auxqsort(pa, asz_f, tsz)
  in
    // nothing
  end // end of [else]
end // end of [else]
//
end (* end of [auxqsort] *)

(* ****** ****** *)

in (* in of [let] *)
//
$effmask_all(auxqsort(addr@(A), asz, sizeof<a>))
//
end (* end of [array_quicksort] *)

(* ****** ****** *)

(*
//
// HX: [qsort] is in libc/stdlib
//
void qsort
(
  void *base, size_t nmemb, size_t size,
  int(*compar)(const void *, const void *)
) ; // end of [qsort]
*)
implement
{a}(*tmp*)
array_quicksort_stdlib
  (A, asz, cmp) = let
in
  $extfcall(void, "atspre_qsort", addr@(A), asz, sizeof<a>, cmp)
end (* end of [array_quicksort_stdlib] *)

(* ****** ****** *)

(* end of [array_quicksort.dats] *)
