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
//
#define
ATS_PACKNAME
"temptory.temp.cs320.divconq."
//
(* ****** ****** *)
//
fun
{i:tflt}
{o:tflt}
divconq_solve(i): o
and
divconq_solve_beg(i): o
and
divconq_solve_rec(i): o
//
(* ****** ****** *)
//
fun
{i:tflt}
{o:tflt}
divconq_solve_opt(i): optn0_vt(o)
//
(* ****** ****** *)
//
fun
{i:tflt}
{o:tflt}
divconq_divide(i): list0(i)
//
fun
{i:tflt}
{o:tflt}
divconq_conquer(list0(i)): o
and
divconq_conquer_cmb(list0(o)): o
//
(* ****** ****** *)


(* end of [cs320_divconq.sats] *)
