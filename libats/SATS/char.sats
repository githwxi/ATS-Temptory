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
fun
g0add_char_sint
( x: char
, y: sint):<> char = "mac#%"
//
#symload + with g0add_char_sint
//
(* ****** ****** *)
//
fun
g0sub_char_char
( x: char
, y: char):<> sint = "mac#%"
fun
g0sub_char_sint
( x: char
, y: sint):<> char = "mac#%"
//
#symload - with g0sub_char_char
#symload - with g0sub_char_sint
//
(* ****** ****** *)
//
fun
g0lt_char_char
( x: char
, y: char):<> bool = "mac#%"
fun
g0gt_char_char
( x: char
, y: char):<> bool = "mac#%"
fun
g0eq_char_char
( x: char
, y: char):<> bool = "mac#%"
//
fun
g0lte_char_char
( x: char
, y: char):<> bool = "mac#%"
fun
g0gte_char_char
( x: char
, y: char):<> bool = "mac#%"
fun
g0neq_char_char
( x: char
, y: char):<> bool = "mac#%"
//
#symload < with g0lt_char_char
#symload > with g0gt_char_char
#symload = with g0eq_char_char
#symload <= with g0lte_char_char
#symload >= with g0gte_char_char
#symload != with g0neq_char_char
//
(* ****** ****** *)
//
fun{}
char0_iseqz(char):<> bool
fun{}
char0_isneqz(char):<> bool
//
#symload iseqz with char0_iseqz
#symload isneqz with char0_isneqz
//
(* ****** ****** *)
//
fun
char0_ord: char -<> sint = "mac#%"
fun
char0_chr: sint -<> char = "mac#%"
//
(* ****** ****** *)
//
fun
char0_isalpha(char):<> bool = "mac#%"
fun
char0_isalnum(char):<> bool = "mac#%"
fun
char0_iscntrl(char):<> bool = "mac#%"
fun
char0_isdigit(char):<> bool = "mac#%"
fun
char0_isgraph(char):<> bool = "mac#%"
fun
char0_isprint(char):<> bool = "mac#%"
fun
char0_ispunct(char):<> bool = "mac#%"
fun
char0_isspace(char):<> bool = "mac#%"
fun
char0_isxdigit(char):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun
char0_islower(char):<> bool = "mac#%"
fun
char0_isupper(char):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun
char0_tolower(char):<> char = "mac#%"
fun
char0_toupper(char):<> char = "mac#%"
//
(* ****** ****** *)

(* end of [char.sats] *)
