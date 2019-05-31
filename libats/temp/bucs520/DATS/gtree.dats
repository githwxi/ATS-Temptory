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

#staload
"./../SATS/gtree.sats"

(* ****** ****** *)
//
#staload
"libats/SATS/qlist.sats"
#staload
"libats/SATS/list_vt.sats"
//
#staload
"libats\
/temp/SATS/slistref.sats"
#staload
"libats\
/temp/SATS/qlistref.sats"
//
(* ****** ****** *)

#staload
"libats/SATS/print.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
{node}//tmp
gtree_streamize
  (nx0) =
  (auxmain()) where
{
//
fun
auxmain
(
// argless
): stream_vt(node) =
$ldelay
(
let
//
val
opt =
gtree_store_choose_opt<node>
  ((*void*))
//
in (* in-of-let *)
//
case+ opt of
|
~optn0_vt_none() =>
 (
 stream_vt_nil()
 ) where
 {
   val () =
   gtree_store_free<node>()
 }
|
~optn0_vt_some(nx0) =>
 let
   val
   nxs =
   gtree_node_children<node>(nx0)
   val () =
   gtree_store_insert_list<node>(nxs)
 in
   stream_vt_cons(nx0, auxmain())
 end
end
,
(
// nothing
) where
{
  val () = gtree_store_free<node>()
}
) (* end of [$ldelay] *)
//
val () = gtree_store_insert<node>(nx0)
//
} (* end of [gtree_streamize] *)

(* ****** ****** *)

impltmp
{node}//tmp
gtree_streamize_bfs
  (nx0) =
(
gtree_streamize<node>
  (nx0)
) where
{
val
store =
qlistref_nil<>{node}()
//
impltmp
gtree_store_free<node>
  ((*void*)) =
let
val ref =
$UN.cast{ptr}(store)
val qxs =
$UN.ptr0_get<qlist(node)>(ref)
in
  $UN.mfree(ref);
  qlist_free<node>(qxs)
end
//
impltmp
gtree_store_insert<node>
(nx0) =
qlistref_insert<node>(store, nx0)
//
impltmp
gtree_store_insert_list<node>
(nxs) =
(
list0_vt_foreach0<node>(nxs)
) where
{
impltmp
list0_vt_foreach0$work<node>
(nx0) =
(
  gtree_store_insert<node>(nx0)
)
}
//
impltmp
gtree_store_choose_opt<node>() = qlistref_takeout_opt<node>(store)
//
} (* end of [gtree_streamize_bfs] *)

(* ****** ****** *)

impltmp
{node}//tmp
gtree_streamize_dfs
  (nx0) =
(
gtree_streamize<node>
  (nx0)
) where
{
val
store =
slistref_nil<>{node}()
//
impltmp
gtree_store_free<node>
  ((*void*)) =
let
val ref =
$UN.cast{ptr}(store)
val nxs =
$UN.ptr0_get<list0_vt(node)>(ref)
in
  $UN.mfree(ref);
  list0_vt_free<node>(nxs)
end
//
impltmp
gtree_store_insert<node>
(nx0) =
slistref_insert<node>(store, nx0)
//
impltmp
gtree_store_insert_list<node>
(nxs) =
(
list0_vt_rforeach0<node>(nxs)
) where
{
impltmp
list0_vt_rforeach0$work<node>
(nx0) =
(
  gtree_store_insert<node>(nx0)
)
}
//
impltmp
gtree_store_choose_opt<node>() = slistref_takeout_opt<node>(store)
//
} (* end of [gtree_streamize_dfs] *)

(* ****** ****** *)

(* end of [cs520_gtree.dats] *)
