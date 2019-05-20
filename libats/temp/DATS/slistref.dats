(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

(* Author: Hongwei Xi *)
(* Start time: November, 2016 *)
(* Authoremail: gmmhwxiATgmailDOTcom *)

(* ****** ****** *)
  
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gref.sats"
#staload
"libats/SATS/bool.sats"
#staload
"libats/SATS/gseq.sats"
#staload
"libats/SATS/glseq.sats"
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/list_vt.sats"

#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)
//
#staload "./../SATS/slistref.sats"
//
(* ****** ****** *)
//
sexpdef
slist =
lam(a:vtflt) => list0_vt(a)
//
(* ****** ****** *)

local

(* ****** ****** *)
//
absimpl
slistref_vtflt_tbox
  (a:vtflt) = ref(slist(a))
//
(* ****** ****** *)

in (*in-of-local*)

(* ****** ****** *)
//
implement
{}(*tmp*)
slistref_nil
  {a}((*void*)) =
  ref<slist(a)>(list0_vt_nil())
implement
{}(*tmp*)
slistref_make_nil
  {a}((*void*)) =
  ref<slist(a)>(list0_vt_nil())
//
(* ****** ****** *)

implement
{a}(*tmp*)
slistref_sing(x0) =
let
  val stk = slistref_nil<>()
in
  slistref_insert<a>(stk, x0); stk
end // end of [slistref_sing]

(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_iseqz
  (stk) =
  list0_vt_iseqz<>(!p0) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
} (* end of [slistref_iseqz] *)
//
implement
{a}(*tmp*)
slistref_isneqz
  (stk) =
  list0_vt_isneqz<>(!p0) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
} (* end of [slistref_isneqz] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_size
  (stk) =
(
i2sz
(list0_vt_length<a>(!p0))
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
} (* end of [slistref_length] *)  
implement
{a}(*tmp*)
slistref_length
  (stk) =
(
  list0_vt_length<a>(!p0)
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
} (* end of [slistref_length] *)  
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_insert
  (stk, x0) = () where
{
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
val xs = !p0
val () =
(!p0 := list0_vt_cons{a}(x0, xs))
//
} (* end of [slistref_insert] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_takeout
  (stk) = let
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
in
case- !p0 of
| ~list0_vt_cons(x0, xs) =>
   let val () = !p0 := xs in x0 end
//
end (* end of [slistref_takeout] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_takeout_opt
  (stk) = let
//
val
(
vbox(pf) | p0
) = ref_vptrof(stk)
//
in
//
case+ !p0 of
|  list0_vt_nil() =>
   optn0_vt_none()
| ~list0_vt_cons(x0, xs) =>
   let
     val () =
     !p0 := xs in optn0_vt_some(x0)
   end // end of [list0_vt_cons]
//
end (* end of [slistref_takeout_opt] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
slistref_takeout_all
  (stk) = let
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
in
  xs where
  {
  val xs = !p0
  val () = !p0 := list0_vt_nil()
  }
end (* end of [slistref_takeout_all] *)
//
(* ****** ****** *)
//
implement
{x0}(*tmp*)
slistref_forall1
  (stk) = let
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
in
$effmask_ref
(
  list0_vt_forall1<x0>(!p0)
) where
{
implement
list0_vt_forall1$test<x0>
  (x0) =
  slistref_forall1$test<x0>(x0)
}
end // end of [slistref_forall1]
//
implement
{x0}(*tmp*)
slistref_foreach1
  (stk) = let
//
val
(vbox(pf)|p0) = ref_vptrof(stk)
//
in
$effmask_ref
(
  list0_vt_foreach1<x0>(!p0)
) where
{
implement
list0_vt_foreach1$work<x0>
  (x0) =
  slistref_foreach1$work<x0>(x0)
}
end // end of [slistref_foreach1]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
{x0}(*tmp*)
slistref_print(stk) =
(
slistref_print$beg<>();
slistref_foreach1<x0>(stk);
slistref_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
implement
slistref_foreach1$work<x0>
  (x0) = () where
{
  val i0 = !p0
  val () = !p0 := i0 + 1
  val () =
  ( if
    (i0 > 0)
    then
    slistref_print$sep<>()
  ) (* end of [if] *)
  val () = print$val<x0>(x0)
} (* end of [where] *)
} (* end of [slistref_print] *)

(* ****** ****** *)
//
implement
slistref_print$beg<>() = print("(")
implement
slistref_print$end<>() = print(")")
implement
slistref_print$sep<>() = print(",")
//
(* ****** ****** *)
//
implement
(x0:tflt)
glseq_forall1<slistref(x0)><x0>
  (stk) =
(
  slistref_forall1<x0>(stk)
) where
{
implement
slistref_forall1$test<x0>(x0) = glseq_forall1$test<x0>(x0)
}
//
implement
(x0:tflt)
glseq_foreach1<slistref(x0)><x0>
  (stk) =
(
  slistref_foreach1<x0>(stk)
) where
{
implement
slistref_foreach1$work<x0>(x0) = glseq_foreach1$work<x0>(x0)
}
//
(* ****** ****** *)

(* end of [slistref.dats] *)
