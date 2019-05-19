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

#staload "./../SATS/gint.sats"
#staload "./../SATS/glseq.sats"
#staload "./../SATS/qlist.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)
//
implement
(x0:tflt)
glseq_forall1<qlist(x0)><x0>
  (stk) =
(
  qlist_forall1<x0>(stk)
) where
{
implement
qlist_forall1$test<x0>(x0) = glseq_forall1$test<x0>(x0)
}
//
(* ****** ****** *)
//
implement
(x0:tflt)
glseq_foreach1<qlist(x0)><x0>
  (stk) =
(
  qlist_foreach1<x0>(stk)
) where
{
implement
qlist_foreach1$work<x0>(x0) = glseq_foreach1$work<x0>(x0)
}
//
(* ****** ****** *)

(* end of [qlist.dats] *)
