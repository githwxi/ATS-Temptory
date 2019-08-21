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
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/bool.sats"
#staload "./../SATS/tuple.sats"
//
(* ****** ****** *)
//
impltmp
{a0,a1}
tuple2_equal(xs, ys) =
let
val ans =
gequal$val<a0>(xs.0, ys.0)
in
if ~ans then ans else gequal$val<a1>(xs.1, ys.1)
end (* end of [tuple2_equal] *)
impltmp
{a0,a1}
tuple2_compare(xs, ys) =
let
val sgn =
gcompare$val<a0>(xs.0, ys.0)
in
if sgn != 0 then sgn else gcompare$val<a1>(xs.1, ys.1)
end (* end of [tuple2_compare] *)
//
(* ****** ****** *)
//
impltmp
{a0,a1,a2}
tuple3_equal(xs, ys) =
let
val ans =
gequal$val<a0>(xs.0, ys.0)
in
if
~ans
then ans
else let
val ans =
gequal$val<a1>(xs.1, ys.1)
in
if
~ans then ans else gequal$val<a2>(xs.2, ys.2)
end
end (* end of [tuple3_equal] *)
//
impltmp
{a0,a1,a2}
tuple3_compare(xs, ys) =
let
val sgn =
gcompare$val<a0>(xs.0, ys.0)
in
if
sgn != 0
then sgn
else let
val sgn =
gcompare$val<a1>(xs.1, ys.1)
in
if
sgn != 0 then sgn else gcompare$val<a2>(xs.2, ys.2)
end
end (* end of [tuple3_compare] *)
//
(* ****** ****** *)

(* end of [tuple.dats] *)
