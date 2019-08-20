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
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"

(* ****** ****** *)
//
impltmp
{}//tmp
optn0_iseqz
  (opt) =
(
case+ opt of
| optn0_none _ => tt
| optn0_some _ => ff
)
//
impltmp
{}//tmp
optn0_isneqz
  (opt) =
(
case+ opt of
| optn0_none _ => ff
| optn0_some _ => tt
)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
optn0_size
  (opt) =
(
i2sz(optn0_length<x0>(opt))
)
impltmp
{x0}//tmp
optn0_length
  (opt) =
(
case+ opt of
| optn0_none _ => 0 | optn0_some _ => 1
)
//
(* ****** ****** *)

impltmp
{x0}//tmp
optn0_forall
  (opt) =
(
case+ opt of
| optn0_none() => true
| optn0_some(x0) => optn0_forall$test<x0>(x0)
) (* end of [optn0_forall] *)

(* ****** ****** *)

impltmp
{x0}//tmp
optn0_foreach
  (opt) =
(
case+ opt of
| optn0_none() => ()
| optn0_some(x0) => optn0_foreach$work<x0>(x0)
) (* end of [optn0_foreach] *)

(* ****** ****** *)

impltmp
{x0}//tmp
optn0_listize
  (opt) =
(
case+ opt of
| optn0_none() => list0_vt_nil()
| optn0_some(x0) => list0_vt_sing(x0)
)
impltmp
{x0}//tmp
optn0_streamize
  (opt) = $ldelay
(
case+ opt of
| optn0_none() => stream_vt_nil()
| optn0_some(x0) => stream_vt_sing(x0)
)

(* ****** ****** *)

(* end of [optn.dats] *)
