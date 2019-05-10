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

/* ****** ****** */

ATSinline()
void
atspre_exit
(atstype_int ecd)
{ exit(ecd); return; }

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
