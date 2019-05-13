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
{x0:vtflt}
list0_vt_sing
(x0: INV(x0)): list0_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_length
(xs: !list0_vt(INV(x0))):<> int
#symload length with list0_vt_length
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_free(list0_vt(INV(x0))): void
fun
{x0:vtflt}
list1_vt_free(list1_vt(INV(x0))): void
//
#symload free with list0_vt_free of 10
#symload free with list1_vt_free of 11
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_copy
(xs: !list0_vt(INV(x0))): list0_vt(x0)
fun
{x0:vtflt}
list0_vt_rcopy
(xs: !list0_vt(INV(x0))): list0_vt(x0)
//
#symload copy with list0_vt_copy of 10
#symload rcopy with list0_vt_rcopy of 10
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_append
( xs: list0_vt(INV(x0))
, ys: list0_vt(INV(x0))): list0_vt(x0)
//
fun
{x0:vtflt}
list0_vt_concat
(list0_vt(list0_vt(INV(x0)))): list0_vt(x0)
//
fun
{x0:vtflt}
list0_vt_revapp
( xs: list0_vt(INV(x0))
, ys: list0_vt(INV(x0))): list0_vt(x0)
fun
{x0:vtflt}
list0_vt_reverse
  (xs: list0_vt(INV(x0))): list0_vt(x0)
//
#symload append with list0_vt_append
#symload concat with list0_vt_concat
#symload revapp with list0_vt_revapp
#symload reverse with list0_vt_reverse
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall0$test(x0: x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_foreach0
(xs: list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach0$work(x0: x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforall0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_rforall0$test(x0: x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforeach0
(xs: list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_rforeach0$work(x0: x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft0
(xs: list0_vt(INV(x0)), r0: r0): r0
//
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldleft0$fopr(r0: r0, x0: x0): r0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall1
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_foreach1
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach1$work(!x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforall1
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_rforall1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforeach1
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_rforeach1$work(!x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft1
(xs: !list0_vt(INV(x0)), r0: r0): r0
//
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldleft1$fopr(r0: r0, x0: !x0): r0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall1_ref
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall1_ref$test(cptr0(x0)): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_foreach1_ref
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach1_ref$work(cptr0(x0)): void
//
(* ****** ****** *)

(* end of [list_vt.sats] *)
