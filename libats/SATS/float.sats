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
{k1:tflt}
{k2:tflt}
g0float_cast
(g0float(k1)):<> g0float(k2)
//
(* ****** ****** *)
//
fun
g0cast_sint_float
  (i0: sint):<> float = "mac#%"
fun
g0cast_sint_double
  (i0: sint):<> double = "mac#%"
fun
g0cast_sint_ldouble
  (i0: sint):<> ldouble = "mac#%"
//
#symload
cast2flt with g0cast_sint_float of 10
#symload
cast2dbl with g0cast_sint_double of 10
#symload
cast2ldbl with g0cast_sint_ldouble of 10
//
(* ****** ****** *)
//
fun
g0cast_slint_float
  (i0: slint):<> double = "mac#%"
fun
g0cast_slint_double
  (i0: slint):<> double = "mac#%"
fun
g0cast_slint_ldouble
  (i0: slint):<> double = "mac#%"
//
#symload
cast2flt with g0cast_slint_float of 10
#symload
cast2dbl with g0cast_slint_double of 10
#symload
cast2ldbl with g0cast_slint_ldouble of 10
//
(* ****** ****** *)
//
fun
g0cast_float_sint
  (f0: float):<> sint = "mac#%"
fun
g0cast_float_slint
  (f0: float):<> slint = "mac#%"
fun
g0cast_float_sllint
  (f0: float):<> sllint = "mac#%"
//
#symload
cast2sint with g0cast_float_sint of 10
#symload
cast2slint with g0cast_float_slint of 10
#symload
cast2sllint with g0cast_float_sllint of 10
//
(* ****** ****** *)
//
fun
g0cast_double_sint
  (f0: double):<> sint = "mac#%"
fun
g0cast_double_slint
  (f0: double):<> lint = "mac#%"
fun
g0cast_double_sllint
  (f0: double):<> sllint = "mac#%"
//
#symload
cast2sint with g0cast_double_sint of 10
#symload
cast2slint with g0cast_double_slint of 10
#symload
cast2sllint with g0cast_double_sllint of 10
//
(* ****** ****** *)
//
fun
g0cast_float_double
  (f0: float):<> double = "mac#%"
fun
g0cast_float_ldouble
  (f0: float):<> ldouble = "mac#%"
fun
g0cast_double_ldouble
  (f0: double):<> ldouble = "mac#%"
//
#symload
cast2dbl with g0cast_float_double of 10
#symload
cast2ldbl with g0cast_float_ldouble of 10
#symload
cast2ldbl with g0cast_double_ldouble of 10
//
(* ****** ****** *)
//
fun
g0abs_float
  (f0: float):<> float = "mac#%"
fun
g0abs_double
  (f0: double):<> double = "mac#%"
fun
g0abs_ldouble
  (f0: ldouble):<> ldouble = "mac#%"
//
#symload abs with g0abs_float of 10
#symload abs with g0abs_double of 10
#symload abs with g0abs_ldouble of 10
//
(* ****** ****** *)
//
fun
g0neg_float
  (f0: float):<> float = "mac#%"
fun
g0neg_double
  (f0: double):<> double = "mac#%"
fun
g0neg_ldouble
  (f0: ldouble):<> ldouble = "mac#%"
//
#symload ~ with g0neg_float of 10
#symload ~ with g0neg_double of 10
#symload ~ with g0neg_ldouble of 10
#symload neg with g0neg_float of 10
#symload neg with g0neg_double of 10
#symload neg with g0neg_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1:tflt}
{k2:tflt}
g0float_succ
( g0float(k1) ):<> g0float(k2)
//
fun
g0succ_float
  (f0: float):<> float = "mac#%"
fun
g0succ_double
  (f0: double):<> double = "mac#%"
fun
g0succ_ldouble
  (f0: ldouble):<> ldouble = "mac#%"
//
#symload succ with g0succ_float of 10
#symload succ with g0succ_double of 10
#symload succ with g0succ_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1:tflt}
{k2:tflt}
g0float_pred
( g0float(k1) ):<> g0float(k2)
//
fun
g0pred_float
  (f0: float):<> float = "mac#%"
fun
g0pred_double
  (f0: double):<> double = "mac#%"
fun
g0pred_ldouble
  (f0: ldouble):<> ldouble = "mac#%"
