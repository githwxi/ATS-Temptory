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
//
(*
typedef ieqz = int // succ/fail: 0/~0
*)
typedef inez = int // succ/fail: ~0/ 0
//
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
ENTRY =
$extype"atspre_ENTRY"
abstflt
ACTION =
$extype"atspre_ACTION"
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
ENTRY_get_key
(cptr(ENTRY)): string = "mac#%"
fun
ENTRY_get_data
(cptr(ENTRY)): (ptr0) = "mac#%"
//
#symload .key with ENTRY_get_key
#symload .data with ENTRY_get_data
//
fun
ENTRY_cons_key
(k0: string): ENTRY = "mac#%"
fun
ENTRY_cons_key_data
{data:tbox}
(k0: string, x0: data): ENTRY = "mac#%"
//
#symload
ENTRY_cons with ENTRY_cons_key
#symload
ENTRY_cons with ENTRY_cons_key_data
//
(* ****** ****** *)
//
// succ/fail: ~0/0
//
fun
hcreate
(nel: size): inez = "mac#%"
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
fun
{data:tbox}
hsearch_enter
(k0: string, x0: data): cptr(ENTRY)
//
(* ****** ****** *)

abstflt
hsearch_data =
$extype"atspre_hsearch_data"

(* ****** ****** *)
//
fun
hcreate_r
( nel: size
, htab
: &hsearch_data? >> _ ): inez = "mac#%"
//
fun
hdestroy_r
( &hsearch_data >> _? ): void = "mac#%"
//
fun
hsearch_r
( itm: ENTRY
, act: ACTION
, rval: &cptr(ENTRY)? >> _
, htab: &hsearch_data ): inez = "mac#%"
//
fun{}
hsearch_r_find
(k0: string, htab: &hsearch_data): cptr(ENTRY)
fun
{data:tbox}
hsearch_r_enter
( k0: string
, x0: (data), htab: &hsearch_data): cptr(ENTRY)
//
(* ****** ****** *)
//
abstbox
htabref_tbox =
cptr0(hsearch_data)
typedef htabref = htabref_tbox
//
absvtbox
htabptr0_vtbox =
cptr0(hsearch_data)
vtypedef htabptr0 = htabptr0_vtbox
//
(* ****** ****** *)
//
fun{}
htabref_create
(cap: size): optn0_vt(htabref)
fun{}
htabref_destroy(htabref): void
fun{}
htabref_find
( ht
: htabref, k0: string): optn0_vt(cptr(ENTRY))
fun
{data:tbox}
htabref_enter
( ht: htabref
, k0: string, x0: data): optn0_vt(cptr(ENTRY))
//
#symload find with htabref_find
#symload enter with htabref_enter
(*
#symload create with htabref_create
*)
#symload destroy with htabref_destroy
//
(* ****** ****** *)
//
fun{}
htabptr0_create
(cap: size): optn0_vt(htabptr0)
fun{}
htabptr0_destroy(htabptr0): void
fun{}
htabptr0_find
( ht
: !htabptr0, k0: string): optn0_vt(cptr(ENTRY))
fun
{data:tbox}
htabptr0_enter
( ht: !htabptr0
, k0: string, x0: (data)): optn0_vt(cptr(ENTRY))
//
#symload find with htabptr0_find
#symload enter with htabptr0_enter
(*
#symload create with htabptr0_create
*)
#symload destroy with htabptr0_destroy
//
(* ****** ****** *)

(* end of [search.sats] *)
