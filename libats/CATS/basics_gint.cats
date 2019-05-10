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
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
/* ****** ****** */
//
// HX: for sint
//
/* ****** ****** */

ATSinline()
atstype_sint
temptory_g0abs_sint
  (atstype_sint x)
{
  return (x >= 0? x : -x);
}
ATSinline()
atstype_slint
temptory_g0abs_slint
  (atstype_slint x)
{
  return (x >= 0? x : -x);
}

/* ****** ****** */
//
#define \
temptory_g0succ_sint(x) (x + 1)
#define \
temptory_g0pred_sint(x) (x - 1)
//
/* ****** ****** */
//
#define \
temptory_g1succ_sint(x) (x + 1)
#define \
temptory_g1pred_sint(x) (x - 1)
//
/* ****** ****** */

#define \
temptory_g0add_sint_sint(x, y) (x + y)
#define \
temptory_g0sub_sint_sint(x, y) (x - y)
#define \
temptory_g0mul_sint_sint(x, y) (x * y)
#define \
temptory_g0div_sint_sint(x, y) (x / y)

/* ****** ****** */

#define \
temptory_g1add_sint_sint(x, y) (x + y)
#define \
temptory_g1sub_sint_sint(x, y) (x - y)
#define \
temptory_g1mul_sint_sint(x, y) (x * y)
#define \
temptory_g1div_sint_sint(x, y) (x / y)

/* ****** ****** */

#define \
temptory_g0lt_sint_sint(x, y) (( x < y ) ? 1 : 0)
#define \
temptory_g0gt_sint_sint(x, y) (( x > y ) ? 1 : 0)
#define \
temptory_g0eq_sint_sint(x, y) (( x == y ) ? 1 : 0)
#define \
temptory_g0lte_sint_sint(x, y) (( x <= y ) ? 1 : 0)
#define \
temptory_g0gte_sint_sint(x, y) (( x >= y ) ? 1 : 0)
#define \
temptory_g0neq_sint_sint(x, y) (( x != y ) ? 1 : 0)

/* ****** ****** */

#define \
temptory_g1lt_sint_sint(x, y) (( x < y ) ? 1 : 0)
#define \
temptory_g1gt_sint_sint(x, y) (( x > y ) ? 1 : 0)
#define \
temptory_g1eq_sint_sint(x, y) (( x == y ) ? 1 : 0)
#define \
temptory_g1lte_sint_sint(x, y) (( x <= y ) ? 1 : 0)
#define \
temptory_g1gte_sint_sint(x, y) (( x >= y ) ? 1 : 0)
#define \
temptory_g1neq_sint_sint(x, y) (( x != y ) ? 1 : 0)

/* ****** ****** */
//
// HX: for uint
//
/* ****** ****** */
//
#define \
temptory_g0succ_uint(x) (x + 1)
#define \
temptory_g0pred_uint(x) (x - 1)
//
/* ****** ****** */
//
#define \
temptory_g1succ_uint(x) (x + 1)
#define \
temptory_g1pred_uint(x) (x - 1)
//
/* ****** ****** */

#define \
temptory_g0add_uint_uint(x, y) (x + y)
#define \
temptory_g0sub_uint_uint(x, y) (x - y)
#define \
temptory_g0mul_uint_uint(x, y) (x * y)
#define \
temptory_g0div_uint_uint(x, y) (x / y)

/* ****** ****** */

#define \
temptory_g1add_uint_uint(x, y) (x + y)
#define \
temptory_g1sub_uint_uint(x, y) (x - y)
#define \
temptory_g1mul_uint_uint(x, y) (x * y)
#define \
temptory_g1div_uint_uint(x, y) (x / y)

/* ****** ****** */

/* end of [basics_gint.cats] */