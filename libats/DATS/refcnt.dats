(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
(* Start time: July, 2013 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
// HX: For supporting ref-counted resourse.
// HX: This implementation does not support locked counting
//
(* ****** ****** *)
//
#staload
UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/print.sats"
#staload "./../SATS/refcnt.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
refcnt_print(rfc) =
let
val
(pf0,fpf|p0)
=
vtakeout(rfc)
in
print$val<a>(!p0); fpf(pf0)
end // end of [refcnt_print]
//
implement
(a:vtflt)
print$val<refcnt(a)>
(rfc) = refcnt_print<a>(rfc)
//
(* ****** ****** *)
//
implement
(a:vtflt)
gcopy$val<refcnt(a)>(x) = incref(x)
implement
(a:vtflt)
gfree$val<refcnt(a)>(x) = decref(x)
//
(* ****** ****** *)
//
datavtype
refcnt(a:vtflt) =
  | REFCNT(a) of (uint, a)
//
(* ****** ****** *)
//
absimpl
refcnt_vtflt_vtbox(a) = refcnt(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_make_elt(x0) = REFCNT(1u, x0)

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_get0_elt
  (rfc) = let
//
val+
@REFCNT(u, x) = rfc
//
in
//
if
u <= 1u
then let
  val r = x
  val () = free@(rfc) in r
end // end of [then]
else let
  val r =
  gcopy$val<a>(x)
  val () = u := pred(u)
  prval () = fold@(rfc)
  prval () = $UN.castvwtp0(rfc) in r
end // end of [else]
//
end // end of [refcnt_get0_elt]

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_get1_elt
  (rfc) = let
//
val+REFCNT(u, x) = rfc
//
in
  gcopy$val<a>(x)
end // end of [refcnt_get1_elt]

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_get1_cnt
  (rfc) = let
//
val+REFCNT(u, _) = rfc
//
in
  $UN.cast{Intgte(1)}(u)
end // end of [refcnt_get1_cnt]

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_incref
  (rfc) = let
//
val+
@REFCNT(u, _) = rfc
//
in
let
//
val () =
(u := succ(u))
//
prval () = fold@(rfc)
//
in
$UN.castvwtp1{refcnt(a)}(rfc)
end
end // end of [refcnt_incref]

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_decref
  (rfc) = let
//
val+@REFCNT(u, x) = rfc
//
in
//
if
(u <= 1u)
then
(
gfree$val<a>(x); free@(rfc)
)
else
{
//
val () =
(u := pred(u))
//
prval () = fold@(rfc)
prval () = $UN.castvwtp0(rfc)
//
} (* end of [else] *)
//
end // end of [refcnt_decref]

(* ****** ****** *)

implement
{a}(*tmp*)
refcnt_vtakeout
  (rfc) = res where
{
//
val+
@REFCNT(_, x) = rfc
val res =
$UN.castvwtp0(addr@x)
prval () = fold@(rfc)
//
} (* end of [refcnt_vtakeout] *)

(* ****** ****** *)

(* end of [refcnt.dats] *)
