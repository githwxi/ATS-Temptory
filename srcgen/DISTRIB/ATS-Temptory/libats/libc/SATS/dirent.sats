(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define
ATS_PACKNAME "temptory.libc."
#define
ATS_EXTERN_PREFIX "temptory_libc_"

(* ****** ****** *)

%{#
//
#include \
"libats/libc/CATS/dirent.cats"
//
%} // end of [%{#]

(* ****** ****** *)
//
typedef ieqz = int // succ/fail: 0/~0
(*
typedef inez = int // succ/fail: ~0/ 0
*)
//
(* ****** ****** *)
//
abstflt
DIR = $extype"atspre_DIR"
abstflt
dirent = $extype"atspre_dirent"
//
(* ****** ****** *)

fun
dirent_get_d_name
(ent: &dirent): cptr(char) = "mac#%"
fun
direntp_get_d_name
(ent: cptr(dirent)): cptr(char) = "mac#%"
//
#symload .d_name with dirent_get_d_name
#symload .d_name with direntp_get_d_name
//
(* ****** ****** *)
//
fun
opendir(strcst): cptr0(DIR) = "mac#%"
fun
closedir(cptr(DIR)): (ieqz) = "mac#%"
//
(* ****** ****** *)
//
fun
readdir
(dir: cptr0(DIR)): cptr0(dirent) = "mac#%"
//
(* ****** ****** *)

fun
readdir_r
( dir: cptr(DIR)
, ent: &dirent? >> _
, res: &cptr(dirent)? >> _): ieqz = "mac#%"

(* ****** ****** *)

fun
telldir
(dir: cptr(DIR)): llint = "mac#%"
fun
seekdir
(dir: cptr(DIR), loc: llint): void = "mac#%"

(* ****** ****** *)

fun
rewinddir(dir: cptr(DIR)): void = "mac#%"

(* ****** ****** *)
//
fun{}
readdir_forall(cptr(DIR)): bool
fun{}
readdir_forall$test(ent: cptr(dirent)): bool
//
(* ****** ****** *)
//
fun{}
readdir_r_streamize(dir: cptr(DIR)): stream_vt(dirent)
//
(* ****** ****** *)

(* end of [dirent.sats] *)
