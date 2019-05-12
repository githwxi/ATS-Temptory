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
lazy_force (lazyval) = !lazyval
implement
{a}(*tmp*)
lazy_vt_force (lazyval) = !lazyval

(* ****** ****** *)

primplmnt
unit_v_elim (pf) = let
  prval unit_v() = pf in (*nothing*)
end // end of [unit_v_elim]
primplmnt
unit_vt_elim (pf) = let
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
listize_argc_argv
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
//
implement
(a:tflt)
gcopy$val<a>(x0) = (x0)
//
(* ****** ****** *)
//
implement
(a:tflt)
gfree$val<a>(x0) = ((*void*))
//
(* ****** ****** *)

(* end of [basics.dats] *)
