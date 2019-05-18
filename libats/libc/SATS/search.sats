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
"libats/libc/CATS/search.cats"
//
%} // end of [%{#]

(* ****** ****** *)

/*
void
*lfind
(
const void *key, const void *base, size_t *nmemb,
size_t size, int(*compar)(const void *, const void *)
);
*/
                 
(* ****** ****** *)
//
fun
{a:vtflt}
lfind_libc{n:int}
(
k0: &a,
A0: &array(a, n), size(n), cmpfunref(a)
) : cptr0(a) // end of [lfind_libc]
//
(* ****** ****** *)
//
/*
void
*lsearch
(
const void *key, void *base, size_t *nmemb,
size_t size, int(*compar)(const void *, const void *)
);
*/
//
// HX-2019-05-18:
// Not sure if I would ever want to use such a function!
//
(* ****** ****** *)
//
abstflt
ENTRY = $extype"ENTRY"
abstflt
ACTION = $extype"ACTION"
//
#macdef
FIND =
$extval(ACTION, "FIND")
#macdef
ENTER =
$extval(ACTION, "ENTER")
//
(* ****** ****** *)
//
fun
ENTRY_cons_key
(k0: string): ENTRY = "mac#%"
fun
ENTRY_cons_key_data
(k0: string, x0: string): ENTRY = "mac#%"
//
#symload
ENTRY_cons with ENTRY_cons_key
#symload
ENTRY_cons with ENTRY_cons_key_data
//
fun
ENTRY_get_key
  (kx: cptr(ENTRY)): string = "mac#%"
fun
ENTRY_get_data
  (kx: cptr(ENTRY)): string = "mac#%"
//
#symload .key with ENTRY_get_key
#symload .data with ENTRY_get_data
//
(* ****** ****** *)
//
// succ/fail: ~0/0
//
fun{}
hcreate(nel: size): int
(*
fun{}
hdestroy((*void*)): void
*)
fun
hcreate(nel: size): int = "mac#%"
fun
hdestroy((*void*)): void = "mac#%"
//
fun
hsearch
( itm: ENTRY
, act: ACTION): cptr(ENTRY) = "mac#%"
//
fun{}
hsearch_find
(k0: string): cptr(ENTRY)
fun{}
hsearch_enter
(k0: string, x0: string): cptr(ENTRY)
//
(* ****** ****** *)

(* end of [search.sats] *)
