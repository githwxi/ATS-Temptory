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
"./../SATS/graph.sats"

(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/bool.sats"
#staload
"libats/SATS/list.sats"
#staload
"libats\
/temp/SATS/slistref.sats"
#staload
"libats\
/temp/SATS/qlistref.sats"

(* ****** ****** *)

#staload
"libats/SATS/print.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
{node}//tmp
graph_streamize
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
graph_store_choose_opt<node>
  ((*void*))
//
in (* in-of-let *)
//
case+ opt of
|
~optn0_vt_none() =>
 stream_vt_nil()
|
~optn0_vt_some(nx0) =>
 let
   val
   nxs =
   graph_node_neighbors(nx0)
   val () =
   graph_store_insert_list(nxs)
 in
   stream_vt_cons(nx0, auxmain())
 end
end
) (* end of [$ldelay] *)
//
val () = graph_store_insert(nx0)
//
} (* end of [graph_streamize] *)

(* ****** ****** *)

impltmp
{node}//tmp
graph_streamize_bfs
  (nx0) =
(
graph_streamize<node>
  (nx0)
) where
{
val
store =
qlistref_nil<>{node}()
//
impltmp
graph_store_insert<node>
(nx0) =
let
val
marked =
graph_node_is_marked<node>(nx0)
in
if
marked
then
(
// nothing
)
else
(
  graph_node_mark<node>(nx0);
  qlistref_insert<node>(store, nx0)
)
end // graph_store_insert
//
impltmp
graph_store_insert_list<node>
(nxs) =
(
  list0_foreach<node>(nxs)
) where
{
impltmp
list0_foreach$work<node>
(nx0) = graph_store_insert<node>(nx0)
}
//
impltmp
graph_store_choose_opt<node>() = qlistref_takeout_opt(store)
//
} (* end of [graph_streamize_bfs] *)

(* ****** ****** *)

impltmp
{node}//tmp
graph_streamize_dfs
  (nx0) =
(
graph_streamize<node>
  (nx0)
) where
{
val
store =
slistref_nil<>{node}()
//
impltmp
graph_store_insert<node>
(nx0) =
let
val
marked =
graph_node_is_marked(nx0)
in(* in-of-let *)
//
if
marked
then
(
// nothing
)
else
(
  graph_node_mark<node>(nx0);
  slistref_insert<node>(store, nx0)
) (* end of [then] *)
//
end // graph_store_insert
//
impltmp
graph_store_insert_list<node>
(nxs) =
(
  list0_rforeach<node>(nxs)
) where
{
impltmp
list0_rforeach$work<node>
(nx0) = graph_store_insert<node>(nx0)
}
//
impltmp
graph_store_choose_opt<node>() = slistref_takeout_opt(store)
//
} (* end of [graph_streamize_dfs] *)

(* ****** ****** *)

(* end of [cs320_graph.dats] *)
