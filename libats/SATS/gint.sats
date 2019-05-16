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
g0cast_sint_uint
(x: sint):<> uint = "mac#%"
fun
g1cast_sint_uint
{i:nat}
(x: sint(i)):<> uint(i) = "mac#%"
fun
g1cast_sint_usize
{i:nat}
(x: sint(i)):<> usize(i) = "mac#%"
//
#symload
cast with g0cast_sint_uint of 10
#symload
cast with g1cast_sint_uint of 12
#symload
cast with g1cast_sint_usize of 12
#symload
i2sz with g1cast_sint_usize of 12
//
fun
g0cast_sint_slint
(x: sint):<> slint = "mac#%"
fun
g1cast_sint_slint
{i:int}
(x: sint(i)):<> slint(i) = "mac#%"
//
#symload
cast with g0cast_sint_slint of 10
#symload
cast with g1cast_sint_slint of 12
//
fun
g0cast_slint_sllint
(x: slint):<> sllint = "mac#%"
fun
g1cast_slint_sllint
{i:int}
(x: slint(i)):<> sllint(i) = "mac#%"
//
#symload
cast with g0cast_slint_sllint of 10
#symload
cast with g1cast_slint_sllint of 12
//
(* ****** ****** *)
//
fun
g0abs_sint
(x: sint):<> sint = "mac#%"
#symload abs with g0abs_sint of 10
//
fun
g0abs_slint
(x: slint):<> slint = "mac#%"
#symload abs with g0abs_slint of 10
//
(* ****** ****** *)
//
fun
g0neg_sint
(x: sint):<> sint = "mac#%"
fun
g1neg_sint
{i:int}
(x: sint(i)):<> sint(~i) = "mac#%"
//
#symload ~ with g0neg_sint of 10
#symload ~ with g1neg_sint of 11
#symload neg with g0neg_sint of 10
#symload neg with g1neg_sint of 11
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
g0succ_sint
(x: sint):<> sint = "mac#%"
#symload succ with g0succ_sint of 10
fun
g1succ_sint
{i:int}
(x: sint(i)):<> sint(i+1) = "mac#%"
#symload succ with g1succ_sint of 11
//
fun
g0succ_uint
(x: uint):<> uint = "mac#%"
#symload succ with g0succ_uint of 10
fun
g1succ_uint
{i:int}
(x: uint(i)):<> uint(i+1) = "mac#%"
#symload succ with g1succ_uint of 11
//
fun
g0succ_ssize
(x: ssize):<> ssize = "mac#%"
#symload succ with g0succ_ssize of 10
fun
g1succ_ssize
{i:int}
(x: ssize(i)):<> ssize(i+1) = "mac#%"
#symload succ with g1succ_ssize of 11
//
fun
g0succ_usize
(x: usize):<> usize = "mac#%"
#symload succ with g0succ_usize of 10
fun
g1succ_usize
{i:int}
(x: usize(i)):<> usize(i+1) = "mac#%"
#symload succ with g1succ_usize of 11
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
g0pred_sint
(x: sint):<> sint = "mac#%"
#symload pred with g0pred_sint of 10
fun
g1pred_sint
{i:int}
(x: sint(i)):<> sint(i-1) = "mac#%"
#symload pred with g1pred_sint of 11
//
fun
g0pred_uint
(x: uint):<> uint = "mac#%"
#symload pred with g0pred_uint of 10
fun
g1pred_uint
{i:pos}
(x: uint(i)):<> uint(i-1) = "mac#%"
#symload pred with g1pred_uint of 11
//
fun
g0pred_ssize
(x: ssize):<> ssize = "mac#%"
#symload pred with g0pred_ssize of 10
fun
g1pred_ssize
{i:int}
(x: ssize(i)):<> ssize(i-1) = "mac#%"
#symload pred with g1pred_ssize of 11
//
fun
g0pred_usize
(x: usize):<> usize = "mac#%"
#symload pred with g0pred_usize of 10
fun
g1pred_usize
{i:pos}
(x: usize(i)):<> usize(i-1) = "mac#%"
#symload pred with g1pred_usize of 11
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
g0add_sint_sint
( x: sint
, y: sint):<> sint = "mac#%"
fun
g1add_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(i+j) = "mac#%"
//
#symload + with g0add_sint_sint of 10
#symload + with g1add_sint_sint of 12
//
fun
g0add_uint_uint
( x: uint
, y: uint):<> uint = "mac#%"
#symload + with g0add_uint_uint of 10
fun
g1add_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)):<> uint(i+j) = "mac#%"
#symload + with g1add_uint_uint of 12
//
fun
g0add_sint0_ssize
( x: sint0
, y: ssize):<> ssize = "mac#%"
#symload + with g0add_sint0_ssize of 10
fun
g0add_ssize_ssize
( x: ssize
, y: ssize):<> ssize = "mac#%"
#symload + with g0add_ssize_ssize of 10
//
fun
g1add_sint1_ssize
{i,j:int}
( x: sint1(i)
, y: ssize(j)):<> ssize(i+j) = "mac#%"
#symload + with g1add_sint1_ssize of 12
fun
g1add_ssize_ssize
{i,j:int}
( x: ssize(i)
, y: ssize(j)):<> ssize(i+j) = "mac#%"
#symload + with g1add_ssize_ssize of 12
//
fun
g0add_uint0_usize
( x: uint
, y: usize):<> usize = "mac#%"
#symload + with g0add_uint0_usize of 10
fun
g0add_usize_usize
( x: usize
, y: usize):<> usize = "mac#%"
#symload + with g0add_usize_usize of 10
//
fun
g1add_sint1_usize
{i,j:int
|i >= 0}
( x: sint1(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_sint1_usize of 12
fun
g1add_uint1_usize
{i,j:int}
( x: uint(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_uint1_usize of 12
fun
g1add_usize_usize
{i,j:int}
( x: usize(i)
, y: usize(j)):<> usize(i+j) = "mac#%"
#symload + with g1add_usize_usize of 12
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
g0sub_sint_sint
( x: sint
, y: sint):<> sint = "mac#%"
#symload - with g0sub_sint_sint of 10
fun
g1sub_sint_sint
{i,j:int}
( x
: sint(i)
, y
: sint(j)):<> sint(i-j) = "mac#%"
#symload - with g1sub_sint_sint of 12
//
fun
g0sub_uint_uint
( uint , uint ):<> uint = "mac#%"
#symload - with g0sub_uint_uint of 10
fun
g1sub_uint_uint
{i,j:int
|i > j }
( x
: uint(i)
, y
: uint(j)):<> uint(i-j) = "mac#%"
#symload - with g1sub_uint_uint of 12
//
fun
g0sub_ssize_ssize
(ssize, ssize):<> ssize = "mac#%"
#symload - with g0sub_ssize_ssize of 10
fun
g1sub_ssize_ssize
{i,j:int}
( x
: ssize(i)
, y
: ssize(j)):<> ssize(i-j) = "mac#%"
#symload - with g1sub_ssize_ssize of 12
//
fun
g0sub_usize_sint1
{j:nat}
( x
: usize
, y
: sint1(j)):<> usize = "mac#%"
#symload - with g0sub_usize_sint1 of 10
fun
g0sub_usize_usize
( x: usize
, y: usize):<> usize = "mac#%"
#symload - with g0sub_usize_usize of 10
fun
g1sub_usize_usize
{i,j:int
|i > j }
( x
: usize(i)
, y
: usize(j)):<> usize(i-j) = "mac#%"
#symload - with g1sub_usize_usize of 12
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
g0mul_sint_sint
( x: sint
, y: sint):<> sint = "mac#%"
fun
g1mul_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> sint(i*j) = "mac#%"
//
#symload * with g0mul_sint_sint of 10
#symload * with g1mul_sint_sint of 12
//
fun
g0mul_uint_uint
( x: uint
, y: uint):<> uint = "mac#%"
fun
g1mul_uint_uint
{i,j:int}
( x: uint(i)
, y: uint(j)):<> uint(i*j) = "mac#%"
//
#symload * with g0mul_uint_uint of 10
#symload * with g1mul_uint_uint of 12
//
fun
g0mul_uint0_usize
( x: uint0
, y: usize):<> usize = "mac#%"
fun
g0mul_usize_usize
( x: usize
, y: usize):<> usize = "mac#%"
//
#symload * with g0mul_uint0_usize of 10
#symload * with g0mul_usize_usize of 10
//
fun
g1mul_sint1_usize
{i,j:int
|i >= 0}
( x: sint1(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_sint1_usize of 12
fun
g1mul_uint1_usize
{i,j:int}
( x: uint1(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_uint1_usize of 12
fun
g1mul_usize_usize
{i,j:int}
( x: usize(i)
, y: usize(j)):<> usize(i*j) = "mac#%"
#symload * with g1mul_usize_usize of 12
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
g0div_sint_sint
( x: sint
, y: sint):<> sint = "mac#%"
#symload / with g0div_sint_sint of 10
fun
g1div_sint_sint
{i,j:int
|j != 0 }
( x
: sint(i)
, y
: sint(j)):<> sint(i/j) = "mac#%"
#symload / with g1div_sint_sint of 12
//
fun
g0div_uint_uint
( uint , uint ):<> uint = "mac#%"
#symload / with g0div_uint_uint of 10
fun
g1div_uint_uint
{i,j:int
|j > 0 }
( x
: uint(i)
, y
: uint(j)):<> uint(i/j) = "mac#%"
#symload / with g1div_sint_sint of 12
//
fun
g0div_usize_sint1
{j:int|j > 0}
( x
: usize
, y
: sint1(j)):<> usize = "mac#%"
#symload / with g0div_usize_sint1 of 11
fun
g1div_usize_sint1
{i,j:int
|j > 0 }
( x
: usize(i)
, y
: sint1(j)):<> usize(i/j) = "mac#%"
#symload / with g1div_usize_sint1 of 12
//
fun
g0div_usize_usize
( usize, usize ):<> usize = "mac#%"
#symload / with g0div_usize_usize of 10
fun
g1div_usize_usize
{i,j:int
|j > 0 }
( x: usize(i)
, y: usize(j)):<> usize(i/j) = "mac#%"
#symload / with g1div_usize_usize of 12
//
(* ****** ****** *)
//
fun
g0lt_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0lte_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
//
fun
g0gt_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0gte_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
//
fun
g0eq_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
fun
g0neq_sint_sint
( x: sint
, y: sint):<> bool = "mac#%"
//
fun
g0cmp_sint_sint
( x: sint
, y: sint):<> sint = "mac#%"
//
#symload < with g0lt_sint_sint of 10
#symload > with g0gt_sint_sint of 10
#symload = with g0eq_sint_sint of 10
#symload <= with g0lte_sint_sint of 10
#symload >= with g0gte_sint_sint of 10
#symload != with g0neq_sint_sint of 10
(*
#symload <=> with g0cmp_sint_sint of 10
*)
//
(* ****** ****** *)
//
fun
g1lt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i < j) = "mac#%"
fun
g1lte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i <= j) = "mac#%"
//
fun
g1gt_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i > j) = "mac#%"
fun
g1gte_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i >= j) = "mac#%"
//
fun
g1eq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i == j) = "mac#%"
fun
g1neq_sint_sint
{i,j:int}
( x: sint(i)
, y: sint(j)):<> bool(i != j) = "mac#%"
//
(* ****** ****** *)
//
#symload < with g1lt_sint_sint of 12
#symload > with g1gt_sint_sint of 12
#symload = with g1eq_sint_sint of 12
//
#symload <= with g1lte_sint_sint of 12
#symload >= with g1gte_sint_sint of 12
#symload != with g1neq_sint_sint of 12
//
(* ****** ****** *)
//
fun
g0lt_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0lte_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
//
fun
g0gt_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0gte_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
//
fun
g0eq_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
fun
g0neq_uint_uint
( x: uint
, y: uint):<> bool = "mac#%"
//
fun
g0cmp_uint_uint
( x: uint
, y: uint):<> sint = "mac#%"
//
#symload < with g0lt_uint_uint of 10
#symload > with g0gt_uint_uint of 10
#symload = with g0eq_uint_uint of 10
//
#symload <= with g0lte_uint_uint of 10
#symload >= with g0gte_uint_uint of 10
#symload != with g0neq_uint_uint of 10
(*
#symload <=> with g0cmp_uint_uint of 10
*)
//
(* ****** ****** *)
//
fun
g0lt_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0lte_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0gt_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0gte_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0eq_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
fun
g0neq_usize_usize
( x: usize
, y: usize):<> bool = "mac#%"
//
fun
g0cmp_usize_usize
( x: usize
, y: usize):<> sint = "mac#%"
//
#symload < with g0lt_usize_usize of 10
#symload > with g0gt_usize_usize of 10
#symload = with g0eq_usize_usize of 10
#symload <= with g0lte_usize_usize of 10
#symload >= with g0gte_usize_usize of 10
#symload != with g0neq_usize_usize of 10
(*
#symload <=> with g0cmp_usize_usize of 10
*)
//
(* ****** ****** *)

fun
g0lt_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0gt_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0eq_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0lte_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0gte_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
fun
g0neq_usize_sint1
  {j:nat}
( x: usize
, y: sint1(j)):<> bool = "mac#%"
//
#symload < with g0lt_usize_sint1 of 11
#symload > with g0gt_usize_sint1 of 11
#symload = with g0eq_usize_sint1 of 11
#symload <= with g0lte_usize_sint1 of 11
#symload >= with g0gte_usize_sint1 of 11
#symload != with g0neq_usize_sint1 of 11
(*
#symload <=> with g0cmp_usize_sint1 of 11
*)
//
(* ****** ****** *)
//
// HX-2019-05-11:
// For listization
//
(* ****** ****** *)
//
fun{}
sint_listize(sint): list0_vt(sint)
fun{}
uint_listize(uint): list0_vt(uint)
//
(* ****** ****** *)
//
fun{}
sint_rlistize(sint): list0_vt(sint)
fun{}
uint_rlistize(uint): list0_vt(uint)
//
(* ****** ****** *)
//
// HX-2019-05-11:
// For streamization
//
(* ****** ****** *)
//
fun{}
sint_streamize(sint): stream_vt(sint)
fun{}
uint_streamize(uint): stream_vt(uint)
//
(* ****** ****** *)

(* end of [gint.sats] *)
