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
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)
//
// HX-2012-12:
// for maps associating keys with items
// of types [key] and [itm], respectively
//
(* ****** ****** *)
//
abstbox
map_tbox
(key:tflt,itm:tflt+) = ptr
typedef
map(k:tflt,x:tflt) = map_tbox(k,x)
//
(* ****** ****** *)
//
fun{k0:tflt}
equal_key_key(k0, k0): bool
fun{k0:tflt}
compare_key_key(k0, k0): sint
//
(* ****** ****** *)
//
fun{}
funmap_nil
{k0,x0:tflt}(): map(k0, x0)
fun{}
funmap_make_nil
{k0,x0:tflt}(): map(k0, x0)
//
(* ****** ****** *)
//
fun{}
funmap_iseqz
{k0,x0:tflt}
(m0: map(k0, INV(x0))): bool
fun{}
funmap_isneqz
{k0,x0:tflt}
(m0: map(k0, INV(x0))): bool
//
#symload iseqz with funmap_iseqz
#symload isneqz with funmap_isneqz
//
(* ****** ****** *)
//
// HX-2012-12: this function is O(n)-time
//
fun
{k0,x0:tflt}
funmap_size(m0: map(k0, INV(x0))): size
fun
{k0,x0:tflt}
funmap_length(m0: map(k0, INV(x0))): (int)
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_search
( m0: map(k0, INV(x0))
, k0: k0
, r0: &x0? >> opt(x0,b)): #[b:bool] bool(b)
fun
{k0,x0:tflt}
funmap_search_opt
(m0: map(k0, INV(x0)), k0: k0): optn0_vt(x0)
//
(* ****** ****** *)
//
// HX-2012-12:
// if [k0] occurs in [map], [x0] replaces the
// item associated with [k0] in [map] while the
// item is stored in [res] instead.
//
fun
{k0,x0:tflt}
funmap_insert
( m0
: &map(k0, INV(x0)) >> _
, k0: k0, x0: x0
, r0: &x0? >> opt(x0, b)): #[b:bool] bool(b)
fun
{k0,x0:tflt}
funmap_insert_opt
(m0: &map(k0, INV(x0)) >> _, k0, x0): optn0_vt(x0)

(* ****** ****** *)
//
// HX-2012-12:
// insertion always happens regardless whether
// [k0] is associated with some item in [map] or not
//
fun
{k0,x0:tflt}
funmap_insert_any
(m0: &map(k0, INV(x0)) >> _, k0: k0, x0: x0): void
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_takeout
( m0
: &map(k0, INV(x0)) >> _
, k0: k0
, res: &x0? >> opt(x0, b)) : #[b:bool] bool(b)
//
fun
{k0,x0:tflt}
funmap_takeout_opt
(map: &map(k0, INV(x0)) >> _, k0: k0) : optn0_vt (x0)
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_remove
(map: &map(k0, INV(x0)) >> _, k0: k0): bool
//
(* ****** ****** *)
//
fun{}
print_funmap$beg(): void // "("
fun{}
print_funmap$end(): void // ")"
fun{}
print_funmap$sep(): void // ";"
fun{}
print_funmap$mapto(): void // "->"
//
fun
{k0,x0:tflt}
print_funmap
(map: map(k0, INV(x0))): void
//
#symload print with print_funmap
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_listize
(map(k0, INV(x0))): list0_vt(@(k0,x0))
fun
{k0,x0:tflt}
funmap_rlistize
(map(k0, INV(x0))): list0_vt(@(k0,x0))
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_forall
(map: map(k0, INV(x0))): bool
fun
{k0,x0:tflt}
funmap_forall$test(k: k0, x: x0): bool
//
(* ****** ****** *)
//
fun
{k0,x0:tflt}
funmap_foreach
(map: map(k0, INV(x0))): void
fun
{k0,x0:tflt}
funmap_foreach$work(k: k0, x: x0): void
//
(* ****** ****** *)
//
fun
{k0:tflt
;x0:tflt}
{kx2:vtflt}
funmap_map$$fopr(k0, x0): kx2
fun
{k0:tflt
;x0:tflt}
{kx2:vtflt}
funmap_map_list(map(k0, INV(x0))): list0_vt(kx2)
//
(* ****** ****** *)
//
fun
{k0:tflt
;x0:tflt}
funmap_streamize(map(k0, INV(x0))): stream_vt(@(k0,x0))
//
(* ****** ****** *)

(* end of [funmap.hats] *)
