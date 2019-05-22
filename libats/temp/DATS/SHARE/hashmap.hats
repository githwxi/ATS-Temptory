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
implement
hash_key<int>(i0) =
$UN.cast{ulint}
(
inthash_jenkins($UN.cast{uint32}(i0))
)
implement
hash_key<uint>(i0) =
$UN.cast{ulint}
(
inthash_jenkins($UN.cast{uint32}(i0))
)
implement
hash_key<usize>(i0) =
$UN.cast{ulint}
(
inthash_jenkins($UN.cast{uint32}(i0))
)
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

implement{}
hashmap$recapacitize () = 1 // HX: default: resizable

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_search
(map, k0, res) = let
//
val cp =
hashmap_search_ref<k0,x0>(map, k0)
//
in
//
if
isneqz(cp)
then let
//
  val
  (pf0, fpf | p0) =
  $UN.cptr0_vtake(cp)
//
  val () =
  (res := gcopy$ref(!p0))
//
  prval () = fpf(pf0)
  prval () = opt_some{x0}(res)
//
in
  true
end else let
  prval () = opt_none{x0}(res)
in
  false
end // end of [if]
//
end // end of [hashtbl_search]

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_search_opt
  (map, k0) = let
//
var res: x0?
//
val opt =
hashmap_search<k0,x0>(map, k0, res)
//
in
//
if
opt
then let
  prval () =
  opt_unsome{x0}(res) in optn0_vt_some{x0}(res)
end // end of [then
else let
  prval () =
  opt_unnone{x0}(res) in optn0_vt_none{x0}((*void*))
end // end of [else]
//
end // end of [hashmap_search_opt]

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_insert_opt
  (map, k0, x0) = let
//
var res: x0?
//
val opt =
hashmap_insert<k0,x0>(map, k0, x0, res)
//
in
//
if
opt
then let
  prval () =
  opt_unsome{x0}(res) in optn0_vt_some{x0}(res)
end // end of [then]
else let
  prval () =
  opt_unnone{x0}(res) in optn0_vt_none{x0}((*void*))
end // end of [else]
//
end // end of [hashmap_insert_opt]

(* ****** ****** *)

implement
{k0,x0}
hashmap_remove
  (map, k0) = let
//
var res: x0?
//
val takeout =
hashmap_takeout<k0,x0>(map, k0, res)
//
in
if
takeout
then
let
prval() = opt_unsome{x0}(res)
in
let val () = gfree$ref<x0>(res) in tt end
end
else
let prval() = opt_unnone{x0}(res) in ff end
end // end of [hashmap_remove]

(* ****** ****** *)

implement
{k0,x0}
hashmap_takeout_opt
  (map, k0) = let
//
var res: x0?
val opt =
hashmap_takeout<k0,x0>(map, k0, res)
//
in (* in-of-let *)
//
if
opt
then let
prval () =
opt_unsome{x0}(res) in optn0_vt_some{x0}(res)
end else let
prval () =
opt_unnone{x0}(res) in optn0_vt_none{x0}((*void*))
end // end of [if]
//
end // end of [hashmap_takeout_opt]

(* ****** ****** *)
//
implement
hashmap_print$beg<>() = print("(")
implement
hashmap_print$end<>() = print(")")
implement
hashmap_print$sep<>() = print(",")
implement
hashmap_print$mapto<>() = print("->")
//
(* ****** ****** *)

implement
{k0,x0:vtflt}
hashmap_print(map) =
(
hashmap_print$beg<>();
(
print!
("cap(", cap, "); ", "hsz(", hsz, ")")
) where
{
 val cap = capacity(map) and hsz = size(map)
} ;
hashmap_print$end<>();
) (* end of [hashmap_print] *)

(* ****** ****** *)

(* end of [hashmap.hats] *)
