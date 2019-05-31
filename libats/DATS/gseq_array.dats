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
#staload "./../SATS/list.sats"
#staload "./../SATS/array.sats"

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_forall<arrszref(x0)><x0>
  (xs) =
(
  arrszref_forall<x0>(xs)
) where
{
  impltmp
  arrszref_forall$test<x0>(x0) = gseq_forall$test<x0>(x0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_foreach<arrszref(x0)><x0>
  (xs) =
(
  arrszref_foreach<x0>(xs)
) where
{
  impltmp
  arrszref_foreach$work<x0>(x0) = gseq_foreach$work<x0>(x0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_rforall<arrszref(x0)><x0>
  (xs) =
(
  arrszref_rforall<x0>(xs)
) where
{
  impltmp
  arrszref_rforall$test<x0>(x0) = gseq_rforall$test<x0>(x0)
} (* end of [gseq_rforall] *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_rforeach<arrszref(x0)><x0>
  (xs) =
(
  arrszref_rforeach<x0>(xs)
) where
{
  impltmp
  arrszref_rforeach$work<x0>(x0) = gseq_rforeach$work<x0>(x0)
} (* end of [gseq_rforeach] *)

(* ****** ****** *)

(* end of [gseq_array.dats] *)
