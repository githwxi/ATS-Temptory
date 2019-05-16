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
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/array.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
array_get_at
  (A0, i) =
$UN.cptr0_get
(
$UN.cast{cptr(a)}(addr@A0)+i
)
implement
{a}(*tmp*)
array_set_at
  (A0, i, x) =
$UN.cptr0_set
(
$UN.cast{cptr(a)}(addr@A0)+i, x
)
//
implement
{a}(*tmp*)
array_getref_at
  (A0, i) =
  $UN.cast{cptr(a)}(addr@A0)+i
//
(* ****** ****** *)
//
implement
{}(*tmp*)
array_ptr_mfree
(pf1, pf2 | p0) =
let
prval () = $UN.cast2void(pf1)
prval () = $UN.cast2void(pf2)
in
  $extfcall(void, "ATS_MFREE", p0)
end // end of [array_ptr_mfree]
//
(* ****** ****** *)

implement
{a}(*tmp*)
array_ptr_alloc
  (asz) =
(
$UN.castvwtp0
(
  $extfcall
  (ptr, "ATS_MALLOC", asz*sizeof<a>)
)
) (* end of [array_ptr_alloc] *)

(* ****** ****** *)

implement
{a}(*tmp*)
array_permute
  (A, asz) = let
//
prval() = lemma_array_param(A)
//
fun
loop
{l:addr}{n:nat} .<n>.
(
pf: !array_v(a, l, n) | p0: ptr(l), nz: size(n)
) : void = let
//
(*
val () =
  println! ("array_permute: loop")
*)
//
in
//
if
nz >= 2
then let
//
  val i =
  array_permute$randint<>(nz)
  prval
  (pf1, pf2) = array_v_uncons(pf)
//
  val () =
  if i > 0 then
  $UN.ptr0_exch<a>
    (ptr0_add_size<a>(p0, i), !p0)
  // end of [if]
  val () =
  loop(pf2 | ptr1_succ<a>(p0), pred(nz))
//
  prval() = pf := array_v_cons(pf1, pf2)
in
  // nothing
end // end of [if]
//
end // end of [loop]
//
in
  loop(view@(A) | addr@(A), asz)
end // end of [array_permute]

(* ****** ****** *)

(* end of [array.dats] *)
