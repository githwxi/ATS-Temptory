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

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/gref.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/array.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
array_get_at_sint
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(addr@A0, i0))
)
impltmp
{a}(*tmp*)
array_set_at_sint
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(addr@A0, i0), x0)
)
//
impltmp
{a}(*tmp*)
array_get_at_size
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(addr@A0, i0))
)
impltmp
{a}(*tmp*)
array_set_at_size
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(addr@A0, i0), x0)
)
//
impltmp
{a}(*tmp*)
array_getref_at_sint
  (A0, i0) =
(
  $UN.cast{cptr(a)}(addr@A0)+i0
)
impltmp
{a}(*tmp*)
array_getref_at_size
  (A0, i0) =
(
  $UN.cast{cptr(a)}(addr@A0)+i0
)
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
array_ptr_mfree
(pf1, pf2 | p0) =
let
prval () = $UN.cast2void(pf1)
prval () = $UN.cast2void(pf2)
in
  $extfcall(void, "ATS_MFREE", p0)
end // end of [array_ptr_mfree]
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
array_ptr_alloc
  (asz) =
(
$UN.castvwtp0
(
  $extfcall
  (ptr, "ATS_MALLOC", asz*sizeof<a>)
)
) (* end of [array_ptr_alloc] *)

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
array_forall
  (A0, asz) =
(
let
val pa = ptr2cptr{a}(addr@A0)
in
(
  cptr0_forall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_forall$test<a>(x) = array_forall$test<a>(x)
}
end // end of [array_forall]
)
//
impltmp
{a}(*tmp*)
array_foreach
  (A0, asz) =
