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

#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
castfn
g0ofg1_optn
{a:tflt}
(optn1(INV(a))):<> optn0(a)
castfn
g1ofg0_optn
{a:tflt}
(optn0(INV(a))):<> optn1(a)
//
#symload g0ofg1 with g0ofg1_optn
#symload g1ofg0 with g1ofg0_optn
//
(* ****** ****** *)
//
castfn
g0ofg1_optn_vt
{a:vtflt}
(optn1_vt(INV(a))):<> optn0_vt(a)
castfn
g1ofg0_optn_vt
{a:vtflt}
(optn0_vt(INV(a))):<> optn1_vt(a)
//
#symload g0ofg1 with g0ofg1_optn_vt
#symload g1ofg0 with g1ofg0_optn_vt
//
(* ****** ****** *)
//
fun{}
optn0_iseqz
{x0:tflt}
(xs: optn0(x0)): bool
fun{}
optn0_isneqz
{x0:tflt}
(xs: optn0(x0)): bool
//
#symload iseqz with optn0_iseqz
#symload isneqz with optn0_isneqz
//
(* ****** ****** *)
//
fun
{x0:tflt}
optn0_size
(xs: optn0(x0)): size
fun
{x0:tflt}
optn0_length
(xs: optn0(x0)): Intgte(0)
//
#symload size with optn0_size
#symload length with optn0_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
optn0_forall
(xs: optn0(x0)): bool
fun
{x0:tflt}
optn0_forall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
optn0_foreach
(xs: optn0(x0)): void
fun
{x0:tflt}
optn0_foreach$work(x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
optn0_listize
(xs: optn0(x0)): list0_vt(x0)
fun
{x0:tflt}
optn0_streamize
(xs: optn0(x0)): stream_vt(x0)
//
(* ****** ****** *)
//
#symload forall with optn0_forall
#symload foreach with optn0_foreach
#symload listize with optn0_listize
#symload streamize with optn0_streamize
//
(* ****** ****** *)

(* end of [optn.sats] *)
