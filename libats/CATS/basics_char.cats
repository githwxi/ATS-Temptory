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

#define \
temptory_char0_ord(c0) ((int)c0)
#define \
temptory_char0_chr(i0) ((char)i0)

/* ****** ****** */

#define \
temptory_char0_isalpha(c) isalpha(c)
#define \
temptory_char0_isalnum(c) isalnum(c)
#define \
temptory_char0_iscntrl(c) iscntrl(c)
#define \
temptory_char0_isdigit(c) isdigit(c)
#define \
temptory_char0_isgraph(c) isgraph(c)
#define \
temptory_char0_isprint(c) isprint(c)
#define \
temptory_char0_isspace(c) isspace(c)
#define \
temptory_char0_ispunct(c) ispunct(c)
#define \
temptory_char0_isxdigit(c) isxdigit(c)

/* ****** ****** */

#define \
temptory_char0_islower(c) islower(c)
#define \
temptory_char0_isupper(c) isupper(c)
#define \
temptory_char0_tolower(c) tolower(c)
#define \
temptory_char0_toupper(c) toupper(c)

/* ****** ****** */
//
#define \
temptory_g0add_char_sint(x, y) (x + y) // char
//
#define \
temptory_g0sub_char_char(x, y) (x - y) // sint
#define \
temptory_g0sub_char_sint(x, y) (x - y) // char
//
/* ****** ****** */

#define \
temptory_g0lt_char_char(x, y) (( x < y ) ? 1 : 0)
#define \
temptory_g0gt_char_char(x, y) (( x > y ) ? 1 : 0)
#define \
temptory_g0eq_char_char(x, y) (( x == y ) ? 1 : 0)
#define \
temptory_g0lte_char_char(x, y) (( x <= y ) ? 1 : 0)
#define \
temptory_g0gte_char_char(x, y) (( x >= y ) ? 1 : 0)
#define \
temptory_g0neq_char_char(x, y) (( x != y ) ? 1 : 0)

/* ****** ****** */

/* end of [basics_char.cats] */