(
let
val pa = ptr2cptr{a}(addr@A0)
in
(
  cptr0_foreach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_foreach$work<a>(x) = array_foreach$work<a>(x)
}
end // end of [array_foreach]
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
array_rforall
  (A0, asz) =
(
let
val pa = ptr2cptr{a}(addr@A0)
in
(
  cptr0_rforall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforall$test<a>(x) = array_rforall$test<a>(x)
}
end // end of [array_rforall]
)
//
impltmp
{a}(*tmp*)
array_rforeach
  (A0, asz) =
(
let
val pa = ptr2cptr{a}(addr@A0)
in
(
  cptr0_rforeach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforeach$work<a>(x) = array_rforeach$work<a>(x)
}
end // end of [array_rforeach]
)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
array_permute
  (A0, asz) = let
//
prval() = lemma_array_param(A0)
//
fun
loop
{l:addr}{n:nat} .<n>.
(
pf: !array_v(a, l, n) | p0: ptr(l), nz: size(n)
) : void = let
//
(*
val () =
  println! ("array_permute: loop")
*)
//
in
//
if
nz >= 2
then let
//
val i =
array_permute$randint<>(nz)
prval
(pf1, pf2) = array_v_uncons(pf)
//
val () =
if i > 0 then
$UN.ptr0_exch_ref<a>
  (ptr0_add_size<a>(p0, i), !p0)
// end of [if]
val () =
loop
(pf2|ptr1_succ<a>(p0), pred(nz))
//
prval() =
  (pf := array_v_cons(pf1, pf2))
//
in
  // nothing
end // end of [if]
//
end // end of [loop]
//
in
  loop(view@(A0) | addr@(A0), asz)
end // end of [array_permute]

(* ****** ****** *)
//
// HX-2019-05:
// For arrsz-ptrs and arrsz-refs
//
(* ****** ****** *)

local
//
datatype
arrszref
(a:vtflt) =
{n:nat}
ARRSZREF of
(arrayref(a,n), size(n))
absimpl
arrszref_vtflt_tbox(a) = arrszref(a)
//
in (* in-of-local *)

(* ****** ****** *)
//
impltmp
{}(*tmp*)
arrszref_cons
  {a}{n}(A0, n0) =
(
let
prval () =
$UN.prop_assert{n>=0}() in ARRSZREF(A0, n0)
end // end of [let]
)
impltmp
{}(*tmp*)
arrszref_uncons{a}(AZ) =
let val ARRSZREF(A0, n0) = AZ in (A0, n0) end
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_make_elt
  (n0, x0) = let
//
val n0 = g1ofg0(n0)
//
val A0 =
arrayptr_make_none<a>(n0)
//
val p0 = ptrof( A0 )
val p0 = ptr2cptr{a}( p0 )
//
in
(
let
val () =
loop(p0, p0 + n0)
val A0 =
$UN.castvwtp0(A0) in arrszref_cons(A0, n0)
end
) where
{
  fun
  loop(p0: cptr(a), p1: cptr(a)): void =
  (
  if
  (p0 < p1)
  then
  ($UN.cptr0_set(p0, x0); loop(succ(p0), p1))
  )
}
end // end of [arrszref_make_elt]

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_make_list0
  (xs) =
(
let
val n0 = length(xs)
val n0 =
$UN.cast{Intgte(0)}(n0)
val A0 =
arrayptr_make_none<a>(i2sz(n0))
//
val p0 = ptrof(A0)
val p0 = ptr2cptr{a}(p0)
//
val pz =
(
list0_foldleft<x0><r0>(xs, p0)
) where
{
typedef x0 = (a)
typedef r0 = cptr(a)
impltmp
list0_foldleft$fopr<x0><r0>
  (p0, x0) =
( succ(p0) ) where
{
  val () = $UN.cptr0_set(p0, x0)
}
}
//
in
let
val A0 =
$UN.castvwtp0(A0) in arrszref_cons(A0, i2sz(n0))
end
end // end of [let]
) (* end of [arrszref_make_list0] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_make_list0_vt
  (xs) =
(
let
val n0 = length(xs)
val n0 =
$UN.cast{Intgte(0)}(n0)
val A0 =
arrayptr_make_none<a>(i2sz(n0))
//
val p0 = ptrof(A0)
val p0 = ptr2cptr{a}(p0)
//
val pz =
(
list0_vt_foldleft0<x0><r0>
  (xs, p0)) where
{
vtypedef x0 = (a)
vtypedef r0 = cptr(a)
impltmp
list0_vt_foldleft0$fopr<x0><r0>
  (p0, x0) =
( succ(p0) ) where
{
  val () = $UN.cptr0_set(p0, x0)
}
}
//
in
let
val A0 =
$UN.castvwtp0(A0) in arrszref_cons(A0, i2sz(n0))
end
end // end of [let]
) (* end of [arrszref_make_list0_vt] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_get_at_sint
  (AZ, i0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = i2sz(i0)
in
if
i0 < n0
then A0[i0]
else $raise ArraySubscriptExn()
end
//
end // end of [let]
)
impltmp
{a}(*tmp*)
arrszref_set_at_sint
  (AZ, i0, x0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = i2sz(i0) in
if
i0 < n0
then (A0[i0] := x0)
else $raise ArraySubscriptExn()
end
//
end // end of [let]
)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_get_at_size
  (AZ, i0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = g1ofg0(i0) in
if
i0 < n0
then A0[i0]
else $raise ArraySubscriptExn()
end
//
end // end of [let]
)
impltmp
{a}(*tmp*)
arrszref_set_at_size
  (AZ, i0, x0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = g1ofg0(i0) in
if
i0 < n0
then (A0[i0] := x0)
else $raise ArraySubscriptExn()
end
//
end // end of [let]
)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_lget_at_sint
  (AZ, i0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = i2sz(i0)
in
if
i0 < n0
then A0.lget_at(i0)
else $raise ArraySubscriptExn()
end
//
end // end of [let]
)
impltmp
{a}(*tmp*)
arrszref_lset_at_sint
  (AZ, i0, x0) =
(
let
val+
ARRSZREF
(A0, n0) = AZ
in
//
let
val
i0 = i2sz(i0) in
if
i0 < n0
then A0.lset_at(i0, x0)
else (gfree$val<a>(x0); $raise ArraySubscriptExn())
end
//
end // end of [let]
)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_forall
  (AZ) =
(
let
val+
ARRSZREF(A0, n0) = AZ
in
(
arrayref_forall<a>(A0, n0)  
) where
{
impltmp
arrayref_forall$test<a>(x) = arrszref_forall$test<a>(x)
}
end // end of [let]
)
impltmp
{a}(*tmp*)
arrszref_foreach
  (AZ) =
(
let
val+
ARRSZREF(A0, n0) = AZ
in
(
arrayref_foreach<a>(A0, n0)  
) where
{
impltmp
arrayref_foreach$work<a>(x) = arrszref_foreach$work<a>(x)
}
end // end of [let]
)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_rforall
  (AZ) =
(
let
val+
ARRSZREF(A0, n0) = AZ
in
(
arrayref_rforall<a>(A0, n0)  
) where
{
impltmp
arrayref_rforall$test<a>(x) = arrszref_rforall$test<a>(x)
}
end // end of [let]
)
impltmp
{a}(*tmp*)
arrszref_rforeach
  (AZ) =
(
let
val+
ARRSZREF(A0, n0) = AZ
in
(
arrayref_rforeach<a>(A0, n0)  
) where
{
impltmp
arrayref_rforeach$work<a>(x) = arrszref_rforeach$work<a>(x)
}
end // end of [let]
)

end // end of [local]

(* ****** ****** *)

local
//
datavtype
arrszptr
(a:vtflt) =
{n:nat}
ARRSZPTR of
(arrayptr(a,n), size(n))
absimpl
arrszptr_vtflt_vtbox(a) = arrszptr(a)
//
extern
castfn
_ptr2ref_{a:vtflt}(!arrszptr(a)): arrszref(a)
//
in

impltmp
{a}(*tmp*)
arrszptr_get_at_sint
  (AZ, i0) =
let
val AZ = _ptr2ref_(AZ)
in
  arrszref_get_at_sint(AZ, i0)
end
impltmp
{a}(*tmp*)
arrszptr_set_at_sint
  (AZ, i0, x0) =
let
val AZ = _ptr2ref_(AZ)
in
  arrszref_set_at_sint(AZ, i0, x0)
end

impltmp
{a}(*tmp*)
arrszptr_get_at_size
  (AZ, i0) =
let
val AZ = _ptr2ref_(AZ)
in
  arrszref_get_at_size(AZ, i0)
end
impltmp
{a}(*tmp*)
arrszptr_set_at_size
  (AZ, i0, x0) =
let
val AZ = _ptr2ref_(AZ)
in
  arrszref_set_at_size(AZ, i0, x0)
end

end // end of [local]

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrszref_quicksort(AZ) =
(
arrayref_quicksort(A0, asz)
) where
{
val(A0, asz) = arrszref_uncons(AZ)
}

(* ****** ****** *)
//
// HX-2019-05:
// For array-ptrs and array-refs
//
(* ****** ****** *)

impltmp
{}(*tmp*)
arrayptr_free{a}(A0) =
(
$extfcall(void, "ATS_MFREE", A0)
) where
{
  val A0 = $UN.castvwtp0{ptr}(A0)
}

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayptr_make_none
  (asz) =
(
$UN.castvwtp0($UN.calloc<a>(asz))
)
//
impltmp
{a}(*tmp*)
arrayptr_make_elt
  {n}(asz, x0) =
let
val A0 =
arrayptr_make_none<a>
  (asz)
val () =
( loop(p0, p1) ) where
{
//
val p0 = ptrof(A0)
val p0 = ptr2cptr{a}(p0)
val p1 = (p0 + asz)
//
fun
loop
( p0: cptr(a)
, p1: cptr(a)): void =
(
if
(p0 < p1)
then
loop(succ(p0), p1) where
{
val () = $UN.cptr0_set<a>(p0, x0)
}
) (* end of [loop] *)
} (* end of [where] *)
in
  $UN.castvwtp0{arrayptr(a,n)}(A0)
end // end of [arrayptr_make_elt]
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayref_get_at_sint
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(ptrof(A0), i0))
)
impltmp
{a}(*tmp*)
arrayref_set_at_sint
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(ptrof(A0), i0), x0)
)
//
impltmp
{a}(*tmp*)
arrayref_get_at_size
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(ptrof(A0), i0))
)
impltmp
{a}(*tmp*)
arrayref_set_at_size
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(ptrof(A0), i0), x0)
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayref_lget_at_sint
  (A0, i0) =
