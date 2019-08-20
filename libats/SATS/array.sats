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
{a:tflt0}
array_get_at_sint
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), sint(i)): (a)
fun
{a:tflt0}
array_set_at_sint
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), sint(i), a): void
//
fun
{a:tflt0}
array_get_at_size
{n:int}{i:nat | i < n}
( arr
: &(@[INV(a)][n]), size(i)): (a)
fun
{a:tflt0}
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
#symload [] with array_get_at_sint
#symload [] with array_set_at_sint
#symload [] with array_get_at_size
#symload [] with array_set_at_size
#symload .get_at with array_get_at_sint
#symload .set_at with array_set_at_sint
#symload .get_at with array_get_at_size
#symload .set_at with array_set_at_size
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
array_bsearch$ford(x0: &(a)): int
//
fun
{a:vtflt}
array_bsearch
  {n:int}
  (A0: &(@[a][n]), n: size(n)): Sizelte(n)
//
(*
** HX:
** this one is based on [bsearch] in [stdlib]
*)
fun
{a:vtflt}
array_bsearch_libc
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
array_quicksort$fcmp(x: &(a), y: &(a)): int(*sgn*)
//
(* ****** ****** *)

(*
** HX:
** this one is based on [qsort] in [stdlib]
*)
fun
{a:vtflt}
array_quicksort_libc
  {n:int}
(
A0: &(@[INV(a)][n]) >> @[a][n], size(n), cmpfunref(a)
) : void // end of [array_quicksort_libc]

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
// For arrsz-ptrs and arrsz-refs
//
(* ****** ****** *)
//
castfn
arrszptr_refize
{a:vtflt}
(AZ: arrszptr(a)): arrszref(a)
//
(* ****** ****** *)
//
absvtbox
arrszptrout
(a:vtflt,l:addr,n:int)
//
fun{}
arrszptr_cons
{a:vtflt}{n:int}
(arrayptr(a,n), size(n)): arrszptr(a)
//
fun{}
arrszptr_takeout
{a:vtflt}
(
AZ: !arrszptr(a) >> arrszptrout(a,l,n)
) : #[l:addr;n:nat] (arrayptr(a,l,n), size(n))
//
praxi
arrszptr_restore
{a:vtflt}{l:addr}{n:int}
(AZ: !arrszptrout(a,l,n) >> arrszptr(a), A0: arrayptr(a,l,n)) : void
//
#symload takeout with arrszptr_takeout
#symload restore with arrszptr_restore
//
(* ****** ****** *)
//
fun
{a:tflt0}
arrszptr_get_at_size
( AZ
: !arrszptr(a), i: size): (a)
fun
{a:tflt0}
arrszptr_set_at_size
( AZ
: !arrszptr(a), i: size, x: a): void
//
fun
{a:tflt0}
arrszptr_get_at_sint
{i:nat}
( AZ
: !arrszptr(a), i: sint(i)): (a)
fun
{a:tflt0}
arrszptr_set_at_sint
{i:nat}
( AZ
: !arrszptr(a), i: sint(i), x: a): void
//
fun
{a:vtflt}
arrszptr_getref_at_size
( AZ
: !arrszptr(a), i: size): cptr(a)
fun
{a:vtflt}
arrszptr_getref_at_sint
( AZ
: !arrszptr(a), i: size): cptr(a)
//
#symload [] with arrszptr_get_at_size
#symload [] with arrszptr_set_at_size
#symload [] with arrszptr_get_at_sint
#symload [] with arrszptr_set_at_sint
#symload .get_at with arrszptr_get_at_sint
#symload .set_at with arrszptr_set_at_sint
#symload .get_at with arrszptr_get_at_size
#symload .set_at with arrszptr_set_at_size
//
(* ****** ****** *)
//
fun{}
arrszref_cons
{a:vtflt}{n:int}
(arrayref(a,n), size(n)): arrszref(a)
//
fun{}
arrszref_uncons{a:vtflt}
(
AZ: arrszref(a)
) : [n:nat] (arrayref(a, n), size(n))
//
(* ****** ****** *)
//
fun{}
arrszref_size
{a:vtflt}(arrszref(a)): size
fun{}
arrszref_length
{a:vtflt}(arrszref(a)): Intgte(0)
//
#symload size with arrszref_size
#symload length with arrszref_length
//
(* ****** ****** *)
//
fun
{a:tflt}
arrszref_make_elt
  (size, x0: a): arrszref(a)
