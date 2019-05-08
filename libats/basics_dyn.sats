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
//
// Author of the file:
// Hongwei Xi (gmhwxiATgmailDOTcom)
// Start Time: September, 2011
//
(* ****** ****** *)

#include "libats/params.hats"

(* ****** ****** *)
#if
VERBOSE_PRELUDE
#then
#print
"Loading [basics_dyn.sats] starts!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)
//
fun
patsopt_version(): string = "ext#%"
//
(* ****** ****** *)

datatype TYPE(a:vtflt) = TYPE(a) of ()

(* ****** ****** *)
//
// HX-2012: In $ATSHOME/ccomp/runtime:
// atsbool_true/atsbool_false are mapped to 1/0
// this mapping is fixed and should never be changed!
//
#define true true_bool // shorthand
#define false false_bool // shorthand
//
val true_bool : bool(true)  = "mac#atsbool_true" // = 1
val false_bool : bool(false) = "mac#atsbool_false" // = 0
//
(* ****** ****** *)
//
// HX: [false] implies all
//
prfun
false_elim
{X:prop | false} ((*void*)): X
//
(* ****** ****** *)

prfun
prop_verify
{b:bool | b} ():<prf> void
prfun
prop_verify_add
{b:bool | b} ():<prf> [b] void

(* ****** ****** *)
//
val {
a:vtflt
} sizeof : usize(sizeof(a))
//
praxi
lemma_sizeof
{a:vtflt}
((*void*)):[sizeof(a) >= 0] void
//
(* ****** ****** *)

praxi
topize
{a:tflt}(x: !INV(a) >> a?): void

(* ****** ****** *)

castfn
dataget
{a:vtflt}(x: !INV(a) >> a): (a?!)

(* ****** ****** *)
(*
//
// HX: returning the pf to GC
//
praxi
mfree_gc_v_elim
{l:addr}(pf: mfree_gc_v(l)):<prf> void
// end of [mfree_gc_v_elim]
//
praxi
mfree_gcngc_v_nullify
  {l:addr} (
  pf1: mfree_gc_v(l), pf1: mfree_ngc_v(l)
) : void // end of [mfree_gcngc_nullify_v]
//
*)
(* ****** ****** *)
(*
//
fun
cloptr_free
  {a:tflt}
  (cloptr(a)):<!wrt> void = "mac#%"
//
overload free with cloptr_free of 0
//
*)
(* ****** ****** *)
//
fun
{a:tflt}
lazy_force
(lazyval: lazy(INV(a))):<!laz> (a)
//
fun
{a:vtflt}
lazy_vt_force
(lazyval: lazy_vt(INV(a))):<!all> (a)
//
(*
//
// HX-2016-08:
// this is assumed internally!
//
overload ! with lazy_force of 0
overload ! with lazy_vt_force of 0
*)
//
(* ****** ****** *)
//
// HX-2013:
// implemented in [pats_ccomp_instrset]
//
fun
lazy_vt_free
  {a:vtflt}
  (lazyval: lazy_vt(a)):<!wrt> void = "mac#%"
//
#symload ~ with lazy_vt_free of 0
#symload free with lazy_vt_free of 0
//
(* ****** ****** *)
//
// HX-2014:
// implemented in [pats_ccomp_instrset]
//
fun
lazy2cloref
  {a:tflt}
(
  lazy(a)
) : ((*void*)) -<cloref1> (a) = "mac#%"
//
(* ****** ****** *)
//
// HX: the_null_ptr = (void*)0
//
val
the_null_ptr
  : ptr(null) = "mac#the_atsptr_null"
//
(* ****** ****** *)
//
praxi
lemma_addr_param
  {l:addr}((*void*)): [l >= null] void
//
(* ****** ****** *)

praxi
lemma_string_param
  {n:int} (x: string(n)): [n >= 0] void
// end of [lemma_string_param]
praxi
lemma_stropt_param
  {n:int} (x: stropt(n)): [n >= ~1] void
// end of [lemma_stropt_param]

