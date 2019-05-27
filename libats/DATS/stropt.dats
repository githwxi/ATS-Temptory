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

#define CNUL '\000'

(* ****** ****** *)

#staload "./../SATS/gptr.sats"
#staload "./../SATS/string.sats"
#staload "./../SATS/stropt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
stropt0_iseqz
  (opt) = ptr0_iseqz(ptrof(opt))
implement
{}(*tmp*)
stropt0_isneqz
  (opt) = ptr0_isneqz(ptrof(opt))
//
(* ****** ****** *)
//
// HX-2019-05-26:
// For linear stropts
//
(* ****** ****** *)
//
implement
{}(*tmp*)
stropt0_vt_iseqz
  (opt) = ptr0_iseqz(ptrof(opt))
implement
{}(*tmp*)
stropt0_vt_isneqz
  (opt) = ptr0_isneqz(ptrof(opt))
//
(* ****** ****** *)
//
implement
{}(*tmp*)
stropt0_vt_free(opt) =
if
iseqz(opt)
then
ignoret($UN.stropt0_vt_unnone(opt))
else
string0_vt_free($UN.stropt0_vt_unsome(opt))
//
(* ****** ****** *)

(* end of [stropt.dats] *)
