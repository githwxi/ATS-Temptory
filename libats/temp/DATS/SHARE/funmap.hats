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

implement
{k0}(*tmp*)
equal_key_key(k1, k2) = gequal$val<k0>(k1, k2)
implement
{k0}(*tmp*)
compare_key_key(k1, k2) = gcompare$val<k0>(k1, k2)

(* ****** ****** *)
//
implement
{}(*tmp*)
funmap_isneqz
  (xs) =
  not(funmap_iseqz<>(xs))
//
(* ****** ****** *)

implement
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

implement
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

implement
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

implement
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

implement
(k0:tflt
,x0:tflt)
gseq_forall<map(k0,x0)><(k0, x0)>(map) =
(
  funmap_forall<k0,x0>(map)
) where
{
implement
funmap_forall$test<k0,x0>
  (k0, x0) = gseq_forall$test<(k0,x0)>((k0, x0))
}
implement
(k0:tflt
,x0:tflt)
gseq_foreach<map(k0,x0)><(k0, x0)>(map) =
(
  funmap_foreach<k0,x0>(map)
) where
{
implement
funmap_foreach$work<k0,x0>
  (k0, x0) = gseq_foreach$work<(k0,x0)>((k0, x0))
}

(* ****** ****** *)

implement
(k0:tflt
,x0:tflt)
gseq_streamize<map(k0,x0)><(k0,x0)>(map) = funmap_streamize<k0,x0>(map)

(* ****** ****** *)

(* end of [funmap.hats] *)
