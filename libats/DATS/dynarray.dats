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

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/array.sats"
#staload "./../SATS/dynarray.sats"
#staload "./../basics_gen.sats"

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

extern
fun
{a:vtflt}
ptr1_add
{l:addr;n:uint}(ptr(l), n: size(n)):<> ptr(l+n*sizeof(a))
impltmp
{a}//tmp
ptr1_add{l,n}(p0, n0) =
$UN.cast{ptr(l+n*sizeof(a))}(g0add_ptr_size(p0, n0*sizeof<a>))

extern
prfun
array_v_split_at
  {a:vtflt}
  {l:addr}
  {n:int}{i:nat | i <= n}
(
  pfarr: array_v (INV(a), l, n) | i: size (i)
) :<prf> @(
  array_v (a, l, i), array_v (a, l+i*sizeof(a), n-i)
) // end of [array_v_split_at]
extern
prfun
array_v_unsplit
  {a:vtflt}
  {l:addr}
  {n1,n2:int}
(
  pf1arr: array_v (INV(a), l, n1)
, pf2arr: array_v (a, l+n1*sizeof(a), n2)
) :<prf> array_v (a, l, n1+n2) // end of [array_v_unsplit]
extern
prfun
array_v_extend :
  {a:vtflt}
  {l:addr}{n:int}
  (array_v (INV(a), l, n), a @ l+n*sizeof(a)) -<prf> array_v (a, l, n+1)
extern
prfun
array_v_unextend :
  {a:vtflt}
  {l:addr}
  {n:int | n > 0}
  (array_v (INV(a), l, n)) -<prf> (array_v (a, l, n-1), a @ l+(n-1)*sizeof(a))

(* ****** ****** *)

extern
fun
memmove_right {a:vtflt}{l:addr;n,k:nat} (
  pf_arr: array_v(a, l, n)
, pf_buf: array_v(a?, l+n*sizeof(a), k)
| dst: ptr (l+k*sizeof(a)), src: ptr l, nb: size(n*sizeof(a))
): (
  array_v(a?, l, k), array_v (a, l+k*sizeof(a), n)
| ptr (l+k*sizeof(a))
) = "mac#memmove"

extern
fun
memmove_left {a:vtflt}{l:addr;n,k:nat} (
  pf_buf: array_v(a?, l, k)
, pf_arr: array_v(a, l+k*sizeof(a), n)
| dst: ptr (l), src: ptr (l+k*sizeof(a)), nb: size(n*sizeof(a))
): (
  array_v(a, l, n), array_v (a?, l+n*sizeof(a), k)
| ptr (l-k*sizeof(a))
) = "mac#memmove"

extern
fun
memcpy {a:vtflt;l1,l2:addr;n:nat} (
  pf1_arr: array_v (a, l1, n)
, pf2_arr: array_v (a?, l2, n)
| dst: ptr l2, src: ptr l1, nb: size(n*sizeof(a))
): (
  array_v (a?, l1, n)
, array_v (a, l2, n)
| ptr l2
) = "mac#memcpy"

(* ****** ****** *)

local

datavtype
dynarray (a:vtflt+, n:int, m:int) =
  {l:addr | m > 0; n >= 0; n <= m}
  DYNARRAY of
  (
    array_v(a, l, n), array_v(a?, l+n*sizeof(a), m-n), mfree_gc_v(l)
  | ptr l, size m, size n
  )
vtypedef
dynarray (a:vtflt, n:int) = [m:int] dynarray (a, n, m)

absimpl
dynarray_vtflt_int_tbox(a, n) = dynarray(a, n)

in (* in-of-local *)

impltmp
{a}(*tmp*)
dynarray_make_nil
  (m) =
A where {
//
val (pf1_arr, pf_gc | p) = array_ptr_alloc<a>(m)
prval pf0_arr = array_v_nil{a}()
val A = DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, i2sz 0)
//
}

impltmp
{}(*tmp*)
dynarray_free_tflt {a}{n}
  (DA) = {
//
val~DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval() = lemma_array_v_param(pf0_arr)
//
prval pf_arr = array_v_unsplit {a?} (pf0_arr, pf1_arr)
val () = $effmask_all (array_ptr_mfree<> (pf_arr, pf_gc | p))
//
} (* end of [dynarray_free_tflt] *)

