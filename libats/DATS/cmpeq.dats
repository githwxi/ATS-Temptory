(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/tuple.sats"
#staload "./../SATS/string.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
gequal$ref
(x1, x2) =
gequal$val<a>(x1, x2)
impltmp
{a}(*tmp*)
gequal$val(x1, x2) =
(gcompare$val<a>(x1, x2) = 0)
//
impltmp
(a:tflt)
gequal$val<list0(a)>
  (xs, ys) =
(
  $effmask_all(list0_equal<a>(xs, ys))
)
//
(* ****** ****** *)
//
impltmp
{a:vtflt}
gcompare$ref
(x1, x2) =
gcompare$val<a>(x1, x2)
//
impltmp
gcompare$val<sint>
(i1, i2) =
g0cmp_sint_sint(i1, i2)
impltmp
gcompare$val<uint>
(u1, u2) =
g0cmp_uint_uint(u1, u2)
//
impltmp
gcompare$val<string>
(cs1, cs2) =
(
  $effmask_all(strcmp(cs1, cs2))
)
impltmp
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
impltmp
(a:tflt)
gcompare$val<list0(a)>
  (xs, ys) =
(
  $effmask_all
  (list0_compare<a>(xs, ys))
)
//
(* ****** ****** *)
//
impltmp
(a0,a1:tflt)
gcompare$val<tup(a0,a1)>
  (xs, ys) =
(
  (tuple2_compare<a0,a1>(xs, ys))
)
impltmp
(a0,a1,a2:tflt)
gcompare$val<tup(a0,a1,a2)>
  (xs, ys) =
(
  tuple3_compare<a0,a1,a2>(xs, ys)
)
//
(* ****** ****** *)

(* end of [cmpeq.dats] *)
