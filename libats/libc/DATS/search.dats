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
{}(*tmp*)
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
{}(*tmp*)
hsearch_r_enter
(k0, x0, htab) = let
var
rval:
cptr(ENTRY)?
val
inez: int =
hsearch_r
(ENTRY_cons(k0), ENTER, rval, htab)
in
if inez != 0 then rval else cptr0_null()
end // end of [hsearch_r_enter]

(* ****** ****** *)

(* end of [search.dats] *)
