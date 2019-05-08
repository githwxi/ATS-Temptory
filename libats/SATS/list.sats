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
ATS_PACKNAME "temptory"
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
castfn
g0ofg1_list
{a:tflt}
(list1(INV(a))):<> list0(a)
castfn
g1ofg0_list
{a:tflt}
(list0(INV(a))):<> list1(a)
//
#symload g0ofg1 with g0ofg1_list
#symload g1ofg0 with g1ofg0_list
//
(* ****** ****** *)
//
castfn
g0ofg1_list_vt
{a:vtflt}
(list1_vt(INV(a))):<> list0_vt(a)
castfn
g1ofg0_list_vt
{a:vtflt}
(list0_vt(INV(a))):<> list1_vt(a)
//
#symload g0ofg1 with g0ofg1_list_vt
#symload g1ofg0 with g1ofg0_list_vt
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_length(xs: list0(x0)): int
//
#symload length with list0_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_forall
(xs: list0(x0)): bool
fun
{x0:tflt}
list0_forall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_foreach
(xs: list0(x0)): void
fun
{x0:tflt}
list0_foreach$work(x0): void
//
(* ****** ****** *)
(*
//
fun
{x0:tflt}
{r0:vtflt}
list0_foldleft
(xs: list0(x0), r0: r0): r0
fun
{x0:tflt}
{r0:vtflt}
list0_foldright
(xs: list0(x0), r0: r0): r0
//
fun
{x0:tflt}{r0:vtflt}
list0_foldleft$fopr(r0, x0): r0
fun
{x0:tflt}{r0:vtflt}
list0_foldright$fopr(x0, r0): r0
//
*)
(* ****** ****** *)

(* end of [list.sats] *)
