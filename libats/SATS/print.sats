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
ATS_PACKNAME "temptory"
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
print_bool(bool): void
fun{}
print_char(char): void
(*
fun{}
print_double(double): void
*)
fun{}
print_string(string): void

(* ****** ****** *)

#symload print with print_int
#symload print with print_bool
#symload print with print_char
(*
#symload print with print_double
*)
#symload print with print_string

(* ****** ****** *)

fun{}
print_uint(uint): void
fun{}
print_lint(lint): void

(* ****** ****** *)

#symload print with print_uint
#symload print with print_lint

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

(* end of [print.sats] *)
