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

#define
ATS_PACKNAME "temptory.libc."
#define
ATS_EXTERN_PREFIX "temptory_libc_"

(* ****** ****** *)
//
(*
int
atoi(const char *nptr);
long
atol(const char *nptr);
long
long atoll(const char *nptr);
*)
//
fun
atoi(rep: string): sint = "mac#"
fun
atol(rep: string): slint = "mac#"
fun
atoll(rep: string): sllint = "mac#"
//
(* ****** ****** *)
//
(*
int rand(void);
int
rand_r(unsigned int *seedp);
void srand(unsigned int seed);    
*)
fun rand(): Intgte(0) = "mac#"
fun srand(seed: uint): void = "mac#"
fun rand_r(seed: &uint >> _): Intgte(0) = "mac#"
//
(* ****** ****** *)

(* end of [stdlib.sats] *)
