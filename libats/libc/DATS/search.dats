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

#staload "libats/SATS/gint.sats"
#staload "libats/SATS/gptr.sats"
#staload "libats/SATS/array.sats"

(* ****** ****** *)

#staload "libats/SATS/print.sats"

(* ****** ****** *)

#staload "./../SATS/search.sats"

(* ****** ****** *)

#staload UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
lfind_libc
(k0, A0, asz, cmp) =
(
let
var asz = asz
in
$extfcall
( cptr(a)
, "atspre_lfind"
, addr@(k0), addr@(A0), addr@(asz), sizeof<a>, cmp)
end
)

(* ****** ****** *)

implement
{}(*tmp*)
hsearch_find(k0) =
hsearch(ENTRY_cons(k0), FIND)
implement
{a}(*tmp*)
hsearch_enter(k0, x0) =
hsearch(ENTRY_cons(k0, x0), ENTER)

(* ****** ****** *)

implement
{}(*tmp*)
hsearch_r_find
(k0, htab) = let
var
rval:
cptr(ENTRY)?
val
inez: int =
hsearch_r
(ENTRY_cons(k0), FIND, rval, htab)
in
if inez != 0 then rval else cptr0_null()
end // end of [hsearch_r_find]

(* ****** ****** *)

implement
{a}(*tmp*)
hsearch_r_enter
(k0, x0, htab) = let
var
rval:
cptr(ENTRY)?
val
inez: int =
hsearch_r
(ENTRY_cons(k0, x0), ENTER, rval, htab)
in
if inez != 0 then rval else cptr0_null()
end // end of [hsearch_r_enter]

(* ****** ****** *)

implement
{}(*tmp*)
htabref_create(nel) =
let
//
val
(pf0, fpf | p0) =
ptr1_alloc<hsearch_data>()
val inez = hcreate_r(nel, !p0)
//
(*
val
((*void*)) =
println!("htabref_create: p0 = ", p0)
val
((*void*)) =
println!("htabref_create: nel = ", nel)
val
((*void*)) =
println!("htabref_create: inez = ", inez)
val
((*void*)) =
(
$extfcall
(void, "perror", "htabref_create: errno = "); println!()
)
*)
//
in
if
(inez = 0)
then
let
val () =
ptr1_mfree
(fpf, $UN.topize_at(pf0) | p0)
in
optn0_vt_none()
end
else
optn0_vt_some($UN.castvwtp0((pf0, fpf | p0)))
end // end of [htabref_create]

(* ****** ****** *)
//
implement
{}(*tmp*)
htabref_destroy(htab) =
(
$UN.mfree($UN.cast{ptr}(htab))
) where
{
val () =
$extfcall(void, "atspre_hdestroy_r", htab)
} (* end of [htabref_destroy] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
htabref_find
(htab, k0) = let
//
val p0 = $UN.cast{ptr}(htab)
val (pf0, fpf | p0) =
$UN.ptr0_vtake{hsearch_data}(p0)
//
val cp0 = hsearch_r_find<>(k0, !p0)
//
in
  let prval () = fpf(pf0) in cp0 end
end // end of [htabref_find]

(* ****** ****** *)

implement
{a}(*tmp*)
htabref_enter
(htab, k0, x0) = let
//
val p0 = $UN.cast{ptr}(htab)
val (pf0, fpf | p0) =
$UN.ptr0_vtake{hsearch_data}(p0)
//
val cp0 =
  hsearch_r_enter<a>(k0, x0, !p0)
//
in
  let prval () = fpf(pf0) in cp0 end
end // end of [htabref_enter]

(* ****** ****** *)

implement
{}(*tmp*)
htabref_find_opt
(htab, k0) = let
//
val p0 = $UN.cast{ptr}(htab)
val (pf0, fpf | p0) =
$UN.ptr0_vtake{hsearch_data}(p0)
//
val cp0 = hsearch_r_find<>(k0, !p0)
//
in
let
prval () = fpf(pf0)
in
  if
  iseqz(cp0)
  then optn0_vt_none() else optn0_vt_some(cp0)
end
end // end of [htabref_find_opt]

implement
{a}(*tmp*)
htabref_enter_opt
(htab, k0, x0) = let
//
val p0 = $UN.cast{ptr}(htab)
val (pf0, fpf | p0) =
$UN.ptr0_vtake{hsearch_data}(p0)
//
val cp0 = hsearch_r_enter<a>(k0, x0, !p0)
//
in
let
prval () = fpf(pf0)
in
  if
  iseqz(cp0)
  then optn0_vt_none() else optn0_vt_some(cp0)
end
end // end of [htabref_enter_opt]

(* ****** ****** *)
//
implement
{}(*tmp*)
htabptr0_create
  (nel) =
  $UN.castvwtp0(htabref_create(nel))
implement
{}(*tmp*)
htabptr0_destroy
  (htab) =
  htabref_destroy($UN.castvwtp0(htab))
//
(* ****** ****** *)
//
implement
{}(*tmp*)
htabptr0_find
(htab, k0) =
(
  htabref_find($UN.castvwtp1(htab), k0)
)
implement
{}(*tmp*)
htabptr0_find_opt
(htab, k0) =
(
  htabref_find_opt($UN.castvwtp1(htab), k0)
)
//
implement
{a}(*tmp*)
htabptr0_enter
(htab, k0, x0) =
(
  htabref_enter($UN.castvwtp1(htab), k0, x0)
)
implement
{a}(*tmp*)
htabptr0_enter_opt
(htab, k0, x0) =
(
  htabref_enter_opt($UN.castvwtp1(htab), k0, x0)
)
//
(* ****** ****** *)

(* end of [search.dats] *)
