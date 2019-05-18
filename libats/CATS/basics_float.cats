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
atspre_g0cast_int_float
  (atstype_int x) { return ((atstype_float)x) ; }
ATSinline()
atstype_double
atspre_g0cast_int_double
  (atstype_int x) { return ((atstype_double)x) ; }
ATSinline()
atstype_double
atspre_g0cast_lint_double
  (atstype_lint x) { return ((atstype_double)x) ; }

/* ****** ****** */

ATSinline()
atstype_int
atspre_g0cast_float_int
  (atstype_float x) { return ((atstype_int)x) ; }
ATSinline()
atstype_lint
atspre_g0cast_float_lint
  (atstype_float x) { return ((atstype_lint)x) ; }
ATSinline()
atstype_llint
atspre_g0cast_float_llint
  (atstype_float x) { return ((atstype_llint)x) ; }

ATSinline()
atstype_int
atspre_g0cast_double_int
  (atstype_double x) { return ((atstype_int)x) ; }
ATSinline()
atstype_lint
atspre_g0cast_double_lint
  (atstype_double x) { return ((atstype_lint)x) ; }
ATSinline()
atstype_llint
atspre_g0cast_double_llint
  (atstype_double x) { return ((atstype_llint)x) ; }

ATSinline()
atstype_double
atspre_g0cast_float_double
  (atstype_float x) { return ((atstype_double)x) ; }
ATSinline()
atstype_float
atspre_g0cast_double_float
  (atstype_double x) { return ((atstype_float)x) ; }


/* ****** ****** */

extern double atof (const char *inp) ;

ATSinline()
atstype_double
temptory_g0string2float_double
  (atstype_string inp) { return atof((char*)inp) ; }

/* ****** ****** */

ATSinline()
atstype_sint
temptory_g0abs_float
  (atstype_float x)
{
  return (x >= 0? x : -x);
}
ATSinline()
atstype_sint
temptory_g0abs_double
  (atstype_double x)
{
  return (x >= 0? x : -x);
}
ATSinline()
atstype_sint
temptory_g0abs_ldouble
  (atstype_ldouble x)
{
  return (x >= 0? x : -x);
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

extern atstype_float fmodf (atstype_float, atstype_float) ;
extern atstype_double fmod (atstype_double, atstype_double) ;
extern atstype_ldouble fmodl (atstype_ldouble, atstype_ldouble) ;

#define \
temptory_g0mod_float_float(x, y) (fmodf(x, y))
#define \
temptory_g0mod_double_double(x, y) (fmod(x, y))
#define \
temptory_g0mod_ldouble_ldouble(x, y) (fmodl(x, y))

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
temptory_g0cmp_float_float(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

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
#define \
temptory_g0cmp_double_double(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

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
#define \
temptory_g0cmp_ldouble_ldouble(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

#define \
temptory_g0min_float_float(x, y) (x <= y ? x : y)
#define \
temptory_g0min_double_double(x, y) (x <= y ? x : y)
#define \
temptory_g0min_ldouble_ldouble(x, y) (x <= y ? x : y)

#define \
temptory_g0max_float_float(x, y) (x >= y ? x : y)
#define \
temptory_g0max_double_double(x, y) (x >= y ? x : y)
#define \
temptory_g0max_ldouble_ldouble(x, y) (x >= y ? x : y)

/* ****** ****** */

#define \
temptory_g0lt_int_float(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_int_float(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_int_float(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_int_float(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_int_float(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_int_float(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_int_float(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

#define \
temptory_g0lt_float_int(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_float_int(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_float_int(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_float_int(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_float_int(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_float_int(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_float_int(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

#define \
temptory_g0lt_int_double(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_int_double(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_int_double(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_int_double(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_int_double(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_int_double(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_int_double(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

#define \
temptory_g0lt_double_int(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_double_int(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_double_int(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_double_int(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_double_int(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_double_int(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_double_int(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

#define \
temptory_g0lt_int_ldouble(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_int_ldouble(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_int_ldouble(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_int_ldouble(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_int_ldouble(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_int_ldouble(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_int_ldouble(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

#define \
temptory_g0lt_ldouble_int(x, y) ((x < y) ? 1 : 0)
#define \
temptory_g0gt_ldouble_int(x, y) ((x > y) ? 1 : 0)
#define \
temptory_g0eq_ldouble_int(x, y) ((x == y) ? 1 : 0)
#define \
temptory_g0lte_ldouble_int(x, y) ((x <= y) ? 1 : 0)
#define \
temptory_g0gte_ldouble_int(x, y) ((x >= y) ? 1 : 0)
#define \
temptory_g0neq_ldouble_int(x, y) ((x != y) ? 1 : 0)
#define \
temptory_g0cmp_ldouble_int(x, y) ( (x < y) ? -1 : (x > y) ? 1 : 0 )

/* ****** ****** */

/* end of [basics_float.cats] */
