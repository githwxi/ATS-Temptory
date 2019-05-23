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
abstbox
hmapref_tbox
(k0:vtflt, x0:vtflt) = ptr
typedef
hmapref
(k0:vtflt, x0:vtflt) = hmapref_tbox(k0, x0)
//
(* ****** ****** *)

sexpdef href = hmapref

(* ****** ****** *)
//
fun
{k0:vtflt}
hash_key(k0: !k0):<> ulint
fun
{k0:vtflt}
equal_key_key
(k1: !k0, k2: !k0):<> bool
//
(* ****** ****** *)
//
fun{}
hmapref$hint(): Intgte(1)
fun
{k0,x0:vtflt}
hmapref_make((*default*)): href(k0, x0)
fun
{k0,x0:vtflt}
hmapref_make_hint(hint: Intgte(1)): href(k0, x0)
//
(* ****** ****** *)
//
fun{}
hmapref_size
{k0,x0:vtflt}
(map: hmapref(k0, x0)): size
#symload size with hmapref_size
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hmapref_search_ref
(map: href(k0, x0), k0: !k0): cptr0(x0)
fun
{k0,x0:vtflt}
hmapref_search_opt
(map: href(k0, x0), k0: !k0): optn0_vt(x0)
//
#symload search_ref with hmapref_search_ref
#symload search_opt with hmapref_search_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hmapref_insert
( map
: href(k0, x0)
, k0: k0, x0: x0
, res: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) // end-of-fun
fun
{k0,x0:vtflt}
hmapref_insert_any
(map: href(k0, x0), k0: k0, x0: x0): void
fun
{k0,x0:vtflt}
hmapref_insert_opt
( map
: href(k0, x0), k0: k0, x0: x0): optn0_vt(x0)
//
#symload insert with hmapref_insert
#symload insert_any with hmapref_insert_any
#symload insert_opt with hmapref_insert_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hmapref_remove
  (map: href(k0, x0), k0: !k0): bool
fun
{k0,x0:vtflt}
hmapref_takeout_opt
  (map: href(k0, x0), k0: !k0): optn0_vt(x0)
//
#symload remove with hmapref_remove
#symload takeout_opt with hmapref_takeout_opt
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hmapref_print
(map: href(k0, x0)): void
fun{}
hmapref_print$beg(): void // "("
fun{}
hmapref_print$end(): void // ")"
fun{}
hmapref_print$sep(): void // ";"
fun{}
hmapref_print$mapto(): void // "->"
//
#symload print with hmapref_print
//
(* ****** ****** *)
//
fun
{k0,x0:vtflt}
hmapref_foreach
(map: href(k0, x0)): void
fun
{k0,x0:vtflt}
hmapref_foreach$work(k0: !k0, x0: !x0): void
//
(* ****** ****** *)

(* end of [hmapref.sats] *)
