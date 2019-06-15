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

typedef sint0 = sint
typedef uint0 = uint
typedef sint1(i:int) = sint(i)
typedef uint1(i:int) = uint(i)

(* ****** ****** *)
//
castfn
g0ofg1_sint
{i:int}(i: sint(i)):<> sint
castfn
g1ofg0_sint
(i: sint):<> [i:int] sint(i)
//
#symload g0ofg1 with g0ofg1_sint
#symload g1ofg0 with g1ofg0_sint
//
(* ****** ****** *)
//
castfn
g0ofg1_size
{i:int}(i: size(i)):<> size
castfn
g1ofg0_size
(i: size):<> [i:nat] size(i)
//
#symload g0ofg1 with g0ofg1_size
#symload g1ofg0 with g1ofg0_size
//
(* ****** ****** *)
//
fun
{k1:tflt}
{k2:tflt}
g0int_cast
(g0int(k1)):<> g0int(k2)
fun
{k1:tflt}
{k2:tflt}
g1int_cast
{i:int}
(g1int(k1, i)):<> g1int(k2, i)
fun
{k1:tflt}
{k2:tflt}
g1uint_cast
{i:nat}
(g1int(k1, i)):<> g1int(k2, i)
//
(* ****** ****** *)
//
fun
g0cast_sint0_uint0
(x: sint):<> uint = "mac#%"
fun
g1cast_sint0_uint0
{i:nat}
(x: sint(i)):<> uint(i) = "mac#%"
fun
g1cast_sint1_usize1
{i:nat}
(x: sint(i)):<> usize(i) = "mac#%"
//
#symload
i2sz with g1cast_sint1_usize1 of 12
//
#symload
cast2uint with g0cast_sint0_uint0 of 10
#symload
cast2uint with g1cast_sint0_uint0 of 12
#symload
cast2usize with g1cast_sint1_usize1 of 12
//
fun
g0cast_sint0_slint0
(x0: sint):<> slint = "mac#%"
fun
g1cast_sint0_slint0
{i:int}
(x0: sint(i)):<> slint(i) = "mac#%"
//
#symload
cast2slint with g0cast_sint0_slint0 of 10
#symload
cast2slint with g1cast_sint0_slint0 of 12
//
fun
g0cast_slint0_sllint0
(x0: slint):<> sllint = "mac#%"
fun
g1cast_slint0_sllint0
{i:int}
(x0: slint(i)):<> sllint(i) = "mac#%"
//
#symload
cast2sllint with g0cast_slint0_sllint0 of 10
#symload
cast2sllint with g1cast_slint0_sllint0 of 12
//
(* ****** ****** *)
//
fun
g0abs_sint0
(x: sint):<> sint = "mac#%"
#symload abs with g0abs_sint0 of 10
//
fun
g0abs_slint0
(x: slint):<> slint = "mac#%"
#symload abs with g0abs_slint0 of 10
//
(* ****** ****** *)
//
fun
g0neg_sint0
(x: sint):<> sint = "mac#%"
fun
g1neg_sint1
{i:int}
(x: sint(i)):<> sint(~i) = "mac#%"
//
#symload ~ with g0neg_sint0 of 10
#symload ~ with g1neg_sint1 of 11
#symload neg with g0neg_sint0 of 10
#symload neg with g1neg_sint1 of 11
//
(* ****** ****** *)
//
fun
{k1:tflt}
{k2:tflt}
g0int_succ
( g0int(k1) ):<> g0int(k2)
fun
{k1:tflt}
{k2:tflt}
g1int_succ
{i:int}
(x: g1int(k1, i)):<> g1int(k2, i+1)
//
fun
g0succ_sint0
(x: sint):<> sint = "mac#%"
#symload succ with g0succ_sint0 of 10
fun
g1succ_sint1
{i:int}
(x: sint(i)):<> sint(i+1) = "mac#%"
#symload succ with g1succ_sint1 of 11
//
fun
g0succ_uint0
(x: uint):<> uint = "mac#%"
#symload succ with g0succ_uint0 of 10
fun
g1succ_uint1
{i:int}
(x: uint(i)):<> uint(i+1) = "mac#%"
#symload succ with g1succ_uint1 of 11
//
fun
g0succ_ssize0
(x: ssize):<> ssize = "mac#%"
#symload succ with g0succ_ssize0 of 10
fun
g1succ_ssize1
{i:int}
(x: ssize(i)):<> ssize(i+1) = "mac#%"
#symload succ with g1succ_ssize1 of 11
//
fun
g0succ_usize0
(x: usize):<> usize = "mac#%"
#symload succ with g0succ_usize0 of 10
fun
g1succ_usize1
{i:int}
(x: usize(i)):<> usize(i+1) = "mac#%"
#symload succ with g1succ_usize1 of 11
//
fun
g0succ_ulint0
(x: ulint):<> ulint = "mac#%"
#symload succ with g0succ_ulint0 of 10
fun
g1succ_ulint1
{i:int}
(x: ulint(i)):<> ulint(i+1) = "mac#%"
#symload succ with g1succ_ulint1 of 11
//
//
(* ****** ****** *)
//
fun
{k1:tflt}
{k2:tflt}
g0int_pred
( g0int(k1) ):<> g0int(k2)
fun
{k1:tflt}
{k2:tflt}
g1int_pred
{i:int}
(x: g1int(k1, i)):<> g1int(k2, i-1)
fun
{k1:tflt}
{k2:tflt}
g1uint_pred
{i:int | i > 0}
(x: g1int(k1, i)):<> g1int(k2, i-1)
//
fun
g0pred_sint0
(x: sint):<> sint = "mac#%"
#symload pred with g0pred_sint0 of 10
fun
g1pred_sint1
{i:int}
(x: sint(i)):<> sint(i-1) = "mac#%"
#symload pred with g1pred_sint1 of 11
//
fun
g0pred_uint0
(x: uint):<> uint = "mac#%"
#symload pred with g0pred_uint0 of 10
fun
g1pred_uint1
{i:pos}
(x: uint(i)):<> uint(i-1) = "mac#%"
#symload pred with g1pred_uint1 of 11
//
fun
g0pred_ssize0
(x: ssize):<> ssize = "mac#%"
#symload pred with g0pred_ssize0 of 10
fun
g1pred_ssize1
{i:int}
(x: ssize(i)):<> ssize(i-1) = "mac#%"
#symload pred with g1pred_ssize1 of 11
//
fun
g0pred_usize0
(x: usize):<> usize = "mac#%"
#symload pred with g0pred_usize0 of 10
fun
g1pred_usize1
{i:pos}
(x: usize(i)):<> usize(i-1) = "mac#%"
#symload pred with g1pred_usize1 of 11
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0int_add
( g0int(k1)
, g0int(k2)):<> g0int(k3)
fun
{k1
,k2:tflt}
{k3:tflt}
g1int_add
{i,j:int}
( g1int(k1, i)
, g1int(k2, j)):<> g1int(k3, i+j)
//
(* ****** ****** *)
//
fun
g0add_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
fun
g1add_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(i+j) = "mac#%"
//
#symload + with g0add_sint0_sint0 of 10
#symload + with g1add_sint1_sint1 of 12
//
fun
g0add_uint0_uint0
( x: uint
, y: uint):<> uint = "mac#%"
#symload + with g0add_uint0_uint0 of 10
fun
g1add_uint1_uint1
{i,j:int}
( x: uint(i)
, y: uint(j)):<> uint(i+j) = "mac#%"
#symload + with g1add_uint1_uint1 of 12
//
fun
g0add_sint0_ssize0
( x: sint
, y: ssize):<> ssize = "mac#%"
#symload + with g0add_sint0_ssize0 of 10
fun
g0add_ssize0_ssize0
( x: ssize
, y: ssize):<> ssize = "mac#%"
#symload + with g0add_ssize0_ssize0 of 10
//
fun
g1add_sint1_ssize1
{i,j:int}
( x: sint1(i)
, y: ssize(j)):<> ssize(i+j) = "mac#%"
#symload + with g1add_sint1_ssize1 of 12
fun
g1add_ssize1_ssize1
{i,j:int}
( x: ssize(i)
, y: ssize(j)):<> ssize(i+j) = "mac#%"
#symload + with g1add_ssize1_ssize1 of 12
//
fun
g0add_uint0_usize0
( x: uint
, y: usize):<> usize = "mac#%"
#symload + with g0add_uint0_usize0 of 10
fun
g0add_usize0_usize0
( x: usize
, y: usize):<> usize = "mac#%"
#symload + with g0add_usize0_usize0 of 10
//
fun
g1add_sint1_usize1
{i,j:int
|i >= 0}
( x: sint1(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_sint1_usize1 of 12
fun
g1add_uint1_usize1
{i,j:int}
( x: uint(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_uint1_usize1 of 12
fun
g1add_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_usize1_usize1 of 12
//
(* ****** ****** *)
//
fun
g0add_slint0_slint0
( x: slint
, y: slint):<> slint = "mac#%"
#symload + with g0add_slint0_slint0 of 10
fun
g1add_slint1_slint1
{i,j:int}
( x: slint(i)
, y: slint(j)):<> slint(i+j) = "mac#%"
#symload + with g1add_slint1_slint1 of 12
//
(* ****** ****** *)
//
fun
g0add_ulint0_ulint0
( x: ulint
, y: ulint):<> ulint = "mac#%"
#symload + with g0add_ulint0_ulint0 of 10
fun
g1add_ulint1_ulint1
{i,j:int}
( x: ulint(i)
, y: ulint(j)):<> ulint(i+j) = "mac#%"
#symload + with g1add_ulint1_ulint1 of 12
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0int_sub
( g0int(k1)
, g0int(k2)):<> g0int(k3)
fun
{k1
,k2:tflt}
{k3:tflt}
g1int_sub
{i,j:int}
( g1int(k1, i)
, g1int(k2, j)):<> g1int(k3, i-j)
fun
{k1
,k2:tflt}
{k3:tflt}
g1uint_sub
{i,j:int
|i > j }
( g1int(k1, i)
, g1int(k2, j)):<> g1int(k3, i-j)
//
fun
g0sub_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
#symload - with g0sub_sint0_sint0 of 10
fun
g1sub_sint1_sint1
{i,j:int}
( x
: sint(i)
, y
: sint(j)):<> sint(i-j) = "mac#%"
#symload - with g1sub_sint1_sint1 of 12
//
fun
g0sub_uint0_uint0
( uint , uint ):<> uint = "mac#%"
#symload - with g0sub_uint0_uint0 of 10
fun
g1sub_uint1_uint1
{i,j:int
|i > j }
( x
: uint(i)
, y
: uint(j)):<> uint(i-j) = "mac#%"
#symload - with g1sub_uint1_uint1 of 12
//
fun
g0sub_ssize0_ssize0
(ssize, ssize):<> ssize = "mac#%"
#symload - with g0sub_ssize0_ssize0 of 10
fun
g1sub_ssize1_ssize1
{i,j:int}
( x
: ssize(i)
, y
: ssize(j)):<> ssize(i-j) = "mac#%"
#symload - with g1sub_ssize1_ssize1 of 12
//
fun
g0sub_usize0_sint1
{j:nat}
( x
: usize
, y
: sint1(j)):<> usize = "mac#%"
#symload - with g0sub_usize0_sint1 of 10
fun
g0sub_usize0_usize0
( x: usize
, y: usize):<> usize = "mac#%"
#symload - with g0sub_usize0_usize0 of 10
fun
g1sub_usize1_usize1
{i,j:int
|i > j }
( x
: usize(i)
, y
: usize(j)):<> usize(i-j) = "mac#%"
#symload - with g1sub_usize1_usize1 of 12
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0int_mul
( g0int(k1)
, g0int(k2)):<> g0int(k3)
fun
{k1
,k2:tflt}
{k3:tflt}
g1int_mul
{i,j:int}
( g1int(k1, i)
, g1int(k2, j)):<> g1int(k3, i*j)
//
fun
g0mul_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
fun
g1mul_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(i*j) = "mac#%"
//
#symload * with g0mul_sint0_sint0 of 10
#symload * with g1mul_sint1_sint1 of 12
//
fun
g0mul_uint0_uint0
( x: uint
, y: uint):<> uint = "mac#%"
fun
g1mul_uint1_uint1
{i,j:int}
( x: uint(i)
, y: uint(j)):<> uint(i*j) = "mac#%"
//
#symload * with g0mul_uint0_uint0 of 10
#symload * with g1mul_uint1_uint1 of 12
//
fun
g0mul_uint0_usize0
( x: uint0
, y: usize):<> usize = "mac#%"
fun
g0mul_usize0_usize0
( x: usize
, y: usize):<> usize = "mac#%"
//
#symload * with g0mul_uint0_usize0 of 10
#symload * with g0mul_usize0_usize0 of 10
//
fun
g1mul_sint1_usize1
{i,j:int
|i >= 0}
( x: sint1(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_sint1_usize1 of 12
fun
g1mul_uint1_usize1
{i,j:int}
( x: uint1(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_uint1_usize1 of 12
fun
g1mul_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_usize1_usize1 of 12
//
(* ****** ****** *)
//
fun
g0mul_slint0_slint0
( x: slint
, y: slint):<> slint = "mac#%"
#symload * with g0mul_slint0_slint0 of 10
//
fun
g1mul_slint1_slint1
{i,j:int}
( x: slint(i)
, y: slint(j)):<> slint(i*j) = "mac#%"
#symload * with g1mul_slint1_slint1 of 12
//
fun
g0mul_ulint0_ulint0
( x: ulint
, y: ulint):<> ulint = "mac#%"
#symload * with g0mul_ulint0_ulint0 of 10
//
fun
g1mul_ulint1_ulint1
{i,j:int}
( x: ulint(i)
, y: ulint(j)):<> ulint(i*j) = "mac#%"
#symload * with g1mul_ulint1_ulint1 of 12
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0int_div
( g0int(k1)
, g0int(k2)):<> g0int(k3)
fun
{k1
,k2:tflt}
{k3:tflt}
g1int_div
{i,j:int
|j != 0}
( g1int(k1, i)
, g1int(k2, j)):<> g1int(k3, i/j)
//
fun
g0div_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
#symload / with g0div_sint0_sint0 of 10
fun
g1div_sint1_sint1
{i,j:int
|j != 0 }
( x
: sint(i)
, y
: sint(j)):<> sint(i/j) = "mac#%"
#symload / with g1div_sint1_sint1 of 12
//
fun
g0div_uint0_uint0
( uint , uint ):<> uint = "mac#%"
#symload / with g0div_uint0_uint0 of 10
fun
g1div_uint1_uint1
{i,j:int
|j > 0 }
( x
: uint(i)
, y
: uint(j)):<> uint(i/j) = "mac#%"
#symload / with g1div_uint1_uint1 of 12
//
fun
g0div_usize0_sint1
{j:int|j > 0}
( x
: usize
, y
: sint1(j)):<> usize = "mac#%"
#symload / with g0div_usize0_sint1 of 11
fun
g1div_usize1_sint1
{i,j:int
|j > 0 }
( x
: usize(i)
, y
: sint1(j)):<> usize(i/j) = "mac#%"
#symload / with g1div_usize1_sint1 of 12
//
fun
g0div_usize0_usize0
( usize, usize ):<> usize = "mac#%"
#symload / with g0div_usize0_usize0 of 10
fun
g1div_usize1_usize1
{i,j:int
|j > 0 }
( x: usize(i)
, y: usize(j)):<> usize(i/j) = "mac#%"
#symload / with g1div_usize1_usize1 of 12
//
(* ****** ****** *)

fun
g0mod_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
#symload % with g0mod_sint0_sint0 of 10
fun
g0mod_uint0_uint0
( x: uint
, y: uint):<> uint = "mac#%"
#symload % with g0mod_uint0_uint0 of 10
//
fun
g0mod_usize0_usize0
( usize, usize ):<> usize = "mac#%"
#symload % with g0mod_usize0_usize0 of 10
fun
g1mod_usize1_usize1
{i:int;j:int|j > 0}
( usize(i), usize(j) ):<> Sizelt(j) = "mac#%"
#symload % with g1mod_usize1_usize1 of 12
//
(* ****** ****** *)
//
fun
g0lt_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0gt_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0eq_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
//
fun
g0lte_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0gte_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0neq_sint0_sint0
( x: sint
, y: sint):<> bool = "mac#%"
//
fun
g0cmp_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
//
#symload < with g0lt_sint0_sint0 of 10
#symload > with g0gt_sint0_sint0 of 10
#symload = with g0eq_sint0_sint0 of 10
#symload <= with g0lte_sint0_sint0 of 10
#symload >= with g0gte_sint0_sint0 of 10
#symload != with g0neq_sint0_sint0 of 10
(*
#symload <=> with g0cmp_sint0_sint0 of 10
*)
//
(* ****** ****** *)
//
fun
g0max_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
fun
g0min_sint0_sint0
( x: sint
, y: sint):<> sint = "mac#%"
//
#symload max with g0max_sint0_sint0 of 10
#symload min with g0max_sint0_sint0 of 10
//
(* ****** ****** *)
//
fun
g1lt_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i < j) = "mac#%"
fun
g1lte_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i <= j) = "mac#%"
//
fun
g1gt_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i > j) = "mac#%"
fun
g1gte_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i >= j) = "mac#%"
//
fun
g1eq_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i == j) = "mac#%"
fun
g1neq_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i != j) = "mac#%"
//
#symload < with g1lt_sint1_sint1 of 12
#symload > with g1gt_sint1_sint1 of 12
#symload = with g1eq_sint1_sint1 of 12
//
#symload <= with g1lte_sint1_sint1 of 12
#symload >= with g1gte_sint1_sint1 of 12
#symload != with g1neq_sint1_sint1 of 12
(*
#symload <=> with g1cmp_sint1_sint1 of 12
*)
//
(* ****** ****** *)
//
fun
g1max_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(max(i,j)) = "mac#%"
fun
g1min_sint1_sint1
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(min(i,j)) = "mac#%"
//
#symload max with g1max_sint1_sint1 of 12
#symload min with g1max_sint1_sint1 of 12
//
(* ****** ****** *)
//
fun
g0eq_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0lt_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0gt_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
//
fun
g0lte_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0gte_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0neq_uint0_uint0
( x: uint
, y: uint):<> bool = "mac#%"
//
fun
g0cmp_uint0_uint0
( x: uint
, y: uint):<> sint = "mac#%"
//
#symload < with g0lt_uint0_uint0 of 10
#symload > with g0gt_uint0_uint0 of 10
#symload = with g0eq_uint0_uint0 of 10
//
#symload <= with g0lte_uint0_uint0 of 10
#symload >= with g0gte_uint0_uint0 of 10
#symload != with g0neq_uint0_uint0 of 10
(*
#symload <=> with g0cmp_uint0_uint0 of 10
*)
//
(* ****** ****** *)
//
fun
g0lt_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
fun
g0gt_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
fun
g0eq_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
fun
g0lte_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
fun
g0gte_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
fun
g0neq_uint0_sint1
  {j:nat}
( x: uint0
, y: sint1(j)):<> bool = "mac#%"
//
#symload < with g0lt_uint0_sint1 of 11
#symload > with g0gt_uint0_sint1 of 11
#symload = with g0eq_uint0_sint1 of 11
#symload <= with g0lte_uint0_sint1 of 11
#symload >= with g0gte_uint0_sint1 of 11
#symload != with g0neq_uint0_sint1 of 11
(*
#symload <=> with g0cmp_uint0_sint1 of 11
*)
//
(* ****** ****** *)
//
fun
g0lt_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0lte_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0gt_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0gte_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0eq_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0neq_usize0_usize0
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0cmp_usize0_usize0
( x: usize
, y: usize):<> sint = "mac#%"
//
#symload < with g0lt_usize0_usize0 of 10
#symload > with g0gt_usize0_usize0 of 10
#symload = with g0eq_usize0_usize0 of 10
#symload <= with g0lte_usize0_usize0 of 10
#symload >= with g0gte_usize0_usize0 of 10
#symload != with g0neq_usize0_usize0 of 10
(*
#symload <=> with g0cmp_usize0_usize0 of 10
*)
//
(* ****** ****** *)
//
fun
g0lt_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0gt_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0eq_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0lte_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0gte_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0neq_usize0_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
//
#symload < with g0lt_usize0_sint1 of 11
#symload > with g0gt_usize0_sint1 of 11
#symload = with g0eq_usize0_sint1 of 11
#symload <= with g0lte_usize0_sint1 of 11
#symload >= with g0gte_usize0_sint1 of 11
#symload != with g0neq_usize0_sint1 of 11
(*
#symload <=> with g0cmp_usize0_sint1 of 11
*)
//
(* ****** ****** *)
//
fun
g1lt_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i < j) = "mac#%"
fun
g1lte_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i <= j) = "mac#%"
//
fun
g1gt_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i > j) = "mac#%"
fun
g1gte_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i >= j) = "mac#%"
//
fun
g1eq_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i == j) = "mac#%"
fun
g1neq_usize1_usize1
{i,j:int}
( x: usize(i)
, y: usize(j)):<> bool(i != j) = "mac#%"
//
#symload < with g1lt_usize1_usize1 of 12
#symload > with g1gt_usize1_usize1 of 12
#symload = with g1eq_usize1_usize1 of 12
//
#symload <= with g1lte_usize1_usize1 of 12
#symload >= with g1gte_usize1_usize1 of 12
#symload != with g1neq_usize1_usize1 of 12
(*
#symload <=> with g1cmp_usize1_usize1 of 12
*)
//
(* ****** ****** *)
//
fun
g1lt_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i < j) = "mac#%"
fun
g1lte_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i <= j) = "mac#%"
//
fun
g1gt_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i > j) = "mac#%"
fun
g1gte_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i >= j) = "mac#%"
//
fun
g1eq_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i == j) = "mac#%"
fun
g1neq_usize1_sint1
{i,j:int}
( x: usize(i)
, y: sint1(j)):<> bool(i != j) = "mac#%"
//
#symload < with g1lt_usize1_sint1 of 12
#symload > with g1gt_usize1_sint1 of 12
#symload = with g1eq_usize1_sint1 of 12
//
#symload <= with g1lte_usize1_sint1 of 12
#symload >= with g1gte_usize1_sint1 of 12
#symload != with g1neq_usize1_sint1 of 12
(*
#symload <=> with g1cmp_usize1_sint1 of 12
*)
//
(* ****** ****** *)
//
fun
g0lsl_uint0_sint1
( x: uint
, y: Intgte(0)):<> uint = "mac#%"
//
fun
g0lsr_uint0_sint1
( x: uint
, y: Intgte(0)):<> uint = "mac#%"
//
#symload << with g0lsl_uint0_sint1
#symload >> with g0lsr_uint0_sint1
//
#symload lsl with g0lsl_uint0_sint1
#symload lsr with g0lsl_uint0_sint1
//
(* ****** ****** *)
//
fun
g0lnot_uint0
(x: uint):<> uint = "mac#%"
//
#symload ~ with g0lnot_uint0 of 10
#symload lnot with g0lnot_uint0 of 10
//
fun
g0lor2_uint0_uint0
(x: uint, y: uint):<> uint = "mac#%"
//
fun
g0land_uint0_uint0
(x: uint, y: uint):<> uint = "mac#%"
//
fun
g0lxor_uint0_uint0
(x: uint, y: uint):<> uint = "mac#%"
//
(*
#symload | with g0lor2_uint0_uint0 of 10
#symload & with g0land_uint0_uint0 of 10
#symload ^ with g0lxor_uint0_uint0 of 10
*)
//
#symload lor with g0lor2_uint0_uint0 of 10
#symload lor2 with g0lor2_uint0_uint0 of 10
#symload land with g0land_uint0_uint0 of 10
#symload lxor with g0lxor_uint0_uint0 of 10
//
(* ****** ****** *)
//
// HX-2019-05-11:
// For listization
//
(* ****** ****** *)

