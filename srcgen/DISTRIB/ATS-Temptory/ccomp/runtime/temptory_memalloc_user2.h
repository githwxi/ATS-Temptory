/* ******************************************************************* */
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/* ******************************************************************* */

/*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
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
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Start time: March, 2013 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
*/

/* ****** ****** */
//
#include <stdio.h>
/*
extern
int fprintf (FILE *stream, const char *format, ...) ;
*/
/* ****** ****** */
//
// stdlib.h
//
extern void exit (int code) ;
//
/* ****** ****** */

extern void atsruntime_mfree_user2 (void *ptr) ;
extern void *atsruntime_malloc_user2 (size_t bsz) ;
extern void *atsruntime_calloc_user2 (size_t asz, size_t tsz) ;
extern void *atsruntime_realloc_user2 (void *ptr, size_t bsz) ;

/* ****** ****** */

/* end of [temptory_memalloc_user2.h] */
