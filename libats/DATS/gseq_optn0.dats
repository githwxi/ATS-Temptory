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

(* ****** ****** *)

implement
(x0:tflt)
gseq_iseqz<optn0(x0)><x0>
  (xs) =
(
  optn0_iseqz<>{x0}(xs)
) (* end of [gseq_iseqz] *)
implement
(x0:tflt)
gseq_isneqz<optn0(x0)><x0>
  (xs) =
(
  optn0_isneqz<>{x0}(xs)
) (* end of [gseq_isneqz] *)
implement
(x0:tflt)
gseq_length<optn0(x0)><x0>
  (xs) =
(
  optn0_length<x0>(xs)
) (* end of [gseq_length] *)

(* ****** ****** *)

implement
(x0:tflt)
gseq_listize<optn0(x0)><x0>
  (xs) =
(
  optn0_listize<x0>(xs)
) (* end of [gseq_listize<optn0>] *)
implement
(x0:tflt)
gseq_streamize<optn0(x0)><x0>
  (xs) =
(
  optn0_streamize<x0>(xs)
) (* end of [gseq_streamize<optn0>] *)

(* ****** ****** *)

implement
(x0:tflt)
gseq_forall<optn0(x0)><x0>
  (xs) =
(
  optn0_forall<x0>(xs)
) where
{
implement
optn0_forall$test<x0>(x0) = gseq_forall$test<x0>(x0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

implement
(x0:tflt)
gseq_foreach<optn0(x0)><x0>
  (xs) =
(
  optn0_foreach<x0>(xs)
) where
{
implement
optn0_foreach$work<x0>(x0) = gseq_foreach$work<x0>(x0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

(* end of [gseq_optn0.dats] *)
