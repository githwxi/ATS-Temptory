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
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/gseq.sats"
//
#staload UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)
//
(*
fun
{xs:tflt}
{x0:tflt}
gseq_forall(xs): bool
*)
//
(* ****** ****** *)
//
implement
{xs}{x0}
gseq_foreach(xs) =
let
//
implement
gseq_forall$test<x0>(x0) =
let
val () =
gseq_foreach$work<x0>(x0) in true
end // end of [let]
//
in
  ignoret(gseq_forall<xs><x0>(xs))
end // end of [let]
//
(* ****** ****** *)
//
implement
{xs}{x0}{r0}
gseq_foldleft
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
implement
gseq_foreach$work<x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
gseq_foldleft$fopr<x0><r0>(r0, x0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = gseq_foreach<xs><x0>(xs) in rr
end
end // end of [let]
//
(* ****** ****** *)
//
implement
{xs}{x0}
gseq_iforall(xs) =
(
gseq_forall<xs><x0>(xs)
) where
{
//
var i0: int = 0
val p0 = addr@(i0)
//
implement
gseq_forall$test<x0>
  (x0) =
(
gseq_iforall$test<x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [where] *)
//
(* ****** ****** *)

(* end of [gseq.dats] *)
