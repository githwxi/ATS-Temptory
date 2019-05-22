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
//
// HX-2013-09:
// A collection of hash functions
//
(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/char.sats"
#staload
"libats/SATS/string.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/hashfun.sats"

(* ****** ****** *)

(*
fun{}
inthash_jenkins(uint32): uint32
*)
(*
** HX-2013-08:
** This one by Robert Jenkins
** is a full-avalanche hash function
*)
/*
uint32_t
libats_inthash_jenkins
  (uint32_t a)
{
  a = (a+0x7ed55d16) + (a<<12);
  a = (a^0xc761c23c) ^ (a>>19);
  a = (a+0x165667b1) + (a<< 5);
  a = (a+0xd3a2646c) ^ (a<< 9);
  a = (a+0xfd7046c5) + (a<< 3);
  a = (a^0xb55a4f09) ^ (a>>16);
  return a;
}
*/
implement
{}(*tmp*)
inthash_jenkins(key) =
$extfcall
( uint32
, "temptory_inthash_jenkins", key)
//
(* ****** ****** *)

(*
fun{}
string_hash_multiplier
(
  K: ulint, H0: ulint, str: string
) :<> ulint // endfun
*)
implement
{}(*tmp*)
string_hash_multiplier
  (K, H0, key) = let
//
fun loop
(
cp: cptr(char), res: ulint
) : ulint = let
  val c0 = $UN.cptr0_get(cp)
in
//
if
isneqz(c0)
then
loop
( succ(cp)
, K*res+$UN.cast{ulint}(c0))
else (res)
//
end // end of [loop]
//
in
  $effmask_all(loop(cptrof(key), H0))
end // end of [string_hash_multiplier]

(* ****** ****** *)

(* end of [hashfun.dats] *)