(* ****** ****** *)
//
// HX-2012-06:
// indication of the failure of
exception AssertExn of () // an assertion
//
(* ****** ****** *)
//
// HX-2012-06:
// indication of something expected
exception NotFoundExn of () // to be found but not
//
(* ****** ****** *)
//
exception GenerallyExn of (string) // for unspecified causes
(*
exception GenerallyExn2 of (string, ptr(*data*)) // for unspecified causes
*)
//
(* ****** ****** *)
//
// HX-2012-07:
// indication of a function argument being
exception IllegalArgExn of (string) // out of its domain
//
(* ****** ****** *)
//
datatype unit = unit of ()
dataprop unit_p = unit_p of ()
dataview unit_v = unit_v of ()
datavtype unit_vt = unit_vt of ()
//
prfun unit_v_elim (unit_v): void
prfun unit_vt_elim (unit_vt): void
//
(* ****** ****** *)
(*
//
abstbox
boxed_tflt_tbox(a:tflt+) = unit
absvtbox
boxed_vtflt_vtbox(a:vtflt+) = unit
//
vtypedef
boxed(a:vtflt) = boxed_vtflt_vtbox(a)
vtypedef
boxed_vt(a:vtflt) = boxed_vtflt_vtbox(a)
//
typedef boxed(a:tflt) = boxed_tflt_tbox(a)
typedef boxed_t(a:tflt) = boxed_tflt_tbox(a)
//
fun{a:tbox} box: (INV(a)) -> boxed_t(a)
fun{a:tbox} unbox: boxed_t(INV(a)) -> (a)
fun{a:vtbox} box_vt: (INV(a)) -> boxed_vt(a)
fun{a:vtbox} unbox_vt: boxed_vt(INV(a)) -> (a)
//
*)
(* ****** ****** *)
//
sexpdef
array(a:vtflt, n:int) = @[a][n]
//
viewdef
array_v
(a:vtflt, l:addr, n:int) = @[a][n] @ l
//
absvtbox
arrayptr_vtflt_addr_int_vtbox
(a:vtflt+, l:addr, n:int(*size*)) = ptr(l)
sexpdef
arrayptr = arrayptr_vtflt_addr_int_vtbox
vtypedef
arrayptr
(a:vtflt, n:int) = [l:addr] arrayptr(a, l, n)
//
abstbox
arrayref_vtflt_int_tbox
  (a:vtflt(*elt*), n:int(*size*)) = ptr
sexpdef arrayref = arrayref_vtflt_int_tbox
//
abstbox
arrszref_vtflt_tbox(a: vtflt) = ptr
typedef
arrszref(a:vtflt) = arrszref_vtflt_tbox(a)
//
(* ****** ****** *)
//
datatype
// tflt+: covariant
list0_tflt_tbox
  (a:tflt+) =
| list0_nil(a) of ()
| list0_cons(a) of (a, list0_tflt_tbox(a))
// end of [datatype]
sexpdef list0 = list0_tflt_tbox
//
(* ****** ****** *)
//
datatype
// tflt+: covariant
list1_tflt_int_tbox
  (a:tflt+, int) =
| list1_nil(a, 0) of ()
| {n:int | n >= 0}
  list1_cons(a, n+1) of (a, list1_tflt_int_tbox(a, n))
// end of [datatype]
sexpdef list1 = list1_tflt_int_tbox
//
typedef
list1(a:tflt) = [n:int] list1(a, n)
typedef
list1_0(a:tflt) = [n:int | n >= 0] list1(a, n)
typedef
list1_1(a:tflt) = [n:int | n >= 1] list1(a, n)
typedef list1_lt
  (a:tflt, n:int) = [k:nat | k < n] list1(a, k)
typedef list1_gt
  (a:tflt, n:int) = [k:int | k > n] list1(a, k)
typedef list1_lte
  (a:tflt, n:int) = [k:nat | k <= n] list1(a, k)
typedef list1_gte
  (a:tflt, n:int) = [k:int | k >= n] list1(a, k)
typedef list1_btw
  (a:tflt, m:int, n:int) = [k:int | m <= k; k < n] list1(a, k)
typedef list1_btwe
  (a:tflt, m:int, n:int) = [k:int | m <= k; k <= n] list1(a, k)
//
(* ****** ****** *)
//
datavtype
// vtflt+: covariant
list0_vtflt_vtbox
  (a:vtflt+) =
| list0_nil_vt(a) of ()
| list0_cons_vt(a) of (a, list0_vtflt_vtbox(a))
// end of [datavtype]
sexpdef list0_vt = list0_vtflt_vtbox
//
(* ****** ****** *)
//
datavtype
// vtflt+: covariant
list1_vtflt_int_vtbox
  (a:vtflt+, int) =
