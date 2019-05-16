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
#staload "./../SATS/gptr.sats"
#staload "./../SATS/bool.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/glseq.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{x0}//tmp
list0_vt_sing(x0) =
list0_vt_cons(x0, list0_vt_nil())
//
(* ****** ****** *)

implement
{x0}//tmp
list0_vt_length(xs) =
(
$effmask_all(loop(xs, 0))
) where
{
fun
loop
(xs: !list0_vt(x0), i0: int): int =
case+ xs of
| list0_vt_nil() => i0
| list0_vt_cons(_, xs) => loop(xs, succ(i0))
} (* end of [list0_length] *)

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
list0_vt_copy(xs) =
(
let
var r0: ptr? in loop(xs, r0); r0
end
) where
{
fun
loop
( xs: !list0_vt(x0)
, r0: &ptr? >> list0_vt(x0)): void =
(
case+ xs of
| list0_vt_nil() =>
  (r0 := list0_vt_nil())
| list0_vt_cons(x0, xs) =>
  {
    val x0 = gcopy$val<x0>(x0)
    val () =
    (r0 := list0_vt_cons(x0, _))
    val+list0_vt_cons(_, r1) = r0
    val () = loop(xs, r1); prval () = fold@(r0)
  } (* end of [list0_vt_cons] *)
)
} (* end of [list0_vt_copy] *)
//
(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rcopy(xs) =
(
loop(xs, list0_vt_nil())
) where
{
//
vtypedef
xs = list0_vt(x0)
//
fun
loop
(xs: !xs, r0: xs): xs =
(
case+ xs of
| list0_vt_nil() => r0
| list0_vt_cons(x0, xs) =>
  loop(xs, list0_vt_cons(gcopy$val<x0>(x0), r0))
) (* end of [loop] *)
} (* end of [list_vt_rcopy] *)

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
{x0}(*tmp*)
list0_vt_streamize
  (xs) =
(
  auxmain(xs)
)  where
{
//
vtypedef xs = list0_vt(x0)
vtypedef r0 = stream_vt(x0)
//
fun
auxmain
(xs: xs): r0 = $ldelay
(
case+ xs of
| ~list0_vt_nil() =>
   stream_vt_nil()
| ~list0_vt_cons(x0, xs) =>
   stream_vt_cons(x0, auxmain(xs))
, list0_vt_free<x0>(xs)
)
} (* end of [list0_vt_streamize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_forall0
  (xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0_vt(x0)): bool =
(
case+ xs of
|
~list0_vt_nil() => true
|
~list0_vt_cons(x0, xs) =>
 let
 val
 test =
 list0_vt_forall0$test<x0>(x0)
 in
 if
 test
 then loop(xs)
 else (list0_vt_free<x0>(xs); false)
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_forall0] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_foreach0
  (xs) =
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
 list0_vt_foreach0$work<x0>(x0) in loop(xs)
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_foreach0] *)

(* ****** ****** *)

implement
{x0}{r0}//tmp
list0_vt_foldleft0
  (xs, r0) =
  (loop(xs, r0)) where
{
//
fun
loop
(xs: list0_vt(x0), r0: r0): r0 =
(
case+ xs of
|
~list0_vt_nil() => r0
|
~list0_vt_cons(x0, xs) =>
 let
 val r0 =
 list0_vt_foldleft0$fopr<x0><r0>(r0, x0) in loop(xs, r0)
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_foldleft0] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rforall0(xs) =
(
  list0_vt_forall0<x0>(xs)
) where
{
  val xs =
  list0_vt_reverse<x0>(xs)
  implement
  list0_vt_forall0$test<x0>(x0) =
  (
    list0_vt_rforall0$test<x0>(x0)
  )
} (* end of [list0_vt_rforall0] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rforeach0(xs) =
(
  list0_vt_foreach0<x0>(xs)
) where
{
  val xs =
  list0_vt_reverse<x0>(xs)
  implement
  list0_vt_foreach0$work<x0>(x0) =
  (
    list0_vt_rforeach0$work<x0>(x0)
  )
} (* end of [list0_vt_rforeach0] *)

(* ****** ****** *)

implement
{x0}{r0}//tmp
list0_vt_foldleft0
  (xs, r0) =
(
  loop(xs, r0)
) where
{
//
vtypedef
xs = list0_vt(x0)
//
fun
loop
(xs: xs, r0: r0): r0 =
(
case+ xs of
|
~list0_vt_nil() => r0
|
~list0_vt_cons(x0, xs) =>
 (
   loop(xs, r0)
 ) where
 {
   val r0 =
   list0_vt_foldleft0$fopr<x0><r0>(r0, x0)
 }
)
} (* end of [list0_foldleft0] *)

(* ****** ****** *)
//
implement
{x0}(*tmp*)
list0_vt_iforall0(xs) =
(
  glseq_iforall0<xs><x0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_iforall0$test<x0>
(i0, x0) = list0_vt_iforall0$test<x0>(i0, x0)
//
} (* end of [list0_vt_iforall0] *)
//
implement
{x0}(*tmp*)
list0_vt_iforeach0(xs) =
(
  glseq_iforeach0<xs><x0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_iforeach0$work<x0>
(i0, x0) = list0_vt_iforeach0$work<x0>(i0, x0)
//
} (* end of [list0_vt_iforeach0] *)
//
(* ****** ****** *)
//
implement
{x0}{y0}
list0_vt_map0(xs) =
list0_vt_map0_list<x0><y0>(xs)
//
implement
{x0}{y0}
list0_vt_map0_list(xs) =
(
  glseq_map0_list<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_map0$fopr<x0><y0>(x0) = list0_vt_map0$fopr<x0><y0>(x0)
//
} // list0_vt_map0_list
implement
{x0}{y0}
list0_vt_map0_rlist(xs) =
(
  glseq_map0_rlist<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_map0$fopr<x0><y0>(x0) = list0_vt_map0$fopr<x0><y0>(x0)
//
} // list0_vt_map0_rlist
//
(* ****** ****** *)
//
implement
{x0}{y0}
list0_vt_imap0(xs) =
list0_vt_imap0_list<x0><y0>(xs)
//
implement
{x0}{y0}
list0_vt_imap0_list(xs) =
(
  glseq_imap0_list<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_imap0$fopr<x0><y0>(i0, x0) = list0_vt_imap0$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap0_list
implement
{x0}{y0}
list0_vt_imap0_rlist(xs) =
(
  glseq_imap0_rlist<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_imap0$fopr<x0><y0>(i0, x0) = list0_vt_imap0$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap0_rlist
//
(* ****** ****** *)

implement
{x0}//tmp
list0_vt_forall1(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: !list0_vt(x0)): bool =
(
case+ xs of
| list0_vt_nil() => true
| list0_vt_cons(x0, xs) =>
  let
  val
  test =
  list0_vt_forall1$test<x0>(x0)
  in
    if test then loop(xs) else false
  end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_forall1] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_foreach1
  (xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: !list0_vt(x0)): void =
(
case+ xs of
| list0_vt_nil() => ()
| list0_vt_cons(x0, xs) =>
   let
   val () =
   list0_vt_foreach1$work<x0>(x0) in loop(xs)
   end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_foreach1] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rforall1(xs) =
(
  list0_vt_forall0<x0>(xs)
) where
{
  val xs =
  list0_vt_rcopy<x0>(xs)
  implement
  list0_vt_forall0$test<x0>(x0) =
  let
  val
  test =
  list0_vt_rforall1$test<x0>(x0)
  in
  let val () = gfree$val<x0>(x0) in test end
  end
} (* end of [list0_vt_rforall1] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_rforeach1(xs) =
(
glseq_rforeach1<list0_vt(x0)><x0>(xs)
) where
{
implement
list0_vt_rforeach1$work<x0>(x0) = glseq_rforeach1$work<x0>(x0)
}

(* ****** ****** *)

implement
{x0}{r0}//tmp
list0_vt_foldleft1
  (xs, r0) =
(
  loop(xs, r0)
) where
{
//
vtypedef
xs = list0_vt(x0)
//
fun
loop
(xs: !xs, r0: r0): r0 =
(
case+ xs of
| list0_vt_nil() => r0
| list0_vt_cons(x0, xs) =>
  loop(xs, list0_vt_foldleft1$fopr<x0><r0>(r0, x0))
)
} (* end of [list0_foldleft1] *)

(* ****** ****** *)
//
implement
{x0}{y0}
list0_vt_map1(xs) =
list0_vt_map1_list<x0><y0>(xs)
//
implement
{x0}{y0}
list0_vt_map1_list(xs) =
(
  glseq_map1_list<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_map1$fopr<x0><y0>(x0) = list0_vt_map1$fopr<x0><y0>(x0)
//
} // list0_vt_map1_list
implement
{x0}{y0}
list0_vt_map1_rlist(xs) =
(
  glseq_map1_rlist<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_map1$fopr<x0><y0>(x0) = list0_vt_map1$fopr<x0><y0>(x0)
//
} // list0_vt_map1_rlist
//
(* ****** ****** *)
//
implement
{x0}{y0}
list0_vt_imap1(xs) =
list0_vt_imap1_list<x0><y0>(xs)
//
implement
{x0}{y0}
list0_vt_imap1_list(xs) =
(
  glseq_imap1_list<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_imap1$fopr<x0><y0>(i0, x0) = list0_vt_imap1$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap1_list
implement
{x0}{y0}
list0_vt_imap1_rlist(xs) =
(
  glseq_imap1_rlist<xs><x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
implement
glseq_imap1$fopr<x0><y0>(i0, x0) = list0_vt_imap1$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap1_rlist
//
(* ****** ****** *)

implement
{x0}//tmp
list0_vt_forall1_ref
  (xs) =
  (loop(xs)) where
{
//
fun
loop
( xs0
: !list0_vt(x0)): bool =
(
case+ xs0 of
|
 list0_vt_nil() => tt
|
@list0_vt_cons(x0, xs1) =>
 let
 val cp =
 ptr2cptr{x0}(addr@x0)
 val test =
 list0_vt_forall1_ref$test<x0>(cp)
 in
   if
   test
   then
   let
   val
   test = loop(xs1) in fold@(xs0); test
   end
   else let prval () = fold@(xs0) in ff end
 end // end of [list0_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_vt_forall1_ref] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_vt_foreach1_ref
  (xs) =
(
glseq_foreach1_ref<list0_vt(x0)><x0>(xs)
) where
{
implement
glseq_foreach1_ref$work<x0>(px) = list0_vt_foreach1_ref$work<x0>(px)
}

(* ****** ****** *)

implement
{x0}{r0}//tmp
list0_vt_foldleft1_ref
  (xs, r0) =
(
glseq_foldleft1_ref<list0_vt(x0)><x0><r0>(xs, r0)
) where
{
implement
glseq_foldleft1_ref$fopr<x0><r0>(r0, px) = list0_vt_foldleft1_ref$fopr<x0><r0>(r0, px)
}

(* ****** ****** *)

implement
{x0}//tmp
list1_vt_length
{n}(xs) =
$UN.cast{int(n)}(n0) where
{
val xs =
$UN.castvwtp1{list0_vt(x0)}(xs)
val n0 = list0_vt_length<x0>(xs)
prval () = $UN.castvwtp0{void}(xs)
}

(* ****** ****** *)

(* end of [list_vt.dats] *)
