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
{from:tflt}(x: INV(from)):<> (to)
//
(* ****** ****** *)
//
praxi
cast2void{a:view}(x: a):<prf> void
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
{from:vtflt}(x0: !INV(from)>>from):<> to
//
(* ****** ****** *)

castfn
{a:tflt}
list0_vt2t
(xs: !list0_vt(a)): list0(a)
castfn
{a:tflt}
list1_vt2t
{n:int}(xs: !list1_vt(a, n)): list1(a, n)

(* ****** ****** *)
//
fun
{a:vtflt}
ptr0_get(p0: ptr): (a)
fun
{a:vtflt}
ptr0_set(p0: ptr, x0: INV(a)):<!wrt> void
//
(* ****** ****** *)
//
fun
{a:vtflt}
cptr0_get(cp: cptr(a)): (a)
fun
{a:vtflt}
cptr0_set(cp: cptr(a), x0: INV(a)):<!wrt> void
//
(* ****** ****** *)
//
fun
{(*tmp*)}
cfree
{a:vtflt}(cptr(a)): void
fun
{a:vtflt}
calloc_int
{n:nat}(asz: int(n)): cptr(a)
fun
{a:vtflt}
calloc_uint(uint): cptr(a)
fun
{a:vtflt}
calloc_size(size): cptr(a)
//
#symload calloc with calloc_int of 10
#symload calloc with calloc_uint of 10
#symload calloc with calloc_size of 10
//
(* ****** ****** *)
//
// HX: only if you know what you are doing ...
//
symintr ptr_vtake
//
castfn
ptr0_vtake
  {a:vtflt}
(
  p0: ptr
) :<> [l:addr] (a@l, a@l -<lin,prf> void | ptr(l))
castfn
ptr1_vtake
  {a:vtflt}{l:addr}
  (p0: ptr(l)):<> (a@l, a@l -<lin,prf> void | ptr(l))
//
#symload ptr_vtake with ptr0_vtake of 0
#symload ptr_vtake with ptr1_vtake of 10
//
(* ****** ****** *)

(* end of [unsafe.sats] *)