| list1_nil_vt(a, 0) of ()
| {n:int | n >= 0}
  list1_cons_vt(a, n+1) of (a, list1_vtflt_int_vtbox(a, n))
// end of [list_vtflt_int_vtbox]
//
sexpdef list1_vt = list1_vtflt_int_vtbox
//
vtypedef
list1_vt(a:vtflt) = [n:int] list1_vt(a, n)
vtypedef
list1_0_vt
  (a:vtflt) = [n:int | n >= 0] list1_vt(a, n)
vtypedef
list1_0_vt
  (a:vtflt) = [n:int | n >= 1] list1_vt(a, n)
vtypedef
list1_gt_vt
  (a:vtflt, n:int) = [k:nat | k < n] list1_vt(a, k)
vtypedef
list1_lte_vt
  (a:vtflt, n:int) = [k:nat | k <= n] list1_vt(a, k)
vtypedef
list1_gt_vt
  (a:vtflt, n:int) = [k:int | k > n] list1_vt(a, k)
vtypedef
list1_gte_vt
  (a:vtflt, n:int) = [k:int | k >= n] list1_vt(a, k)
vtypedef
list1_btw_vt
  (a:vtflt, m:int, n:int) = [k:int | m <= k; k < n] list1_vt(a, k)
vtypedef
list1_btwe_vt
  (a:vtflt, m:int, n:int) = [k:int | m <= k; k <= n] list1_vt(a, k)
//
(* ****** ****** *)
//
datatype
stream_con(a:tflt+) =
  | stream_nil of ((*void*))
  | stream_cons of (a, stream(a))
//
where
stream(a:tflt) = lazy(stream_con(a))
//
datavtype
stream_vt_con
  (a:vtflt+) =
  | stream_vt_nil of ((*void*))
  | stream_vt_cons of (a, stream_vt(a))
//
where
stream_vt(a:vtflt) = lazy_vt(stream_vt_con(a))
//
(* ****** ****** *)
//
praxi
opt_some{a:vtflt}
  (x: !INV(a) >> opt(a, true)):<prf> void
praxi
opt_unsome{a:vtflt}
  (x: !opt(INV(a), true) >> a):<prf> void
//
fun{a:vtflt}
opt_unsome_get(x: &opt(INV(a), true) >> a?): (a)
//
praxi
opt_none{a:vtflt}
  (x: !(a?) >> opt(a, false)):<prf> void
praxi
opt_unnone{a:vtflt}
  (x: !opt(INV(a), false) >> a?):<prf> void
//
praxi
opt_clear{a:tflt}
  {b:bool}(x: !opt(INV(a), b) >> a?):<prf> void
//
(* ****** ****** *)
//
datatype
// tflt+: covariant
optn0_tflt_tbox
  (a:tflt+) =
| optn0_none(a) of ()
| optn0_some(a) of (a)
// end of [datatype]
//
sexpdef optn0 = optn0_tflt_tbox
//
(* ****** ****** *)
//
datatype
// tflt+: covariant
optn1_tflt_bool_tbox
(
  a:tflt+, bool
) = // optn1_tflt_bool_tbox
  | optn1_none(a, ff)
  | optn1_some(a, tt) of (a)
// end of [datatype]
sexpdef optn1 = optn1_tflt_bool_tbox
sexpdef optn1(a:tflt) = [b:bool] optn1(a, b)
//
(* ****** ****** *)
//
datavtype
// vtflt+: covariant
optn0_vtflt_vtbox
  (a:vtflt+) =
  | optn0_none_vt(a)
  | optn0_some_vt(a) of (a)
// end of [option_vtflt_bool_vtbox]
sexpdef optn0_vt = optn0_vtflt_vtbox
//
(* ****** ****** *)
//
datavtype
// vtflt+: covariant
optn1_vtflt_bool_vtbox
(
  a:vtflt+, bool
) = // option_vtflt_bool_vtbox
  | optn1_none_vt(a, ff)
  | optn1_some_vt(a, tt) of (a)
// end of [option_vtflt_bool_vtbox]
sexpdef optn1_vt = optn1_vtflt_bool_vtbox
sexpdef optn1_vt(a:vtflt) = [b:bool] optn1_vt(a, b)
//
(* ****** ****** *)
//
absvtbox
argv_int_vtbox(n:int) = ptr
sexpdef argv = argv_int_vtbox
//
(*
[argv_takeout_strarr]
is declared in prelude/SATS/extern.sats
[argv_takeout_parrnull]
is declared in prelude/SATS/extern.sats
*)
//
praxi
lemma_argv_param
  {n:int}(argv: !argv(n)): [n >= 0] void
