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

fun
{a:vtflt}
grand$val(): (a)
fun
{a:vtflt}
grand$ref(&a? >> a): void

(* ****** ****** *)

fun{}
nat0_rand(): Nat
fun{}
sint_rand(): sint
fun{}
uint_rand(): uint

(* ****** ****** *)

fun{}
nat0_rand_max
{n:int|n >= 1}(max: int(n)): Natlt(n)

(* ****** ****** *)
//
fun
{a:tflt}
list0_rand(): list0(a)
fun
{a:vtflt}
list0_vt_rand(): list0_vt(a)
//
fun{}
list0_rand$len(): Intgte(0)
//
(* ****** ****** *)
//
fun{}
string0_rand(): string
fun{}
string0_vt_rand(): string_vt
//
fun{}
string0_rand$len(): Intgte(0)
fun{}
string0_rand$char(): CharNZ(*!=0*)
//
(* ****** ****** *)
//
fun
{a0
,a1:tflt}
tuple2_rand((*void*)): (a0, a1)
fun
{a0
,a1
,a2:tflt}
tuple3_rand((*void*)): (a0, a1, a2)
//
(* ****** ****** *)

(* end of [grand.sats] *)
