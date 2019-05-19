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
abstbox
qlist_vtflt_tbox(a:vtflt+) = ptr
vtypedef
qlist(a:vtflt) = qlist_vtflt_tbox(a)
//
(* ****** ****** *)
//
fun{}
qlist_iseqz
{a:vtflt}(xs: !qlist(a)): bool
fun{}
qlist_isneqz
{a:vtflt}(xs: !qlist(a)): bool
//
#symload iseqz with qlist_iseqz
#symload isneqz with qlist_isneqz
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
