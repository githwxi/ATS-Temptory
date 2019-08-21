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

impltmp
{}(*tmp*)
qlist_nil() =
(
QLIST(null, null)
) where
{
  val null = ptr0_null()
}
impltmp
{}(*tmp*)
qlist_make_nil() =
(
QLIST(null, null)
) where
{
  val null = ptr0_null()
}

(* ****** ****** *)

impltmp
{}(*tmp*)
qlist_iseqz(xs) =
(
case+ xs of
| QLIST(qf, qr) => iseqz(qf)
)
impltmp
{}(*tmp*)
qlist_isneqz(xs) =
(
case+ xs of
| QLIST(qf, qr) => isneqz(qf)
)

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
qlist_size(xs) =
(
i2sz
(qlist_length<a>(xs))
)
impltmp
{a}(*tmp*)
qlist_length(xs) =
(
case+ xs of
| QLIST(qf, qr) =>
  let
    val rf =
    $UN.castvwtp0{list0_vt(a)}(qf)
    val n0 = list0_vt_length<a>(rf)
  in
    let prval () = $UN.cast2void(rf) in n0 end
  end
)
//
(* ****** ****** *)

impltmp
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

impltmp
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
impltmp
{a}(*tmp*)
qlist_remove
  (xs) =
(
let
var res: a?
val
opt =
qlist_takeout<a>(xs, res)
in
//
if
opt
then
let
prval () =
opt_unsome{a}(res)
in
  gfree$val<a>(res); opt
end
else
let
prval () = opt_unnone{a}(res) in opt
end
//
end // end of [qlist_remove]
)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
qlist_takeout
  (xs, res) =
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
      prval () = fold@(xs)
      prval () = opt_none{a}(res) in ff
      end
   | ~list0_vt_cons(x0, rx) =>
      let
        val () =
        (res := x0)
        val rx =
        $UN.castvwtp0{ptr}(rx)
        val () =
        (qf := rx)
        val () =
        if iseqz(rx) then qr := rx(*0*)
      in
        let
        prval () = fold@(xs)
        prval () = opt_some{a}(res) in tt
        end
      end (* end of [list0_vt_cons] *)
 end
) (* end of [qlist_takeout_out] *)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
qlist_takeout_opt
  (xs) = let
//
var res: a?
//
val
found =
qlist_takeout<a>(xs, res)
//
in (* in-of-let *)
//
if
found
then
(
optn0_vt_some{a}(res)
) where
{ prval () = opt_unsome{a}(res) }
else
(
optn0_vt_none{a}((*void*))
) where
{ prval () = opt_unnone{a}(res) }
//
end (* end of [qlist_takeout_out] *)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
qlist_free(xs) =
list0_vt_free<a>
(qlist_freeout<a>(xs))
impltmp
{a}(*tmp*)
qlist_freeout(xs) =
(
case+ xs of
| ~QLIST(qf, qr) =>
   $UN.castvwtp0{list0_vt(a)}(qf)
) (* end of [qlist_freeout] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
qlist_forall0<x0>
  (xs) =
(
list0_vt_forall0<x0>(qlist_freeout<x0>(xs))
) where
{
impltmp
list0_vt_forall0$test<x0>(x0) = qlist_forall0$test<x0>(x0)
}
impltmp
(x0:vtflt)
qlist_foreach0<x0>
  (xs) =
(
list0_vt_foreach0<x0>(qlist_freeout<x0>(xs))
) where
{
impltmp
list0_vt_foreach0$work<x0>(x0) = qlist_foreach0$work<x0>(x0)
}

(* ****** ****** *)

impltmp
(x0:vtflt)
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
impltmp
list0_vt_forall1$test<x0>(x0) = qlist_forall1$test<x0>(x0)
}
} (* end of [qlist_forall1] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
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
impltmp
list0_vt_foreach1$work<x0>(x0) = qlist_foreach1$work<x0>(x0)
}
} (* end of [qlist_foreach1] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

impltmp
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
impltmp
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
impltmp
qlist_print$beg<>() = print("(")
impltmp
qlist_print$end<>() = print(")")
impltmp
qlist_print$sep<>() = print(",")
//
(* ****** ****** *)
//
impltmp
(x0:vtflt)
glseq_forall0<
glseq><qlist(x0),x0>
  (xs) =
(
  qlist_forall0<x0>(xs)
) where
{
impltmp
qlist_forall0$test<x0>(x0) =
glseq_forall0$test<glseq><qlist(x0),x0>(x0)
}
//
(* ****** ****** *)
//
impltmp
(x0:vtflt)
glseq_foreach0<
glseq><qlist(x0),x0>
  (xs) =
(
  qlist_foreach0<x0>(xs)
) where
{
impltmp
qlist_foreach0$work<x0>(x0) =
glseq_foreach0$work<glseq><qlist(x0),x0>(x0)
}
//
(* ****** ****** *)
//
impltmp
(x0:vtflt)
glseq_forall1<
glseq><qlist(x0),x0>
  (xs) =
(
  qlist_forall1<x0>(xs)
) where
{
impltmp
qlist_forall1$test<x0>(x0) =
glseq_forall1$test<glseq><qlist(x0),x0>(x0)
}
//
(* ****** ****** *)
//
impltmp
(x0:vtflt)
glseq_foreach1<
glseq><qlist(x0),x0>
  (xs) =
(
  qlist_foreach1<x0>(xs)
) where
{
impltmp
qlist_foreach1$work<x0>(x0) =
glseq_foreach1$work<glseq><qlist(x0),x0>(x0)
}
//
(* ****** ****** *)

(* end of [qlist.dats] *)
