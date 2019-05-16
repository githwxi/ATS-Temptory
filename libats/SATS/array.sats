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

(* Author: Hongwei Xi *)
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

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
exception
ArraySubscriptExn of ()
//
(* ****** ****** *)

(*
//
// HX: [array_v]
// can also be defined as follows:
//
dataview
array_view
(a:vtflt+, addr, int) =
| {l:addr}
  array_v_nil(a, l, 0) of ()
| {l:addr}{n:int}
  array_v_cons(a, l, n+1) of
  (a @ l, array_view(a, l+sizeof(a), n))
// end of [array_v]
//
  sexpdef array_v = array_view
//
*)

(* ****** ****** *)
//
praxi
lemma_array_param
{a:vtflt}
{l:addr}{n:int}
(A0: &array(INV(a),n)): [n >= 0] void
prfun
lemma_array_v_param
{a:vtflt}
{l:addr}{n:int}
(pf: !array_v(INV(a),l,n)): [n >= 0] void
//
(* ****** ****** *)
//
praxi
array_v_nil :
{a:vtflt}{l:addr}
((*void*)) -<prf> array_v(a, l, 0)
//
praxi
array_v_unnil :
{a:vtflt}{l:addr}
(array_v(a, l, 0)) -<prf> ( void )
//
prfun
array_v_unnil_nil :
{a1
,a2:vtflt}{l:addr}
(array_v(a1, l, 0)) -<prf> array_v(a2, l, 0)
// end of [array_v_unnil_nil]
//
(* ****** ****** *)

prfun
array_v_sing
{a:vtflt}{l:addr}(pf: INV(a) @ l): array_v(a, l, 1)
prfun
array_v_unsing
{a:vtflt}{l:addr}(pf: array_v(INV(a), l, 1)): (a @ l)

(* ****** ****** *)
//
praxi
array_v_cons
{a:vtflt}
{l:addr}{n:int}
( pf1: a @ l
, pf2: array_v(INV(a),l+sizeof(a),n)): array_v(a,l,n+1)
//
praxi
array_v_uncons :
{a:vtflt}
{l:addr}{n:int | n > 0}
array_v(INV(a), l, n) -<prf> (a @ l, array_v(a, l+sizeof(a), n-1))
//
(* ****** ****** *)
//
fun
{a:tflt}
array_get_at_sint
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), sint(i)): (a)
fun
{a:tflt}
array_set_at_sint
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), sint(i), a): void
//
fun
{a:tflt}
array_get_at_size
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), size(i)): (a)
fun
{a:tflt}
array_set_at_size
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), size(i), a): void
//
fun
{a:vtflt}
array_getref_at_sint
{n:int}{i:nat | i < n}
( arr
: &(array(INV(a),n)), sint(i)):<> cptr(a)
fun
{a:vtflt}
array_getref_at_size
{n:int}{i:nat | i < n}
( arr
: &(array(INV(a),n)), size(i)):<> cptr(a)
//
#symload [] with array_get_at_sint of 10
#symload [] with array_set_at_sint of 10
#symload [] with array_get_at_size of 10
#symload [] with array_set_at_size of 10
#symload array_get_at with array_get_at_sint
#symload array_get_at with array_get_at_size
#symload array_set_at with array_set_at_sint
#symload array_set_at with array_set_at_size
//
(* ****** ****** *)

fun{}
array_ptr_mfree
{a:vtflt}{l:addr}{n:int}
(array_v(a?, l, n), mfree_gc_v(l) | ptr(l)): void

(* ****** ****** *)
//
fun
{a:vtflt}
array_ptr_alloc
  {n:int}
