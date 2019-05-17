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

/*
//
// Author: Hongwei Xi
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
*/

/* ****** ****** */

#ifndef TEMPTORY_LIBATS_CATS_BASICS
#define TEMPTORY_LIBATS_CATS_BASICS

/* ****** ****** */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ****** ****** */

#define atspre_stdin stdin
#define atspre_stdout stdout
#define atspre_stderr stderr

/* ****** ****** */

#define atspre_fopen fopen
#define atspre_fclose fclose

/* ****** ****** */

#define atspre_fgetc fgetc

/* ****** ****** */

#define atspre_fflush fflush
#define atspre_fprintf fprintf

/* ****** ****** */

#define atspre_qsort qsort
#define atspre_bsearch bsearch

/* ****** ****** */

ATSinline()
void
atspre_exit
(atstype_int ecd){ exit(ecd); return; }

/* ****** ****** */

ATSinline()
atsvoid_t0ype
atspre_prerr_string
(atstype_string msg)
{
  fprintf(stderr, "%s", (char*)msg); return;
}

/* ****** ****** */

ATSinline()
atsvoid_t0ype
atspre_prerr_newline()
{
  fprintf(stderr, "\n"); fflush(stderr); return;
}

/* ****** ****** */
//
ATSinline()
atsvoid_t0ype
atspre_assert_bool
  (atstype_bool prop)
{
  if (!prop) exit(1) ; return ;
} /* endfun */
//
#define atspre_assert_bool0 atspre_assert_bool
#define atspre_assert_bool1 atspre_assert_bool
//
/* ****** ****** */
//
ATSinline()
atsvoid_t0ype
atspre_assert_errmsg_bool
(
  atstype_bool prop, atstype_string msg0
)
{
  if
  (!prop)
  {
    fprintf(stderr, "%s", (char*)msg0) ; exit(1) ;
  } // end of [if]
  return /*nothing*/ ;
} /* endfun */
//
#define \
atspre_assert_errmsg_bool0 atspre_assert_errmsg_bool
#define \
atspre_assert_errmsg_bool1 atspre_assert_errmsg_bool
//
/* ****** ****** */

ATSinline()
atstype_string
atspre_argv_get_at
(
  atstype_arrptr argv, atstype_int i
)
{
  return (((atstype_string*)argv)[i]) ;
} /* end of [atspre_argv_get_at] */

ATSinline()
atsvoid_t0ype
atspre_argv_set_at
(
  atstype_arrptr argv
, atstype_int i, atstype_string x
)
{
  ((atstype_string*)argv)[i] = x ; return ;
} /* end of [atspre_argv_set_at] */

/* ****** ****** */

#include "libats/CATS/basics_gint.cats"
#include "libats/CATS/basics_gptr.cats"
#include "libats/CATS/basics_bool.cats"
#include "libats/CATS/basics_char.cats"
#include "libats/CATS/basics_float.cats"
#include "libats/CATS/basics_string.cats"
    
/* ****** ****** */

#endif // ifndef TEMPTORY_LIBATS_CATS_BASICS

/* ****** ****** */

/* end of [basics.cats] */
