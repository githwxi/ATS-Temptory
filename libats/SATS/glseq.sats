(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_length(!xs): (int)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_listize
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_rlistize
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_streamize
  (xs: xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_foreach(xs): void
fun
{x0:vtflt}
glseq_foreach$work(x0): void
//
(* ****** ****** *)

(* end of [glseq.sats] *)
