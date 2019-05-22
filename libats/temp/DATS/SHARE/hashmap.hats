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
// HX: shared by hashmap_chain
// HX: shared by hashmap_linprb
//
(* ****** ****** *)
//
implement
{k0}(*tmp*)
equal_key_key = gequal$val<k0>
//
(* ****** ****** *)
//
// HX: 31 and 37 are top choices
//
implement
hash_key<string>(k0) =
string_hash_multiplier(31UL, 618033989UL, k0)
(*
implement
hash_key<string>(k0) =
string_hash_multiplier(31UL, 61803398875UL, k0)
*)
//
(* ****** ****** *)

(* end of [hashmap.hats] *)
