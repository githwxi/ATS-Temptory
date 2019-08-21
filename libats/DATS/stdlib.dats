(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
//
#staload
UNSAFE =
"libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/stdlib.sats"
//
(* ****** ****** *)

impltmp
{}//tmp
atoi(rep) =
$extfcall
(sint, "atspre_atoi", rep)
impltmp
{}//tmp
atof(rep) =
$extfcall
(double, "atspre_atof", rep)

(* ****** ****** *)

impltmp
{}//tmp
atol(rep) =
$extfcall
(slint, "atspre_atol", rep)
impltmp
{}//tmp
atoll(rep) =
$extfcall
(sllint, "atspre_atoll", rep)

(* ****** ****** *)

(* end of [stdlib.dats] *)
