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
implfun
tempopt_version() = "0.0.0"
//
(* ****** ****** *)
//
implprf
false_elim() =
(case+ 0 of _ =/=> ((*void*)))
//
(* ****** ****** *)
//
implprf prop_verify() = ()
implprf prop_verify_add() = ()
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
lazy_force(lazyval) = !lazyval
impltmp
{a}(*tmp*)
lazy_vt_force(lazyval) = !lazyval

(* ****** ****** *)

implprf
unit_v_elim(pf) = let
  prval unit_v() = pf in (*nothing*)
end // end of [unit_v_elim]
implprf
unit_vt_elim(pf) = let
  prval ~unit_vt() = pf in (*nothing*)
end // end of [unit_v_elim]

(* ****** ****** *)
(*
//
impltmp{a} box(x) = $UN.cast(x)
impltmp{a} unbox(x) = $UN.cast(x)
//
impltmp{a} box_vt(x) = $UN.castvwtp0(x)
impltmp{a} unbox_vt(x) = $UN.castvwtp0(x)
//
*)
(* ****** ****** *)
//
// HX:
// See prelude/basics_dyn.sats
//
impltmp
{a}(*tmp*)
opt_unsome_get(x) =
let prval () = opt_unsome(x) in (x) end
//
(* ****** ****** *)

impltmp
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
impltmp{}
assertexn_bool0(prop) =
if not(prop) then $raise AssertExn()
impltmp{}
assertexn_bool1(prop) =
if not(prop) then $raise AssertExn()
*)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
gself$val(x0) = (x0)

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
gcopy$ref(x0) = gcopy$val<a>(x0)
//
(* ****** ****** *)

impltmp
(a:tflt)
gcopy$val<a>(x0) = (x0)
impltmp
(a:tflt)
gcopy$ref<a>(x0) = (x0)

impltmp
(a:vtflt)
gcopy$val<list0_vt(a)>(xs) = list0_vt_copy<a>(xs)

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
gfree$ref(x0) = gfree$val<a>(x0)
//
(* ****** ****** *)
//
impltmp
(a:tflt)
gfree$val<a>(x0) = ((*void*))
impltmp
(a:tflt)
gfree$ref<a>(x0) = ((*void*))
//
impltmp
(a0:vtflt
,a1:vtflt)
gfree$val<(a0,a1)>(xs) =
let
val () =
gfree$val<a0>(xs.0)
val () =
gfree$val<a1>(xs.1) in ignoret(0) end
impltmp
(a0:vtflt
,a1:vtflt)
gfree$ref<(a0,a1)>(xs) =
let
val () =
gfree$ref<a0>(xs.0)
val () =
gfree$ref<a1>(xs.1) in ignoret(0) end
//
impltmp
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
impltmp
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

impltmp
gfree$val<string_vt>(cs) = string0_vt_free(cs)

(* ****** ****** *)

impltmp
(a:vtflt)
gfree$val<list0_vt(a)>(xs) = list0_vt_free<a>(xs)

(* ****** ****** *)

(* end of [basics.dats] *)
