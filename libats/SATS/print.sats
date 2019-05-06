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

(* end of [print.sats] *)
