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

fun
g0add_ptr_int
(ptr, bsz: int): ptr = "mac#%"
fun
g0sub_ptr_int
(ptr, bsz: int): ptr = "mac#%"
fun
g0add_ptr_size
(ptr, bsz: size): ptr = "mac#%"
fun
g0sub_ptr_size
(ptr, bsz: size): ptr = "mac#%"

(* ****** ****** *)
//
fun
{a:vtflt}
cptr0_succ(cp: cptr(a)): cptr(a)
fun
{a:vtflt}
cptr0_pred(cp: cptr(a)): cptr(a)
//
#symload succ with cptr0_succ of 0
#symload pred with cptr0_pred of 0
//
(* ****** ****** *)
//
fun
{a:vtflt}
g0add_cptr_size
(cp0: cptr(a), bsz: size): cptr(a)
fun
{a:vtflt}
g0sub_cptr_size
(cp0: cptr(a), bsz: size): cptr(a)
//
(* ****** ****** *)

(* end of [gptr.sats] *)
