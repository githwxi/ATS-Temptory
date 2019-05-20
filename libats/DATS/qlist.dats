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

#staload
UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/glseq.sats"
#staload "./../SATS/qlist.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload "./../SATS/print.sats"

(* ****** ****** *)

local

datavtype
qlist(a:vtflt+) =
| QLIST of (ptr0, ptr0)

absimpl
qlist_vtflt_vtbox(a) = qlist(a)

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
{}(*tmp*)
qlist_nil() =
(
QLIST(null, null)
) where
{
  val null = ptr0_null()
}
implement
{}(*tmp*)
qlist_make_nil() =
(
QLIST(null, null)
) where
{
  val null = ptr0_null()
}

(* ****** ****** *)

implement
{}(*tmp*)
qlist_iseqz(xs) =
(
case+ xs of
| QLIST(qf, qr) => iseqz(qf)
)
implement
{}(*tmp*)
qlist_isneqz(xs) =
(
case+ xs of
| QLIST(qf, qr) => isneqz(qf)
)

(* ****** ****** *)

implement
{a}(*tmp*)
qlist_insert
  (xs, x0) =
(
case+ xs of
|
@QLIST(qf, qr) =>
 let
   val r0 =
   list0_vt_cons(x0, _)
   val+
   list0_vt_cons(_, r1) = r0
   val rr = qr
   val () = (qr := addr@(r1))
   val () = (r1 := list0_vt_nil())
 in
   let
   prval () = fold@(r0)
   in
     let
     val r0 =
     $UN.castvwtp0{ptr}(r0)
     in
       if
       isneqz(rr)
       then
       $UN.ptr0_set<ptr>(rr, r0);
       if iseqz(qf) then qf := r0; fold@(xs);
     end
   end
 end // end of [QLIST]
)

(* ****** ****** *)

implement
{a}(*tmp*)
qlist_takeout_all
  (xs) =
(
case+ xs of
|
@QLIST(qf, qr) =>
 if
 iseqz(qf)
 then
 (fold@(xs); list0_vt_nil())
 else
 let
 val rf = qf
 val null = ptr0_null()
 in
   qf := null;
   qr := null; fold@(xs);
   $UN.castvwtp0{list0_vt(a)}(rf)
 end
) (* end of [qlist_takeout_all] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
qlist_remove
  (xs) =
(
let
val
opt =
qlist_takeout_opt<a>(xs)
in
case+ opt of
| ~optn0_vt_none() => ff
| ~optn0_vt_some(x0) => (gfree$val(x0); tt)
end // end of [qlist_remove]
)
//
implement
{a}(*tmp*)
qlist_takeout_opt
  (xs) =
(
case+ xs of
|
@QLIST(qf, qr) =>
 let
   val rx =
   $UN.castvwtp0
   {list0_vt(a)}(qf)
 in
   case+ rx of
   | ~list0_vt_nil() =>
      let
      prval () = fold@(xs) in optn0_vt_none()
      end
   | ~list0_vt_cons(x0, rx) =>
      let
        val rx =
        $UN.castvwtp0{ptr}(rx)
        val () =
        (qf := rx)
        val () =
        if iseqz(rx) then qr := rx(*null*)
      in
        let prval () = fold@(xs) in optn0_vt_some(x0) end
      end (* end of [list0_vt_cons] *)
 end
) (* end of [qlist_takeout_out] *)
//
(* ****** ****** *)
 
implement
(x0:tflt)
qlist_forall1<x0>
  (xs) =
(
let
prval () = $UN.cast2void(ys) in test
end
) where
{
//
val+QLIST(qf, qr) = xs
//
val ys =
$UN.castvwtp0(qf)
val test =
(
list0_vt_forall1<x0>(ys)
) where
{
implement
list0_vt_forall1$test<x0>(x0) = qlist_forall1$test<x0>(x0)
}
} (* end of [qlist_forall1] *)

(* ****** ****** *)

implement
(x0:tflt)
qlist_foreach1<x0>
  (xs) =
(
let
prval () = $UN.cast2void(ys) in test
end
) where
{
//
val+QLIST(qf, qr) = xs
//
val ys =
$UN.castvwtp0(qf)
val test =
(
list0_vt_foreach1<x0>(ys)
) where
{
implement
list0_vt_foreach1$work<x0>(x0) = qlist_foreach1$work<x0>(x0)
}
} (* end of [qlist_foreach1] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
{x0}(*tmp*)
qlist_print(xs) =
(
qlist_print$beg<>();
qlist_foreach1<x0>(xs);
qlist_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast
{ref(int)}(addr@i0)
//
implement
qlist_foreach1$work<x0>
  (x0) = () where
{
  val i0 = !p0
  val () = !p0 := i0 + 1
  val () =
  ( if
    (i0 > 0)
    then qlist_print$sep<>()
  ) (* end of [if] *)
  val () = print$val<x0>(x0)
} (* end of [where] *)
} (* end of [qlist_print] *)

(* ****** ****** *)
//
implement
qlist_print$beg<>() = print("(")
implement
qlist_print$end<>() = print(")")
implement
qlist_print$sep<>() = print(",")
//
(* ****** ****** *)
//
implement
(x0:tflt)
glseq_forall1<qlist(x0)><x0>
  (xs) =
(
  qlist_forall1<x0>(xs)
) where
{
implement
qlist_forall1$test<x0>(x0) = glseq_forall1$test<x0>(x0)
}
//
(* ****** ****** *)
//
implement
(x0:tflt)
glseq_foreach1<qlist(x0)><x0>
  (xs) =
(
  qlist_foreach1<x0>(xs)
) where
{
implement
qlist_foreach1$work<x0>(x0) = glseq_foreach1$work<x0>(x0)
}
//
(* ****** ****** *)

(* end of [qlist.dats] *)
