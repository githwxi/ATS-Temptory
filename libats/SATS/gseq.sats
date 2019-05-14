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
{xs:tflt}
{x0:tflt}
gseq_iseqz(xs): bool
fun
{xs:tflt}
{x0:tflt}
gseq_isneqz(xs): bool
fun
{xs:tflt}
{x0:tflt}
gseq_length(xs): (int)
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_indexof(xs, x0): int
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_listize
  (xs: xs): list0_vt(x0)
fun
{xs:tflt}
{x0:tflt}
gseq_rlistize
  (xs: xs): list0_vt(x0)
fun
{xs:tflt}
{x0:tflt}
gseq_streamize
  (xs: xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_forall(xs): bool
fun
{x0:tflt}
gseq_forall$test(x0): bool
//
fun
{xs:tflt}
{x0:tflt}
gseq_exists(xs): bool
fun
{x0:tflt}
gseq_exists$test(x0): bool
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_foreach(xs): void
fun
{x0:tflt}
gseq_foreach$work(x0): void
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_rforall(xs): bool
fun
{x0:tflt}
gseq_rforall$test(x0): bool
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_rforeach(xs): void
fun
{x0:tflt}
gseq_rforeach$work(x0): void
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
{r0:vtflt}
gseq_foldleft(xs, r0): r0
fun
{x0:tflt}
{r0:vtflt}
gseq_foldleft$fopr(r0, x0): r0
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
{r0:vtflt}
gseq_foldright(xs, r0): r0
fun
{x0:tflt}
{r0:vtflt}
gseq_foldright$fopr(x0, r0): r0
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_iforall(xs): bool
fun
{x0:tflt}
gseq_iforall$test(int, x0): bool
//
fun
{xs:tflt}
{x0:tflt}
gseq_iexists(xs): bool
fun
{x0:tflt}
gseq_iexists$test(int, x0): bool
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
gseq_iforeach(xs): void
fun
{x0:tflt}
gseq_iforeach$work(int, x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
gseq_map$fopr(x0): (y0)
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_map_list(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_map_rlist(xs): list0_vt(y0)
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_map_stream(xs): stream_vt(y0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
gseq_imap$fopr(int, x0): (y0)
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imap_list(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imap_rlist(xs): list0_vt(y0)
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imap_stream(xs): stream_vt(y0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
gseq_mapopt$fopr(x0): (y0)
fun
{x0:tflt}
gseq_mapopt$test(x0): bool
fun
{x0:tflt}
gseq_filter$test(x0): bool
//
(* ****** ****** *)
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_mapopt_list(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_mapopt_rlist(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_mapopt_stream(xs): stream_vt(y0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
gseq_imapopt$fopr(int, x0): (y0)
fun
{x0:tflt}
gseq_imapopt$test(int, x0): bool
//
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imapopt_list(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imapopt_rlist(xs): list0_vt(y0)
fun
{xs:tflt}
{x0:tflt}
{y0:vtflt}
gseq_imapopt_stream(xs): stream_vt(y0)
//
(* ****** ****** *)

(* end of [gseq.sats] *)
