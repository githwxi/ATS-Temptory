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
castfn
ptr2cptr
{a:vtflt}(p: ptr):<> cptr(a)
castfn
cptr2ptr
{a:vtflt}(cp: cptr(a)):<> ptr
//
(* ****** ****** *)
//
castfn
g0ofg1_ptr
{l:addr}
(p1: ptr1(l)):<> ptr0
castfn
g1ofg0_ptr
(p0: ptr0):<> [l:addr] ptr1(l)
//
#symload g0ofg1 with g0ofg1_ptr
#symload g1ofg0 with g1ofg0_ptr
//
(* ****** ****** *)
//
fun
g0lt_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
fun
g0gt_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
fun
g0eq_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
fun
g0lte_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
fun
g0gte_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
fun
g0neq_ptr_ptr
(ptr, ptr):<> bool = "mac#%"
//
#symload < with g0lt_ptr_ptr of 10
#symload > with g0gt_ptr_ptr of 10
#symload = with g0eq_ptr_ptr of 10
#symload <= with g0lte_ptr_ptr of 10
#symload >= with g0gte_ptr_ptr of 10
#symload != with g0neq_ptr_ptr of 10
//
(* ****** ****** *)
//
fun
ptr0_iseqz(ptr):<> bool = "mac#%"
fun
ptr0_isneqz(ptr):<> bool = "mac#%"
//
#symload iseqz with ptr0_iseqz
#symload isneqz with ptr0_isneqz
//
(* ****** ****** *)
//
fun
{a:vtflt}
ptr0_succ
(p0: ptr):<> ptr // +sizeof(a)
fun
{a:vtflt}
ptr0_pred
(p0: ptr):<> ptr // -sizeof(a)
//
fun
{a:vtflt}
ptr0_add_size
( p0: ptr
, n0: size):<> ptr // +n0*sizeof(a)
fun
{a:vtflt}
ptr0_sub_size
( p0: ptr
, n0: size):<> ptr // -n0*sizeof(a)
//
(* ****** ****** *)
//
fun
g0add_ptr_int
(ptr, bsz: int):<> ptr = "mac#%"
//
fun
g0sub_ptr_int
(ptr, bsz: int):<> ptr = "mac#%"
fun
g0sub_ptr_ptr
(ptr, beg: ptr):<> size = "mac#%"
//
fun
g0add_ptr_size
(ptr, bsz: size):<> ptr = "mac#%"
//
fun
g0sub_ptr_size
(ptr, bsz: size):<> ptr = "mac#%"
//
#symload + with g0add_ptr_int of 10
#symload - with g0sub_ptr_int of 10
#symload - with g0sub_ptr_ptr of 10
#symload + with g0add_ptr_size of 10
#symload - with g0sub_ptr_size of 10
//
(* ****** ****** *)
//
fun
{a:vtflt}
ptr1_succ
{l:addr}(ptr(l)):<> ptr(l+sizeof(a))
fun
{a:vtflt}
ptr1_pred
{l:addr}(ptr(l)):<> ptr(l-sizeof(a))
//
(* ****** ****** *)
//
// HX: for C-pointers
//
(* ****** ****** *)
//
fun
{a:vtflt}
cptr0_succ(cp: cptr(a)):<> cptr(a)
fun
{a:vtflt}
cptr0_pred(cp: cptr(a)):<> cptr(a)
//
#symload succ with cptr0_succ of 10
#symload pred with cptr0_pred of 10
//
(* ****** ****** *)
//
fun
g0lt_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
fun
g0gt_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
fun
g0eq_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
fun
g0lte_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
fun
g0gte_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
fun
g0neq_cptr_cptr
{a:vtflt}
(cptr(a), cptr(a)):<> bool = "mac#%"
//
#symload < with g0lt_cptr_cptr of 10
#symload > with g0gt_cptr_cptr of 10
#symload = with g0eq_cptr_cptr of 10
#symload <= with g0lte_cptr_cptr of 10
#symload >= with g0gte_cptr_cptr of 10
#symload != with g0neq_cptr_cptr of 10
//
(* ****** ****** *)
//
fun
{a:vtflt}
g0add_cptr_size
(cp0: cptr(a), bsz: size):<> cptr(a)
fun
{a:vtflt}
g0sub_cptr_size
(cp0: cptr(a), bsz: size):<> cptr(a)
//
#symload + with g0add_cptr_size of 10
#symload - with g0sub_cptr_size of 10
//
(* ****** ****** *)
//
fun
{a:tflt}
cptr0_forall
(cptr(a), cptr(a)): bool
fun
{a:tflt}
cptr0_forall$test(x0: a): bool
//
(* ****** ****** *)
//
fun
{a:tflt}
cptr0_foreach
(cptr(a), cptr(a)): void
fun
{a:tflt}
cptr0_foreach$work(x0: a): void
//
(* ****** ****** *)
//
fun
{a:tflt}
cptr0_rforall
(cptr(a), cptr(a)): bool
fun
{a:tflt}
cptr0_rforall$test(x0: a): bool
//
(* ****** ****** *)
//
fun
{a:tflt}
cptr0_rforeach
(cptr(a), cptr(a)): void
fun
{a:tflt}
cptr0_rforeach$work(x0: a): void
//
(* ****** ****** *)

(* end of [gptr.sats] *)
