(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// HX: shared by linmap_list
(*
// HX: shared by linmap_listord
*)
// HX: shared by linmap_avltree
// HX: shared by linmap_randbst
// HX: shared by linmap_skiplst
//
(* ****** ****** *)
//
absvtbox
map_vtbox
(k0:vtflt, x0:vtflt+) = ptr
vtypedef
map(k0:vtflt,x0:vtflt) = map_vtbox(k0, x0)
//
(* ****** ****** *)
//
fun
{k0:vtflt}
equal_key_key(k1: !k0, k2: !k0):<> bool
fun
{k0:vtflt}
compare_key_key(k1: !k0, k2: !k0):<> sint
//
(* ****** ****** *)
//
fun{}
linmap_nil{k0,x0:vtflt}(): map(k0, x0)
fun{}
linmap_make_nil{k0,x0:vtflt}(): map(k0, x0)
//
(* ****** ****** *)
//
fun{}
linmap_iseqz
{k0,x0:vtflt}(map: !map(k0, INV(x0))): bool
fun{}
linmap_isneqz
{k0,x0:vtflt}(map: !map(k0, INV(x0))): bool
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
linmap_size(map: !map(k0, INV(x0))): size
fun
{k0,x0:vtflt}
linmap_length(map: !map(k0, INV(x0))): Intgte(0)
//
(* ****** ****** *)

fun
{k0,x0:vtflt}
linmap_search
( map
: !map(k0, INV(x0))
, k0: !k0, r0: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) (*found*) // endfun

fun
{k0,x0:vtflt}
linmap_search_ref
(map: !map(k0, INV(x0)), k0: !k0): cptr0(x0)
// end of [linmap_search_ref]

fun
{k0,x0:vtflt}
linmap_search_opt
(map: !map(k0, INV(x0)), k0: !k0): optn0_vt(x0)
// end of [linmap_search_opt]

(* ****** ****** *)
//
// HX-2012-12:
// if [k0] occurs in [map], [x0] replaces the
// item associated with [k0] in [map] while the
// item is stored in [res] instead.
//
fun
{k0,x0:vtflt}
linmap_insert
( map
: &map(k0, INV(x0)) >> _
, k0: k0, x0: x0, res: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) // endfun
fun
{k0,x0:vtflt}
linmap_insert_opt
( map
: &map(k0, INV(x0)) >> _, k0: k0, x0: x0): optn0_vt(x0)
// end of [linmap_insert_opt]
//
(* ****** ****** *)
//
// HX-2012-12:
// insertion always happens regardless whether
// [k0] is associated with some item in [map]
//
fun
{k0,x0:vtflt}
linmap_insert_any
(map: &map(k0, INV(x0)) >> _, k0: k0, x0: x0): void
// end of [linmap_insert_any]
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
linmap_remove
(map: &map(k0, INV(x0)) >> _, k0: !k0): bool
//
fun
{k0,x0:vtflt}
linmap_takeout
( map
: &map(k0, INV(x0)) >> _
, k0: !k0, res: &x0? >> opt(x0,b)): #[b:bool] bool(b)
fun
{k0,x0:vtflt}
linmap_takeout_opt
( map: &map(k0, INV(x0)) >> _, k0: !k0 ): optn0_vt(x0)
// end of [linmap_takeout_opt]
//
(* ****** ****** *)

(* end of [linmap.hats] *)