impltmp
{a}(*tmp*)
dynarray_free {n}
  (DA) = {
//
val~DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval() = lemma_array_v_param(pf0_arr)
//
fun
loop
{l:addr}{n:nat} .<n>. (
  pf: array_v (a, l, n)
| p0: ptr(l), nz: size(n)
): (array_v (a?, l, n) | void) =
if nz > i2sz(0) then let
  prval (pf_at, pf) = array_v_uncons{a} (pf)
  val () = gfree$ref<a>(!p0)
  val (pf | ()) = loop (pf | ptr1_succ(p0), pred(nz))
  prval pf_res = array_v_cons{a?} (pf_at, pf)
in
  (pf_res | ((*empty*)))
end else let
  prval () = array_v_unnil{a} (pf)
  prval pf_res = array_v_nil{a?} ()
in
  (pf_res | ((*empty*)))
end
//
val (pf0_arr | ()) = $effmask_all (loop (pf0_arr | p, n))
//
prval pf_arr = array_v_unsplit {a?} (pf0_arr, pf1_arr)
val () = $effmask_all (array_ptr_mfree<> (pf_arr, pf_gc | p))
//
} (* end of [dynarray_free] *)

impltmp{}
dynarray_get_size{a}{n}(DA) =
n where
{
val DYNARRAY (_, _, _ | _, _, n) = DA
}

impltmp{}
dynarray_get_capacity{a}{n}(DA) =
m where
{
val DYNARRAY (_, _, _ | _, m, _) = DA
}

impltmp{}
dynarray_takeout{a}{n}(DA) =
(arr, n) where
{
val DYNARRAY {_,n,m}{l} (_, _, _ | p, _, n) = DA
val arr = $UN.castvwtp0{arrayptr(a,l,n)}(p)
prval () = DA := $UN.castvwtp0{dynarrayptrout(a,l,n)}(DA)
}

impltmp
{a}
dynarray_get_at_sint {n}{i}
  (DA, i) = res where {
//
val DYNARRAY (pf0_arr, _, _| ap, _, _) = DA
val res = array_get_at_sint<a> (!ap, i)
//
}

impltmp
{a}
dynarray_set_at_sint {n}{i}
  (DA, i, x) = {
//
val DYNARRAY (pf0_arr, _, _ | ap, _, _) = DA
val () = array_set_at_sint<a> (!ap, i, x)
//
}

impltmp
{a}
dynarray_get_at_size {n}{i}
  (DA, i) = res where {
//
val DYNARRAY (pf0_arr, _, _ | ap, _, _) = DA
val res = array_get_at_size<a> (!ap, i)
//
}

impltmp
{a}
dynarray_set_at_size {n}{i}
  (DA, i, x) = {
//
val DYNARRAY (pf0_arr, _, _ | ap, _, _) = DA
val () = array_set_at_size<a> (!ap, i, x)
//
}

impltmp
{a}
dynarray_getref_at_sint {n}{i}
  (DA, i) = res where {
//
val DYNARRAY (pf, _, _ | ap, _, _) = DA
val res = array_getref_at_sint<a> (!ap, i)
//
}

impltmp
{a}
dynarray_getref_at_size {n}{i}
  (DA, i) = res where {
//
val DYNARRAY (pf, _, _ | ap, _, _) = DA
val res = array_getref_at_size<a> (!ap, i)
//
}

// insertions

extern
fun{a:vtflt}
recapacitize {n,m,m1:uint} (
  !dynarray(a, n, m) >> dynarray (a, n, max(m,m1)), m1: size(m1)
): void

impltmp
{a} (*tmp*)
recapacitize {n,m,m1}
  (DA, m1) = let
