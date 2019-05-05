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
overload ~ with lazy_vt_free of 0
overload free with lazy_vt_free of 0
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
list_tflt_int_tbox
  (a:tflt+, int) =
  | list_nil(a, 0) of ()
  | {n:int | n >= 0}
    list_cons(a, n+1) of
    (a, list_tflt_int_tbox(a, n))
// end of [datatype]
sexpdef list = list_tflt_int_tbox
//
typedef
List(a:tflt) = [n:int] list(a, n)
typedef
List0(a:tflt) = [n:int | n >= 0] list(a, n)
typedef
List1(a:tflt) = [n:int | n >= 1] list(a, n)
typedef listLt
  (a:tflt, n:int) = [k:nat | k < n] list(a, k)
typedef listLte
  (a:tflt, n:int) = [k:nat | k <= n] list(a, k)
typedef listGt
  (a:tflt, n:int) = [k:int | k > n] list(a, k)
typedef listGte
  (a:tflt, n:int) = [k:int | k >= n] list(a, k)
typedef listBtw
  (a:tflt, m:int, n:int) = [k:int | m <= k; k < n] list(a, k)
typedef listBtwe
  (a:tflt, m:int, n:int) = [k:int | m <= k; k <= n] list(a, k)
//
(* ****** ****** *)
//
datavtype
// vtflt+: covariant
list_vtflt_int_vtbox
  (a:vtflt+, int) =
  | list_vt_nil(a, 0) of ()
  | {n:int | n >= 0}
    list_vt_cons(a, n+1) of (a, list_vtflt_int_vtbox(a, n))
// end of [list_vtflt_int_vtbox]
//
sexpdef list_vt = list_vtflt_int_vtbox
//
vtypedef
List_vt(a:vtflt) = [n:int] list_vt(a, n)
vtypedef
List0_vt(a:vtflt) = [n:int | n >= 0] list_vt(a, n)
vtypedef
List1_vt(a:vtflt) = [n:int | n >= 1] list_vt(a, n)
vtypedef listLt_vt
  (a:vtflt, n:int) = [k:nat | k < n] list_vt(a, k)
vtypedef listLte_vt
  (a:vtflt, n:int) = [k:nat | k <= n] list_vt(a, k)
vtypedef listGt_vt
  (a:vtflt, n:int) = [k:int | k > n] list_vt(a, k)
vtypedef listGte_vt
  (a:vtflt, n:int) = [k:int | k >= n] list_vt(a, k)
vtypedef listBtw_vt
  (a:vtflt, m:int, n:int) = [k:int | m <= k; k < n] list_vt(a, k)
vtypedef listBtwe_vt
  (a:vtflt, m:int, n:int) = [k:int | m <= k; k <= n] list_vt(a, k)
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
datatype
// tflt+: covariant
option_tflt_bool_tbox
(
  a:tflt+, bool
) = // option_tflt_bool_tbox
  | Some(a, true) of (a) | None(a, false)
// end of [datatype]
sexpdef option = option_tflt_bool_tbox
typedef Option(a:tflt) = [b:bool] option(a, b)
//
datavtype
// vtflt+: covariant
option_vtflt_bool_vtbox
(
  a:vtflt+, bool
) = // option_vtflt_bool_vtbox
  | Some_vt(a, true) of (a) | None_vt(a, false)
// end of [option_vtflt_bool_vtbox]
stadef option_vt = option_vtflt_bool_vtbox
vtypedef Option_vt(a:vtflt) = [b:bool] option_vt(a, b)
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
(* ****** ****** *)

praxi
lemma_argv_param
  {n:int}(argv: !argv(n)): [n >= 0] void
// end of [praxi]

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
overload [] with argv_get_at
overload [] with argv_set_at
//
(* ****** ****** *)
//
fun{}
listize_argc_argv
  {n:int}
  (argc: int(n), argv: !argv(n)): list_vt(string, n)
//
(* ****** ****** *)
//
symintr main0
symintr main1
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
overload main0 with main0_void
overload main0 with main0_argc_argv
overload main0 with main0_argc_argv_envp
//
overload main1 with main1_void
overload main1 with main1_argc_argv
overload main1 with main1_argc_argv_envp
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
overload assert with assert_bool0 of 0
overload assert with assert_bool1 of 10
//
(* ****** ****** *)
//
fun{}
assertexn_bool0 (x: bool):<!exn> void
fun{}
assertexn_bool1 {b:bool} (x: bool (b)):<!exn> [b] void
//
symintr assertexn
overload assertexn with assertexn_bool0 of 0
overload assertexn with assertexn_bool1 of 10
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
symintr assert_errmsg
overload assert_errmsg with assert_errmsg_bool0 of 0
overload assert_errmsg with assert_errmsg_bool1 of 10
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
symintr assert_errmsg2
overload assert_errmsg2 with assert_errmsg2_bool0 of 0
overload assert_errmsg2 with assert_errmsg2_bool1 of 10
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
