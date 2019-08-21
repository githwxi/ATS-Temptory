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
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

(* ****** ****** *)
//
// For ordering
//
(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/float.sats"

(* ****** ****** *)

#staload "./../SATS/gnum.sats"
#staload "./../SATS/gord.sats"

(* ****** ****** *)
//
impltmp
{a}
g_eq(x, y) = (g_cmp<a>(x, y) = 0)
impltmp
{a}
g_lt(x, y) = (g_cmp<a>(x, y) < 0)
impltmp
{a}
g_gt(x, y) = (g_cmp<a>(x, y) > 0)
//
impltmp
{a}
g_lte(x, y) = (g_cmp<a>(x, y) <= 0)
impltmp
{a}
g_gte(x, y) = (g_cmp<a>(x, y) >= 0)
impltmp
{a}
g_neq(x, y) = (g_cmp<a>(x, y) != 0)
//
(* ****** ****** *)
//
impltmp
{a}
g_eqz(x) = g_eq<a>(x, g_0<a>())
impltmp
{a}
g_ltz(x) = g_lt<a>(x, g_0<a>())
impltmp
{a}
g_gtz(x) = g_gt<a>(x, g_0<a>())
//
impltmp
{a}
g_ltez(x) = g_lte<a>(x, g_0<a>())
impltmp
{a}
g_gtez(x) = g_gte<a>(x, g_0<a>())
impltmp
{a}
g_neqz(x) = g_neq<a>(x, g_0<a>())
//
(* ****** ****** *)

impltmp
{a}
g_cmp(x, y) =
g0cmp_double_double(g_todbl<a>(x), g_todbl<a>(y))

(* ****** ****** *)

(* end of [gord.dats] *)
