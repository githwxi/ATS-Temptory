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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/print.sats"
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
gseq_iseqz(xs) =
(
gseq_forall<pf><xs,x0>(xs)
) where
{
impltmp
gseq_forall$test<pf><xs,x0>(x0) = ff
}
impltmp
{pf}
{xs,x0}
gseq_isneqz(xs) =
(
 if eqz then ff else tt
) where
{
  val eqz = gseq_iseqz<pf><xs,x0>(xs)
} (* end of [gseq_isneqz] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_size(xs) =
(
gseq_foldleft<pf><xs,x0><r0>
  (xs, i2sz(0))
) where
{
//
typedef r0 = size
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) = succ(r0)
} (* end of [gseq_size] *)
//
impltmp
{pf}
{xs,x0}
gseq_length(xs) =
(
gseq_foldleft<pf><xs,x0><r0>(xs, 0(*r0*))
) where
{
//
typedef r0 = Intgte(0)
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) = succ(r0)
} (* end of [gseq_length] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_print(xs) =
{
val () =
gseq_print$beg<pf><xs,x0>()
val n0 =
gseq_foldleft<pf><xs,x0><r0>(xs, 0)
val () =
gseq_print$end<pf><xs,x0>()
} where
{
typedef r0 = int
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) =
let
//
val () =
if
r0 > 0
then
gseq_print$sep<pf><xs,x0>()
//
val () = gseq_print$val<pf><xs,x0>(x0) in succ(r0)
end
} (* end of [gseq_print] *)
//
impltmp
{pf}
{xs,x0}
gseq_print$beg() = print_string("(")
impltmp
{pf}
{xs,x0}
gseq_print$end() = print_string(")")
impltmp
{pf}
{xs,x0}
gseq_print$sep() = print_string(",")
//
impltmp
{pf}
{xs,x0}
gseq_print$val(x0) = print$val<x0>(x0)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_indexof
  (xs, x0) =
(
let
val
test =
gseq_exists<pf><xs,x0>(xs)
in
if test
then $UN.ptr0_get<int>(p0) else (~1)
end
) where
{
//
var i0: int = ~1
val p0 = addr@(i0)
//
impltmp
gseq_exists$test<pf><xs,x0>
  (x1) =
(
  gequal$val<x0>(x0, x1)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [gseq_indexof] *)
//
(* ****** ****** *)
//
(*
HX-2019-05-09:
This is wild, isn't it :)
*)
impltmp
{pf}
{xs,x0}
gseq_listize(xs) = let
//
vtypedef p0 = ptr
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><p0>
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
{vt:vtbox}(vt):<fun>(ptr)
//
val xs =
list0_vt_cons(x0, _)
val+list0_vt_cons(x0, r1) = xs
//
val xs = _castfn_(xs)
val () =
$UN.ptr0_set<ptr>(p0, xs)
//
prval () = _assert_(view@x0)
prval () = _assert_(view@r1)
//
} (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldleft<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(x0)}(r0)
end (* end of [gseq_listize] *)
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}
gseq_rlistize(xs) =
(
gseq_foldleft<pf><xs,x0><r0>(xs, r0)
) where
{
//
val r0 = list0_vt_nil()
//
vtypedef r0 = list0_vt(x0)
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) = list0_vt_cons(x0, r0)
} (* end of [gseq_rlistize] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}
gseq_forall(xs) =
(
loop
(
gseq_streamize<pf><xs,x0>(xs)
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
  gseq_forall$test<pf><xs,x0>(x0)
in
  if test then loop(xs) else (~xs; false)
end // end of [let]
)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}
gseq_exists(xs) =
(
if
gseq_forall<pf><xs,x0>(xs) then ff else tt
) where
{
//
impltmp
gseq_forall$test<pf><xs,x0>(x0) = 
(
if
gseq_exists$test<pf><xs,x0>(x0) then ff else tt
)
//
} (* end of [gseq_exists] *)

(* ****** ****** *)
//
(*
local
exception False
in//in-of-local
impltmp
{pf}
{xs,x0}
gseq_forall(xs) =
let
//
impltmp
gseq_foreach$work<pf><xs,x0>
  (x0) =
if
gseq_forall<pf><xs,x0>(x0)
then () else $raise False(*void*)
//
in
try
let
val () =
gseq_foreach<pf><xs,x0>(xs)
in true end with ~False() => false
end // end of [let]
end // end of [local]
*)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_foreach(xs) =
let
//
impltmp
gseq_forall$test<pf><xs,x0>(x0) =
let
val () =
gseq_foreach$work<pf><xs,x0>(x0) in true
end // end of [let]
//
in
  ignoret(gseq_forall<pf><xs,x0>(xs))