//
(* ****** ****** *)
//
fun
{a:tflt}
arrszref_make_list0
  (xs: list0(a)): arrszref(a)
fun
{a:vtflt}
arrszref_make_list0_vt
  (xs: list0_vt(a)): arrszref(a)
//
#symload
arrszref_make with arrszref_make_list0
#symload
arrszref_make with arrszref_make_list0_vt
//
(* ****** ****** *)
//
fun
{a:tflt0}
arrszref_get_at_size
(AZ: arrszref(a), i: size): (a)
fun
{a:tflt0}
arrszref_set_at_size
(AZ: arrszref(a), i: size, x: a): void
//
fun
{a:tflt0}
arrszref_get_at_sint
{i:nat}
(AZ: arrszref(a), i: sint(i)): (a)
fun
{a:tflt0}
arrszref_set_at_sint
{i:nat}
(AZ: arrszref(a), i: sint(i), x: a): void
//
fun
{a:vtflt}
arrszref_getref_at_size
(AZ: arrszref(a), i: size): cptr(a)
fun
{a:vtflt}
arrszref_getref_at_sint
(AZ: arrszref(a), i: size): cptr(a)
//
#symload [] with arrszref_get_at_size
#symload [] with arrszref_set_at_size
#symload [] with arrszref_get_at_sint
#symload [] with arrszref_set_at_sint
#symload .get_at with arrszref_get_at_sint
#symload .set_at with arrszref_set_at_sint
#symload .get_at with arrszref_get_at_size
#symload .set_at with arrszref_set_at_size
//
(* ****** ****** *)
//
fun
{a:tflt1}
arrszref_lget_at_size
(AZ: arrszref(a), i: size): (a)
fun
{a:tflt1}
arrszref_lset_at_size
(AZ: arrszref(a), i: size, x: a): void
//
fun
{a:tflt1}
arrszref_lget_at_sint
{i:nat}
(AZ: arrszref(a), i: sint(i)): (a)
fun
{a:tflt1}
arrszref_lset_at_sint
{i:nat}
(AZ: arrszref(a), i: sint(i), x: a): void
//
#symload .lget_at with arrszref_lget_at_size
#symload .lset_at with arrszref_lset_at_size
#symload .lget_at with arrszref_lget_at_sint
#symload .lset_at with arrszref_lset_at_sint
//
(* ****** ****** *)

fun
{a:vtflt}
arrszref_forall
(AZ: arrszref(a)): bool
fun
{a:vtflt}
arrszref_forall$test(x: !a): bool
fun
{a:vtflt}
arrszref_foreach
(AZ: arrszref(a)): void
fun
{a:vtflt}
arrszref_foreach$work(x: !a): void

(* ****** ****** *)

(*
fun
{a:vtflt}
{r0:vtflt}
arrszref_foldleft
(AZ: arrszref(a), r0: r0): r0
fun
{a:vtflt}
{r0:vtflt}
arrszref_foldleft$fopr(r0: r0, x0: !a): r0
*)

(* ****** ****** *)

fun
{a:vtflt}
arrszref_rforall
(AZ: arrszref(a)): bool
fun
{a:vtflt}
arrszref_rforall$test(x: !a): bool
fun
{a:vtflt}
arrszref_rforeach
(AZ: arrszref(a)): void
fun
{a:vtflt}
arrszref_rforeach$work(x: !a): void

(* ****** ****** *)

fun
{a:vtflt}
arrszref_iforall
(AZ: arrszref(a)): bool
fun
{a:vtflt}
arrszref_iforall$test(int, x: !a): bool
fun
{a:vtflt}
arrszref_iforeach
(AZ: arrszref(a)): void
fun
{a:vtflt}
arrszref_iforeach$work(int, x: !a): void

