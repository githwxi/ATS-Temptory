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

(* ****** ****** *)

implement
{x0}//tmp
list0_iseqz(xs) =
(
case+ xs of
| list0_nil _ => tt | list0_cons _ => ff
)
implement
{x0}//tmp
list0_isneqz(xs) =
(
case+ xs of
| list0_nil _ => ff | list0_cons _ => tt
)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_length(xs) =
(
$effmask_all(loop(xs, 0))
) where
{
fun
loop
(xs: list0(x0), i0: int): int =
case+ xs of
| list0_nil() => i0
| list0_cons(_, xs) => loop(xs, succ(i0))
} (* end of [list0_length] *)
(*
implement
{x0}//tmp
list0_length(xs) =
(
gseq_foldleft<list0(x0)><x0><int>(xs, 0)
) where
{
implement
gseq_foldleft$fopr<x0><int>(r0, x0) = succ(r0)
}
*)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_indexof(xs, x0) =
$effmask_all
(
  gseq_indexof<list0(x0)><x0>(xs, x0)
) (* end of [list0_indexof] *)
//
(* ****** ****** *)

implement
{x0}//tmp
list0_concat(xss) =
(
list0_foldright<xs><xs>(xss, list0_nil())
) where
{
typedef xs = list0(x0)
implement
list0_foldright$fopr<xs><xs>(xs, r0) = list0_append<x0>(xs, r0)
} (* end of [list0_concat] *)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_append
  (xs, ys) =
(
let
  var r0: ptr?
in
  loop(xs, r0); r0
end
) where
{
  fun
  loop
  ( xs: list0(x0)
  , r0: &ptr? >> list0(x0)
  ) : void =
  (
  case+ xs of
  | list0_nil() =>
    {
      val () = (r0 := ys)
    } (* list0_nil *)
  | list0_cons(x0, xs) =>
    {
      val () =
      (r0 := list0_cons(x0, _))
      val+list0_cons(_, r1) = r0
      val () = loop(xs, r1); prval () = fold@(r0)
    } (* list0_cons *)
  ) (* end of [loop] *)
} (* end of [list0_append] *)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_revapp
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs: list0(x0)
, ys: list0(x0)): list0(x0) =
(
case+ xs of
| list0_nil() => ys
| list0_cons(x0, xs) =>
  loop(xs, list0_cons(x0, ys))
)
} (* end of [list0_revapp] *)
//
implement
{x0}//tmp
list0_reverse(xs) =
(
  list0_revapp<x0>(xs, list0_nil())
) (* end of [list0_reverse] *)
//
(* ****** ****** *)

implement
{x0}//tmp
list0_listize
  (xs) =
(
let
  var r0: ptr?
in
  loop(xs, r0); r0
end
) where
{
//
typedef xs = list0(x0)
//
fun
loop
( xs: xs
, r0: &ptr? >> list0_vt(x0)
) : void =
(
case+ xs of
| list0_nil() =>
  (r0 := list0_vt_nil())
| list0_cons(x0, xs) =>
  {
    val () =
    (r0 := list0_vt_cons(x0, _))
    val+list0_vt_cons(_, r1) = r0
    val () = loop(xs, r1); prval () = fold@(r0)
  } // end of [list0_cons]
)
} (* end of [list0_listize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_rlistize
  (xs) =
(
loop(xs, list0_vt_nil())
) where
{
//
typedef xs = list0(x0)
vtypedef r0 = list0_vt(x0)
//
fun
loop(xs: xs, r0: r0): r0 =
(
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  loop(xs, list0_vt_cons(x0, r0))
)
} (* end of [list0_rlistize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_streamize
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
(
xs: list0(x0)
) : stream_vt(x0) = $ldelay
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  stream_vt_cons(x0, auxmain(xs))
)
} (* end of [list0_streamize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_forall(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0(x0)): bool =
(
case+ xs of
| list0_nil() => tt
| list0_cons(x0, xs) =>
  if
  list0_forall$test<x0>(x0) then loop(xs) else ff
)
} (* end of [list0_forall] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_foreach(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0(x0)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x0, xs) =>
  let
    val () = list0_foreach$work<x0>(x0) in loop(xs)
  end // end of [list0_cons]
)
} (* end of [list0_foreach] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_rforall(xs) =
(
loop
(list0_rlistize<x0>(xs))
) where
{
//
sexpdef xs = list0_vt(x0)
//
fun
free
(xs: xs): void =
(
case xs of
| ~list0_vt_nil() => ()
| ~list0_vt_cons(x0, xs) => free(xs)
)
fun
loop(xs: xs): bool =
(
case+ xs of
| ~list0_vt_nil() => tt
| ~list0_vt_cons(x0, xs) =>
  if
  list0_rforall$test<x0>(x0)
  then loop(xs) else let val () = free(xs) in ff end
)
} (* end of [list0_rforall] *)

(* ****** ****** *)
//
// HX-2019-05-09:
// tail-recursion
//
implement
{x0}{r0}
list0_foldleft
  (xs, r0) =
(
  loop(xs, r0)
) where
{
//
typedef xs = list0(x0)
//
fun
loop
(xs: xs, r0: r0): r0 =
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  loop(xs, list0_foldleft$fopr<x0><r0>(r0, x0))
} (* end of [list0_foldleft] *)

(* ****** ****** *)
//
// HX-2019-05-09:
// tail-recursion
//
implement
{x0}{r0}
list0_foldright
  (xs, r0) =
(
loop
(list0_rlistize(xs), r0)
) where
{
//
sexpdef xs = list0_vt(x0)
//
fun
loop
(xs: xs, r0: r0): r0 =
case+ xs of
| ~list0_vt_nil() => r0
| ~list0_vt_cons(x0, xs) =>
   loop(xs, list0_foldright$fopr<x0><r0>(x0, r0))
//  
} (* end of [list0_foldright] *)
//
(*
implement
{x0}{r0}
list0_foldright
  (xs, r0) =
(
  auxlst(xs, r0)
) where
{
//
typedef xs = list0(x0)
//
fun
auxlst
(xs: xs, r0: r0): r0 =
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  list0_foldright$fopr<x0><r0>(x0, auxlst(xs, r0))
} (* end of [list0_foldright] *)
*)
//
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

(* end of [list.dats] *)
