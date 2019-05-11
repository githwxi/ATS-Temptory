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
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_sing(x0) =
list0_vt_cons(x0, list0_vt_nil())
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_free(xs) =
  (loop(xs)) where
{
fun
loop
(xs: list0_vt(x0)): void =
(
case+ xs of
| ~list0_vt_nil() => ()
| ~list0_vt_cons(x0, xs) => (gfree$val(x0); loop(xs))
) (* end of [loop] *)
} (* end of [list_vt_free] *)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_concat
  (xss) =
(
case+ xss of
| ~list0_vt_nil() =>
   list0_vt_nil()
| ~list0_vt_cons(xs0, xss) =>
  (
  case+ xss of
  | ~list0_vt_nil() => xs0
  | ~list0_vt_cons(xs1, xss) =>
    (
    let
      var r0: ptr?
    in
      r0 := xs0; loop(r0, xs1, xss); r0
    end
    )
  )
) where
{
//
vtypedef xs = list0_vt(x0)
vtypedef xss = list0_vt(xs)
//
fun
loop
( r0: &xs >> xs
, xs1: xs, xss: xss): void =
(
case+ r0 of
| ~list0_vt_nil() =>
  (
  let
    val () = (r0 := xs1)
  in
    case+ xss of
    | ~list0_vt_nil
       ((*void*)) => ()
    | ~list0_vt_cons
       (xs1, xss) => loop(r0, xs1, xss)
  end
  )
| @list0_vt_cons(x0, r1) =>
  (
    loop(r1, xs1, xss); fold@(r0)
  ) // end of [list0_vt_cons]
)
//
} (* end of [list0_vt_concat] *)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_append
  (xs, ys) =
(
let
  var r0: ptr?
in
  r0 := xs; loop(r0, ys); r0
end
) where
{
//
vtypedef xs = list0_vt(x0)
//
fun
loop
(xs0: &xs >> xs, ys0: xs): void =
(
case+ xs0 of
| ~list0_vt_nil() =>
  (xs0 := ys0)
| @list0_vt_cons(x0, xs1) =>
  (loop(xs1, ys0); fold@(xs0))
)
} (* end of [list0_vt_append] *)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_revapp
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs0
: list0_vt(x0)
, ys0
: list0_vt(x0)): list0_vt(x0) =
(
case+ xs0 of
| ~list0_vt_nil() => ys0
| @list0_vt_cons(x0, xs1) =>
  let
    val xs2 = xs1
    val ( ) = (xs1 := ys0)
  in
    fold@(xs0); loop(xs2, xs0)
  end
)
} (* end of [list0_vt_revapp] *)
//
implement
{x0}//tmp
list0_vt_reverse(xs) =
(
  list0_vt_revapp<x0>(xs, list0_vt_nil())
) (* end of [list0_vt_reverse] *)
//
(* ****** ****** *)

implement
{x0}//tmp
list0_vt_foreach(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0_vt(x0)): void =
(
case+ xs of
|
~list0_vt_nil() => ()
|
~list0_vt_cons(x0, xs) =>
 let
 val () =
 list0_vt_foreach$work<x0>(x0) in loop(xs)
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_foreach] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rforeach(xs) =
  (loop(reverse(xs))) where
{
//
fun
loop
(xs: list0_vt(x0)): void =
(
case+ xs of
|
~list0_vt_nil() => ()
|
~list0_vt_cons(x0, xs) =>
 let
 val () =
 list0_vt_rforeach$work<x0>(x0) in loop(xs)
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_rforeach] *)

(* ****** ****** *)

(* end of [list_vt.dats] *)
