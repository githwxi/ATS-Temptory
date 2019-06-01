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
#staload "./../SATS/glseq.sats"
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_sing(x0) =
stream_vt_cons
( x0
, stream_vt_make_nil())
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
stream_vt_make_nil() =
$ldelay
(stream_vt_nil(*void*))
//
impltmp
{x0}(*tmp*)
stream_vt_make_sing(x0) =
$ldelay
(
let
val xs =
stream_vt_make_nil()
in stream_vt_cons(x0, xs) end, gfree$val<x0>(x0)
) (* stream_vt_make_sing *)
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_make_list0
  (xs) =
  (auxmain(xs)) where
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
) (* end of [auxmain] *)
} (* end of [stream_vt_make_list0] *)
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_make_list0_vt
  (xs) =
  (auxmain(xs)) where
{
fun
auxmain
(
xs: list0_vt(x0)
) : stream_vt(x0) = $ldelay
(
(
case+ xs of
|
~list0_vt_nil() =>
 stream_vt_nil()
|
~list0_vt_cons(x0, xs) =>
 stream_vt_cons(x0, auxmain(xs))
)
,
list0_vt_free<x0>(xs)
) (* end of [auxmain] *)
} (* end of [stream_vt_make_list0_vt] *)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
stream_vt_length
  (xs) =
  (loop(xs, 0)) where
{
fun
loop
(xs: stream_vt(a), r0: int): int =
(
case+ !xs of
| ~stream_vt_nil() => r0
| ~stream_vt_cons(x0, xs) =>
   (gfree$val<a>(x0); loop(xs, r0+1))
)
} (* end of [stream_vt_length] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
stream_vt_append
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
stream_vt_append<a>
) =
lam(xs, ys) => $ldelay(
//
let
//
val nx = !xs
//
in
//
case+ nx of
|
~stream_vt_nil() =>
(
  lazy_vt_force(ys)
)
|
@stream_vt_cons(x0, xs) =>
 (
   xs := auxmain(xs, ys); fold@{a}(nx); nx
 )
//
end // end-of-let
,
(
  ~(xs); ~(ys) // HX: for freeing the stream!
)
//
) (* end of [auxmain] *)
//
} (* end of [stream_vt_append] *)

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_take$when(x0) = 
not
(stream_vt_take$until<x0>(x0))
//
impltmp
{x0}(*tmp*)
stream_vt_take(xs) =
(
let
  var r0: ptr?
  val nx = loop(xs, r0) in (r0, nx)
end
) where
{
vtypedef xs = stream_vt(x0)
vtypedef nx = stream_vt_con(x0)
fun
loop
( xs: xs
, r0: &ptr? >> list0_vt(x0)): nx =
let
  val nx = !xs
in
case+ nx of
|
@stream_vt_nil() =>
 let
 val () =
 (r0 := list0_vt_nil()) in fold@(nx); nx
 end
|
@stream_vt_cons(x0, xs) =>
 let
 val
 test =
 stream_vt_take$when<x0>(x0)
 in
 if
 test
 then let
   val xs = xs
   val x0 = x0
   val () = free@(nx)
   val () =
   (r0 := list0_vt_cons(x0, _))
   val+list0_vt_cons(_, r1) = r0
   val nx = loop(xs, r1); prval () = fold@(r0) in nx
 end // end of [then]
 else let
 val () =
 (r0 := list0_vt_nil()) in fold@(nx); nx
 end // end of [else]
 end // end of [stream_vt_cons]
end
}
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_drop$when(x0) = 
not
(stream_vt_drop$until<x0>(x0))
//
impltmp
{x0}(*tmp*)
stream_vt_drop(xs) =
(
let
  var r0 = (0:int)
  val nx = loop(xs, r0) in (r0, nx)
end
) where
{
vtypedef xs = stream_vt(x0)
vtypedef nx = stream_vt_con(x0)
fun
loop
( xs: xs
, r0: &int >> int): nx =
let
  val nx = !xs
in
case+ nx of
|
@stream_vt_nil() =>
 (fold@(nx); nx)
|
@stream_vt_cons(x0, xs) =>
 let
 val
 test =
 stream_vt_drop$when<x0>(x0)
 in
 if
 test
 then
 (
 loop(xs, r0)
 ) where
 {
   val xs = xs
   val () =
   gfree$val<x0>(x0)
   val () = free@(nx)
   val () = (r0 := r0 + 1)
 } (* end of [then] *)
 else (fold@(nx); nx)
 end // end of [stream_vt_cons]
end
}
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_tolist(xs) =
list0_vt2t
(stream_vt_listize<x0>(xs))
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
stream_vt_listize(xs) =
(
let
var rr: ptr?
val () = loop(xs, rr) in rr
end
) where
{
//
vtypedef r0 = list0_vt(x0)
vtypedef xs = stream_vt(x0)
//
fun
loop
( xs: xs
, r0: &ptr? >> r0): void =
(
case+ !xs of
|
~stream_vt_nil() =>
 (r0 := list0_vt_nil())
|
~stream_vt_cons(x0, xs) =>
 {
   val () =
   (r0 := list0_vt_cons(x0, _))
   val+list0_vt_cons(_, r1) = r0
   val () = loop(xs, r1); prval () = fold@(r0)
 }
)
} (* end of [stream_vt_listize] *)
//
(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_group_line
  (xs) =
  (auxmain(xs)) where
{
fun
auxmain
( xs
: stream_vt(x0)) 
: stream_vt(list0_vt(x0)) =
$ldelay
(
let
//
val
(ys, xs) =
(
stream_vt_take<x0>(xs)
) where
{
impltmp
stream_vt_take$until<x0>(x0) =
stream_vt_group_line$iseol<x0>(x0)
}
//
in
case+ xs of
|
~stream_vt_nil() =>
 (
 case+ ys of
 | ~list0_vt_nil _ => stream_vt_nil()
 |  list0_vt_cons _ => stream_vt_sing(ys)
 )
|
~stream_vt_cons(x0, xs) =>
 let
 val () =
 gfree$val<x0>(x0) in stream_vt_cons(ys, auxmain(xs))
 end
end // end-of-let
, lazy_vt_free(xs)
) (* end of [auxmain] *)
} (* end of [stream_vt_group_line] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_group_word
  (xs) =
  (auxmain(xs)) where
{
fun
auxmain
( xs
: stream_vt(x0)) 
: stream_vt(list0_vt(x0)) =
$ldelay
(
let
//
val
(n0, xs) =
(
stream_vt_drop<x0>(xs)
) where
{
impltmp
stream_vt_drop$until<x0>(x0) =
stream_vt_group_word$isalpha<x0>(x0)
}
//
in
case+ xs of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
~stream_vt_cons(y0, xs) =>
 let
 val
 (ys, xs) =
 (
 stream_vt_take<x0>(xs)
 ) where
 {
 impltmp
 stream_vt_take$when<x0>(x0) =
 stream_vt_group_word$isalpha<x0>(x0)
 }
 val ys = list0_vt_cons(y0, ys)
 in
 case+ xs of
 | ~stream_vt_nil() =>
    stream_vt_sing(ys)
 | ~stream_vt_cons(x0, xs) =>
    let
    val () = gfree$val<x0>(x0)
    in stream_vt_cons(ys, auxmain(xs)) end
 end
end // end-of-let
, lazy_vt_free(xs)
) (* end of [auxmain] *)
} (* end of [stream_vt_group_word] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_forall0
  (xs) =
  (loop(xs)) where
{
fun
loop
(xs: stream_vt(x0)): bool =
(
case+ !xs of
|
~stream_vt_nil() => tt
|
~stream_vt_cons(x0, xs) =>
 let
 val
 test =
 stream_vt_forall0$test<x0>(x0)
 in
   if test then loop(xs) else (~xs; false)
 end // end of [stream_vt_cons]
) (* end of [loop] *)
} (* end of [stream_vt_forall0] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_foreach0
  (xs) =
  (loop(xs)) where
{
fun
loop
(xs: stream_vt(x0)): void =
(
case+ !xs of
|
~stream_vt_nil() => ()
|
~stream_vt_cons(x0, xs) =>
 let
 val () =
 stream_vt_foreach0$work<x0>(x0) in loop(xs)
 end // end of [stream_vt_cons]
) (* end of [loop] *)
} (* end of [stream_vt_foreach0] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_iforeach0
  (xs) =
  (loop(0, xs)) where
{
fun
loop
( i0: int
, xs: stream_vt(x0)): void =
(
case+ !xs of
|
~stream_vt_nil() => ()
|
~stream_vt_cons(x0, xs) =>
 let
 val () =
 stream_vt_iforeach0$work<x0>(i0, x0) in loop(i0+1, xs)
 end // end of [stream_vt_cons]
) (* end of [loop] *)
} (* end of [stream_vt_iforeach0] *)

(* ****** ****** *)

impltmp
{x0}{y0}(*tmp*)
stream_vt_map(xs) =
  (auxmain(xs)) where
{
//
fun
auxmain
(
//
xs: stream_vt(x0)
//
) : stream_vt(y0) = $ldelay
(
//
case+ !xs of
//
|
~stream_vt_nil() =>
 (
  stream_vt_nil(*void*)
 )
|
~stream_vt_cons(x0, xs) =>
 let
   val y0 =
   stream_vt_map$fopr<x0><y0>(x0)
 in
   stream_vt_cons{y0}(y0, auxmain(xs))
 end (* end of [stream_vt_con] *)
//
,
//
(
  lazy_vt_free(xs) // for freeing the stream!
)
//
) (* end of [auxmain] *)
//
} (* end of [stream_vt_map] *)

(* ****** ****** *)

impltmp
{x0}{y0}//tmp
stream_vt_mapopt
(
  xs
) = auxmain1(xs) where
{
//
(*
HX-2019-05:
fnx // bug!!!
*)
fun
auxmain1
(
xs: stream_vt(x0)
) : stream_vt(y0) =
$ldelay
(auxmain2(xs), ~xs)
//  
and
auxmain2
(
xs: stream_vt(x0)
) : stream_vt_con(y0) =
(
//
let
val nx = !xs
in
//
case+ (nx) of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
~stream_vt_cons(x0, xs) =>
 let
   val
   test =
   stream_vt_mapopt$test<x0>(x0)
 in
   if
   test
   then
   (
     stream_vt_cons(y0, auxmain1(xs))
   ) where
   {
     val y0 =
     stream_vt_mapopt$fopr<x0><y0>(x0)
   }
   else let
     val () = gfree$val<x0>(x0) in auxmain2(xs)
   end (* end of [else] *)
 end // end of [stream_vt_cons]
//
end // end of [let]
//
) (* end of auxmain2 *)
//
} (* end of [stream_vt_mapopt] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_filter
(
  xs
) = auxmain1(xs) where
{
//
(*
HX-2019-05:
fnx // bug!!!
*)
fun
auxmain1
(
xs: stream_vt(x0)
) : stream_vt(x0) =
$ldelay
(auxmain2(xs), ~xs)
//  
and
auxmain2
(
xs: stream_vt(x0)
) : stream_vt_con(x0) =
(
//
let
val nx = !xs
in
//
case+ (nx) of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
@stream_vt_cons(x0, xs) =>
 let
   val
   test =
   stream_vt_filter$test<x0>(x0)
 in
   if
   test
   then
   (
     xs := auxmain1(xs); fold@{x0}(nx); nx
   ) // end of [then]
   else let
     val xs = xs
   in
     gfree$val<x0>(x0); free@{x0}(nx); auxmain2(xs) 
   end (* end of [else] *)
 end // end of [stream_vt_cons]
//
end // end of [let]
//
) (* end of auxmain2 *)
//
} (* end of [stream_vt_filter] *)

(* ****** ****** *)

impltmp
{x0}{y0}(*tmp*)
stream_vt_imap(xs) =
  (auxmain(0, xs)) where
{
//
fun
auxmain
(
//
i0: int
,
xs: stream_vt(x0)
//
) : stream_vt(y0) = $ldelay
(
//
case+ !xs of
//
|
~stream_vt_nil() =>
 (
  stream_vt_nil(*void*)
 )
|
~stream_vt_cons(x0, xs) =>
 let
   val y0 =
   stream_vt_imap$fopr<x0><y0>(i0, x0)
 in
   stream_vt_cons{y0}(y0, auxmain(i0+1, xs))
 end (* end of [stream_vt_con] *)
//
,
//
(
  lazy_vt_free(xs) // for freeing the stream!
)
//
) (* end of [auxmain] *)
//
} (* end of [stream_vt_imap] *)

(* ****** ****** *)

impltmp
{x0}{y0}//tmp
stream_vt_imapopt
( xs ) =
auxmain1(0, xs) where
{
//
(*
HX-2019-05:
fnx // bug!!!
*)
fun
auxmain1
(
i0: int
,
xs: stream_vt(x0)
) : stream_vt(y0) =
$ldelay
(auxmain2(0, xs), ~xs)
//  
and
auxmain2
(
i0: int
,
xs: stream_vt(x0)
) : stream_vt_con(y0) =
(
//
let
val nx = !xs
in
//
case+ (nx) of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
~stream_vt_cons(x0, xs) =>
 let
   val
   test =
   stream_vt_imapopt$test<x0>(i0, x0)
 in
   if
   test
   then
   (
   stream_vt_cons(y0, auxmain1(i0+1, xs))
   ) where
   {
     val y0 =
     stream_vt_imapopt$fopr<x0><y0>(i0, x0)
   }
   else let
     val () = gfree$val<x0>(x0) in auxmain2(i0+1, xs)
   end (* end of [else] *)
 end // end of [stream_vt_cons]
//
end // end of [let]
//
) (* end of auxmain2 *)
//
} (* end of [stream_vt_imapopt] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_forall0_ref
  (xs) =
  (loop(xs)) where
{
fun
loop
(xs: stream_vt(x0)): bool =
(
let
val nx = !xs
in
case+ nx of
|
~stream_vt_nil() => true
|
@stream_vt_cons(x0, xs) =>
 let
 val
 test =
 stream_vt_forall0_ref$test<x0>(x0)
 in
   if
   test
   then
   let
   val xs = xs in free@(nx); loop(xs)
   end
   else (lazy_vt_free(xs); free@(nx); false)
 end // end of [stream_vt_cons]
end // end of [let]
) (* end of [loop] *)
} (* end of [stream_vt_forall0_ref] *)

(* ****** ****** *)

impltmp
{x0}(*tmp*)
stream_vt_foreach0_ref
  (xs) =
  (loop(xs)) where
{
fun
loop
(xs: stream_vt(x0)): void =
(
let
val nx = !xs
in
case+ nx of
|
~stream_vt_nil() => ()
|
@stream_vt_cons(x0, xs) =>
 let
 val () =
 stream_vt_foreach0_ref$work<x0>(x0)
 in
 let val xs = xs in free@(nx); loop(xs) end
 end // end of [stream_vt_cons]
end // end of [let]
) (* end of [loop] *)
} (* end of [stream_vt_foreach0_ref] *)

(* ****** ****** *)

(* end of [stream_vt.dats] *)
