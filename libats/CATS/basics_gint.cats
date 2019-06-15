/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
*) */

/* ****** ****** */
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
/* ****** ****** */

ATSinline()
atstype_sint
temptory_g0abs_sint0
  (atstype_sint x)
{
  return (x >= 0? x : -x);
}
ATSinline()
atstype_slint
temptory_g0abs_slint0
  (atstype_slint x)
{
  return (x >= 0? x : -x);
}

/* ****** ****** */

#define \
temptory_g0neg_sint0(x) (-x)
#define \
temptory_g1neg_sint1(x) (-x)

/* ****** ****** */
//
#define \
temptory_g0succ_sint0(x) (x + 1)
#define \
temptory_g1succ_sint1(x) (x + 1)
#define \
temptory_g0succ_uint0(x) (x + 1)
#define \
temptory_g1succ_uint1(x) (x + 1)
#define \
temptory_g0succ_ssize0(x) (x + 1)
#define \
temptory_g1succ_ssize1(x) (x + 1)
#define \
temptory_g0succ_usize0(x) (x + 1)
#define \
temptory_g1succ_usize1(x) (x + 1)
#define \
temptory_g0succ_ulint0(x) (x + 1)
#define \
temptory_g1succ_ulint1(x) (x + 1)
//
#define \
temptory_g0pred_sint0(x) (x - 1)
#define \
temptory_g1pred_sint1(x) (x - 1)
#define \
temptory_g0pred_uint0(x) (x - 1)
#define \
temptory_g1pred_uint1(x) (x - 1)
#define \
temptory_g0pred_ssize0(x) (x - 1)
#define \
temptory_g1pred_ssize1(x) (x - 1)
#define \
temptory_g0pred_usize0(x) (x - 1)
#define \
temptory_g1pred_usize1(x) (x - 1)
//
/* ****** ****** */

ATSinline()
atstype_uint
temptory_g0cast_sint0_uint0
  (atstype_sint x)
{ return ( (atstype_uint)x ) ; }

ATSinline()
atstype_uint
temptory_g1cast_sint1_uint1
  (atstype_sint x)
{ return ( (atstype_uint)x ) ; }

ATSinline()
atstype_usize
temptory_g0cast_sint0_usize0
  (atstype_sint x)
{ return ( (atstype_usize)x ) ; }
ATSinline()
atstype_usize
temptory_g1cast_sint1_usize1
  (atstype_sint x)
{ return ( (atstype_usize)x ) ; }

ATSinline()
atstype_slint
temptory_g0cast_sint0_slint0
  (atstype_sint x)
{ return ( (atstype_slint)x ) ; }

ATSinline()
atstype_slint
temptory_g1cast_sint1_slint1
  (atstype_sint x)
{ return ( (atstype_slint)x ) ; }

ATSinline()
atstype_sllint
temptory_g0cast_slint0_sllint0
  (atstype_slint x)
{ return ( (atstype_sllint)x ) ; }

ATSinline()
atstype_sllint
temptory_g1cast_slint1_sllint1
  (atstype_slint x)
{ return ( (atstype_sllint)x ) ; }

/* ****** ****** */

#define \
temptory_g0add_sint0_sint0(x, y) (x + y)
#define \
temptory_g1add_sint1_sint1(x, y) (x + y)
#define \
temptory_g0add_uint0_uint0(x, y) (x + y)
#define \
temptory_g1add_uint1_uint1(x, y) (x + y)
#define \
temptory_g0add_sint0_ssize0(x, y) (x + y)
#define \
temptory_g1add_sint1_ssize1(x, y) (x + y)
#define \
temptory_g0add_ssize0_ssize0(x, y) (x + y)
#define \
temptory_g1add_ssize1_ssize1(x, y) (x + y)
#define \
temptory_g0add_uint0_usize0(x, y) (x + y)
#define \
temptory_g1add_sint1_usize1(x, y) (x + y)
#define \
temptory_g1add_uint1_usize1(x, y) (x + y)
#define \
temptory_g0add_usize0_usize0(x, y) (x + y)
#define \
temptory_g1add_usize1_usize1(x, y) (x + y)
//
/* ****** ****** */
//
#define \
temptory_g0add_slint0_slint0(x, y) (x + y)
#define \
temptory_g1add_slint1_slint1(x, y) (x + y)
//
#define \
temptory_g0add_ulint0_ulint0(x, y) (x + y)
#define \
temptory_g1add_ulint1_ulint1(x, y) (x + y)
//
/* ****** ****** */

#define \
temptory_g0sub_sint0_sint0(x, y) (x - y)
#define \
temptory_g1sub_sint1_sint1(x, y) (x - y)
#define \
temptory_g0sub_uint0_uint0(x, y) (x - y)
#define \
temptory_g1sub_uint1_uint1(x, y) (x - y)
#define \
temptory_g0sub_ssize0_ssize0(x, y) (x - y)
#define \
temptory_g1sub_ssize1_ssize1(x, y) (x - y)
#define \
temptory_g0sub_usize0_sint1(x, y) (x - y)
#define \
temptory_g0sub_usize0_usize0(x, y) (x - y)
#define \
temptory_g1sub_usize1_usize1(x, y) (x - y)

/* ****** ****** */

