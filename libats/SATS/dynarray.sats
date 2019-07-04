(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)

(* Author: Hongwei Xi, Artyom Shalkhakov *)
(* Start time: June, 2019 *)
(* Authoremail: hwxiATcsDOTbuDOTedu, artyomDOTshalkhakovATgmailDOTcom *)

(* ****** ****** *)

#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)

#define NSH(x) x
// for commenting: no sharing
#define SHR(x) x
// for commenting: it is shared

(* ****** ****** *)

//
absvtbox
dynarray_vtflt_int_tbox(a:vtflt+, n:int) = ptr
//
sexpdef
dynarray = dynarray_vtflt_int_tbox
//

(* ****** ****** *)

//
absvtbox
dynarrayptrout
(a:vtflt,l:addr,n:int)
//

(* ****** ****** *)
//
fun{a:vtflt}
dynarray$frealloc
  {l:addr;m,n,m1:int | m > 0; n >= 0; n <= m; m < m1} (
  array_v(a, l, n), array_v(a?, l+n*sizeof(a), m-n), mfree_gc_v(l)
| ptr l, size m, size n, size m1
): [l1:addr] (
  array_v(a, l1, n), array_v(a?, l1+n*sizeof(a), m1-n), mfree_gc_v(l1)
| ptr l1
)
//
(* ****** ****** *)
//
fun{}
dynarray$fgrow {n,d:pos | d <= n} (
  cap: size(n), delta: size(d)
): [m:int | n+d <= m] size(m)
//
(* ****** ****** *)

fun{a:vtflt}
dynarray_make_nil(cap: Sizegt(0)): dynarray(a, 0)

(* ****** ****** *)

fun{}
dynarray_free_tflt
  {a:tflt}{n:int}(DA: dynarray(INV(a), n)):<!wrt> void
// end of [dynarray_free_tflt]

fun{a:vtflt}
dynarray_free
  {n:int}(DA: dynarray(INV(a), n)):<!wrt> void
// end of [dynarray_free]

(* ****** ****** *)

fun{}
dynarray_get_size
  {a:vtflt}{n:int}(DA: !dynarray(INV(a), n)): size(n)
fun{}
dynarray_get_capacity
  {a:vtflt}{n:int}(DA: !dynarray(INV(a), n)): [m:int | m >= n] size(m)

(* ****** ****** *)

fun{}
dynarray_takeout
  {a:vtflt}{n:int}
(
  DA: !dynarray(a, n) >> dynarrayptrout(a, l, n)
) : #[l:addr] (arrayptr (a, l, n), size(n))
//
praxi
dynarray_restore
{a:vtflt}{l:addr}{n:int}
(AZ: !dynarrayptrout(a,l,n) >> dynarray(a,n), A0: arrayptr(a,l,n)) : void
//
#symload takeout with dynarray_takeout
#symload restore with dynarray_restore

(* ****** ****** *)

fun
{a:tflt0}
dynarray_get_at_sint
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: sint(i)): (a)
fun
{a:tflt0}
dynarray_set_at_sint
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: sint(i), x: a): void
fun
{a:tflt0}
dynarray_get_at_size
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: size(i)): (a)
fun
{a:tflt0}
dynarray_set_at_size
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: size(i), x: a): void
//
fun
{a:vtflt}
dynarray_getref_at_sint
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: sint(i)): cptr(a)
fun
{a:vtflt}
dynarray_getref_at_size
{n:int}{i:nat | i < n}
(A: !dynarray(INV(a), n), i: size(i)): cptr(a)
//
#symload [] with dynarray_get_at_sint
#symload [] with dynarray_set_at_sint
#symload [] with dynarray_get_at_size
#symload [] with dynarray_set_at_size
#symload .get_at with dynarray_get_at_sint
#symload .set_at with dynarray_set_at_sint
#symload .get_at with dynarray_get_at_size
#symload .set_at with dynarray_set_at_size
//

(* ****** ****** *)

// insertions

// insert at index (aka before the index)
fun{a:vtflt}
dynarray_insert_at{n:int}{i:nat | i <= n}
(
  DA: !dynarray(INV(a), n) >> dynarray(a, n+1), i: size(i), x: a
): void
// append (aka insert after the last)
fun{a:vtflt}
dynarray_append{n:int}
(
  DA: !dynarray(INV(a), n) >> dynarray(a, n+1), x: a
): void

// removals/takeouts

// takeout element at index
fun{a:vtflt}
dynarray_takeout_at{n,i:int | n > 0; i>=0; i < n}
(
  DA: !dynarray(a, n) >> dynarray(a, n-1), i: size(i), res: &INV(a)? >> a
): void

// pop the last element
fun{a:vtflt}
dynarray_takeout_last{n:int | n > 0}
(
  DA: !dynarray(INV(a), n) >> dynarray(a, n-1), res: &INV(a)? >> a
): void

// FIXME: but need N-ary versions as well... e.g. insert two,three elems
//    or remove 2-3 elems at once

(* ****** ****** *)

fun{a:vtflt}
dynarray_reset_capacity {n:int}
  (DA: !dynarray(INV(a), n) >> _, m1: Sizegte(1)):<!wrt> bool(*done/ignored*)
// end of [dynarray_reset_capacity]

(* ****** ****** *)

(* end of [dynarray.sats] *)
