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
list0_vt2t
{a:tflt}
(list0_vt(INV(a))):<> list0(a)
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_iseqz(list0(x0)):<> bool
fun
{x0:tflt}
list0_isneqz(list0(x0)):<> bool
//
#symload iseqz with list0_iseqz
#symload isneqz with list0_isneqz
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_length(list0(x0)):<> (int)
//
#symload length with list0_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_indexof
(list0(INV(x0)), elt: x0):<> (int)
//
#symload indexof with list0_indexof
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_concat
(list0(list0(x0))): list0(x0)
fun
{x0:tflt}
list0_append
(list0(x0), list0(x0)): list0(x0)
fun
{x0:tflt}
list0_revapp
(list0(x0), list0(x0)): list0(x0)
fun
{x0:tflt}
list0_reverse(list0(x0)): list0(x0)
//
#symload concat with list0_concat
#symload append with list0_append
#symload revapp with list0_revapp
#symload reverse with list0_reverse
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_listize
(xs: list0(INV(x0))): list0_vt(x0)
fun
{x0:tflt}
list0_rlistize
(xs: list0(INV(x0))): list0_vt(x0)
fun
{x0:tflt}
list0_streamize
(xs: list0(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_forall
(xs: list0(INV(x0))): bool
fun
{x0:tflt}
list0_forall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_foreach
(xs: list0(INV(x0))): void
fun
{x0:tflt}
list0_foreach$work(x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_rforall
(xs: list0(INV(x0))): bool
fun
{x0:tflt}
list0_rforall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
{r0:vtflt}
list0_foldleft
(xs: list0(INV(x0)), r0: r0): r0
fun
{x0:tflt}
{r0:vtflt}
list0_foldright
(xs: list0(INV(x0)), r0: r0): r0
//
fun
{x0:tflt}{r0:vtflt}
list0_foldleft$fopr(r0: r0, x0: x0): r0
fun
{x0:tflt}{r0:vtflt}
list0_foldright$fopr(x0: x0, r0: r0): r0
//
(* ****** ****** *)

(* end of [list.sats] *)