//
#symload pred with g0pred_float of 10
#symload pred with g0pred_double of 10
#symload pred with g0pred_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0float_add
( g0float(k1)
, g0float(k2)):<> g0float(k3)
//
(* ****** ****** *)
//
fun
g0add_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0add_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0add_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload + with g0add_float_float of 10
#symload + with g0add_double_double of 10
#symload + with g0add_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0float_sub
( g0float(k1)
, g0float(k2)):<> g0float(k3)
//
fun
g0sub_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0sub_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0sub_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload - with g0sub_float_float of 10
#symload - with g0sub_double_double of 10
#symload - with g0sub_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0float_mul
( g0float(k1)
, g0float(k2)):<> g0float(k3)
//
fun
g0mul_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0mul_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0mul_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload * with g0mul_float_float of 10
#symload * with g0mul_double_double of 10
#symload * with g0mul_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun
{k1
,k2:tflt}
{k3:tflt}
g0float_div
( g0float(k1)
, g0float(k2)):<> g0float(k3)
//
fun
g0div_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0div_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0div_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload / with g0div_float_float of 10
#symload / with g0div_double_double of 10
#symload / with g0div_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun
g0mod_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0mod_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0mod_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload % with g0mod_float_float of 10
#symload % with g0mod_double_double of 10
#symload % with g0mod_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun
g0lt_float_float
( x: float
, y: float):<> bool = "mac#%"
fun
g0gt_float_float
( x: float
, y: float):<> bool = "mac#%"
fun
g0eq_float_float
( x: float
, y: float):<> bool = "mac#%"
//
fun
g0lte_float_float
( x: float
, y: float):<> bool = "mac#%"
fun
g0gte_float_float
( x: float
, y: float):<> bool = "mac#%"
fun
g0neq_float_float
( x: float
, y: float):<> bool = "mac#%"
//
fun
g0cmp_float_float
( x: float
, y: float):<> sint = "mac#%"
//
#symload < with g0lt_float_float of 10
#symload > with g0gt_float_float of 10
#symload = with g0eq_float_float of 10
#symload <= with g0lte_float_float of 10
#symload >= with g0gte_float_float of 10
#symload != with g0neq_float_float of 10
(*
#symload <=> with g0cmp_float_float of 10
*)
//
(* ****** ****** *)
//
fun
g0lt_double_double
( x: double
, y: double):<> bool = "mac#%"
fun
g0gt_double_double
( x: double
, y: double):<> bool = "mac#%"
fun
g0eq_double_double
( x: double
, y: double):<> bool = "mac#%"
//
fun
g0lte_double_double
( x: double
, y: double):<> bool = "mac#%"
fun
g0gte_double_double
( x: double
, y: double):<> bool = "mac#%"
fun
g0neq_double_double
( x: double
, y: double):<> bool = "mac#%"
//
fun
g0cmp_double_double
( x: double
, y: double):<> sint = "mac#%"
//
#symload < with g0lt_double_double of 10
#symload > with g0gt_double_double of 10
#symload = with g0eq_double_double of 10
#symload <= with g0lte_double_double of 10
#symload >= with g0gte_double_double of 10
#symload != with g0neq_double_double of 10
(*
#symload <=> with g0cmp_double_double of 10
*)
//
(* ****** ****** *)
//
fun
g0lt_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
fun
g0gt_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
fun
g0eq_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
//
fun
g0lte_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
fun
g0gte_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
fun
g0neq_ldouble_ldouble
( x: ldouble
, y: ldouble):<> bool = "mac#%"
//
fun
g0cmp_ldouble_ldouble
( x: ldouble
, y: ldouble):<> sint = "mac#%"
//
#symload < with g0lt_ldouble_ldouble of 10
#symload > with g0gt_ldouble_ldouble of 10
#symload = with g0eq_ldouble_ldouble of 10
#symload <= with g0lte_ldouble_ldouble of 10
#symload >= with g0gte_ldouble_ldouble of 10
#symload != with g0neq_ldouble_ldouble of 10
(*
#symload <=> with g0cmp_ldouble_ldouble of 10
*)
(* ****** ****** *)
//
fun
g0max_float_float
( x: float
, y: float):<> float = "mac#%"
fun
g0min_float_float
( x: float
, y: float):<> float = "mac#%"
//
#symload max with g0max_float_float of 10
#symload min with g0min_float_float of 10
//
fun
g0max_double_double
( x: double
, y: double):<> double = "mac#%"
fun
g0min_double_double
( x: double
, y: double):<> double = "mac#%"
//
#symload max with g0max_double_double of 10
#symload min with g0min_double_double of 10
//
fun
g0max_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
fun
g0min_ldouble_ldouble
( x: ldouble
, y: ldouble):<> ldouble = "mac#%"
//
#symload max with g0max_ldouble_ldouble of 10
#symload min with g0min_ldouble_ldouble of 10
//
(* ****** ****** *)
//
fun{}
g0mul_sint_float
  (i0: sint, f1: float): float
fun{}
g0mul_float_sint
  (f0: float, i1: sint): float
//
fun{}
g0mul_sint_double
  (i0: sint, f1: double): double
fun{}
g0mul_double_sint
  (f0: double, i1: sint): double
//
#symload * with g0mul_sint_float
#symload * with g0mul_float_sint
#symload * with g0mul_sint_double
#symload * with g0mul_double_sint
//
(* ****** ****** *)
//
fun{}
g0div_sint_float
  (i0: sint, f1: float): float
fun{}
g0div_float_sint
  (f0: float, i1: sint): float
//
fun{}
g0div_sint_double
  (i0: sint, f1: double): double
fun{}
g0div_double_sint
  (f0: double, i1: sint): double
//
#symload / with g0div_sint_float
#symload / with g0div_float_sint
#symload / with g0div_sint_double
#symload / with g0div_double_sint
//
(* ****** ****** *)

(* end of [float.sats] *)
