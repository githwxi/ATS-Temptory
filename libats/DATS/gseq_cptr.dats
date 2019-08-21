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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/range.sats"

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_forall<
gseq><CPTR2(x0),x0>
(CPTR2) =
(
  cptr0_forall<x0>(cp0, cp1)
) where
{
//
val cp0 = CPTR2_range$beg<x0>()
val cp1 = CPTR2_range$end<x0>()
//
impltmp
cptr0_forall$test<x0>(x0) =
  gseq_forall$test<gseq><CPTR2(x0),x0>(x0)
//
} (* gseq_forall<CPTR2(x0),x0> *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_foreach<
gseq><CPTR2(x0),x0>
(CPTR2) =
(
  cptr0_foreach<x0>(cp0, cp1)
) where
{
//
val cp0 = CPTR2_range$beg<x0>()
val cp1 = CPTR2_range$end<x0>()
//
impltmp
cptr0_foreach$work<x0>(x0) =
  gseq_foreach$work<gseq><CPTR2(x0),x0>(x0)
//
} (* gseq_foreach<CPTR2(x0),x0> *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_forall<
gseq><CPTR2(x0),cptr(x0)>
(
  CPTR2
) =
( CPTR2_forall<x0>() ) where
{
impltmp
CPTR2_forall$test<x0>(cp) =
  gseq_forall$test<gseq><CPTR2(x0),cptr(x0)>(cp)
} (* gseq_forall<CPTR2(x0),cptr(x0)> *)

(* ****** ****** *)

(* end of [gseq_cptr.dats] *)