( asz: size(n) ) 
: [l:agz] (array_v(a?,l,n), mfree_gc_v(l) | ptr(l))
//
(* ****** ****** *)
//
fun
{a:vtflt}
array_forall
{n:int}
(&array(a, n), size(n)): bool
fun
{a:vtflt}
array_forall$test(x: !(a)): bool
//
fun
{a:vtflt}
array_foreach
{n:int}
(&array(a, n), size(n)): void
fun
{a:vtflt}
array_foreach$work(x: !(a)): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
array_rforall
{n:int}
(&array(a, n), size(n)): bool
fun
{a:vtflt}
array_rforall$test(x: !(a)): bool
//
fun
{a:vtflt}
array_rforeach
{n:int}
(&array(a, n), size(n)): void
fun
{a:vtflt}
array_rforeach$work(x: !(a)): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
array_bsearch$ford(x0: &(a)):<> int
//
fun
{a:vtflt}
array_bsearch
  {n:int}
  (A0: &(@[a][n]), n: size(n)):<> Sizelte(n)
//
(*
** HX:
** this one is based on [bsearch] in [stdlib]
*)
fun
{a:vtflt}
array_bsearch_stdlib
  {n:int}
( A0
: &(@[INV(a)][n])
, asz: size(n), key: &(a), cmp: cmpfunref(a)
) : cptr(a) (* HX: found/~found : ~null/null *)
//
(* ****** ****** *)
//
fun
{a:vtflt}
array_quicksort
  {n:int}
( A0
: &(@[INV(a)][n]) >> @[a][n], asz: size(n)
) : void // end-of-function
fun{a:vtflt}
array_quicksort$cmp(x: &(a), y: &(a)): int(*sgn*)
//
(* ****** ****** *)

(*
** HX: this one is based on [qsort] in [stdlib]
*)
fun
{a:vtflt}
array_quicksort_stdlib
  {n:int}
(A0: &(@[INV(a)][n]) >> @[a][n], size(n), cmpfunref(a)
) : void // end of [array_quicksort_stdlib]

(* ****** ****** *)
//
(*
HX-2016:
Fisher–Yates shuffle
*)
//
fun
{a:vtflt}
array_permute{n:int}
(A0: &(@[INV(a)][n]) >> @[a][n], size(n)): void
//
fun
{(*void*)}
array_permute$randint{n:int|n > 0}(n: size(n)): Sizelt(n)
//
(* ****** ****** *)
//
// HX-2019-05:
// For array-pointer and array-references
//
(* ****** ****** *)

vtypedef
arrayptr
(a:vtflt,n:int) =
[l:agez] arrayptr(a,l,n)

(* ****** ****** *)

fun{}
arrayref_cptrof
{a:vtflt}{n:int}
(A: !arrayref(a, n)): cptr(a)

(* ****** ****** *)

fun
{a:tflt}
arrayref_get_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i)): (a)
fun
{a:tflt}
arrayref_set_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i), x: a): void
fun
{a:tflt}
arrayref_get_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i)): (a)
fun
{a:tflt}
arrayref_set_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i), x: a): void

#symload [] with arrayref_get_at_sint of 10
#symload [] with arrayref_set_at_sint of 10
#symload [] with arrayref_get_at_size of 10
#symload [] with arrayref_set_at_size of 10
#symload arrayref_get_at with arrayref_get_at_sint
#symload arrayref_get_at with arrayref_get_at_size
#symload arrayref_set_at with arrayref_set_at_sint
#symload arrayref_set_at with arrayref_set_at_size

(* ****** ****** *)

fun{}
arrayptr_cptrof
{a:vtflt}
{l:addr}{n:int}
(A: !arrayptr(a, l, n)): cptr(a, l)

(* ****** ****** *)

fun
{a:tflt}
arrayptr_get_at_sint
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: sint(i)): (a)
fun
{a:tflt}
arrayptr_set_at_sint
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: sint(i), x: a): void
fun
{a:tflt}
arrayptr_get_at_size
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i)): (a)
fun
{a:tflt}
arrayptr_set_at_size
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i), x: a): void

#symload [] with arrayptr_get_at_sint of 10
#symload [] with arrayptr_set_at_sint of 10
#symload [] with arrayptr_get_at_size of 10
#symload [] with arrayptr_set_at_size of 10
#symload arrayptr_get_at with arrayptr_get_at_sint
#symload arrayptr_get_at with arrayptr_get_at_size
#symload arrayptr_set_at with arrayptr_set_at_sint
#symload arrayptr_set_at with arrayptr_set_at_size

(* ****** ****** *)

(* end of [array.sats] *)
