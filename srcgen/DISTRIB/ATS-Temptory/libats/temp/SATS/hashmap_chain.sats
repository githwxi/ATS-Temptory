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

(*
** A chain-based
** hapmap implementation
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Start time: February, 2019 *)
(* Authoremail: gmhwxiATgmailDOTedu *)
(*
** Start Time: March, 2010
** Contributed by Hongwei Xi
** Based on a version done in October, 2008
*)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.hashmap_chain."
//
(* ****** ****** *)
//
#include "./SHARE/hashmap.hats"
//
(* ****** ****** *)
//
(*
HX:
[hcap] is the size of
the initially created array (of buckets)
*)
//
fun{}
hashmap$hcap((*void*)): Intgte(1)
fun
{k0,x0:vtflt}
hashmap_make((*default*)): hmap(k0, x0)
fun
{k0,x0:vtflt}
hashmap_make_hcap(cap: Sizegte(1)): hmap(k0, x0)

(* ****** ****** *)

(* end of [hashmap_chain.sats] *)