fun{}
sint0_forall(sint): bool
fun{}
sint0_forall$test(sint): bool
fun{}
sint0_foreach(sint): void
fun{}
sint0_foreach$work(sint): void

(* ****** ****** *)

fun
{r0:vtflt}
sint0_foldleft(sint, r0): r0
fun
{r0:vtflt}
sint0_foldleft$fopr(r0, sint): r0

(* ****** ****** *)
//
fun{}
sint0_listize(sint): list0_vt(sint)
fun{}
uint0_listize(uint): list0_vt(uint)
fun{}
usize0_listize(size): list0_vt(size)
//
(* ****** ****** *)
//
fun{}
sint0_rlistize(sint): list0_vt(sint)
fun{}
uint0_rlistize(uint): list0_vt(uint)
fun{}
usize0_rlistize(size): list0_vt(size)
//
(* ****** ****** *)
//
// HX-2019-05-11:
// For streamization
//
(* ****** ****** *)
//
fun{}
sint0_streamize(sint): stream_vt(sint)
fun{}
uint0_streamize(uint): stream_vt(uint)
fun{}
usize0_streamize(size): stream_vt(size)
//
(* ****** ****** *)
//
fun{}
sint0_streamize_gte(beg: sint): stream_vt(sint)
fun{}
sint0_streamize_lte(beg: sint): stream_vt(sint)
//
fun{}
uint0_streamize_gte(beg: uint): stream_vt(uint)
fun{}
usize0_streamize_gte(beg: size): stream_vt(size)
//
(* ****** ****** *)
//
// HX-2019-05:
// For fixed-sized integers
//
(* ****** ****** *)
//
abstflt
sint8_tk =
$extype"atstype_sint8"
abstflt
uint8_tk =
$extype"atstype_uint8"
//
typedef sint8 = g0int_t0ype(sint8_tk)
typedef uint8 = g0int_t0ype(uint8_tk)
//
(* ****** ****** *)
//
abstflt
sint16_tk =
$extype"atstype_sint16"
abstflt
uint16_tk =
$extype"atstype_uint16"
//
typedef sint16 = g0int_t0ype(sint16_tk)
typedef uint16 = g0int_t0ype(uint16_tk)
//
(* ****** ****** *)
//
abstflt
sint32_tk =
$extype"atstype_sint32"
abstflt
uint32_tk =
$extype"atstype_uint32"
//
typedef sint32 = g0int_t0ype(sint32_tk)
typedef uint32 = g0int_t0ype(uint32_tk)
//
(* ****** ****** *)
//
abstflt
sint64_tk =
$extype"atstype_sint64"
abstflt
uint64_tk =
$extype"atstype_uint64"
//
typedef sint64 = g0int_t0ype(sint64_tk)
typedef uint64 = g0int_t0ype(uint64_tk)
//
(* ****** ****** *)

(* end of [gint.sats] *)
