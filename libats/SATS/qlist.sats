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
absvtbox
qlist_vtflt_vtbox(a:vtflt+) = ptr
vtypedef
qlist(a:vtflt) = qlist_vtflt_vtbox(a)
//
(* ****** ****** *)
//
fun{}
qlist_nil{a:vtflt}(): qlist(a)
fun{}
qlist_make_nil{a:vtflt}(): qlist(a)
//
(* ****** ****** *)
//
fun{}
qlist_iseqz
{a:vtflt}
(xs: !qlist(INV(a))): bool
fun{}
qlist_isneqz
{a:vtflt}
(xs: !qlist(INV(a))): bool
//
#symload iseqz with qlist_iseqz
#symload isneqz with qlist_isneqz
//
(* ****** ****** *)
//
fun
{x0:vtflt}
qlist_size
(xs: !qlist(x0)): size
fun
{x0:vtflt}
qlist_length
(xs: !qlist(x0)): Intgte(0)
//
#symload size with qlist_size
#symload length with qlist_length
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlist_insert
(xs: !qlist(INV(a)), a): void
//
#symload insert with qlist_insert
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlist_remove
(xs: !qlist(INV(a))): bool
fun
{a:vtflt}
qlist_takeout
( xs: !qlist(INV(a))
, r0: &a? >> opt(a, b)): #[b:bool] bool(b)
fun
{a:vtflt}
qlist_takeout_opt
(xs: !qlist(INV(a))): optn0_vt(a)
fun
{a:vtflt}
qlist_takeout_all
(xs: !qlist(INV(a))): list0_vt(a)
//
#symload remove with qlist_remove
#symload takeout_opt with qlist_takeout_opt
#symload takeout_all with qlist_takeout_all
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlist_free(qlist(INV(a))): void
fun
{a:vtflt}
qlist_freeout(qlist(INV(a))): list0_vt(a)
//
#symload free with qlist_free of 10
#symload freeout with qlist_freeout of 10
//
(* ****** ****** *)
//
fun{}
qlist_print$beg(): void
fun{}
qlist_print$end(): void
fun{}
qlist_print$sep(): void
fun
{a:vtflt}
qlist_print
(xs: !qlist(INV(a))): void
//
#symload print with qlist_print
//
(* ****** ****** *)
//
fun
{x0:vtflt}
qlist_forall0
(xs: qlist(INV(x0))): bool
fun
{x0:vtflt}
qlist_forall1$test(x0: x0): bool
//
fun
{x0:vtflt}
qlist_foreach0
(xs: qlist(INV(x0))): void
fun
{x0:vtflt}
qlist_foreach0$work(x0: x0): void
//
#symload forall0 with qlist_forall0
#symload foreach0 with qlist_foreach0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
qlist_forall1
(xs: !qlist(INV(x0))): bool
fun
{x0:vtflt}
qlist_forall1$test(x0: !x0): bool
//
fun
{x0:vtflt}
qlist_foreach1
(xs: !qlist(INV(x0))): void
fun
{x0:vtflt}
qlist_foreach1$work(xs: !x0): void
//
#symload forall1 with qlist_forall1
#symload foreach1 with qlist_foreach1
//
(* ****** ****** *)

(* end of [qlist.sats] *)
