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

ATSinline()
atstype_float
temptory_g0cast_sint_float
  (atstype_sint x)
{ return ((atstype_float)x) ; }
ATSinline()
atstype_double
temptory_g0cast_sint_double
  (atstype_sint x)
{ return ((atstype_double)x) ; }
ATSinline()
atstype_double
temptory_g0cast_slint_double
  (atstype_slint x)
{ return ((atstype_double)x) ; }

/* ****** ****** */

ATSinline()
atstype_sint
temptory_g0cast_float_sint
  (atstype_float x) { return ((atstype_sint)x) ; }
ATSinline()
atstype_slint
temptory_g0cast_float_slint
  (atstype_float x) { return ((atstype_slint)x) ; }
ATSinline()
atstype_sllint
temptory_g0cast_float_sllint
  (atstype_float x) { return ((atstype_sllint)x) ; }

ATSinline()
atstype_sint
temptory_g0cast_double_sint
  (atstype_double x) { return ((atstype_sint)x) ; }
ATSinline()
atstype_slint
temptory_g0cast_double_slint
  (atstype_double x) { return ((atstype_slint)x) ; }
ATSinline()
atstype_sllint
temptory_g0cast_double_sllint
  (atstype_double x) { return ((atstype_sllint)x) ; }

ATSinline()
atstype_double
temptory_g0cast_float_double
  (atstype_float x) { return ((atstype_double)x) ; }
ATSinline()
atstype_ldouble
temptory_g0cast_float_ldouble
  (atstype_float x) { return ((atstype_ldouble)x) ; }
ATSinline()
atstype_ldouble
temptory_g0cast_double_ldouble
  (atstype_double x) { return ((atstype_ldouble)x) ; }

/* ****** ****** */

ATSinline()
atstype_float
temptory_g0abs_float
  (atstype_float x)
{
  return (x >= 0 ? x : -x);
}
ATSinline()
atstype_double
temptory_g0abs_double
  (atstype_double x)
{
  return (x >= 0 ? x : -x);
}
ATSinline()
atstype_ldouble
temptory_g0abs_ldouble
  (atstype_ldouble x)
{
  return (x >= 0 ? x : -x);
}

/* ****** ****** */

#define \
temptory_g0neg_float(x) (-x)
#define \
temptory_g0neg_double(x) (-x)
#define \
temptory_g0neg_ldouble(x) (-x)

/* ****** ****** */

#define \
temptory_g0succ_float(x) (x + 1)
#define \
temptory_g0succ_double(x) (x + 1)
#define \
temptory_g0succ_ldouble(x) (x + 1)

#define \
temptory_g0pred_float(x) (x + 1)
#define \
temptory_g0pred_double(x) (x + 1)
#define \
temptory_g0pred_ldouble(x) (x + 1)

/* ****** ****** */

#define \
temptory_g0add_float_float(x, y) (x + y)
#define \
temptory_g0add_double_double(x, y) (x + y)
#define \
temptory_g0add_ldouble_ldouble(x, y) (x + y)

#define \
temptory_g0sub_float_float(x, y) (x - y)
#define \
temptory_g0sub_double_double(x, y) (x - y)
#define \
temptory_g0sub_ldouble_ldouble(x, y) (x - y)

#define \
temptory_g0mul_float_float(x, y) (x * y)
#define \
temptory_g0mul_double_double(x, y) (x * y)
#define \
temptory_g0mul_ldouble_ldouble(x, y) (x * y)

#define \
temptory_g0div_float_float(x, y) (x / y)
#define \
temptory_g0div_double_double(x, y) (x / y)
#define \
temptory_g0div_ldouble_ldouble(x, y) (x / y)

#define \
temptory_g0add_float_ldouble(x, y) (x + y)
#define \
temptory_g0sub_float_ldouble(x, y) (x - y)
#define \
temptory_g0mul_float_ldouble(x, y) (x * y)
#define \
temptory_g0div_float_ldouble(x, y) (x / y)

/* ****** ****** */

#if(0)
extern
atstype_float
fmodf(atstype_float, atstype_float) ;
extern
atstype_double
fmod(atstype_double, atstype_double) ;
extern
atstype_ldouble
fmodl(atstype_ldouble, atstype_ldouble) ;
#define \
temptory_g0mod_float_float(x, y) (fmodf(x, y))
#define \
temptory_g0mod_double_double(x, y) (fmod(x, y))
#define \
temptory_g0mod_ldouble_ldouble(x, y) (fmodl(x, y))
#endif

/* ****** ****** */

#define \
temptory_g0lt_float_float(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_float_float(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_float_float(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_float_float(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_float_float(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_float_float(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_float_float(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)

/* ****** ****** */
//
#define \
temptory_g0lt_double_double(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_double_double(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_double_double(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_double_double(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_double_double(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_double_double(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_double_double(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_ldouble_ldouble(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_ldouble_ldouble(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_ldouble_ldouble(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_ldouble_ldouble(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_ldouble_ldouble(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_ldouble_ldouble(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_ldouble_ldouble(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0max_float_float(x, y) (x >= y ? x : y)
#define \
temptory_g0min_float_float(x, y) (x <= y ? x : y)
//
#define \
temptory_g0max_double_double(x, y) (x >= y ? x : y)
#define \
temptory_g0min_double_double(x, y) (x <= y ? x : y)
//
#define \
temptory_g0max_ldouble_ldouble(x, y) (x >= y ? x : y)
#define \
temptory_g0min_ldouble_ldouble(x, y) (x <= y ? x : y)
//
/* ****** ****** */
//
#define \
temptory_g0lt_sint_float(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_sint_float(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_sint_float(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_sint_float(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_sint_float(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_sint_float(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_sint_float(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_float_sint(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_float_sint(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_float_sint(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_float_sint(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_float_sint(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_float_sint(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_float_sint(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_sint_double(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_sint_double(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_sint_double(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_sint_double(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_sint_double(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_sint_double(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_sint_double(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_double_sint(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_double_sint(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_double_sint(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_double_sint(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_double_sint(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_double_sint(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_double_sint(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_sint_ldouble(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_sint_ldouble(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_sint_ldouble(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_sint_ldouble(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_sint_ldouble(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_sint_ldouble(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_sint_ldouble(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */
//
#define \
temptory_g0lt_ldouble_sint(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_ldouble_sint(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_ldouble_sint(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_ldouble_sint(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_ldouble_sint(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_ldouble_sint(x, y) ((x != y) ? 1 : 0)
//
#define \
temptory_g0cmp_ldouble_sint(x, y) ((x < y) ? -1 : (x > y) ? 1 : 0)
//
/* ****** ****** */

/* end of [basics_float.cats] */
