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
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"

(* ****** ****** *)

impltmp
{}//tmp
sint0_forall
  (n0) =
( loop(0) ) where
{
fun
loop(i0: int): bool =
if
(i0 >= n0)
then true else
(
  if
  sint0_forall$test<>(i0)
  then loop(succ(i0)) else false
)
} (* end of [sint0_forall] *)
impltmp
{}//tmp
sint0_foreach
  (n0) =
( loop(0) ) where
{
fun
loop(i0: int): void =
if
(i0 >= n0)
then
(
// nothing
)
else
(
sint0_foreach$work<>(i0); loop(succ(i0))
)
} (* end of [sint0_foreach] *)

(* ****** ****** *)

impltmp
{r0}//tmp
sint0_foldleft
  (n0, r0) =
( loop(0, r0) ) where
{
fun
loop
(i0: int, r0: r0): r0 =
if
(i0 >= n0)
then ( r0 )
else
let
val r0 =
sint0_foldleft$fopr<r0>(r0, i0) in loop(succ(i0), r0)
end // end of [else]
} (* end of [sint0_foreach] *)

(* ****** ****** *)

impltmp
{}//tmp
sint0_listize
  (n0) =
(
loop
(n0, list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(sint)
//
fun
loop
(i0: int, r0: r0): r0 =
(
if
(i0 <= 0)
then r0 else
let
  val i0 = pred(i0)
in
  loop(i0, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [sint0_listize] *)

impltmp
{}//tmp
uint0_listize
  (n0) =
(
loop
(n0, list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(uint)
//
fun
loop
(i0: uint, r0: r0): r0 =
(
if
(i0 <= 0)
then r0 else
let
  val i0 = pred(i0)
in
  loop(i0, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [uint0_listize] *)

impltmp
{}//tmp
usize0_listize
  (n0) =
(
loop
(n0, list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(size)
//
fun
loop
(i0: size, r0: r0): r0 =
(
if
(i0 <= 0)
then r0 else
let
  val i0 = pred(i0)
in
  loop(i0, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [usize0_listize] *)

(* ****** ****** *)

impltmp
{}//tmp
sint0_rlistize
  (n0) =
(
loop
(0, list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(sint)
//
fun
loop
(i0: int, r0: r0): r0 =
(
if
(i0 >= n0)
then r0 else
let
  val i1 = succ(i0)
in
  loop(i1, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [sint0_rlistize] *)

impltmp
{}//tmp
uint0_rlistize
  (n0) =
(
loop
(0u, list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(uint)
//
fun
loop
(i0: uint, r0: r0): r0 =
(
if
(i0 >= n0)
then r0 else
let
  val i1 = succ(i0)
in
  loop(i1, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [uint0_rlistize] *)

impltmp
{}//tmp
usize0_rlistize
  (n0) =
(
loop
(i2sz(0), list0_vt_nil())
) where
{
//
vtypedef
r0 = list0_vt(size)
//
fun
loop
(i0: size, r0: r0): r0 =
(
if
(i0 >= n0)
then r0 else
let
  val i1 = succ(i0)
in
  loop(i1, list0_vt_cons(i0, r0))
end // end of [else]
)
} (* end of [usize0_rlistize] *)

(* ****** ****** *)
//
impltmp
{}//tmp
sint0_streamize
  (n0) =
( auxmain(0) ) where
{
//
fun
auxmain
(i0: sint): stream_vt(sint) =
$ldelay
(
if
i0 >= n0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [sint0_streamize] *)
//
impltmp
{}//tmp
uint0_streamize
  (n0) =
( auxmain(0u) ) where
{
//
fun
auxmain
(i0: uint): stream_vt(uint) =
$ldelay
(
if
i0 >= n0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [uint0_streamize] *)
//
impltmp
{}//tmp
usize0_streamize
  (n0) =
(auxmain(i2sz(0))) where
{
//
fun
auxmain
(i0: size): stream_vt(size) =
$ldelay
(
if
i0 >= n0
then stream_vt_nil()
else stream_vt_cons(i0, auxmain(succ(i0)))
) (* end of [auxmain] *)
//
} (* end of [usize0_streamize] *)
//
(* ****** ****** *)

impltmp
{}//tmp
sint0_streamize_gte
  (b0) =
(
  auxmain(b0)
) where
{
fun
auxmain
(b0: sint): stream_vt(sint) =
$ldelay
(
  let
    val b1 = succ(b0)
  in
    stream_vt_cons(b0, auxmain(b1))
  end
)
} (* end of [sint0_streamize_gte] *)

impltmp
{}//tmp
sint0_streamize_lte
  (b0) =
(
  auxmain(b0)
) where
{
fun
auxmain
(b0: sint): stream_vt(sint) =
$ldelay
(
  let
    val b1 = pred(b0)
  in
    stream_vt_cons(b0, auxmain(b1))
  end
)
} (* end of [sint0_streamize_lte] *)

(* ****** ****** *)

impltmp
{}//tmp
uint0_streamize_gte
  (b0) =
(
  auxmain(b0)
) where
{
fun
auxmain
(b0: uint): stream_vt(uint) =
$ldelay
(
  let
    val b1 = succ(b0)
  in
    stream_vt_cons(b0, auxmain(b1))
  end
)
} (* end of [uint0_streamize_gte] *)

(* ****** ****** *)

impltmp
{}//tmp
usize0_streamize_gte
  (b0) =
(
  auxmain(b0)
) where
{
fun
auxmain
(b0: size): stream_vt(size) =
$ldelay
(
  let
    val b1 = succ(b0)
  in
    stream_vt_cons(b0, auxmain(b1))
  end
)
} (* end of [usize0_streamize_gte] *)

(* ****** ****** *)

(* end of [gint.dats] *)
