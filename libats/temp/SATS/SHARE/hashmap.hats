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
(* Start time: August, 2013 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
absvtbox
hashmap_vtbox
(k0:vtflt, x0:vtflt+) = ptr
vtypedef
hashmap
(k0:vtflt, x0:vtflt) = hashmap_vtbox(k0, x0)
//
(* ****** ****** *)

sexpdef hmap = hashmap

(* ****** ****** *)

fun
{k0:vtflt}
hash_key(k0: !k0):<> ulint
fun
{k0:vtflt}
equal_key_key
(k1: !k0, k2: !k0):<> bool

(* ****** ****** *)
//
(*
HX:
Resizing policy:
Resizing is allowed by default
*)
//
fun{}
hashmap$resizable((*void*)): int
//
(* ****** ****** *)
//
(*
HX:
[size] is the
number of stored elements
*)
//
fun{}
hashmap_size
{k0,x0:vtflt}
(map: !hmap(k0, INV(x0))):<> Sizegte(0)
// end of [hashmap_size]
//
// HX: the array size of the hashtable
//
fun{}
hashmap_hcap
{k0,x0:vtflt}
(map: !hmap(k0, INV(x0))):<> Sizegte(1)
// end of [hashmap_hcap]
//
#symload size with hashmap_size
#symload hcap with hashmap_hcap
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_free(map: hmap(k0, INV(x0))): void
//
#symload free with hashmap_free
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_search
( map
: !hmap(k0, INV(x0))
, k0: !k0
, r0: &x0? >> opt(x0, b)): #[b:bool] bool(b)
fun
{k0,x0:vtflt}
hashmap_search_ref
(map: !hmap(k0, INV(x0)), k0: !k0): cptr0(x0)
// end of [hashmap_search_ref]
fun
{k0,x0:vtflt}
hashmap_search_opt
(map: !hmap(k0, INV(x0)), k0: !k0): optn0_vt(x0)
// end of [hashmap_search_opt]
//
#symload search with hashmap_search
#symload search_ref with hashmap_search_ref
#symload search_opt with hashmap_search_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_insert
( map
: !hmap(k0, INV(x0))
, k0: k0, x0: x0
, res: &x0? >> opt(x0, b)): #[b:bool] bool(b)
fun
{k0,x0:vtflt}
hashmap_insert_any
(map: !hmap(k0, INV(x0)), k0: k0, x0: x0): void
fun
{k0,x0:vtflt}
hashmap_insert_opt
( map
: !hmap(k0, INV(x0)), k0: k0, x0: x0): optn0_vt(x0)
// end of [hashmap_insert_opt]
//
#symload insert with hashmap_insert
#symload insert_any with hashmap_insert_any
#symload insert_opt with hashmap_insert_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_remove
(map: !hmap(k0, INV(x0)), k0: !k0): bool
//
fun
{k0,x0:vtflt}
hashmap_takeout
( map
: !hmap(k0, INV(x0))
, k0: !k0
, r0: &x0? >> opt(x0, b)): #[b:bool] bool(b)
fun
{k0,x0:vtflt}
hashmap_takeout_opt
(map: !hmap(k0, INV(x0)), k0: !k0): optn0_vt(x0)
// end of [hashmap_takeout_opt]
//
#symload remove with hashmap_remove
#symload takeout with hashmap_takeout
#symload takeout_opt with hashmap_takeout_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_takeout_all
(map: !hmap(k0, INV(x0))): list0_vt(@(k0, x0))
// end of [hashmap_takeout_all]
//
#symload takeout_all with hashmap_takeout_all
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_reset_hcap
(map: !hmap(k0, INV(x0)), cap: Sizegte(1)): bool
fun
{k0,x0:vtflt}
hashmap_adjust_hcap(map: !hmap(k0, INV(x0))): bool
//
(* ****** ****** *)
//
fun{}
hashmap_print$beg(): void // "("
fun{}
hashmap_print$end(): void // ")"
fun{}
hashmap_print$sep(): void // ";"
fun{}
hashmap_print$mapto(): void // "->"
fun
{k0,x0:vtflt}
hashmap_print
(map: !hmap(k0, INV(x0))): void
//
#symload print with hashmap_print
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hashmap_foreach1
(map: !hmap(k0, INV(x0))): void
fun
{k0,x0:vtflt}
hashmap_foreach1$work(k0: !k0, x0: !x0): void
//
(* ****** ****** *)

(* end of [hashmap.hats] *)
