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
(* Start time: February, 2019 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.cs320.gtree."
//
(* ****** ****** *)
//
fun
{node:tflt}
gtree_node_children
  (nx: node): list0(node)
//
(* ****** ****** *)
//
fun
{node:tflt}
gtree_store_insert
  (nx: node): void
fun
{node:tflt}
gtree_store_insert_list
  (nxs: list0(node)): void
//
(* ****** ****** *)

fun
{node:tflt}
gtree_store_choose_opt
  ((*void*)): optn0_vt(node)

(* ****** ****** *)
//
fun
{node:tflt}
gtree_streamize(node): stream_vt(node)
//
(* ****** ****** *)
//
fun
{node:tflt}
gtree_streamize_dfs(node): stream_vt(node)
fun
{node:tflt}
gtree_streamize_bfs(node): stream_vt(node)
//
(* ****** ****** *)

(* end of [cs320_gtree.sats] *)
