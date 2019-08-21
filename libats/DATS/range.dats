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
#staload "./../SATS/gptr.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/range.sats"

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_streamize
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
fun
auxmain
(i0: sint): stream_vt(sint) =
$ldelay
(
if
i0 >= u0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [SINT2_streamize] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_forall
  ((*void*)) =
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
SINT2_forall$test<>(i0)
in
if
test
then loop(succ(i0), u0) else false
end (* end-of-let *)
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
} (* end of [SINT2_forall<>] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_foreach() =
(
gseq_foreach<
gseq><SINT2,sint>(SINT2)
) where
{
impltmp
gseq_foreach$work<
gseq><SINT2,sint>(i0) = SINT2_foreach$work<>(i0)
} (* end of [SINT2_foreach<>] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_rforall
  ((*void*)) =
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
SINT2_rforall$test<>(i0)
in
if test then loop(l0, i0) else false
end (* end-of-if *)
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
} (* end of [SINT2_rforall<>] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
SINT2_rforeach() =
(
gseq_rforeach<
gseq><SINT2,sint>(SINT2)
) where
{
impltmp
gseq_rforeach$work<
gseq><SINT2,sint>(i0) = SINT2_rforeach$work<>(i0)
} (* end of [SINT2_rforeach<>] *)

(* ****** ****** *)

impltmp
{y0}(*tmp*)
SINT2_map_stream
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = SINT2_range$beg<>()
val u0 = SINT2_range$end<>()
//
fun
auxmain
(i0: sint): stream_vt(y0) =
$ldelay
(
if
i0 >= u0
then
stream_vt_nil()
else
stream_vt_cons
(SINT2_map$fopr<y0>(i0), auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [SINT2_map_stream] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
CPTR2_streamize
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = CPTR2_range$beg<x0>()
val u0 = CPTR2_range$end<x0>()
//
fun
auxmain
(i0: cptr(x0)): stream_vt(cptr(x0)) =
$ldelay
(
if
i0 >= u0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [CPTR2_streamize] *)

(* ****** ****** *)

impltmp
(x0:tflt)
CPTR2_forall<x0>
  () =
(
  loop(cp0, cp1)
) where
{
//
fun
loop
( cp0: cptr(x0)
, cp1: cptr(x0)): bool =
(
if
(cp0 >= cp1)
then true else
let
val
test =
CPTR2_forall$test<x0>(cp0)
//
in (* in-of-let *)
if
test
then
loop(succ(cp0), cp1) else false
end (* end-of-let *)
)
//
val cp0 = CPTR2_range$beg<x0>()
val cp1 = CPTR2_range$end<x0>()
//
} (* end of [CPTR2_forall] *)

(* ****** ****** *)

impltmp
(x0:tflt)
CPTR2_foreach<x0>() =
(
gseq_foreach<
gseq><CPTR2(x0),cptr(x0)>(CPTR2)
) where
{
impltmp
gseq_foreach$work<
gseq><CPTR2(x0),cptr(x0)>(cp) = CPTR2_foreach$work<x0>(cp)
} (* end of [CPTR2_foreach<x0>] *)

(* ****** ****** *)

impltmp
{x0}{y0}(*tmp*)
CPTR2_map_stream
  ((*void*)) =
  (auxmain(l0)) where
{
//
val l0 = CPTR2_range$beg<x0>()
val u0 = CPTR2_range$end<x0>()
//
fun
auxmain
(i0: cptr(x0)): stream_vt(y0) =
$ldelay
(
if
i0 >= u0
then
stream_vt_nil()
else
stream_vt_cons
(CPTR2_map$fopr<x0><y0>(i0), auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [CPTR2_map_stream] *)

(* ****** ****** *)

(* end of [range.dats] *)
