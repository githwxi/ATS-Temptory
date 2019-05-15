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
temptory_ptr0_iseqz(ptr) (ptr == (void*)0)
#define \
temptory_ptr0_isneqz(ptr) (ptr != (void*)0)

/* ****** ****** */

#define \
temptory_g0lt_ptr_ptr(p0, p1) ((void*)p0 < (void*)p1)
#define \
temptory_g0gt_ptr_ptr(p0, p1) ((void*)p0 > (void*)p1)
#define \
temptory_g0eq_ptr_ptr(p0, p1) ((void*)p0 == (void*)p1)
#define \
temptory_g0lte_ptr_ptr(p0, p1) ((void*)p0 <= (void*)p1)
#define \
temptory_g0gte_ptr_ptr(p0, p1) ((void*)p0 >= (void*)p1)
#define \
temptory_g0neq_ptr_ptr(p0, p1) ((void*)p0 != (void*)p1)

/* ****** ****** */

#define \
temptory_g0add_ptr_int(ptr, bsz) (void*)((char*)(ptr)+(bsz))
#define \
temptory_g0sub_ptr_int(ptr, bsz) (void*)((char*)(ptr)-(bsz))

/* ****** ****** */

#define \
temptory_g0add_ptr_size(ptr, bsz) (void*)((char*)(ptr)+(bsz))
#define \
temptory_g0sub_ptr_size(ptr, bsz) (void*)((char*)(ptr)-(bsz))

/* ****** ****** */

#define \
temptory_g0lt_cptr_cptr(p0, p1) ((void*)p0 < (void*)p1)
#define \
temptory_g0gt_cptr_cptr(p0, p1) ((void*)p0 > (void*)p1)
#define \
temptory_g0eq_cptr_cptr(p0, p1) ((void*)p0 == (void*)p1)
#define \
temptory_g0lte_cptr_cptr(p0, p1) ((void*)p0 <= (void*)p1)
#define \
temptory_g0gte_cptr_cptr(p0, p1) ((void*)p0 >= (void*)p1)
#define \
temptory_g0neq_cptr_cptr(p0, p1) ((void*)p0 != (void*)p1)

/* ****** ****** */

/* end of [basics_gptr.cats] */
