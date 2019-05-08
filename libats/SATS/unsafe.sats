(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
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

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)

(* ****** ****** *)

#define
ATS_PACKNAME "LIBATS.unsafe"

(* ****** ****** *)
//
praxi
prop_assert{b:bool}((*void*)): [b] void
//
praxi
proof_assert{proof:prop}((*void*)): proof
//
(*
praxi
eqint_assert{i1,i2:int}((*void*)): EQINT(i1,i2)
praxi
eqaddr_assert{l1,l2:addr}((*void*)): EQADDR(l1,l2)
praxi
eqbool_assert{b1,b2:bool}((*void*)): EQBOOL(b1,b2)
*)
//
(* ****** ****** *)
//
castfn
cast
{to:tflt}
{from:tflt} (x: INV(from)):<> (to)
//
(* ****** ****** *)
//
castfn
castvwtp0
{to:vtflt}
{from:vtflt}(x: INV(from)):<> (to)
//
(* ****** ****** *)
//
// HX:
// [castvwtp1] is mostly used in a situation
// where a linear value is passed as a read-only value;
// for instance, casting [strptr] to [string] is often
// done for treating a linear string as a nonlinear one
// temporarily.
//
castfn
castvwtp1
{to:vtflt}
{from:vtflt}(x: !INV(from)>>from):<> to
//
(* ****** ****** *)
//
fun
{a:vtflt}
ptr0_get(p0: ptr):<> (a)
fun
{a:vtflt}
ptr0_set(p0: ptr, x0: INV(a)):<!wrt> void
//
(* ****** ****** *)

(* end of [unsafe.sats] *)
