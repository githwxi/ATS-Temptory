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
(* Start time: March, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
//
#staload
"libats/SATS/string.sats"
//
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/list_vt.sats"
//
#staload
"libats/SATS/tuple.sats"
//
(* ****** ****** *)

#staload
UN =
"libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
implement
tempopt_version() = "0.0.0"
//
(* ****** ****** *)
//
primplmnt
false_elim() =
(case+ 0 of _ =/=> ((*void*)))
//
(* ****** ****** *)
//
primplmnt prop_verify() = ()
primplmnt prop_verify_add() = ()
//
(* ****** ****** *)

implement
{a}(*tmp*)
lazy_force(lazyval) = !lazyval
implement
{a}(*tmp*)
lazy_vt_force(lazyval) = !lazyval

(* ****** ****** *)

primplmnt
unit_v_elim(pf) = let
  prval unit_v() = pf in (*nothing*)
end // end of [unit_v_elim]
primplmnt
unit_vt_elim(pf) = let
  prval ~unit_vt() = pf in (*nothing*)
end // end of [unit_v_elim]

(* ****** ****** *)
(*
//
implement{a} box(x) = $UN.cast(x)
implement{a} unbox(x) = $UN.cast(x)
//
implement{a} box_vt(x) = $UN.castvwtp0(x)
implement{a} unbox_vt(x) = $UN.castvwtp0(x)
//
*)
(* ****** ****** *)
//
// HX:
// See prelude/basics_dyn.sats
//
implement
{a}(*tmp*)
opt_unsome_get(x) =
let prval () = opt_unsome(x) in (x) end
//
(* ****** ****** *)

implement
{}(*tmp*)
argc_argv_listize
  {n}(argc, argv) = let
//
prval () =
  lemma_argv_param(argv)
//
fun
loop
{i:nat | i <= n} .<n-i>.
(
argv: !argv(n), i0: int(i),
res0: &ptr? >> list1_vt(string, n-i)
) : void =
(
if
(i0 < argc)
then let
  val x0 = argv[i0]
  val () =
  (
  res0 :=
  list1_vt_cons{string}{0}(x0, _)
  )
//
  val+
  list1_vt_cons(_, res1) = res0
//
  val () = loop(argv, i0+1, res1)
//
  prval ((*folded*)) = fold@(res0)
in
  // nothing
end // end of [then]
else () where
{
  val () = res0 := list1_vt_nil()
}
) (* end of [loop] *)
//
in
  let var res0: ptr in loop(argv, 0, res0); res0 end
end // end of [listize_argc_argv]

(* ****** ****** *)
//
(*
implement{}
assertexn_bool0(prop) =
if not(prop) then $raise AssertExn()
implement{}
assertexn_bool1(prop) =
if not(prop) then $raise AssertExn()
*)
//
(* ****** ****** *)

implement
{a}(*tmp*)
gself$val(x0) = (x0)

(* ****** ****** *)
//
implement
{a}(*tmp*)
gcopy$ref(x0) = gcopy$val<a>(x0)
//
(* ****** ****** *)

implement
(a:tflt)
gcopy$val<a>(x0) = (x0)
implement
(a:tflt)
gcopy$ref<a>(x0) = (x0)

implement
(a:vtflt)
gcopy$val<list0_vt(a)>(xs) = list0_vt_copy<a>(xs)

(* ****** ****** *)
//
implement
{a}(*tmp*)
gfree$ref(x0) = gfree$val<a>(x0)
//
(* ****** ****** *)
//
implement
(a:tflt)
gfree$val<a>(x0) = ((*void*))
implement
(a:tflt)
gfree$ref<a>(x0) = ((*void*))
//
implement
(a0:vtflt
,a1:vtflt)
gfree$val<(a0,a1)>(xs) =
let
val () =
gfree$val<a0>(xs.0)
val () =
gfree$val<a1>(xs.1) in ignoret(0) end
implement
(a0:vtflt
,a1:vtflt)
gfree$ref<(a0,a1)>(xs) =
let
val () =
gfree$ref<a0>(xs.0)
val () =
gfree$ref<a1>(xs.1) in ignoret(0) end
//
implement
(a0:vtflt
,a1:vtflt
,a2:vtflt)
gfree$val<(a0,a1,a2)>(xs) =
let
val () =
gfree$val<a0>(xs.0)
val () =
gfree$val<a1>(xs.1)
val () =
gfree$val<a2>(xs.2) in ignoret(0) end
implement
(a0:vtflt
,a1:vtflt
,a2:vtflt)
gfree$ref<(a0,a1,a2)>(xs) =
let
val () =
gfree$ref<a0>(xs.0)
val () =
gfree$ref<a1>(xs.1)
val () =
gfree$ref<a2>(xs.2) in ignoret(0) end
//
(* ****** ****** *)

implement
gfree$val<string_vt>(cs) = string0_vt_free(cs)

(* ****** ****** *)

implement
(a:vtflt)
gfree$val<list0_vt(a)>(xs) = list0_vt_free<a>(xs)

(* ****** ****** *)
//
implement
{a}(*tmp*)
gequal$ref
(x1, x2) =
gequal$val<a>(x1, x2)
implement
{a}(*tmp*)
gequal$val(x1, x2) =
(gcompare$val<a>(x1, x2) = 0)
//
implement
(a:tflt)
gequal$val<list0(a)>
  (xs, ys) =
(
  $effmask_all(list0_equal<a>(xs, ys))
)
//
(* ****** ****** *)
//
implement
{a:vtflt}
gcompare$ref
(x1, x2) =
gcompare$val<a>(x1, x2)
//
implement
gcompare$val<sint>
(i1, i2) =
g0cmp_sint_sint(i1, i2)
implement
gcompare$val<uint>
(u1, u2) =
g0cmp_uint_uint(u1, u2)
//
implement
gcompare$val<string>
(cs1, cs2) =
(
  $effmask_all(strcmp(cs1, cs2))
)
implement
gcompare$val<string_vt>
(cs1, cs2) =
(
  $effmask_all(strcmp(cs1, cs2))
) where
{
  val cs1 = $UN.string0_vt2t(cs1)
  and cs2 = $UN.string0_vt2t(cs2)
}
//
(* ****** ****** *)
//
implement
(a:tflt)
gcompare$val<list0(a)>
  (xs, ys) =
(
  $effmask_all
  (list0_compare<a>(xs, ys))
)
//
(* ****** ****** *)

implement
(a0,a1:tflt)
gcompare$val<tup(a0,a1)>
  (xs, ys) =
(
  (tuple2_compare<a0,a1>(xs, ys))
)
implement
(a0,a1,a2:tflt)
gcompare$val<tup(a0,a1,a2)>
  (xs, ys) =
(
  tuple3_compare<a0,a1,a2>(xs, ys)
)

(* ****** ****** *)

(* end of [basics.dats] *)
