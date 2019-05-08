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
(* Start time: May, 2019 *)
(* Authoremail: gmhwxiATgmailDOTcom *)

(* ****** ****** *)

#staload "./../SATS/gptr.sats"
#staload "./../SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_get
  (p0) = x0 where {
  val
  [l:addr]
  p0 = g1ofg0_ptr(p0)
  prval
  (pf, fpf) =
  _assert_() where
  {
    extern praxi _assert_ (): (a @ l, a? @ l -<lin,prf> void)
  } // end of [prval]
  val x0 = !p0
  prval () = fpf(pf)
} (* end of [ptr0_get] *)

(* ****** ****** *)

implement
{a}(*tmp*)
ptr0_set
  (p0, x0) = () where
{
  val
  [l:addr]
  p0 = g1ofg0_ptr(p0)
  prval
  (pf, fpf) =
  _assert_ () where {
    extern praxi _assert_ (): (a? @ l, a @ l -<lin,prf> void)
  } // end of [prval]
  val () = !p0 := x0
  prval () = fpf (pf)
} (* end of [ptr0_set] *)

(* ****** ****** *)

(* end of [unsafe.dats] *)