//
val @DYNARRAY {_,m,l} (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
in
//
if m1 < m then let prval () = fold@ (DA) in
end else let
  val (pfz_arr, pfz_gc | pz) = array_ptr_alloc<a>(m1)

  prval (pfz1_arr, pfz2_arr) = array_v_split_at (pfz_arr | n)

  val nb = n*sizeof<a>
  val (pf0_arr1, pfz1_arr | _) = memcpy (pf0_arr, pfz1_arr | pz, p, nb)

  prval pf_arr = array_v_unsplit {a?} (pf0_arr1, pf1_arr)
  val () = $effmask_all (array_ptr_mfree<> (pf_arr, pf_gc | p))
    
  prval () = pf0_arr := pfz1_arr
  prval () = pf1_arr := pfz2_arr
  prval () = pf_gc := pfz_gc
  val () = p := pz
  val () = m := m1
  prval () = fold@ (DA)
in
end
//
end

impltmp
{a} (*tmp*)
dynarray_insert_at{n}{i}
  (DA, i, x) = let
//
val @DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
val m1 = succ(m)
prval () = fold@(DA)
//
val () = recapacitize<a> (DA, m1)
val @DYNARRAY {_,m,l} (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval (pf01_arr, pf02_arr) = array_v_split_at (pf0_arr | i)
prval (pf_kat, pf10_arr) = array_v_uncons {a?} (pf1_arr)
prval pf_karr = array_v_cons {a?} (pf_kat, array_v_nil{a?} ())
val src = ptr1_add<a> (p, i)
val dst = ptr1_add<a> (p, succ(i))
val nb = (n-i)*sizeof<a>
val (pf_karr, pf02_arr | _) = memmove_right (pf02_arr, pf_karr | dst, src, nb)
prval (pf_kat, pf_karr) = array_v_uncons{a?} (pf_karr)
prval () = array_v_unnil {a?} (pf_karr)
//
val () = !src := x
//
prval pf02_arr = array_v_cons {a} (pf_kat, pf02_arr)
prval () = pf0_arr := array_v_unsplit {a} (pf01_arr, pf02_arr)
prval () = pf1_arr := pf10_arr
val () = n := succ(n)
//
prval () = fold@(DA)
//
in
end

impltmp
{a} (*tmp*)
dynarray_append{n}
  (DA, x) = let
//
val @DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
val m1 = succ(m)
prval () = fold@(DA)
//
val () = recapacitize<a> (DA, m1)
val @DYNARRAY {_,m,l} (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval (pf1_at, pf11_arr) = array_v_uncons{a?}(pf1_arr)
val dst = ptr1_add<a> (p, n)
val () = !dst := x
prval pf01_arr = array_v_extend (pf0_arr, pf1_at)
prval () = pf0_arr := pf01_arr
prval () = pf1_arr := pf11_arr
val () = n := succ(n)
prval () = fold@(DA)
//
in
end

// deletions

impltmp
{a} (*tmp*)
dynarray_takeout_at{n,i}
  (DA, i, res) = let
//
val sz = dynarray_get_size(DA)
//
in
//
if succ(i) = sz then dynarray_takeout_last (DA, res)
else
{
//
val @DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval (pf01_arr, pf02_arr) = array_v_split_at (pf0_arr | i)
prval (pf_kat, pf02_arr) = array_v_uncons {a} (pf02_arr)
val dst = ptr1_add<a> (p, i)
val src = ptr1_add<a> (p, succ(i))
//
val () = res := !dst
//
prval pf_karr = array_v_cons {a?} (pf_kat, array_v_nil{a?} ())
//
val nb = (n-succ(i))*sizeof<a>
val (pf02_arr, pf_karr | _) = memmove_left{a} (pf_karr, pf02_arr | dst, src, nb)
prval () = pf0_arr := array_v_unsplit (pf01_arr, pf02_arr)
//
prval pf11_arr = array_v_unsplit (pf_karr, pf1_arr)
//
prval () = pf1_arr := pf11_arr
val () = n := pred(n)
prval () = fold@(DA)
//
}
end


impltmp
{a} (*tmp*)
dynarray_takeout_last{n}
  (DA, res) = {
//
val @DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
//
prval (pf01_arr, pf1_at) = array_v_unextend{a}(pf0_arr)
val src = ptr1_add<a> (p, pred(n))
val () = res := !src
prval pf11_arr = array_v_cons {a?} (pf1_at, pf1_arr)
prval () = pf0_arr := pf01_arr
prval () = pf1_arr := pf11_arr
val () = n := pred(n)
prval () = fold@(DA)
//
}

impltmp
{a} (*tmp*)
dynarray_reset_capacity {n}
  (DA, m1) = let
//
val @DYNARRAY (pf0_arr, pf1_arr, pf_gc | p, m, n) = DA
val cap = m
prval () = fold@(DA)
//
in
  if :(DA: dynarray(a, n)) => m1 <= cap then false
  else let
    val () = $effmask_all (recapacitize<a> (DA, m1))
  in
    true
  end
end


end (* end-of-local *)

(* ****** ****** *)

(* end of [dynarray.dats] *)
