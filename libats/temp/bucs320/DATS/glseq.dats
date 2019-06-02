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
(* Start time: June, 2019 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.bucs320."
//
(* ****** ****** *)

#staload
"libats/SATS/glseq.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/stream_vt.sats"

(* ****** ****** *)

#staload "./../SATS/glseq.sats"

(* ****** ****** *)

impltmp
{xx}{xs}{x0}
glseq_concat_list(xx) =
stream_vt_listize
(glseq_concat_stream<xx><xs><x0>(xx))
impltmp
{xs}{ys}{x0}
glseq_append_list(xs, ys) =
stream_vt_listize
(glseq_append_stream<xs><ys><x0>(xs, ys))

(* ****** ****** *)

impltmp
{xx}{xs}{x0}
glseq_concat_stream(xx) =
(
auxmain
(glseq_streamize<xx><xs>(xx))
) where
{
fun
auxmain
(
xx: stream_vt(xs)
) : stream_vt(x0) =
$ldelay
(
case+ !xx of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
~stream_vt_cons(xs, xx) =>
 let
   val xs =
   glseq_streamize<xs><x0>(xs)
 in
   lazy_vt_force
   (stream_vt_append<x0>(xs, auxmain(xx)))
 end
,
let val () = lazy_vt_free(xx) in (*freed*) end
)
} (* end of [glseq_concat_stream] *)

(* ****** ****** *)

impltmp
{xs}{ys}{x0}
glseq_append_stream(xs, ys) =
(
  stream_vt_append<x0>(xs, ys)
) where
{
  val xs = glseq_streamize<xs><x0>(xs)
  val ys = glseq_streamize<ys><x0>(ys)
}

(* ****** ****** *)

(* end of [cs320_glseq.sats] *)
