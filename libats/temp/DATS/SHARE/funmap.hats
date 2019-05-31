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
(* Start time: December, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

impltmp
{k0}(*tmp*)
equal_key_key
(k1, k2) =
gequal$val<k0>(k1, k2)
impltmp
{k0}(*tmp*)
compare_key_key
(k1, k2) =
gcompare$val<k0>(k1, k2)

(* ****** ****** *)
//
impltmp
{}(*tmp*)
funmap_isneqz
  (xs) =
  not(funmap_iseqz<>(xs))
//
(* ****** ****** *)

impltmp
{k0,x0}
funmap_search_opt
  (map, k0) = let
//
var res: x0?
//
val
found =
funmap_search<k0,x0>
  (map, k0, res)
//
in
//
if
found
then
(
optn0_vt_some{x0}(res)
) where
{ prval () = opt_unsome{x0}(res) }
else
(
optn0_vt_none{x0}((*void*))
) where
{ prval () = opt_unnone{x0}(res) }
//
end (* end of [funmap_search_opt] *)

(* ****** ****** *)

impltmp
{k0,x0}
funmap_insert_opt
  (map, k0, x0) = let
//
var res: x0?
//
val
found =
funmap_insert<k0,x0>
  (map, k0, x0, res)
in
//
if
found
then
(
optn0_vt_some{x0}(res)
) where
{ prval () = opt_unsome{x0}(res) }
else
(
optn0_vt_none{x0}((*void*))
) where
{ prval () = opt_unnone{x0}(res) }
//
end // end of [funmap_insert_opt]

(* ****** ****** *)

impltmp
{k0,x0}
funmap_remove
  (map, k0) = let
//
var res: x0?
//
val
takeout =
funmap_takeout<k0,x0>
  (map, k0, res)
//
in
  takeout where
  { prval () = opt_clear{x0}(res) }
end (* end of [funmap_remove] *)

(* ****** ****** *)

impltmp
{k0,x0}
funmap_takeout_opt
  (map, k0) = let
//
var res: x0?
//
val
found =
funmap_takeout<k0,x0>
  (map, k0, res)
//
in
//
if
found
then
(
optn0_vt_some{x0}(res)
) where
{ prval () = opt_unsome{x0}(res) }
else
(
optn0_vt_none{x0}((*void*))
) where
{ prval () = opt_unnone{x0}(res) }
//
end // end of [funmap_takeout_opt]

(* ****** ****** *)
//
impltmp
funmap_print$beg<>() = print("(")
impltmp
funmap_print$end<>() = print(")")
impltmp
funmap_print$sep<>() = print(",")
impltmp
funmap_print$mapto<>() = print("->")
//
(* ****** ****** *)

impltmp
{k0,x0:tflt}
funmap_print(map) =
(
funmap_print$beg<>();
funmap_foreach<k0,x0>(map);
funmap_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
impltmp
funmap_foreach$work<k0,x0>(k0, x0) =
(
let
val i0 = !p0
val () = !p0 := i0 + 1
in
if
(i0 > 0)
then
funmap_print$sep<>();
//
print$val<k0>(k0); funmap_print$mapto<>(); print$val<x0>(x0);
//
end
) (* end of [where] *)
} (* end of [funmap_print] *)

(* ****** ****** *)

impltmp
(k0:tflt
,x0:tflt)
gseq_forall<map(k0,x0)><(k0, x0)>(map) =
(
  funmap_forall<k0,x0>(map)
) where
{
impltmp
funmap_forall$test<k0,x0>(k0,x0) = gseq_forall$test<(k0,x0)>((k0,x0))
}

(* ****** ****** *)

impltmp
(k0:tflt
,x0:tflt)
gseq_foreach<map(k0,x0)><(k0,x0)>(map) =
(
  funmap_foreach<k0,x0>(map)
) where
{
impltmp
funmap_foreach$work<k0,x0>(k0,x0) = gseq_foreach$work<(k0,x0)>((k0,x0))
}

(* ****** ****** *)

impltmp
(k0:tflt
,x0:tflt)
gseq_streamize<map(k0,x0)><(k0,x0)>(map) = funmap_streamize<k0,x0>(map)

(* ****** ****** *)

(* end of [funmap.hats] *)
