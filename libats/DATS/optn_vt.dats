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
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/optn.sats"
#staload "./../SATS/optn_vt.sats"

(* ****** ****** *)
//
impltmp
{}//tmp
optn0_vt_iseqz
  (opt) =
(
case+ opt of
| optn0_vt_none _ => tt
| optn0_vt_some _ => ff
)
//
impltmp
{}//tmp
optn0_vt_isneqz
  (opt) =
(
case+ opt of
| optn0_vt_none _ => ff
| optn0_vt_some _ => tt
)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
optn0_vt_size
  (opt) = i2sz(optn0_vt_length(opt))
impltmp
{x0}//tmp
optn0_vt_length
  (opt) =
(
case+ opt of
| optn0_vt_none _ => 0 | optn0_vt_some _ => 1
)
//
(* ****** ****** *)

impltmp
{x0}//tmp
optn0_vt_free(opt) =
(
case+ opt of
| ~optn0_vt_none() => ()
| ~optn0_vt_some(x0) => gfree$val<x0>(x0)
)

(* ****** ****** *)

(* end of [optn_vt.dats] *)
