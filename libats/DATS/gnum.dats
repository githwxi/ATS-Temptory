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
// For numbers
//
(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/float.sats"

(* ****** ****** *)

#staload UN =
"libats/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/gnum.sats"
#staload "./../SATS/gseq.sats"

(* ****** ****** *)

impltmp
{a}
g_0() = g_ofint<a>(0)
impltmp
{a}
g_1() = g_ofint<a>(1)
impltmp
{a}
g_2() = g_ofint<a>(2)

(* ****** ****** *)

impltmp
{a}
g_ofint(i0) = $UN.cast{a}(i0)
impltmp
{a}
g_toint(x0) = $UN.cast{int}(x0)

(* ****** ****** *)

impltmp
{a}
g_ofdbl(i0) = $UN.cast{a}(i0)
impltmp
{a}
g_todbl(x0) = $UN.cast{double}(x0)

(* ****** ****** *)

impltmp
{a}
g_succ(x) = g_add<a>(x, g_1<a>())
impltmp
{a}
g_pred(x) = g_sub<a>(x, g_1<a>())

(* ****** ****** *)

impltmp
{a}
g_add(x, y) = g_ofdbl<a>(x+y) where
{
val x = g_todbl<a>(x)
val y = g_todbl<a>(y)
}

impltmp
{a}
g_sub(x, y) = g_ofdbl<a>(x-y) where
{
val x = g_todbl<a>(x)
val y = g_todbl<a>(y)
}

impltmp
{a}
g_mul(x, y) = g_ofdbl<a>(x*y) where
{
val x = g_todbl<a>(x)
val y = g_todbl<a>(y)
}

impltmp
{a}
g_div(x, y) = g_ofdbl<a>(x/y) where
{
val x = g_todbl<a>(x)
val y = g_todbl<a>(y)
}

impltmp
{a}
g_mod(x, y) = g_ofdbl<a>(x%y) where
{
val x = g_todbl<a>(x)
val y = g_todbl<a>(y)
}

(* ****** ****** *)

impltmp
{k0}
{xs,x0}
gseq_add(xs) =
(
gseq_foldleft<k0><xs,x0><r0>(xs, g_0<x0>())
) where
{
typedef r0 = x0
impltmp
gseq_foldleft$fopr<k0><xs,x0><r0>(r0, x0) = g_add<x0>(r0, x0)
}

impltmp
{k0}
{xs,x0}
gseq_mul(xs) =
(
gseq_foldleft<k0><xs,x0><r0>(xs, g_1<x0>())
) where
{
typedef r0 = x0
impltmp
gseq_foldleft$fopr<k0><xs,x0><r0>(r0, x0) = g_mul<x0>(r0, x0)
}

(* ****** ****** *)

(* end of [gnum.sats] *)