end // end of [let]
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}
gseq_rforall(xs) =
(
loop
(gseq_rlistize<pf><xs,x0>(xs))
) where
{
fun
free
( xs
: list0_vt(x0)): void =
(
case xs of
| ~list0_vt_nil() => ()
| ~list0_vt_cons(x0, xs) => free(xs)
)
fun
loop
(xs: list0_vt(x0)): bool =
(
case+ xs of
| ~list0_vt_nil() => tt
| ~list0_vt_cons(x0, xs) =>
  if
  gseq_rforall$test<pf><xs,x0>(x0)
  then loop(xs)
  else let val () = free(xs) in ff end
)
} (* end of [gseq_rforall] *)

(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_rexists(xs) =
(
if
gseq_rforall<pf><xs,x0>(xs) then ff else tt
) where
{
//
impltmp
gseq_rforall$test<pf><xs,x0>(x0) = 
(
if
gseq_rexists$test<pf><xs,x0>(x0) then ff else tt
)
//
} (* end of [gseq_rexists] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_rforeach(xs) =
let
//
impltmp
gseq_rforall$test<pf><xs,x0>(x0) =
let
val () =
gseq_rforeach$work<pf><xs,x0>(x0) in true
end // end of [let]
//
in
  ignoret(gseq_rforall<pf><xs,x0>(xs))
end // end of [gseq_rforeach]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
gseq_foldleft
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
impltmp
gseq_foreach$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let
val () = gseq_foreach<pf><xs,x0>(xs) in rr
end
end // end of [gseq_foldleft]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
gseq_foldright
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
impltmp
gseq_rforeach$work<pf><xs,x0>
  (x0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
gseq_foldright$fopr<pf><xs,x0><r0>(x0, r0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let val () = gseq_rforeach<pf><xs,x0>(xs) in rr end
end // end of [gseq_foldright]
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_iforall(xs) =
(
gseq_forall<pf><xs,x0>(xs)
) where
{
//
var i0: int = 0
val p0 = addr@(i0)
//
impltmp
gseq_forall$test<pf><xs,x0>
  (x0) =
(
gseq_iforall$test<pf><xs,x0>(i0, x0)
) where
{
val i0 = $UN.ptr0_get<int>(p0)
val () = $UN.ptr0_set<int>(p0, succ(i0))
} (* end of [where] *)
//
} (* end of [gseq_iforall] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_iexists(xs) =
(
if
gseq_iforall<pf><xs,x0>(xs) then ff else tt
) where
{
//
impltmp
gseq_iforall$test<pf><xs,x0>(i0, x0) = 
(
if
gseq_iexists$test<pf><xs,x0>(i0, x0) then ff else tt
)
//
} (* end of [gseq_iexists] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}
gseq_iforeach(xs) =
(
ignoret
(gseq_iforall<pf><xs,x0>(xs))
) where
{
//
impltmp
gseq_iforall$test<pf><xs,x0>(i0, x0) =
let
val () =
gseq_iforeach$work<pf><xs,x0>(i0, x0) in true
end // end of [let]
//
} (* end of [gseq_iforeach] *)
//
(* ****** ****** *)
//
impltmp
{pf}
{xs,x0}{r0}
gseq_ifoldleft
  (xs, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
impltmp
gseq_iforeach$work<pf><xs,x0>
  (i0, x0) = () where
{
val r0 = $UN.ptr0_get<r0>(p0)
val r0 =
gseq_ifoldleft$fopr<pf><xs,x0><r0>(r0, i0, x0)
val () = $UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let val () = gseq_iforeach<pf><xs,x0>(xs) in rr end
end // end of [gseq_ifoldleft]
//
(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_map_list(xs) = let
//
vtypedef p0 = ptr
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><p0>
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
{vt:vtbox}(vt):<fun>(ptr)
//
val y0 =
gseq_map$fopr<pf><xs,x0><y0>(x0)
//
val ys =
list0_vt_cons(y0, _(*r1*))
val+
list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldleft<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [gseq_map_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_map_rlist(xs) =
(
gseq_foldleft<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) =
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 = gseq_map$fopr<pf><xs,x0><y0>(x0)
} (* gseq_foldleft$fopr *)
} (* end of [gseq_map_rlist] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_map_stream(xs) =
(
stream_vt_map<x0><y0>(xs)
) where
{
//
val xs = gseq_streamize<pf><xs,x0>(xs)
//
impltmp
stream_vt_map$fopr<x0><y0>(x0) = gseq_map$fopr<pf><xs,x0><y0>(x0)
//
} (* end of [gseq_map_stream] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imap_list(xs) = let
//
var i0 = (0:int)
val pi = addr@(i0)
//
vtypedef p0 = ptr
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><p0>
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
{vt:vtbox}(vt):<fun>(ptr)
//
val i0 =
$UN.ptr0_get<int>(pi)
val () =
$UN.ptr0_set<int>(pi, i0+1)
val y0 =
gseq_imap$fopr<pf><xs,x0><y0>(i0, x0)
//
val ys =
list0_vt_cons(y0, _(*r1*))
val+
list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldleft<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [gseq_imap_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imap_rlist(xs) =
(
gseq_foldleft<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
var i0 = (0:int)
val pi = addr@(i0)
//
vtypedef r0 = list0_vt(y0)
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>
  (r0, x0) =
( list0_vt_cons(y0, r0) ) where
{
  val i0 = $UN.ptr0_get<int>(pi)
  val () = $UN.ptr0_set<int>(pi, i0+1)
  val y0 = gseq_imap$fopr<pf><xs,x0><y0>(i0, x0)
} (* gseq_foldleft$fopr *)
} (* end of [gseq_imap_rlist] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imap_stream(xs) =
(
stream_vt_imap<x0><y0>(xs)
) where
{
//
val xs = gseq_streamize<pf><xs,x0>(xs)
//
impltmp
stream_vt_imap$fopr<x0><y0>(i0, x0) = gseq_imap$fopr<pf><xs,x0><y0>(i0, x0)
//
} (* end of [gseq_imap_stream] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_mapopt_list(xs) = let
//
vtypedef p0 = ptr
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><p0>
  (p0, x0) =
(
let
val
test = gseq_mapopt$test<pf><xs,x0>(x0)
//
in(*in-of-let*)
//
if
test
then
(
addr@(r1)
) where
{
//
extern
praxi
_assert_
{vw:view}(vw):<prf> void
extern
castfn
_castfn_
{vt:vtbox}(vt):<fun>(ptr)
//
val y0 =
gseq_mapopt$fopr<pf><xs,x0><y0>(x0)
//
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
} else (p0) // end of [if]
//
end // end-of-let
) (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldleft<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [gseq_mapopt_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_mapopt_rlist(xs) =
(
gseq_foldleft<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><r0>(r0, x0) =
(
let
val
test =
gseq_mapopt$test<pf><xs,x0>(x0)
in
if
test
then 
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 = gseq_mapopt$fopr<pf><xs,x0><y0>(x0)
} else r0 // end of [if]
end // end-of-let
) // end of [gseq_foldleft$fopr]
//
} (* end of [gseq_mapopt_rlist] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_mapopt_stream(xs) =
(
stream_vt_mapopt<x0><y0>(xs)
) where
{
//
val xs = gseq_streamize<pf><xs,x0>(xs)
//
impltmp
stream_vt_mapopt$test<x0>(x0) = gseq_mapopt$test<pf><xs,x0>(x0)
impltmp
stream_vt_mapopt$fopr<x0><y0>(x0) = gseq_mapopt$fopr<pf><xs,x0><y0>(x0)
//
} (* end of [gseq_mapopt_stream] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imapopt_list(xs) = let
//
var i0 = (0:int)
val pi = addr@(i0)
//
vtypedef p0 = ptr
//
impltmp
gseq_foldleft$fopr<pf><xs,x0><p0>
  (p0, x0) =
(
let
//
val i0 =
$UN.ptr0_get<int>(pi)
val () =
$UN.ptr0_set<int>(pi, i0+1)
//
val
test =
gseq_imapopt$test<pf><xs,x0>(i0, x0)
//
in(*in-of-let*)
//
if
test
then
(
addr@(r1)
) where
{
//
extern
praxi
_assert_
{vw:view}(vw):<prf> void
extern
castfn
_castfn_
{vt:vtbox}(vt):<fun>(ptr)
//
val y0 =
gseq_imapopt$fopr<pf><xs,x0><y0>
  (i0, x0)
//
val ys =
list0_vt_cons(y0, _(*r1*))
val+
list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} else (p0) // end of [if]
//
end // end-of-let
) (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldleft<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [gseq_imapopt_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imapopt_rlist(xs) =
(
gseq_ifoldleft<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
gseq_ifoldleft$fopr<pf><xs,x0><r0>
  (r0, i0, x0) =
(
let
val
test =
gseq_imapopt$test<pf><xs,x0>(i0, x0)
in(* in-of-let *)
if
test
then 
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 =
  gseq_imapopt$fopr<pf><xs,x0><y0>(i0, x0)
} else r0 // end of [if]
end // end-of-let
) // end of [gseq_foldleft$fopr]
//
} (* end of [gseq_imapopt_rlist] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_imapopt_stream(xs) =
(
stream_vt_imapopt<x0><y0>(xs)
) where
{
//
val xs = gseq_streamize<pf><xs,x0>(xs)
//
impltmp
stream_vt_imapopt$test<x0>(i0, x0) = gseq_imapopt$test<pf><xs,x0>(i0, x0)
impltmp
stream_vt_imapopt$fopr<x0><y0>(i0, x0) = gseq_imapopt$fopr<pf><xs,x0><y0>(i0, x0)
//
} (* end of [gseq_imapopt_stream] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_rmap_list(xs) = let
//
vtypedef p0 = ptr
//
impltmp
gseq_foldright$fopr<pf><xs,x0><p0>
  (x0, p0) =
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
{vt:vtbox}(vt):<fun>(ptr)
//
val y0 =
gseq_rmap$fopr<pf><xs,x0><y0>(x0)
val ys =
list0_vt_cons(y0, _(*r1*))
val+
list0_vt_cons(y0, r1) = ys
//
val ys = _castfn_(ys)
val () =
$UN.ptr0_set<ptr>(p0, ys)
//
prval () = _assert_(view@y0)
prval () = _assert_(view@r1)
//
} (* end of [gseq_foldright$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_foldright<pf><xs,x0><p0>(xs, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(y0)}(r0)
end (* end of [gseq_rmap_list] *)

(* ****** ****** *)

impltmp
{pf}
{xs,x0}{y0}
gseq_rmap_rlist(xs) =
(
gseq_foldright<pf><xs,x0><r0>
  (xs, list0_vt_nil())
) where
{
//
vtypedef r0 = list0_vt(y0)
//
impltmp
gseq_foldright$fopr<pf><xs,x0><r0>(x0, r0) =
(
  list0_vt_cons(y0, r0)
) where
{
  val y0 = gseq_rmap$fopr<pf><xs,x0><y0>(x0)
} (* gseq_foldright$fopr *)
} (* end of [gseq_rmap_rlist] *)

(* ****** ****** *)
//
// HX-2019-05-28: zipping
//
(* ****** ****** *)

impltmp
{px}
{py}
{xs,x0}
{ys,y0}
gseq_z2forall
  (xs, ys) =
(
let
val xs =
gseq_streamize<px><xs,x0>(xs)
val ys =
gseq_streamize<py><ys,y0>(ys)
in
(
stream_vt_z2forall<x0,y0>(xs, ys)
) where
{
impltmp
stream_vt_z2forall$test<x0,y0>
(x0, y0) =
gseq_z2forall$test<px><py><xs,x0><ys,y0>(x0, y0)
}
end
) (* end of [gseq_z2forall] *)

(* ****** ****** *)
//
impltmp
{px}
{py}
{xs,x0}
{ys,y0}
gseq_z2foreach(xs, ys) =
let
//
impltmp
gseq_z2forall$test<px><py><xs,x0><ys,y0>(x0, y0) =
let
val () =
gseq_z2foreach$work<px><py><xs,x0><ys,y0>(x0, y0) in true
end // end of [let]
//
in
  ignoret(gseq_z2forall<px><py><xs,x0><ys,y0>(xs, ys))
end // end of [let]
//
(* ****** ****** *)
//
impltmp
{px}
{py}
{xs,x0}
{ys,y0}{r0}
gseq_z2foldleft
  (xs, ys, r0) = let
//
var rr: r0 = r0
val p0 = addr@(rr)
//
impltmp
gseq_z2foreach$work<px><py><xs,x0><ys,y0>
  (x0, y0) = () where
{
val r0 =
$UN.ptr0_get<r0>(p0)
val r0 =
gseq_z2foldleft$fopr<px><py><xs,x0><ys,y0><r0>(r0, x0, y0)
val () =
$UN.ptr0_set<r0>(p0, r0)
} (* end of [where] *)
//
in
let val () = gseq_z2foreach<px><py><xs,x0><ys,y0>(xs, ys) in rr end
end // end of [gseq_z2foldleft]
//
(* ****** ****** *)

impltmp
{px}
{py}
{xs,x0}
{ys,y0}{u0}
gseq_z2map_list
  (xs, ys) = let
//
vtypedef p0 = ptr
//
impltmp
gseq_z2foldleft$fopr<px><py><xs,x0><ys,y0><p0>
  (p0, x0, y0) =
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
{vt:vtbox}(vt):<fun>(ptr)
//
val u0 =
gseq_z2map$fopr<px><py><xs,x0><ys,y0><u0>
  (x0, y0)
val us =
list0_vt_cons(u0, _(*r1*))
val+
list0_vt_cons(u0, r1) = us
//
val us = _castfn_(us)
val () =
$UN.ptr0_set<ptr>(p0, us)
//
prval () = _assert_(view@u0)
prval () = _assert_(view@r1)
//
} (* end of [gseq_foldleft$fopr] *)
//
var r0: ptr?
val p0 = addr@(r0)
val p1 =
gseq_z2foldleft<px><py><xs,x0><ys,y0><p0>(xs, ys, p0)
//
in
  $UN.ptr0_set
  (p1, list0_vt_nil()); $UN.castvwtp0{list0_vt(u0)}(r0)
end (* end of [gseq_z2map_list] *)

(* ****** ****** *)

impltmp
{px}
{py}
{xs,x0}
{ys,y0}{u0}
gseq_z2map_rlist
  (xs, ys) =
let
//
vtypedef r0 = list0_vt(u0)
//
impltmp
gseq_z2foldleft$fopr<px><py><xs,x0><ys,y0><r0>
  (r0, x0, y0) =
(
  list0_vt_cons(u0, r0) ) where
{
  val u0 =
  gseq_z2map$fopr<px><py><xs,x0><ys,y0><u0>(x0, y0)
} (* gseq_foldleft$fopr *)
//
val r0 = list0_vt_nil((*void*))
//
in
  gseq_z2foldleft<px><py><xs,x0><ys,y0><r0>(xs, ys, r0)
end (* end of [gseq_z2map_rlist] *)

(* ****** ****** *)
//
// HX-2019-05-28: crossing
//
(* ****** ****** *)
//
impltmp
{px}
{py}
{xs,x0}
{ys,y0}
gseq_x2forall(xs, ys) =
(
  loop2(xs, ys)
) where
{
val xs =
gseq_listize<px><xs,x0>(xs)
val ys =
gseq_listize<py><ys,y0>(ys)
//
vtypedef xx = list0_vt(x0)
vtypedef yy = list0_vt(y0)
//
fun
loop1(x0: x0, yy: !yy): bool =
(
case+ yy of
| list0_vt_nil() => true
| list0_vt_cons(y0, yy) =>
  (
  if
  test
  then loop1(x0, yy) else false
  ) where
  {
    val
    test =
    gseq_x2forall$test<px><py><xs,x0><ys,y0>(x0, y0)
  } (* end of [list0_vt_cons] *)
)
fun
loop2(xx: xx, yy: yy): bool =
(
case+ xx of
| ~list0_vt_nil() =>
   let val () = list0_vt_free<y0>(yy) in true end
| ~list0_vt_cons(x0, xx) =>
   if
   loop1(x0, yy)
   then
   loop2(xx, yy)
   else
   (
   list0_vt_free<x0>(xx); list0_vt_free<y0>(yy); false
   ) (* list0_vt_cons *)
)
} (* end of [gseq_x2forall] *)
//
(* ****** ****** *)
//
impltmp
{px}
{py}
{xs,x0}
{ys,y0}
gseq_x2foreach(xs, ys) =
let
//
impltmp
gseq_x2forall$test<px><py><xs,x0><ys,y0>(x0, y0) =
true where
{
  val () =
  gseq_x2foreach$work<px><py><xs,x0><ys,y0>(x0, y0)
} (* end of [let] *)
//
in
  ignoret(gseq_x2forall<px><py><xs,x0><ys,y0>(xs, ys))
end // end of [let]
//
(* ****** ****** *)

(* end of [gseq.dats] *)