#define \
temptory_g0mul_sint0_sint0(x, y) (x * y)
#define \
temptory_g1mul_sint1_sint1(x, y) (x * y)
#define \
temptory_g0mul_uint0_uint0(x, y) (x * y)
#define \
temptory_g1mul_uint1_uint1(x, y) (x * y)
#define \
temptory_g0mul_ssize0_ssize0(x, y) (x * y)
#define \
temptory_g1mul_ssize1_ssize1(x, y) (x * y)
#define \
temptory_g1mul_sint1_usize1(x, y) (x * y)
#define \
temptory_g0mul_uint0_usize0(x, y) (x * y)
#define \
temptory_g1mul_uint1_usize1(x, y) (x * y)
#define \
temptory_g0mul_usize0_usize0(x, y) (x * y)
#define \
temptory_g1mul_usize1_usize1(x, y) (x * y)
//
#define \
temptory_g0mul_slint0_slint0(x, y) (x * y)
#define \
temptory_g1mul_slint1_slint1(x, y) (x * y)
#define \
temptory_g0mul_ulint0_ulint0(x, y) (x * y)
#define \
temptory_g1mul_ulint1_uline1(x, y) (x * y)
//
/* ****** ****** */

#define \
temptory_g0div_sint0_sint0(x, y) (x / y)
#define \
temptory_g1div_sint1_sint1(x, y) (x / y)
#define \
temptory_g0div_uint0_uint0(x, y) (x / y)
#define \
temptory_g1div_uint1_uint1(x, y) (x / y)
#define \
temptory_g0div_usize0_sint1(x, y) (x / y)
#define \
temptory_g1div_usize1_sint1(x, y) (x / y)
#define \
temptory_g0div_usize0_usize0(x, y) (x / y)
#define \
temptory_g1div_usize1_usize1(x, y) (x / y)

/* ****** ****** */

#define \
temptory_g0mod_sint0_sint0(x, y) (x % y)
#define \
temptory_g0mod_uint0_uint0(x, y) (x % y)
#define \
temptory_g1mod_uint1_uint1(x, y) (x % y)
#define \
temptory_g0mod_usize0_usize0(x, y) (x % y)
#define \
temptory_g1mod_usize1_usize1(x, y) (x % y)

/* ****** ****** */

#define \
temptory_g0lt_sint0_sint0(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_sint0_sint0(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_sint0_sint0(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_sint0_sint0(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_sint0_sint0(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_sint0_sint0(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_sint0_sint0(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0min_sint0_sint0(x, y) ((x <= y) ? x : y)
#define \
temptory_g0max_sint0_sint0(x, y) ((x >= y) ? x : y)

/* ****** ****** */

#define \
temptory_g1lt_sint1_sint1(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g1gt_sint1_sint1(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g1eq_sint1_sint1(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g1lte_sint1_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g1gte_sint1_sint1(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g1neq_sint1_sint1(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g1cmp_sint1_sint1(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g1min_sint1_sint1(x, y) ((x <= y) ? x : y)
#define \
temptory_g1max_sint1_sint1(x, y) ((x >= y) ? x : y)

/* ****** ****** */

#define \
temptory_g0lt_uint0_uint0(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_uint0_uint0(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_uint0_uint0(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_uint0_uint0(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_uint0_uint0(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_uint0_uint0(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_uint0_uint0(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0lt_uint0_sint1(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_uint0_sint1(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_uint0_sint1(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_uint0_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_uint0_sint1(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_uint0_sint1(x, y) ((x != y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0lt_ssize0_ssize0(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_ssize0_ssize0(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_ssize0_ssize0(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_ssize0_ssize0(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_ssize0_ssize0(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_ssize0_ssize0(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_ssize0_ssize0(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0lt_usize0_usize0(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_usize0_usize0(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_usize0_usize0(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_usize0_usize0(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_usize0_usize0(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_usize0_usize0(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_usize0_usize0(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0lte_usize0_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_usize0_sint1(x, y) ((x >= y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g1lt_usize1_usize1(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g1gt_usize1_usize1(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g1eq_usize1_usize1(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g1lte_usize1_usize1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g1lte_usize1_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g1gte_usize1_usize1(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g1neq_usize1_usize1(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g1cmp_usize1_usize1(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g1lt_usize1_sint1(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g1gt_usize1_sint1(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g1eq_usize1_sint1(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g1lte_usize1_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g1lte_usize1_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g1gte_usize1_sint1(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g1neq_usize1_sint1(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g1cmp_usize1_sint1(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g0lnot_uint0(x) (~(x))
#define \
temptory_g0lor2_uint0_uint0(x, y) (x | y)
#define \
temptory_g0land_uint0_uint0(x, y) (x & y)
#define \
temptory_g0lxor_uint0_uint0(x, y) (x ^ y)

/* ****** ****** */

#define \
temptory_g0lsl_uint0_sint1(x,n) (x << n)
#define \
temptory_g0lsr_uint0_sint1(x,n) (x >> n)

/* ****** ****** */

#define \
temptory_g0lt_usize0_sint1(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_usize0_sint1(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_usize0_sint1(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_usize0_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0lte_usize0_sint1(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_usize0_sint1(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_usize0_sint1(x, y) ((x != y) ? 1 : 0)

/* ****** ****** */

/* end of [basics_gint.cats] */
