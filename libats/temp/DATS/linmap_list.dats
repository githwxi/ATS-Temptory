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
(* Start time: December, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/list_vt.sats"

(* ****** ****** *)

#staload
"./../SATS/linmap_list.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#include "./SHARE/linmap.hats"

(* ****** ****** *)

absimpl
map_vtbox
(k0:vtflt,x0:vtflt) = list0_vt(@(k0, x0))

(* ****** ****** *)

implement
{}(*tmp*)
linmap_nil () = list0_vt_nil()
implement
{}(*tmp*)
linmap_make_nil () = list0_vt_nil()

(* ****** ****** *)

implement
{}(*tmp*)
linmap_iseqz(map) =
(
case+ map of
| list0_vt_nil _ => tt | list0_vt_cons _ => ff
)
implement
{}(*tmp*)
linmap_isneqz(map) =
(
case+ map of
| list0_vt_nil _ => ff | list0_vt_cons _ => tt
)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_size(map) = i2sz(list0_vt_length(map))

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_free(map) = list0_vt_free<(k0,x0)>(map)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_insert
(map, k0, x0, r0) =
let
//
vtypedef kx = @(k0, x0)
//
val
ans =
linmap_takeout<k0,x0>(map, k0, r0)
in
ans where
{
val () =
map := list0_vt_cons{kx}((k0, x0), map)
} (* end of [where] *)
end (* end of [linmap_insert] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_insert_any
(map, k0, x0) = let
//
vtypedef kx = @(k0, x0)
//
in
  map := list0_vt_cons{kx}((k0, x0), map)
end // end of [linmap_insert_any]

(* ****** ****** *)

(* end of [linmap_list.dats] *)
