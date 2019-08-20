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
impltmp
gseq_listize<
gseq><sint,sint>
  (n0) = (sint0_listize<>(n0))
impltmp
gseq_listize<
gseq><uint,uint>
  (n0) = (uint0_listize<>(n0))
impltmp
gseq_listize<
gseq><size,size>
  (n0) = (usize0_listize<>(n0))
//
(* ****** ****** *)
//
impltmp
gseq_rlistize<
gseq><sint,sint>
  (n0) = (sint0_rlistize<>(n0))
impltmp
gseq_rlistize<
gseq><uint,uint>
  (n0) = (uint0_rlistize<>(n0))
impltmp
gseq_rlistize<
gseq><size,size>
  (n0) = (usize0_rlistize<>(n0))
//
(* ****** ****** *)
//
impltmp
gseq_streamize<
gseq><sint,sint>
  (n0) = (sint0_streamize<>(n0))
impltmp
gseq_streamize<
gseq><uint,uint>
  (n0) = (uint0_streamize<>(n0))
impltmp
gseq_streamize<
gseq><size,size>
  (n0) = (usize0_streamize<>(n0))
//
(* ****** ****** *)

impltmp
gseq_forall<
gseq><sint,sint>
  (n0) =
(
  sint0_forall<>(n0)
) where
{
impltmp
sint0_forall$test<>(i0) =
gseq_forall$test<gseq><sint,sint>(i0)
}
impltmp
gseq_foreach<
gseq><sint,sint>
  (n0) =
(
  sint0_foreach<>(n0)
) where
{
impltmp
sint0_foreach$work<>(i0) =
gseq_foreach$work<gseq><sint,sint>(i0)
}

(* ****** ****** *)

impltmp
gseq_forall<
gseq><uint,uint>
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
gseq_forall$test<
gseq><uint,uint>(i0)
in
if
test
then loop(succ(i0)) else false
end (* end of [loop] *)
//
} (* end of [gseq_forall<uint>] *)

(* ****** ****** *)

impltmp
gseq_rforall<
gseq><sint,sint>
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
gseq_rforall$test<gseq><sint,sint>(i0)
in
  if test then loop(i0) else false
end // end-of-let
) (* end of [loop] *)
//
} (* end of [gseq_rforall<sint>] *)

(* ****** ****** *)

impltmp
gseq_rforall<
gseq><uint,uint>
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
gseq_rforall$test<
gseq><uint,uint>(i0)
in
  if test then loop(i0) else false
end // end-of-let
) (* end of [loop] *)
//
} (* end of [gseq_rforall<uint>] *)

(* ****** ****** *)

impltmp
gseq_forall<
gseq><SINT2,sint>
( SINT2 ) =
( SINT2_forall() ) where
{
impltmp
SINT2_forall$test<>(i0) =
  gseq_forall$test<gseq><SINT2,sint>(i0)
} (* end of [gseq_forall<SINT2>] *)
impltmp
gseq_rforall<
gseq><SINT2,sint>
( SINT2 ) =
( SINT2_rforall() ) where
{
impltmp
SINT2_rforall$test<>(i0) =
  gseq_rforall$test<gseq><SINT2,sint>(i0)
} (* end of [gseq_rforall<SINT2>] *)

(* ****** ****** *)

(* end of [gseq_gint.dats] *)