// end of [praxi]
//
(* ****** ****** *)
//
fun
argv_get_at
{n:int}{i:nat | i < n}
(argv: !argv(n), i: int(i)):<> string = "mac#%"
fun
argv_set_at
{n:int}{i:nat | i < n}
(argv: !argv(n), i: int(i), x: string):<!wrt> void = "mac#%"
//
#symload [] with argv_get_at
#symload [] with argv_set_at
//
(* ****** ****** *)
//
fun{}
listize_argc_argv
  {n:int}
  (argc: int(n), argv: !argv(n)): list1_vt(string, n)
//
(* ****** ****** *)
//
#symintr main0
#symintr main1
//
(* ****** ****** *)
//
fun
main0_void
(
  (*void*)
) : void = "ext#mainats_0_void"
fun
main0_argc_argv
  {n:int | n >= 1}
  (argc: int(n), argv: !argv(n)): void = "ext#mainats_0_argc_argv"
fun
main0_argc_argv_envp
  {n:int | n >= 1}
  (argc: int(n), argv: !argv(n), envp: ptr): void = "ext#mainats_0_argc_argv_envp"
//
(* ****** ****** *)
//
fun
main1_void
(
  (*void*)
) : (int) = "ext#mainats_1_void"
fun
main1_argc_argv
  {n:int | n >= 1}
  (argc: int(n), argv: !argv(n)): (int) = "ext#mainats_1_argc_argv"
fun
main1_argc_argv_envp
  {n:int | n >= 1}
  (argc: int(n), argv: !argv n, envp: ptr): (int) = "ext#mainats_1_argc_argv_envp"
//
(* ****** ****** *)
//
#symload main0 with main0_void
#symload main0 with main0_argc_argv
#symload main0 with main0_argc_argv_envp
//
#symload main1 with main1_void
#symload main1 with main1_argc_argv
#symload main1 with main1_argc_argv_envp
//
(* ****** ****** *)
//
fun
exit
(ecode: int):<!exn> {a:tflt}(a) = "mac#%"
fun
exit_errmsg
(ecode: int, msg: string):<!exn> {a:tflt}(a) = "mac#%"
//
(* ****** ****** *)
//
fun
exit_void
  (ecode: int):<!exn> void = "mac#%"
fun
exit_errmsg_void
  (ecode: int, msg: string):<!exn> void = "mac#%"
//
(* ****** ****** *)
//
fun
assert_bool0
  (x: bool):<!exn> void = "mac#%"
fun
assert_bool1
  {b:bool} (x: bool (b)):<!exn> [b] void = "mac#%"
//
#symload assert with assert_bool0 of 0
#symload assert with assert_bool1 of 10
//
(* ****** ****** *)
//
fun{}
assertexn_bool0 (x: bool):<!exn> void
fun{}
assertexn_bool1 {b:bool} (x: bool (b)):<!exn> [b] void
//
#symintr assertexn
#symload assertexn with assertexn_bool0 of 0
#symload assertexn with assertexn_bool1 of 10
//
(* ****** ****** *)
//
fun
assert_errmsg_bool0
  (x: bool, msg: string):<!exn> void = "mac#%"
fun
assert_errmsg_bool1
  {b:bool} (x: bool b, msg: string):<!exn> [b] void = "mac#%"
//
#symintr assert_errmsg
#symload assert_errmsg with assert_errmsg_bool0 of 0
#symload assert_errmsg with assert_errmsg_bool1 of 10
//
(* ****** ****** *)
//
fun
assert_errmsg2_bool0
  (x: bool, msg1: string, msg2: string):<!exn> void = "mac#%"
fun
assert_errmsg2_bool1{b:bool}
  (x: bool b, msg1: string, msg2: string):<!exn> [b] void = "mac#%"
//
#symintr assert_errmsg2
#symload assert_errmsg2 with assert_errmsg2_bool0 of 0
#symload assert_errmsg2 with assert_errmsg2_bool1 of 10
//
(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print
"Loading [basics_dyn.sats] finishes!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

(* end of [basics_dyn.sats] *)
