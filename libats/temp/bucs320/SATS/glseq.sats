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

fun
{xx:vtflt}
{xs:vtflt}
{x0:vtflt}
glseq_concat_list(xx): list0_vt(x0)
fun
{xx:vtflt}
{xs:vtflt}
{x0:vtflt}
glseq_concat_stream(xx): stream_vt(x0)

(* ****** ****** *)

fun
{xs:vtflt}
{ys:vtflt}
{x0:vtflt}
glseq_append_list(xs, ys): list0_vt(x0)
fun
{xs:vtflt}
{ys:vtflt}
{x0:vtflt}
glseq_append_stream(xs, ys): stream_vt(x0)

(* ****** ****** *)

(* end of [cs320_glseq.sats] *)
