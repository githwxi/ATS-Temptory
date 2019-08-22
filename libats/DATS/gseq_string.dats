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
#staload "./../SATS/glseq.sats"
#staload "./../SATS/string.sats"

(* ****** ****** *)

typedef c0 = char
typedef cs = string

(* ****** ****** *)

impltmp
gseq_streamize<gseq><cs,c0>
  (cs) =
(
  string0_streamize<>(cs)
) // end of [gseq_streamize]

(* ****** ****** *)

impltmp
gseq_forall<gseq><cs,c0>
  (cs) =
(
  string0_forall<>(cs)
) where
{
impltmp
string0_forall$test<>(c0) =
  gseq_forall$test<gseq><cs,c0>(c0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
gseq_foreach<gseq><cs,c0>
  (cs) =
(
  string0_foreach<>(cs)
) where
{
impltmp
string0_foreach$work<>(c0) =
  gseq_foreach$work<gseq><cs,c0>(c0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

impltmp
gseq_rforall<gseq><cs,c0>
  (cs) =
(
  string0_rforall<>(cs)
) where
{
impltmp
string0_rforall$test<>(c0) =
  gseq_rforall$test<gseq><cs,c0>(c0)
} (* end of [gseq_rforall] *)

(* ****** ****** *)

impltmp
gseq_rforeach<
gseq><cs,c0>
  (cs) =
(
  string0_rforeach<>(cs)
) where
{
impltmp
string0_rforeach$work<>(c0) =
  gseq_rforeach$work<gseq><cs,c0>(c0)
} (* end of [gseq_rforeach] *)

(* ****** ****** *)
//
impltmp
{}(*tmp*)
string0_size(cs) =
(
$effmask_all
(gseq_size<gseq><string,char>(cs))
)
impltmp
{}(*tmp*)
string0_length(cs) =
(
$effmask_all
(gseq_length<gseq><string,char>(cs))
)
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
string0_indexof(cs, c0) =
(
$effmask_all
(gseq_indexof<gseq><string,char>(cs, c0))
)
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
string0_listize
  (cs) =
(
  gseq_listize<gseq><string,char>(cs)
) (* end of [string0_listize] *)
impltmp
{}(*tmp*)
string0_rlistize
  (cs) =
(
  gseq_rlistize<gseq><string,char>(cs)
) (* end of [string0_rlistize] *)

(* ****** ****** *)

impltmp
{r0}(*tmp*)
string0_foldleft
  (cs, r0) =
(
gseq_foldleft<
gseq><cs,c0>(cs, r0)
) where
{
impltmp
gseq_foldleft$fopr<gseq><cs,c0><r0>(r0, c0) = string0_foldleft$fopr<r0>(r0, c0)
} (* end of [string0_foldleft] *)
impltmp
{r0}(*tmp*)
string0_foldright
  (cs, r0) =
(
gseq_foldright<gseq><cs,c0>(cs, r0)
) where
{
impltmp
gseq_foldright$fopr<gseq><cs,c0><r0>(c0, r0) = string0_foldright$fopr<r0>(c0, r0)
} (* end of [string0_foldright] *)

(* ****** ****** *)

impltmp
{r0}(*tmp*)
string0_ifoldleft
  (cs, r0) =
(
gseq_ifoldleft<gseq><cs,c0>(cs, r0)
) where
{
impltmp
gseq_ifoldleft$fopr<gseq><cs,c0><r0>(r0, i0, c0) =
  string0_ifoldleft$fopr<r0>(r0, i0, c0)
} (* end of [string0_ifoldleft] *)


(* end of [gseq_string.dats] *)
