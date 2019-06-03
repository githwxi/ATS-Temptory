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
#staload "./../SATS/bool.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/stream.sats"

(* ****** ****** *)
//
impltmp
{}(*tmp*)
stream_make_nil() =
$delay
(stream_nil(*void*))
impltmp
{x0}(*tmp*)
stream_make_sing(x0) =
$delay
(stream_cons(x0, stream_make_nil()))
//
impltmp
{x0}(*tmp*)
stream_make_list0
  (xs) =
  (auxmain(xs)) where
{
fun
auxmain
(
xs: list0(x0)
) : stream(x0) = $delay
(
case+ xs of
| list0_nil() =>
  stream_nil()
| list0_cons(x0, xs) =>
  stream_cons(x0, auxmain(xs))
) (* end of [auxmain] *)
} (* end of [stream_make_list0] *)
//
impltmp
{x0}(*tmp*)
stream_make_list0_vt
  (xs) =
(
  stream_make_list0<x0>(list0_vt2t(xs))
)
//
(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_append
  (xs, ys) =
(
  auxmain(xs, ys)
) where
{
//
fun
auxmain:
$d2ctype
(
stream_append<x0>
) =
lam(xs, ys) => $delay
(
//
let
//
val nx = !xs
//
in
//
case+ nx of
| stream_nil() => !ys
| stream_cons(x0, xs) =>
  stream_cons(x0, auxmain(xs, ys))
//
end // end-of-let
) (* end of [auxmain] *)
//
} (* end of [stream_append] *)

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_listize
  (xs) =
(
gseq_listize<stream(x0)><x0>(xs)
)
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_streamize
  (xs) =
  (auxmain(xs)) where
{
fun
auxmain:
$d2ctype
(
stream_streamize<x0>
) =
lam(xs) => $ldelay
(
//
case+ !xs of
| stream_nil() =>
  stream_vt_nil()
| stream_cons(x0, xs) =>
  stream_vt_cons(x0, auxmain(xs))
//
) (* end of [auxmain] *)
} (* end of [stream_streamize] *)
//
(* ****** ****** *)

impltmp
{x0}//tmp
stream_forall(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: stream(x0)): bool =
(
case+ !xs of
| stream_nil() => tt
| stream_cons(x0, xs) =>
  if
  stream_forall$test<x0>(x0) then loop(xs) else ff
)
} (* end of [stream_forall] *)

(* ****** ****** *)

impltmp
{x0}//tmp
stream_foreach(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: stream(x0)): void =
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x0, xs) =>
  let
  val () = stream_foreach$work<x0>(x0) in loop(xs)
  end // end of [stream_cons]
)
} (* end of [stream_foreach] *)

(* ****** ****** *)

impltmp
{x0}{r0}
stream_foldleft
  (xs, r0) =
  (loop(xs, r0)) where
{
//
fun
loop
(xs: stream(x0), r0: r0): r0 =
(
case+ !xs of
| stream_nil() => r0
| stream_cons(x0, xs) =>
  let
    val r0 =
    stream_foldleft$fopr<x0><r0>(r0, x0) in loop(xs, r0)
  end // end of [stream_cons]
)
} (* end of [stream_foldleft] *)

(* ****** ****** *)

(* end of [stream.dats] *)