(
let
val p0 =
ptrof(A0)
val pi =
ptr0_add<a>(p0, i0)
val
(pf0, fpf | pi) =
$UN.ptr0_vtake{a}(pi)
val x0 = gcopy$ref<a>(!pi)
in
  let prval () = fpf(pf0) in x0 end
end
)
//
impltmp
{a}(*tmp*)
arrayref_lset_at_sint
  (A0, i0, x0) =
(
let
val p0 =
ptrof(A0)
val pi =
ptr0_add<a>(p0, i0)
val
(pf0, fpf | pi) =
$UN.ptr0_vtake{a}(pi)
val () = gfree$ref<a>(!pi)
in
let
val () = !pi := x0
prval () = fpf(pf0) in () end
end
)
//
impltmp
{a}(*tmp*)
arrayref_lget_at_size
  (A0, i0) =
(
let
val p0 =
ptrof(A0)
val pi =
ptr0_add<a>(p0, i0)
val
(pf0, fpf | pi) =
$UN.ptr0_vtake{a}(pi)
val x0 = gcopy$ref<a>(!pi)
in
  let prval () = fpf(pf0) in x0 end
end
)
impltmp
{a}(*tmp*)
arrayref_lset_at_size
  (A0, i0, x0) =
(
let
val p0 =
ptrof(A0)
val pi =
ptr0_add<a>(p0, i0)
val
(pf0, fpf | pi) =
$UN.ptr0_vtake{a}(pi)
val () = gfree$ref<a>(!pi)
in
let
val () = !pi := x0
prval () = fpf(pf0) in () end
end
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayptr_get_at_sint
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(ptrof(A0), i0))
)
impltmp
{a}(*tmp*)
arrayptr_set_at_sint
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(ptrof(A0), i0), x0)
)
//
impltmp
{a}(*tmp*)
arrayptr_get_at_size
  (A0, i0) =
