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

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/range.sats"

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_streamize
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
fun
auxmain
(i0: sint): stream_vt(sint) =
$ldelay
(
if
i0 >= u0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [SINT2_streamize] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
CPTR2_streamize
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = CPTR2_range$beg<>{a}()
val u0 = CPTR2_range$end<>{a}()
//
fun
auxmain
(i0: cptr(a)): stream_vt(cptr(a)) =
$ldelay
(
if
i0 >= u0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [SINT2_streamize] *)

(* ****** ****** *)

(* end of [range.dats] *)
