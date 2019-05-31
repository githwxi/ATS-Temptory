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
(*
HX:
Default: resizable
*)
impltmp{}
hashmap$resizable() = 1
//
(* ****** ****** *)

impltmp
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

impltmp
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

impltmp
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

impltmp
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

impltmp
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
impltmp
hashmap_print$beg<>() = print("(")
impltmp
hashmap_print$end<>() = print(")")
impltmp
hashmap_print$sep<>() = print(",")
impltmp
hashmap_print$mapto<>() = print("->")
//
(* ****** ****** *)

(*
impltmp
{k0,x0:vtflt}
hashmap_print(map) =
(
hashmap_print$beg<>();
(
print!
("cap(", cap, "); ", "hsz(", hsz, ")")
) where
{
 val cap = hcap(map) and hsz = size(map)
} ;
hashmap_print$end<>();
) (* end of [hashmap_print] *)
*)

(* ****** ****** *)

impltmp
{k0,x0:vtflt}
hashmap_print(map) =
(
hashmap_print$beg<>();
hashmap_foreach1<k0,x0>(map);
hashmap_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
impltmp
hashmap_foreach1$work<k0,x0>(k0, x0) =
(
let
val i0 = !p0
val () = !p0 := i0 + 1
in
if
(i0 > 0)
then
hashmap_print$sep<>();
//
print$val<k0>(k0); hashmap_print$mapto<>(); print$val<x0>(x0);
//
end
) (* end of [where] *)
} (* end of [hashmap_print] *)

(* ****** ****** *)

(* end of [hashmap.hats] *)
