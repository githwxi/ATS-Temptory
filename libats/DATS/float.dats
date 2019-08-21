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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/float.sats"
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
g0mul_float_sint(f0, i1) = f0*cast2flt(i1)
impltmp
{}(*tmp*)
g0mul_sint_float(i0, f1) = cast2flt(i0)*f1
//
impltmp
{}(*tmp*)
g0mul_double_sint(f0, i1) = f0*cast2dbl(i1)
impltmp
{}(*tmp*)
g0mul_sint_double(i0, f1) = cast2dbl(i0)*f1
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
g0div_float_sint(f0, i1) = f0/cast2flt(i1)
impltmp
{}(*tmp*)
g0div_sint_float(i0, f1) = cast2flt(i0)/f1
//
impltmp
{}(*tmp*)
g0div_double_sint(f0, i1) = f0/cast2dbl(i1)
impltmp
{}(*tmp*)
g0div_sint_double(i0, f1) = cast2dbl(i0)/f1
//
(* ****** ****** *)

(* end of [float.dats] *)
