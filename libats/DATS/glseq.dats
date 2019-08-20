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

#define tt true
#define ff false

(* ****** ****** *)
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/glseq.sats"
//
#staload "./../SATS/print.sats"
//
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"
//
#staload UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_length(xs) =
(
glseq_foldleft1<pf><xs,x0><r0>(xs, 0)
) where
{
//
typedef r0 = int
//
impltmp
glseq_foldleft1$fopr<pf><xs,x0><r0>(r0, x0) = succ(r0)
} (* end of [glseq_length] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_print(xs) =
{
val () =
glseq_print$beg()
val n0 =
glseq_foldleft1<pf><xs,x0><r0>(xs, 0)
val () =
glseq_print$end()
} where
{
typedef r0 = int
//
impltmp
glseq_foldleft1$fopr<pf><xs,x0><r0>(r0, x0) =
let
val () =
if
(r0 > 0)
then glseq_print$sep<pf><xs,x0>()
val () = glseq_print$val<pf><xs,x0>(x0) in succ(r0)
end
} (* end of [glseq_print] *)
//
impltmp
{pf}
{xs,x0}
glseq_print$beg() = print_string("(")
impltmp
{pf}
{xs,x0}
glseq_print$end() = print_string(")")
impltmp
{pf}
{xs,x0}
glseq_print$sep() = print_string(",")
//
impltmp
{pf}
{xs,x0}
glseq_print$val(x0) = print$val<x0>(x0)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_listize(xs) =
stream_vt_listize<x0>
(glseq_streamize<pf><xs,x0>(xs))

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_forall0(xs) =
(
loop
(
glseq_streamize<pf><xs,x0>(xs)
)
) where
{
fun
loop
( xs
: stream_vt(x0)): bool =
(
case+ !xs of
|
~stream_vt_nil() => true
|
~stream_vt_cons(x0, xs) =>
let
  val test =
  glseq_forall0$test<pf><xs,x0>(x0)
in
  if test then loop(xs) else (~xs; ff)
end // end of [let]
)
} (* end of [glseq_forall0] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_exists0(xs) =
(
if
glseq_forall0<pf><xs,x0>(xs) then ff else tt
) where
{
//
impltmp
glseq_forall0$test<pf><xs,x0>
  (x0) =
(
if
glseq_exists0$test<pf><xs,x0>(x0) then ff else tt
) (* glseq_forall0$test *)
//
} (* end of [glseq_exists0] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_foreach0(xs) =
let
//
impltmp
glseq_forall0$test<pf><xs,x0>(x0) =
let
val () =
glseq_foreach0$work<pf><xs,x0>(x0) in tt
end // end of [let]
//
in
  ignoret(glseq_forall0<pf><xs,x0>(xs))
end // end of [let]
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}
glseq_rforall0(xs) =
(
loop
(glseq_rlistize<pf><xs,x0>(xs))
) where
{
fun
loop
(xs: list0_vt(x0)): bool =
(
case+ xs of
| ~list0_vt_nil() => tt
| ~list0_vt_cons(x0, xs) =>
  if
  glseq_rforall0$test<pf><xs,x0>(x0)
  then loop(xs) else
  let val () = list0_vt_free<x0>(xs) in ff end
)
} (* end of [glseq_rforall0] *)

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_rforeach0(xs) =
let
//
impltmp
glseq_rforall0$test<pf><xs,x0>(x0) =
let
val () =
glseq_rforeach0$work<pf><xs,x0>(x0) in true
end // end of [let]
//
in
  ignoret(glseq_rforall0<pf><xs,x0>(xs))
end // end of [glseq_rforeach0]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
glseq_foldleft0
  (xs, r0) = let
//
var rr = (r0:r0)
val p0 = addr@(rr)
//
impltmp
glseq_foreach0$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldleft0$fopr<pf><xs,x0><r0>(r0, x0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let val () = glseq_foreach0<pf><xs,x0>(xs) in rr end
end // end of [glseq_foldleft0]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
glseq_foldright0
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
impltmp
glseq_rforeach0$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldright0$fopr<pf><xs,x0><r0>(x0, r0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let val () = glseq_rforeach0<pf><xs,x0>(xs) in rr end
end // end of [glseq_foldright0]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_iforall0(xs) =
(
glseq_forall0<pf><xs,x0>(xs)
) where
{
//
var i0 = (0:int)
val p0 = addr@(i0)
//
impltmp
glseq_forall0$test<pf><xs,x0>
  (x0) =
(
glseq_iforall0$test<pf><xs,x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [glseq_iforall0] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_iexists0(xs) =
(
if
glseq_iforall0<pf><xs,x0>(xs) then ff else tt
) where
{
//
impltmp
glseq_iforall0$test<pf><xs,x0>
  (i0, x0) =
(
if
glseq_iexists0$test<pf><xs,x0>(i0, x0) then ff else tt
) (* glseq_forall0$test *)
//
} (* end of [glseq_iexists0] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_iforeach0(xs) =
(
ignoret
(glseq_iforall0<pf><xs,x0>(xs))
) where
{
//
impltmp
glseq_iforall0$test<pf><xs,x0>(i0, x0) =
let
val () =
glseq_iforeach0$work<pf><xs,x0>(i0, x0) in tt
end // end of [let]
//
} (* end of [glseq_iforeach0] *)
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
glseq_map0_list(xs) = let
//
vtypedef p0 = ptr
//
impltmp
glseq_foldleft0$fopr<pf><xs,x0><p0>
  (p0, x0) =
  (addr@(r1)) where
{
//
extern
praxi
_assert_
{vw:view}(vw):<prf> void
extern
castfn
_castfn_
{vt:vtbox}(vt):<fun> (ptr)
//
val y0 =
glseq_map0$fopr<pf><xs,x0><y0>(x0)
val ys = list0_vt_cons(y0, _)
val+list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} (* end of [glseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
glseq_foldleft0<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set(p1, list0_vt_nil);
  $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [glseq_map0_list] *)

impltmp
{pf}
{xs,x0}{y0}
glseq_map0_rlist(xs) =
(
glseq_foldleft0<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
glseq_foldleft0$fopr<pf><xs,x0><r0>(r0, x0) =
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 = glseq_map0$fopr<pf><xs,x0><y0>(x0)
}
} (* end of [g1seq_map0_rlist] *)

impltmp
{pf}
{xs,x0}{y0}
glseq_map0_stream(xs) =
(
stream_vt_map<x0><y0>(xs)
) where
{
val xs =
glseq_streamize<pf><xs,x0>(xs)
impltmp
stream_vt_map$fopr<x0><y0>(x0) = glseq_map0$fopr<pf><xs,x0><y0>(x0)
} (* end of [glseq_map0_stream] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
glseq_imap0_list(xs) =
(
glseq_map0_list<pf><xs,x0><y0>(xs)
) where
{
//
  var i0 = (0:int)
  val p0 = addr@(i0)
//
  impltmp
  glseq_map0$fopr<pf><xs,x0><y0>(x0) =
  let
    val i0 =
    $UN.ptr0_get<int>(p0)
    val () =
    $UN.ptr0_set<int>(p0, i0+1)
  in
    glseq_imap0$fopr<pf><xs,x0><y0>(i0, x0)
  end
//
} (* end of [glseq_imap0_list *)

impltmp
{pf}
{xs,x0}{y0}
glseq_imap0_rlist(xs) =
(
glseq_map0_rlist<pf><xs,x0><y0>(xs)
) where
{
//
  var i0 = (0:int)
  val p0 = addr@(i0)
//
  impltmp
  glseq_map0$fopr<pf><xs,x0><y0>(x0) =
  let
    val i0 =
    $UN.ptr0_get<int>(p0)
    val () =
    $UN.ptr0_set<int>(p0, i0+1)
  in
    glseq_imap0$fopr<pf><xs,x0><y0>(i0, x0)
  end
//
} (* end of [glseq_imap0_rlist *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}
glseq_rlistize1(xs) =
(
glseq_foldleft1<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
  vtypedef r0 = list0_vt(x0)
  impltmp
  glseq_foldleft1$fopr<pf><xs,x0><r0>
    (r0, x0) =
  (
    list0_vt_cons(gcopy$val<x0>(x0), r0)
  )
} // end of [glseq_rlistize1]

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_foreach1(xs) =
let
//
impltmp
glseq_forall1$test<pf><xs,x0>(x0) =
let
val () =
glseq_foreach1$work<pf><xs,x0>(x0) in tt
end // end of [let]
//
in
  ignoret(glseq_forall1<pf><xs,x0>(xs))
end // end of [glseq_forall1]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_iforall1(xs) =
(
glseq_forall1<pf><xs,x0>(xs)
) where
{
//
var i0 = (0:int)
val p0 = addr@(i0)
//
impltmp
glseq_forall1$test<pf><xs,x0>
  (x0) =
(
glseq_iforall1$test<pf><xs,x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [glseq_iforall1] *)
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}
glseq_rforall1(xs) =
(
loop
(
glseq_rlistize1<pf><xs,x0>(xs)
)
) where
{
fun
loop
(xs: list0_vt(x0)): bool =
(
case+ xs of
|
~list0_vt_nil() => tt
|
~list0_vt_cons(x0, xs) =>
 let
 val
 test =
 glseq_rforall1$test<pf><xs,x0>(x0)
 in
 let
   val () = gfree$val<x0>(x0)
 in
   if test
     then loop(xs)
     else (list0_vt_free<x0>(xs); false)
   // end of [if]
 end
 end
)
} (* end of [glseq_rforall1] *)

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_rforeach1(xs) =
let
//
impltmp
glseq_rforall1$test<pf><xs,x0>(x0) =
let
val () =
glseq_rforeach1$work<pf><xs,x0>(x0) in tt
end // end of [let]
//
in
  ignoret(glseq_rforall1<pf><xs,x0>(xs))
end // end of [glseq_rforeach1]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
glseq_foldleft1
  (xs, r0) = let
//
var rr = (r0:r0)
val p0 = addr@(rr)
//
impltmp
glseq_foreach1$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldleft1$fopr<pf><xs,x0><r0>(r0, x0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = glseq_foreach1<pf><xs,x0>(xs) in rr
end
end // end of [glseq_foldleft1]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
glseq_foldright1
  (xs, r0) = let
//
var rr = (r0:r0)
val p0 = addr@(rr)
//
impltmp
glseq_rforeach1$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldright1$fopr<pf><xs,x0><r0>(x0, r0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = glseq_rforeach1<pf><xs,x0>(xs) in rr
end
end // end of [glseq_foldright1]
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
glseq_map1_list(xs) = let
//
vtypedef p0 = ptr
//
impltmp
glseq_foldleft1$fopr<pf><xs,x0><p0>
  (p0, x0) =
  (addr@(r1)) where
{
//
extern
praxi
_assert_
{vw:view}(vw):<prf> void
extern
castfn
_castfn_
{vt:vtbox}(vt):<fun> (ptr)
//
val y0 =
glseq_map1$fopr<pf><xs,x0><y0>(x0)
val ys = list0_vt_cons(y0, _)
val+list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} (* end of [glseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
glseq_foldleft1<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set(p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [glseq_map1_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
glseq_map1_rlist(xs) =
(
glseq_foldleft1<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
glseq_foldleft1$fopr<pf><xs,x0><r0>(r0, x0) =
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 = glseq_map1$fopr<pf><xs,x0><y0>(x0)
}
} (* end of [g1seq_map1_rlist] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
glseq_imap1_list(xs) =
(
glseq_map1_list<pf><xs,x0><y0>(xs)
) where
{
//
  var i0 = (0:int)
  val p0 = addr@(i0)
//
  impltmp
  glseq_map1$fopr<pf><xs,x0><y0>(x0) =
  let
    val i0 =
    $UN.ptr0_get<int>(p0)
    val () =
    $UN.ptr0_set<int>(p0, i0+1) in glseq_imap1$fopr<pf><xs,x0><y0>(i0, x0)
  end // end of [glseq_map1$fopr]
//
} (* end of [glseq_imap1_list *)

impltmp
{pf}
{xs,x0}{y0}
glseq_imap1_rlist(xs) =
(
glseq_map1_rlist<pf><xs,x0><y0>(xs)
) where
{
//
  var i0 = (0:int)
  val p0 = addr@(i0)
//
  impltmp
  glseq_map1$fopr<pf><xs,x0><y0>(x0) =
  let
    val i0 =
    $UN.ptr0_get<int>(p0)
    val () =
    $UN.ptr0_set<int>(p0, i0+1) in glseq_imap1$fopr<pf><xs,x0><y0>(i0, x0)
  end // end of [glseq_map1$fopr]
//
} (* end of [glseq_imap1_rlist *)

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
glseq_foreach1_ref(xs) =
let
//
impltmp
glseq_forall1_ref$test<pf><xs,x0>(x0) =
let
val () =
glseq_foreach1_ref$work<pf><xs,x0>(x0) in tt
end // end of [let]
//
in
  ignoret(glseq_forall1_ref<pf><xs,x0>(xs))
end // end of [glseq_foreach1_ref]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
glseq_foldleft1_ref
  (xs, r0) = let
//
var rr = (r0:r0)
val p0 = addr@(rr)
//
impltmp
glseq_foreach1_ref$work<pf><xs,x0>
  (px) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
glseq_foldleft1_ref$fopr<pf><xs,x0><r0>(r0, px)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = glseq_foreach1_ref<pf><xs,x0>(xs) in rr
end
end // end of [glseq_foldleft1_ref]
//
(* ****** ****** *)

(* end of [glseq.dats] *)
