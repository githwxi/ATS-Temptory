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
// HX: shared by linmap_avltree
// HX: shared by linmap_randbst
// HX: shared by linmap_skiplist
*)
//
(* ****** ****** *)
//
impltmp
{k0}(*tmp*)
equal_key_key = gequal$val<k0>
//
impltmp
{k0}(*tmp*)
compare_key_key = gcompare$val<k0>

(* ****** ****** *)

impltmp
{k0,x0}//tmp
linmap_search
(map, k0, r0) = let
//
val cp =
linmap_search_ref<k0,x0>(map, k0)
//
in
//
if
iseqz(cp)
then let
  prval () = opt_none{x0}(r0) in ff
end // end of [then]
else let
//
  val
  (pf0, fpf | p0) =
  $UN.cptr0_vtake(cp)
//
  val () =
  r0 := gcopy$val<x0>(!p0)
//
  prval () = fpf(pf0)
  prval () = opt_some{x0}(r0) in tt
end // end of [else]
//
end // end of [linmap_search]

(* ****** ****** *)

impltmp
{k0,x0}//tmp
linmap_search_opt
  (map, k0) = let
//
var r0: x0?
//
val opt =
linmap_search<k0,x0>(map, k0, r0)
//
in (* in-of-let *)
//
if
opt
then let
prval () =
opt_unsome{x0}(r0) in optn0_vt_some{x0}(r0)
end else let
prval () =
opt_unnone{x0}(r0) in optn0_vt_none{x0}((*void*))
end // end of [if]
//
end // end of [linmap_search_opt]

(* ****** ****** *)

impltmp
{k0,x0}
linmap_insert_any
  (map, k0, x0) = () where
{
//
val-~optn0_vt_none() = linmap_insert_opt<k0,x0>(map, k0, x0)
//
} (* end of [linmap_insert_any] *)
//
(* ****** ****** *)

impltmp
{k0,x0}//tmp
linmap_insert_opt
  (map, k0, x0) = let
//
var r0: x0?
//
val opt =
linmap_insert<k0,x0>(map, k0, x0, r0)
//
in (* in-of-let *)
//
if
opt
then let
prval () =
opt_unsome{x0}(r0) in optn0_vt_some{x0}(r0)
end
else let
prval () =
opt_unnone{x0}(r0) in optn0_vt_none{x0}((*void*))
end // end of [if]
//
end // end of [linmap_insert_opt]

(* ****** ****** *)

impltmp
{k0,x0}
linmap_remove
  (map, k0) = let
//
var res: x0?
//
val takeout =
linmap_takeout<k0,x0>(map, k0, res)
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
end // end of [linmap_remove]

(* ****** ****** *)

impltmp
{k0,x0}
linmap_takeout_opt
  (map, k0) = let
//
var res: x0?
val opt =
linmap_takeout<k0,x0>(map, k0, res)
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
end // end of [linmap_takeout_opt]

(* ****** ****** *)
//
impltmp
linmap_print$beg<>() = print("(")
impltmp
linmap_print$end<>() = print(")")
impltmp
linmap_print$sep<>() = print(",")
impltmp
linmap_print$mapto<>() = print("->")
//
(* ****** ****** *)

impltmp
{k0,x0:vtflt}
linmap_print(map) =
(
linmap_print$beg<>();
linmap_foreach1<k0,x0>(map);
linmap_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
impltmp
linmap_foreach1$work<k0,x0>(k0, x0) =
(
let
val i0 = !p0
val () = !p0 := i0 + 1
in
if
(i0 > 0)
then
linmap_print$sep<>();
//
print$val<k0>(k0); linmap_print$mapto<>(); print$val<x0>(x0);
//
end
) (* end of [where] *)
} (* end of [linmap_print] *)

(* ****** ****** *)

(* end of [linmap.hats] *)
