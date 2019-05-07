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
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: October, 2012 *)
*/

/* ****** ****** */

#ifndef TEMPTORY_TYPEDEFS_H
#define TEMPTORY_TYPEDEFS_H

/* ****** ****** */

/*
** HX:
** of indefinite size
*/
struct atstype_struct ;

/* ****** ****** */

typedef void atstype_void ;
typedef void atsvoid_t0ype ;

/* ****** ****** */

typedef int atstype_int ;

typedef int atstype_sint ;
typedef unsigned int atstype_uint ;

typedef long int atstype_slint ;
typedef unsigned long int atstype_ulint ;

typedef short int atstype_tint ;
typedef unsigned short int atstype_utint ;

typedef long long int atstype_llint ;
typedef unsigned long long int atstype_ullint ;

/* ****** ****** */

typedef atstype_ulint atstype_size ;
typedef atstype_slint atstype_ssize ;
typedef atstype_ulint atstype_usize ;

/* ****** ****** */
//
// HX: true/false: 1/0
//
typedef int atstype_bool ;
//
/* ****** ****** */

typedef unsigned char atstype_byte ;

/* ****** ****** */

typedef char atstype_char ;
typedef signed char atstype_schar ;
typedef unsigned char atstype_uchar ;

/* ****** ****** */

typedef float atstype_float ;
typedef double atstype_double ;
typedef long double atstype_ldouble ;

/* ****** ****** */

typedef atstype_char *atstype_string ;
typedef atstype_char *atstype_stropt ;
typedef atstype_char *atstype_strptr ;

/* ****** ****** */
/*
** HX: for pointers
*/
typedef void *atstype_ptr ;
typedef void *atstype_ptrk ;
/*
** HX: for references
*/
typedef void *atstype_ref ;
/*
** HX: for boxed values
*/
typedef void* atstype_boxed ;
/*
** HX: for [datconptr]
*/
typedef void* atstype_datconptr ;
/*
** HX: for [datcontyp]
*/
typedef void* atstype_datcontyp ;

/* ****** ****** */

#ifdef \
_TEMPTORY_EXCEPTION_NONE_
//
// HX: issuing a message?
//
#else
//
typedef
ATSstruct
{
  int exntag ; char *exnmsg ;
} atstype_exncon ;
//
typedef
atstype_exncon *atstype_exnconptr ;
//
#endif // end of [_TEMPTORY_EXCEPTION_NONE_]

/* ****** ****** */

#define atstkind_type(tk) tk
#define atstkind_t0ype(tk) tk

/* ****** ****** */

#define atsrefarg0_type(hit) hit
#define atsrefarg1_type(hit) atstype_ref

/* ****** ****** */

#endif /* TEMPTORY_TYPEDEFS_H */

/* ****** ****** */

/* end of [temptory_typedefs.h] */
