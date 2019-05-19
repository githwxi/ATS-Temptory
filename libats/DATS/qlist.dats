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
