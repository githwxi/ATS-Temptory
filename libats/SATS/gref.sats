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

castfn
ref_ptrof
{a:vtflt}
(r0: ref(a)):<> [l:agz] ptr(l)
castfn
ref_cptrof
{a:vtflt}
(r0: ref(a)):<> [l:agz] cptr(a, l)
castfn
ref_vptrof
{a:vtflt}
(r0: ref(a)):<> [l:agz] (vbox(a @ l) | ptr(l))

(* ****** ****** *)
//
fun
{a:vtflt}
ref_make_elt(a): ref(a)
//
#symload ref with ref_make_elt
//
(* ****** ****** *)

fun
{a:tflt0}
ref_get_elt(r: ref(a)): (a)
fun
{a:tflt0}
ref_set_elt(r: ref(a), x: a): void

(* ****** ****** *)
//
fun
{a:tflt1}
ref_foreach(ref(a)): void
fun
{a:tflt1}
ref_foreach$work(x: !a): void
fun
{a:tflt1}
ref_foreach_ref(ref(a)): void
fun
{a:tflt1}
ref_foreach_ref$work(x: &a >> _): void
//
(* ****** ****** *)

(* end of [gref.sats] *)