(
$UN.ptr0_get<a>
(ptr0_add<a>(ptrof(A0), i0))
)
impltmp
{a}(*tmp*)
arrayptr_set_at_size
  (A0, i0, x0) =
(
$UN.ptr0_set<a>
(ptr0_add<a>(ptrof(A0), i0), x0)
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayref_forall
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_forall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_forall$test<a>(x) = arrayref_forall$test<a>(x)
}
end // end of [arrayref_forall]
)
impltmp
{a}(*tmp*)
arrayref_foreach
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_foreach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_foreach$work<a>(x) = arrayref_foreach$work<a>(x)
}
end // end of [arrayref_foreach]
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayref_rforall
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_rforall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforall$test<a>(x) = arrayref_rforall$test<a>(x)
}
end // end of [arrayref_rforall]
)
impltmp
{a}(*tmp*)
arrayref_rforeach
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_rforeach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforeach$work<a>(x) = arrayref_rforeach$work<a>(x)
}
end // end of [arrayref_rforeach]
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayptr_forall1
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_forall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_forall$test<a>(x) = arrayptr_forall1$test<a>(x)
}
end // end of [arrayptr_forall1]
)
impltmp
{a}(*tmp*)
arrayptr_foreach1
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_foreach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_foreach$work<a>(x) = arrayptr_foreach1$work<a>(x)
}
end // end of [arrayptr_foreach1]
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrayptr_rforall1
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_rforall<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforall$test<a>(x) = arrayptr_rforall1$test<a>(x)
}
end // end of [arrayptr_rforall1]
)
impltmp
{a}(*tmp*)
arrayptr_rforeach1
  (A0, asz) =
(
let
val pa = cptrof(A0)
in
(
  cptr0_rforeach<a>(pa, pa + asz)
) where
{
impltmp
cptr0_rforeach$work<a>(x) = arrayptr_rforeach1$work<a>(x)
}
end // end of [arrayptr_rforeach1]
)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
arrayref_quicksort
  (A0, asz) =
(
$effmask_ref
(
array_quicksort<a>(!p0, asz)
)
) where
{
val r0 = arrayref_decode(A0)
val (vbox(pf) | p0) = ref_vptrof(r0)
} (* end of [arrayref_quicksort] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
arrayptr_quicksort
  (A0, asz) =
(
let
val () =
array_quicksort<a>(!p0, asz) in
  let prval () = fpf(pf0) in () end
end
) where
{
val
(pf0, fpf | p0) = arrayptr_vptrof(A0)
} (* end of [arrayref_quicksort] *)

(* ****** ****** *)

(* end of [array.dats] *)
