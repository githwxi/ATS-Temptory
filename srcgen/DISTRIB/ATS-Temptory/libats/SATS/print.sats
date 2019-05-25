(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"
//
(* ****** ****** *)
//
fun
{a:vtflt}
print$val(x: !a): void
fun
{a:vtflt}
print$ref(x: &INV(a)): void
//
(* ****** ****** *)
//
fun{}
print_newline((*void*)): void
//
(* ****** ****** *)

fun{}
print_int(int): void
fun{}
print_ptr(ptr): void
fun{}
print_bool(bool): void
fun{}
print_char(char): void
fun{}
print_double(double): void
fun{}
print_string(string): void

(* ****** ****** *)

(*
#symload print with print_int
*)
#symload print with print_ptr
#symload print with print_bool
#symload print with print_char
#symload print with print_double
#symload print with print_string

(* ****** ****** *)
//
fun{}
print_sint(sint): void
fun{}
print_uint(uint): void
//
fun{}
print_size(size): void
fun{}
print_ssize(ssize): void
fun{}
print_usize(usize): void
//
fun{}
print_lint(lint): void
fun{}
print_slint(slint): void
fun{}
print_ulint(ulint): void
//
fun{}
print_llint(llint): void
fun{}
print_sllint(sllint): void
fun{}
print_ullint(ullint): void
//
#symload print with print_sint
#symload print with print_uint
//
#symload print with print_ssize
#symload print with print_usize
(*
#symload print with print_lint
*)
#symload print with print_slint
#symload print with print_ulint
//
(*
#symload print with print_llint
*)
#symload print with print_sllint
#symload print with print_ullint
//
(* ****** ****** *)
//
fun{}
print_float(float): void
fun{}
print_ldouble(ldouble): void
//
#symload print with print_float
#symload print with print_ldouble
//
(* ****** ****** *)
//
fun
{a:tflt}
list0_print
(xs: list0(INV(a))): void
fun
{a:tflt}
list1_print
(xs: list1(INV(a))): void
//
#symload print with list0_print
#symload print with list1_print
//
fun{}
list0_print$beg((*void*)): void
fun{}
list0_print$end((*void*)): void
fun{}
list0_print$sep((*void*)): void
//
fun{}
list1_print$beg((*void*)): void
fun{}
list1_print$end((*void*)): void
fun{}
list1_print$sep((*void*)): void
//
(* ****** ****** *)
//
fun
{a:tflt}
optn0_print
(xs: optn0(INV(a))): void
fun
{a:tflt}
optn1_print
(xs: optn1(INV(a))): void
//
fun{}
optn0_print$beg((*void*)): void
fun{}
optn0_print$end((*void*)): void
//
fun{}
optn1_print$beg((*void*)): void
fun{}
optn1_print$end((*void*)): void
//
#symload print with optn0_print
#symload print with optn1_print
//
(* ****** ****** *)
//
fun{}
tuple_print$beg((*void*)): void
fun{}
tuple_print$end((*void*)): void
fun{}
tuple_print$sep((*void*)): void
//
fun
{a0,a1:tflt}
tuple2_print
(xs: tup(INV(a0),INV(a1))): void
fun
{a0,a1,a2:tflt}
tuple3_print
(xs: tup(INV(a0),INV(a1),INV(a2))): void
//
#symload print with tuple2_print
#symload print with tuple3_print
//
(* ****** ****** *)
//
fun
{a:tflt}
stream_print
(xs: stream(INV(a))): void
//
fun{}
stream_print$beg((*void*)): void
fun{}
stream_print$end((*void*)): void
fun{}
stream_print$sep((*void*)): void
//
#symload print with stream_print
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrszref_print
(AZ: arrszref(a)): void
fun
{a:vtflt}
arrszptr_print
(AZ: !arrszptr(a)): void
//
fun{}
array_print$beg((*void*)): void
fun{}
array_print$end((*void*)): void
fun{}
array_print$sep((*void*)): void
//
#symload print with arrszref_print
#symload print with arrszptr_print
//
(* ****** ****** *)
//
fun
{a:vtflt}
list0_vt_print
(xs: !list0_vt(INV(a))): void
fun
{a:vtflt}
list1_vt_print
(xs: !list1_vt(INV(a))): void
//
#symload print with list0_vt_print
#symload print with list1_vt_print
//
(* ****** ****** *)
//
fun{}
string0_vt_print
(cs: !string_vt): void
//
#symload print with string0_vt_print
//
(* ****** ****** *)

(* end of [print.sats] *)
