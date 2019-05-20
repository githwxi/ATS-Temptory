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

#define tt true
#define ff false

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
"libats/SATS/qlist.sats"
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
#staload "./../SATS/qlistref.sats"
//
(* ****** ****** *)

local

(* ****** ****** *)
//
absimpl
qlistref_vtflt_tbox
  (a:vtflt) = ref(qlist(a))
//
(* ****** ****** *)

in (*in-of-local*)

(* ****** ****** *)
//
implement
{}(*tmp*)
qlistref_nil
  {a}((*void*)) =
  ref<qlist(a)>(qlist_nil())
implement
{}(*tmp*)
qlistref_make_nil
  {a}((*void*)) =
  ref<qlist(a)>(qlist_nil())
//
(* ****** ****** *)

implement
{a}(*tmp*)
qlistref_sing(x0) =
let
  val qrf = qlistref_nil<>()
in
  qlistref_insert<a>(qrf, x0); qrf
end // end of [qlistref_sing]

(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_iseqz
  (qrf) =
(
$effmask_ref
(qlist_iseqz<>(!p0))
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
} (* end of [qlistref_iseqz] *)
//
implement
{a}(*tmp*)
qlistref_isneqz
  (qrf) =
(
$effmask_ref
(qlist_isneqz<>(!p0))
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
} (* end of [qlistref_isneqz] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_size
  (qrf) =
(
i2sz
(
$effmask_ref
(qlist_length<a>(!p0))
)
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
} (* end of [qlistref_length] *)  
implement
{a}(*tmp*)
qlistref_length
  (qrf) =
(
$effmask_ref
(qlist_length<a>(!p0))
) where
{
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
} (* end of [qlistref_length] *)  
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_insert
  (qrf, x0) = () where
{
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
val xs = !p0
val () =
  (!p0 := xs) where
{
  val () =
  $effmask_ref
  (qlist_insert<a>(xs, x0))
}
//
} (* end of [qlistref_insert] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_takeout
  (qrf) = let
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
in
let
var x0: a?
val-tt =
$effmask_ref
(
qlist_takeout<a>(!p0, x0)
)
in
let
prval () = opt_unsome{a}(x0) in x0
end
end
end (* end of [qlistref_takeout] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_takeout_opt
  (qrf) = let
//
val
(
vbox(pf) | p0
) = ref_vptrof(qrf)
//
in
//
$effmask_ref
(qlist_takeout_opt<a>(!p0))
//
end (* end of [qlistref_takeout_opt] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
qlistref_takeout_all
  (qrf) = let
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
in
$effmask_ref
(qlist_takeout_all<a>(!p0))
end (* end of [qlistref_takeout_all] *)
//
(* ****** ****** *)
//
implement
{x0}(*tmp*)
qlistref_forall1
  (qrf) = let
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
in
$effmask_ref
(
  qlist_forall1<x0>(!p0)
) where
{
implement
qlist_forall1$test<x0>
  (x0) =
  qlistref_forall1$test<x0>(x0)
}
end // end of [qlistref_forall1]
//
implement
{x0}(*tmp*)
qlistref_foreach1
  (qrf) = let
//
val
(vbox(pf)|p0) = ref_vptrof(qrf)
//
in
$effmask_ref
(
  qlist_foreach1<x0>(!p0)
) where
{
implement
qlist_foreach1$work<x0>
  (x0) =
  qlistref_foreach1$work<x0>(x0)
}
end // end of [qlistref_foreach1]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
{x0}(*tmp*)
qlistref_print(qrf) =
(
qlistref_print$beg<>();
qlistref_foreach1<x0>(qrf);
qlistref_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
implement
qlistref_foreach1$work<x0>
  (x0) = () where
{
  val i0 = !p0
  val () = !p0 := i0 + 1
  val () =
  ( if
    (i0 > 0)
    then
    qlistref_print$sep<>()
  ) (* end of [if] *)
  val () = print$val<x0>(x0)
} (* end of [where] *)
} (* end of [qlistref_print] *)

(* ****** ****** *)
//
implement
qlistref_print$beg<>() = print("(")
implement
qlistref_print$end<>() = print(")")
implement
qlistref_print$sep<>() = print(",")
//
(* ****** ****** *)
//
implement
(x0:tflt)
glseq_forall1<qlistref(x0)><x0>
  (qrf) =
(
  qlistref_forall1<x0>(qrf)
) where
{
implement
qlistref_forall1$test<x0>(x0) = glseq_forall1$test<x0>(x0)
}
//
implement
(x0:tflt)
glseq_foreach1<qlistref(x0)><x0>
  (qrf) =
(
  qlistref_foreach1<x0>(qrf)
) where
{
implement
qlistref_foreach1$work<x0>(x0) = glseq_foreach1$work<x0>(x0)
}
//
(* ****** ****** *)

(* end of [qlistref.dats] *)