(* ****** ****** *)
//
fun
{a:vtflt}
arrszref_bsearch(arrszref(a)): size
fun
{a:vtflt}
arrszptr_bsearch(!arrszref(a)): size
//
(*
arrszref_bsearch$ford = array_bsearch$ford
arrszptr_bsearch$ford = array_bsearch$ford
*)
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrszref_quicksort(arrszref(a)): void
fun
{a:vtflt}
arrszptr_quicksort(!arrszptr(a)): void
(*
arrszref_quicksort$fcmp = array_quicksort$fcmp
arrszptr_quicksort$fcmp = array_quicksort$fcmp
*)
//
(* ****** ****** *)
//
// HX-2019-05:
// For array-ptrs and array-refs
//
(* ****** ****** *)

vtypedef
arrayptr
(a:vtflt,n:int) =
[l:agez] arrayptr(a,l,n)

(* ****** ****** *)
//
castfn
arrayref_ptrof
{a:vtflt}{n:int}
(A: arrayref(a, n)): ptr
castfn
arrayptr_ptrof
{a:vtflt}
{l:addr}{n:int}
(A: !arrayptr(a, l, n)): ptr(l)
//
castfn
arrayref_cptrof
{a:vtflt}{n:int}
(A: arrayref(a, n)): cptr(a)
castfn
arrayptr_cptrof
{a:vtflt}
{l:addr}{n:int}
(A: !arrayptr(a, l, n)): cptr(a, l)
//
#symload ptrof with arrayref_ptrof
#symload ptrof with arrayptr_ptrof
#symload cptrof with arrayref_cptrof
#symload cptrof with arrayptr_cptrof
//
(* ****** ****** *)
//
castfn
arrayptr_refize
{a:vtflt}
{l:addr}{n:int}
(arrayptr(a,l,n)): arrayref(a, n)
//
#symload refize with arrayptr_refize
//
(* ****** ****** *)
//
castfn
arrayptr_vptrof
{a:vtflt}
{l:addr}{n:int}
(
A0: !arrayptr(a,l,n)
) :
( array_v(a, l, n)
, array_v(a, l, n) -<lin,prf> void | ptr(l))
//
(* ****** ****** *)
//
fun
{a:tflt}
arrayptr_make_elt
  {n:int}
  (size(n), x0: a): arrayptr(a, n)
fun
{a:vtflt}
arrayptr_make_none
  {n:int}(size(n)): arrayptr(a?, n)
//
(* ****** ****** *)
//
fun{}
arrayptr_free
{a:vtflt}
{l:addr}{n:int}(arrayptr(a?, l, n)): void
//
(* ****** ****** *)
//
castfn
arrayref_decode
{a:vtflt}{n:int}
(A0: arrayref(a, n)): ref(array(a, n))
castfn
arrayref_encode
{a:vtflt}{n:int}
(r0: ref(array(a, n))): arrayref(a, n)
//
(* ****** ****** *)

fun
{a:tflt0}
arrayref_get_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i)): (a)
fun
{a:tflt0}
arrayref_set_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i), x: a): void
fun
{a:tflt0}
arrayref_get_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i)): (a)
fun
{a:tflt0}
arrayref_set_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i), x: a): void
//
fun
{a:vtflt}
arrayref_getref_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i)): cptr(a)
fun
{a:vtflt}
arrayref_getref_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i)): cptr(a)
//
#symload [] with arrayref_get_at_sint
#symload [] with arrayref_set_at_sint
#symload [] with arrayref_get_at_size
#symload [] with arrayref_set_at_size
#symload .get_at with arrayref_get_at_sint
#symload .set_at with arrayref_set_at_sint
#symload .get_at with arrayref_get_at_size
#symload .set_at with arrayref_set_at_size
//
(* ****** ****** *)
//
fun
{a:tflt1}
arrayref_lget_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i)): (a)
fun
{a:tflt1}
arrayref_lset_at_sint
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: sint(i), x: a): void
fun
{a:tflt1}
arrayref_lget_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i)): (a)
fun
{a:tflt1}
arrayref_lset_at_size
{n:int}{i:nat | i < n}
(A: arrayref(a, n), i: size(i), x: a): void
//
#symload .lget_at with arrayref_lget_at_size
#symload .lset_at with arrayref_lset_at_size
#symload .lget_at with arrayref_lget_at_sint
#symload .lset_at with arrayref_lset_at_sint
//
(* ****** ****** *)

