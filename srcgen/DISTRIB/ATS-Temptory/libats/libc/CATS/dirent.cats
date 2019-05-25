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

#ifndef TEMPTORY_LIBC_CATS_DIRENT
#define TEMPTORY_LIBC_SATS_DIRENT

/* ****** ****** */

#include <dirent.h>
#include <sys/types.h>

/* ****** ****** */

typedef DIR atspre_DIR;
typedef struct dirent atspre_dirent;

/* ****** ****** */

#define \
temptory_libc_opendir(path) opendir(path)
#define \
temptory_libc_closedir(dir) closedir(dir)

/* ****** ****** */

#define \
temptory_libc_dirent_get_d_ino(ent) (((atspre_dirent*)ent)->d_ino)
#define \
temptory_libc_direntp_get_d_ino(ent) (((atspre_dirent*)ent)->d_ino)

#define \
temptory_libc_dirent_get_d_name(ent) (((atspre_dirent*)ent)->d_name)
#define \
temptory_libc_direntp_get_d_name(ent) (((atspre_dirent*)ent)->d_name)

/* ****** ****** */

#define \
temptory_libc_readdir(dir) readdir(dir)
#define \
temptory_libc_readdir_r(dir, ent, res) readdir_r(dir, ent, (atspre_dirent**)res)

/* ****** ****** */

#define \
temptory_libc_telldir(dir) telldir(dir)
#define \
temptory_libc_seekdir(dir, loc) seekdir(dir, loc)
#define \
temptory_libc_rewinddir(dir) rewinddir(dir)

/* ****** ****** */

# endif// #ifndef TEMPTORY_LIBC_CATS_DIRENT

/* ****** ****** */

/* end of [dirent.cats] */
