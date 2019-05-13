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
absvtbox // co-variant
refcnt_vtflt_vtbox(a:vtflt) = ptr
//
vtypedef
refcnt(a:vtflt) = refcnt_vtflt_vtbox(a)
//
(* ****** ****** *)
//
fun
{a:vtflt}
refcnt_make_elt(x0: a): refcnt(a)
//
#symload refcnt with refcnt_make_elt
//
(* ****** ****** *)

fun
{a:vtflt}
refcnt_get_elt(!refcnt(a)): (a)
fun
{a:vtflt}
refcnt_get_cnt(!refcnt(a)): Intgte(1)

(* ****** ****** *)
//
fun
{a:vtflt}
refcnt_decref (refcnt(a)): void
fun
{a:vtflt}
refcnt_incref (!refcnt(a)): refcnt(a)
//
#symload decref with refcnt_decref
#symload incref with refcnt_incref
//
(* ****** ****** *)
//
fun
{a:vtflt}
refcnt_vtakeout
(rfc: !refcnt(a))
:
[l:addr]
( a @ l
, a @ l -<lin,prf> void | ptr(l))
//
#symload vtakeout with refcnt_vtakeout
//
(* ****** ****** *)

(* end of [refcnt.sats] *)
