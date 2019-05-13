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
#staload "./../SATS/range.sats"

(* ****** ****** *)
//
implement
gseq_listize<sint><sint>
  (n0) = (sint_listize<>(n0))
implement
gseq_listize<uint><uint>
  (n0) = (uint_listize<>(n0))
//
(* ****** ****** *)
//
implement
gseq_streamize<sint><sint>
  (n0) = (sint_streamize<>(n0))
implement
gseq_streamize<uint><uint>
  (n0) = (uint_streamize<>(n0))
//
(* ****** ****** *)

implement
gseq_forall<sint><sint>
  (n0) =
( loop(0) ) where
{
//
fun
loop
(i0: sint): bool =
if
i0 >= n0
then true else
let
val
test =
gseq_forall$test<sint>(i0)
in
if
test
then loop(succ(i0)) else false
end (* end of [loop] *)
//
} (* end of [gseq_forall] *)

(* ****** ****** *)

implement
gseq_forall<uint><uint>
  (n0) =
( loop(0u) ) where
{
//
fun
loop
(i0: uint): bool =
if
i0 >= n0
then true else
let
val
test =
gseq_forall$test<uint>(i0) 
in
if
test
then loop(succ(i0)) else false
end (* end of [loop] *)
//
} (* end of [gseq_forall<uint>] *)

(* ****** ****** *)

implement
gseq_forall<SINT2><sint>
  (SINT2) =
( loop(l0, u0) ) where
{
//
fun
loop
( i0: sint
, u0: sint): bool =
if
i0 >= u0
then true else
let
val
test =
gseq_forall$test<sint>(i0)
in
if
test
then loop(succ(i0), u0) else false
end (* end-of-let *)
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
} (* end of [gseq_forall<SINT2>] *)

(* ****** ****** *)

implement
gseq_rforall<sint><sint>
  (n0) =
( loop(n0) ) where
{
//
fun
loop
(i0: sint): bool =
if
i0 <= 0
then true else
(
let
val i0 = pred(i0)
val test =
gseq_rforall$test<sint>(i0)
in
  if test then loop(i0) else false
end // end-of-let
) (* end of [loop] *)
//
} (* end of [gseq_rforall<sint>] *)

(* ****** ****** *)

implement
gseq_rforall<uint><uint>
  (n0) =
( loop(n0) ) where
{
//
fun
loop
(i0: uint): bool =
if
i0 <= 0u
then true else
(
let
val i0 = pred(i0)
val test =
gseq_rforall$test<uint>(i0)
in
  if test then loop(i0) else false
end // end-of-let
) (* end of [loop] *)
//
} (* end of [gseq_rforall<uint>] *)

(* ****** ****** *)

implement
gseq_rforall<SINT2><sint>
  (SINT2) =
( loop(l0, u0) ) where
{
//
fun
loop
( l0: sint
, i0: sint): bool =
if
l0 >= i0
then true else
let
val i0 = pred(i0)
val
test =
gseq_rforall$test<sint>(i0)
in
if test then loop(l0, i0) else false
end (* end-of-if *)
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
} (* end of [gseq_rforall<SINT2>] *)

(* ****** ****** *)

(* end of [gseq_gint.dats] *)
