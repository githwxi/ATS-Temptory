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
fun{}
optn0_vt_iseqz
{x0:vtflt}
(xs: !optn0_vt(x0)): bool
fun{}
optn0_vt_isneqz
{x0:vtflt}
(xs: !optn0_vt(x0)): bool
//
#symload iseqz with optn0_vt_iseqz
#symload isneqz with optn0_vt_isneqz
//
(* ****** ****** *)
//
fun
{x0:vtflt}
optn0_vt_size
(xs: !optn0_vt(x0)): size
fun
{x0:vtflt}
optn0_vt_length
(xs: !optn0_vt(x0)): Intgte(0)
//
#symload size with optn0_vt_size
#symload length with optn0_vt_length
//
(* ****** ****** *)
//
fun
{a:vtflt}
optn0_vt_free
(opt: optn0_vt(a)): void
//
#symload free with optn0_vt_free
//
(* ****** ****** *)

(* end of [optn_vt.sats] *)
