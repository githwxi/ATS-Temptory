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
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_length(!xs): (int)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_listize
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_rlistize
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_streamize
  (xs: xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_listize1
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_rlistize1
  (xs: xs): list0_vt(x0)
fun
{xs:vtflt}
{x0:vtflt}
glseq_streamize1
  (xs: xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_forall0(xs): bool
fun
{x0:vtflt}
glseq_forall0$test(x0): bool
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_exists0(xs): bool
fun
{x0:vtflt}
glseq_exists0$test(x0): bool
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_foreach0(xs): void
fun
{x0:vtflt}
glseq_foreach0$work(x0): void
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
{r0:vtflt}
glseq_foldleft0(xs, r0): r0
fun
{x0:vtflt}
{r0:vtflt}
glseq_foldleft0$fopr(r0, x0): r0
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
{r0:vtflt}
glseq_foldright0(xs, r0): r0
fun
{x0:vtflt}
{r0:vtflt}
glseq_foldright0$fopr(x0, r0): r0
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_iforall0(xs): bool
fun
{x0:vtflt}
glseq_iforall0$test(int, x0): bool
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_iexists0(xs): bool
fun
{x0:vtflt}
glseq_iexists0$test(int, x0): bool
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_iforeach0(xs): void
fun
{x0:vtflt}
glseq_iforeach0$work(int, x0): void
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_forall1(!xs): bool
fun
{x0:vtflt}
glseq_forall1$test(!x0): bool
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_exists1(!xs): bool
fun
{x0:vtflt}
glseq_exists1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_foreach1(!xs): void
fun
{x0:vtflt}
glseq_foreach1$work(!x0): void
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
{r0:vtflt}
glseq_foldleft1(!xs, r0): r0
fun
{x0:vtflt}
{r0:vtflt}
glseq_foldleft1$fopr(r0, !x0): r0
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
{r0:vtflt}
glseq_foldright1(!xs, r0): r0
fun
{x0:vtflt}
{r0:vtflt}
glseq_foldright1$fopr(!x0, r0): r0
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_rforall1(!xs): bool
fun
{x0:vtflt}
glseq_rforall1$test(!x0): bool
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_rforeach1(!xs): void
fun
{x0:vtflt}
glseq_rforeach1$work(!x0): void
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
glseq_iforall1(!xs): bool
fun
{x0:vtflt}
glseq_iforall1$test(int, !x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
glseq_map1$fopr(!x0): (y0)
fun
{x0:vtflt}
{y0:vtflt}
glseq_imap1$fopr(int, !x0): (y0)
//
(* ****** ****** *)
//
fun
{xs:vtflt}
{x0:vtflt}
{y0:vtflt}
glseq_map1_list(!xs): list0_vt(y0)
fun
{xs:vtflt}
{x0:vtflt}
{y0:vtflt}
glseq_map1_rlist(!xs): list0_vt(y0)
//
(* ****** ****** *)
//
// HX-2019-05-12: for customization
//
(* ****** ****** *)
(*
#define
glseq_forall glseq_forall0
#define
glseq_forall$test glseq_forall0$test
#define
glseq_exists glseq_exists0
#define
glseq_exists$test glseq_exists0$test
*)
(* ****** ****** *)
(*
#define
glseq_foreach glseq_foreach0
#define
glseq_foreach$work glseq_foreach0$work
*)
//
(* ****** ****** *)
//
(*
#define
glseq_foldleft glseq_foldleft0
#define
glseq_foldleft$fopr glseq_foldleft0$fopr
#define
glseq_foldright glseq_foldright0
#define
glseq_foldright$fopr glseq_foldright0$fopr
*)
//
(* ****** ****** *)

(* end of [glseq.sats] *)
