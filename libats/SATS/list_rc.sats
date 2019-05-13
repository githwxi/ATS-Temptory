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

#staload "./refcnt.sats"

(* ****** ****** *)
//
datavtype
list0_rc_con
  (a: vtflt) =
| list0_rc_nil of ()
| list0_rc_cons of (a, list0_rc(a))
//
where
list0_rc
(a:vtflt) = refcnt(list0_rc_con(a))
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_length
(xs: !list0_rc(x0)): int
//
#symload length with list0_rc_length
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_free(list0_rc(x0)): void
fun
{x0:vtflt}
list0_rc_con_free(list0_rc_con(x0)): void
//
#symload free with list0_rc_free of 10
#symload free with list0_rc_con_free of 10
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_forall1
(xs: !list0_rc(x0)): bool
fun
{x0:vtflt}
list0_rc_forall1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_foreach1
(xs: !list0_rc(x0)): void
fun
{x0:vtflt}
list0_rc_foreach1$work(!x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_rforall1
(xs: !list0_rc(x0)): bool
fun
{x0:vtflt}
list0_rc_rforall1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_rc_rforeach1
(xs: !list0_rc(x0)): void
fun
{x0:vtflt}
list0_rc_rforeach1$work(!x0): void
//
(* ****** ****** *)

(* end of [list_rc.sats] *)