fun
{a:tflt0}
arrayptr_get_at_sint
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: sint(i)): (a)
fun
{a:tflt0}
arrayptr_set_at_sint
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: sint(i), x: a): void
fun
{a:tflt0}
arrayptr_get_at_size
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i)): (a)
fun
{a:tflt0}
arrayptr_set_at_size
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i), x: a): void
//
fun
{a:vtflt}
arrayptr_getref_at_sint
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i)): cptr(a)
fun
{a:vtflt}
arrayptr_getref_at_size
{n:int}{i:nat | i < n}
(A: !arrayptr(a, n), i: size(i)): cptr(a)
//
#symload [] with arrayptr_get_at_sint
#symload [] with arrayptr_set_at_sint
#symload [] with arrayptr_get_at_size
#symload [] with arrayptr_set_at_size
#symload .get_at with arrayptr_get_at_sint
#symload .set_at with arrayptr_set_at_sint
#symload .get_at with arrayptr_get_at_size
#symload .set_at with arrayptr_set_at_size
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayref_forall
{n:int}
(A: arrayref(a,n), size(n)): bool
fun
{a:vtflt}
arrayref_forall$test(x: !a): bool
//
fun
{a:vtflt}
arrayref_foreach
{n:int}
(A: arrayref(a,n), size(n)): void
fun
{a:vtflt}
arrayref_foreach$work(x: !a): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayref_rforall
{n:int}
(A: arrayref(a,n), size(n)): bool
fun
{a:vtflt}
arrayref_rforall$test(x: !a): bool
//
fun
{a:vtflt}
arrayref_rforeach
{n:int}
(A: arrayref(a,n), size(n)): void
fun
{a:vtflt}
arrayref_rforeach$work(x: !a): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayref_iforall
{n:int}
(A: arrayref(a,n), size(n)): bool
fun
{a:vtflt}
arrayref_iforall$test(int, x: !a): bool
//
fun
{a:vtflt}
arrayref_iforeach
{n:int}
(A: arrayref(a,n), size(n)): void
fun
{a:vtflt}
arrayref_iforeach$work(int, x: !a): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayptr_forall1
{n:int}
(A: !arrayptr(a,n), size(n)): bool
fun
{a:vtflt}
arrayptr_forall1$test(x: !a): bool
//
fun
{a:vtflt}
arrayptr_foreach1
{n:int}
(A: !arrayptr(a,n), size(n)): void
fun
{a:vtflt}
arrayptr_foreach1$work(x: !a): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayptr_rforall1
{n:int}
(A: !arrayptr(a,n), size(n)): bool
fun
{a:vtflt}
arrayptr_rforall1$test(x: !a): bool
//
fun
{a:vtflt}
arrayptr_rforeach1
{n:int}
(A: !arrayptr(a,n), size(n)): void
fun
{a:vtflt}
arrayptr_rforeach1$work(x: !a): void
//
(* ****** ****** *)
//
fun
{a:vtflt}
arrayref_bsearch
  {n:int}
  (arrayref(a, n), size(n)): Sizelte(n)
fun
{a:vtflt}
arrayptr_bsearch
  {n:int}
  (!arrayptr(a, n), size(n)): Sizelte(n)
//
(*
arrayref_bsearch$ford = array_bsearch$ford
arrayptr_bsearch$ford = array_bsearch$ford
*)
(* ****** ****** *)
//
fun
{a:vtflt}
arrayref_quicksort
  {n:int}
  (A0: arrayref(a, n), asz: size(n)): void
fun
{a:vtflt}
arrayptr_quicksort
  {n:int}
  (A0: !arrayptr(a, n), asz: size(n)): void
(*
arrayref_quicksort$fcmp = array_quicksort$fcmp
arrayptr_quicksort$fcmp = array_quicksort$fcmp
*)
//
(* ****** ****** *)

(* end of [array.sats] *)
