(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
sint_streamize
  (n0) =
( auxmain(0) ) where
{
//
fun
auxmain
(i0: sint): stream_vt(sint) =
$ldelay
(
if
i0 >= n0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [sint_streamize] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
uint_streamize
  (n0) =
( auxmain(0u) ) where
{
//
fun
auxmain
(i0: uint): stream_vt(uint) =
$ldelay
(
if
i0 >= n0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [uint_streamize] *)
//
(* ****** ****** *)

(* end of [gint.dats] *)
