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

#ifndef TEMPTORY_LIBC_CATS_SEARCH
#define TEMPTORY_LIBC_SATS_SEARCH

/* ****** ****** */

#include <search.h>
//
#define atspre_lfind lfind
//
# define \
  temptory_libc_ENTRY_get_key(kx) (((ENTRY*)kx)->key)
# define \
  temptory_libc_ENTRY_get_data(kx) (((ENTRY*)kx)->data)
//
# define \
  temptory_libc_ENTRY_cons_key(k0) ((ENTRY){k0,(void*)0})
# define \
  temptory_libc_ENTRY_cons_key_data(k0, x0) ((ENTRY){k0,x0})
//
# define \
  temptory_libc_hcreate(nel) hcreate(nel)
# define temptory_libc_hdestroy() hdestroy()
# define temptory_libc_hsearch(itm, act) hsearch(itm, act)
//
/* ****** ****** */

# endif// #ifndef TEMPTORY_LIBC_CATS_SEARCH

/* ****** ****** */

/* end of [search.cats] */
