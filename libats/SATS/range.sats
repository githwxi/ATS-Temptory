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
datatype
SINT2 = SINT2 of ((*void*))
//
fun{}
SINT2_range$beg((*void*)): (sint)
fun{}
SINT2_range$end((*void*)): (sint)
//
(* ****** ****** *)
//
fun{}
SINT2_forall(): bool
fun{}
SINT2_forall$test(sint): bool
fun{}
SINT2_foreach(): void
fun{}
SINT2_foreach$work(sint): void
//
fun{}
SINT2_rforall(): bool
fun{}
SINT2_rforall$test(sint): bool
fun{}
SINT2_rforeach(): void
fun{}
SINT2_rforeach$work(sint): void
//
fun{}
SINT2_streamize(): stream_vt(sint)
//
(* ****** ****** *)
//
fun
{y0:vtflt}
SINT2_map$fopr(sint): y0
//
fun
{y0:vtflt}
SINT2_map_list(sint): list0_vt(y0)
fun
{y0:vtflt}
SINT2_map_rlist(sint): list0_vt(y0)
fun
{y0:vtflt}
SINT2_map_stream(sint): stream_vt(y0)
//
(* ****** ****** *)
//
datatype
CPTR2
(a:vtflt) = CPTR2 of ((*void*))
//
fun
{a:vtflt}
CPTR2_range$beg((*void*)): cptr(a)
fun
{a:vtflt}
CPTR2_range$end((*void*)): cptr(a)
//
fun
{a:vtflt}
CPTR2_forall(): bool
fun
{a:vtflt}
CPTR2_forall$test(cptr(a)): bool
//
fun
{a:vtflt}
CPTR2_foreach(): void
fun
{a:vtflt}
CPTR2_foreach$work(cptr(a)): void
//
fun
{a:vtflt}
CPTR2_streamize(): stream_vt(cptr(a))
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
CPTR2_map$fopr(cptr(x0)): y0
//
fun
{x0:vtflt}
{y0:vtflt}
CPTR2_map_list(cptr(x0)): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
CPTR2_map_rlist(cptr(x0)): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
CPTR2_map_stream(cptr(x0)): stream_vt(y0)
//
(* ****** ****** *)

(* end of [range.sats] *)
