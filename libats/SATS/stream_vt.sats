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

#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
fun{}
stream_vt_make_nil
{x0:vtflt}
((*void*)): stream_vt(x0)
fun
{x0:vtflt}
stream_vt_make_sing
  (xs: x0): stream_vt(x0)
//
fun
{x0:tflt}
stream_vt_make_list0
  (xs: list0(INV(x0))): stream_vt(x0)
fun
{x0:vtflt}
stream_vt_make_list0_vt
  (xs: list0_vt(INV(x0))): stream_vt(x0)
//
#symload
stream_vt_make with stream_vt_make_list0
#symload
stream_vt_make with stream_vt_make_list0_vt
//
(* ****** ****** *)
//
fun
{x0:vtflt}
stream_vt_append
( stream_vt(INV(x0))
, stream_vt(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
stream_vt_listize
(xs: stream_vt(INV(x0))): list0_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
stream_vt_forall0
(xs: stream_vt(INV(x0))): bool
fun
{x0:vtflt}
stream_vt_forall0$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
stream_vt_foreach0
(xs: stream_vt(INV(x0))): void
fun
{x0:vtflt}
stream_vt_foreach0$work(x0): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_map$fopr(x0): y0
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_map(stream_vt(INV(x0))): stream_vt(y0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_mapopt$fopr(x0): y0
fun
{x0:vtflt}
stream_vt_mapopt$test(!x0): bool
fun
{x0:vtflt}
stream_vt_filter$test(!x0): bool
//
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_mapopt(stream_vt(INV(x0))): stream_vt(y0)
fun
{x0:vtflt}
stream_vt_filter(stream_vt(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_imap$fopr(int, x0): y0
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_imapopt$fopr(int, x0): y0
fun
{x0:vtflt}
stream_vt_imapopt$test(int, !x0): bool
fun
{x0:vtflt}
stream_vt_ifilter$test(int, !x0): bool
//
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_imap(stream_vt(INV(x0))): stream_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
stream_vt_imapopt(stream_vt(INV(x0))): stream_vt(y0)
fun
{x0:vtflt}
stream_vt_ifilter(stream_vt(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)
