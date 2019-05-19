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
(x0:tflt)
gseq_iseqz<list0(x0)><x0>
  (xs) =
(
  list0_iseqz<>{x0}(xs)
) (* end of [gseq_iseqz] *)
implement
(x0:tflt)
gseq_isneqz<list0(x0)><x0>
  (xs) =
(
  list0_isneqz<>{x0}(xs)
) (* end of [gseq_isneqz] *)
implement
(x0:tflt)
gseq_length<list0(x0)><x0>
  (xs) =
(
  list0_length<x0>(xs)
) (* end of [gseq_length] *)

(* ****** ****** *)
//
implement
(x0:tflt)
gseq_listize<list0(x0)><x0>
  (xs) =
(
  list0_listize<x0>(xs)
) (* end of [gseq_listize] *)
implement
(x0:tflt)
gseq_rlistize<list0(x0)><x0>
  (xs) =
(
  list0_rlistize<x0>(xs)
) (* end of [gseq_rlistize] *)
implement
(x0:tflt)
gseq_streamize<list0(x0)><x0>
  (xs) =
(
  list0_streamize<x0>(xs)
) (* end of [gseq_streamize] *)
//
(* ****** ****** *)

implement
(x0:tflt)
gseq_forall<list0(x0)><x0>
  (xs) =
(
  list0_forall<x0>(xs)
) where
{
implement
list0_forall$test<x0>(x0) = gseq_forall$test<x0>(x0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

implement
(x0:tflt)
gseq_foreach<list0(x0)><x0>
  (xs) =
(
  list0_foreach<x0>(xs)
) where
{
implement
list0_foreach$work<x0>(x0) = gseq_foreach$work<x0>(x0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

implement
(x0:tflt)
gseq_rforall<list0(x0)><x0>
  (xs) =
(
  list0_rforall<x0>(xs)
) where
{
implement
list0_rforall$test<x0>(x0) = gseq_rforall$test<x0>(x0)
} (* end of [gseq_rforall] *)

(* ****** ****** *)

implement
(x0:tflt
,r0:vtflt)
gseq_foldleft<list0(x0)><x0><r0>
  (xs, r0) =
(
  list0_foldleft<x0><r0>(xs, r0)
) where
{
implement
list0_foldleft$fopr<x0><r0>(r0, x0) = gseq_foldleft$fopr<x0><r0>(r0, x0)
} (* end of [gseq_foldleft] *)

(* ****** ****** *)

(* end of [gseq_list0.dats] *)
