(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author of the file:
// Hongwei Xi (gmhwxiATgmailDOTcom)
// Start Time: July, 2012
//
(* ****** ****** *)

#include "libats/params.hats"

(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print
"Loading [basics_gen.sats] starts!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)
//
fun
{a:vtflt}
gcopy$val(x: !INV(a)):<!wrt> a
//
fun
{a:vtflt}
gcopy$ref(x: &INV(a)):<!wrt> a
//
(* ****** ****** *)
//
fun
{a:vtflt}
gfree$val(x: INV(a)):<!wrt> void
//
(*
fun
{a:vtflt}
gfree_ref (x: &INV(a) >> a?):<!wrt> void
*)
//
(* ****** ****** *)

fun
{a:vtflt}
ginit$ref(x: &a? >> a):<!wrt> void

(* ****** ****** *)

fun
{a:vtflt}
gclear$ref(x: &a >> a?):<!wrt> void

(* ****** ****** *)
//
fun
{a:vtflt}
gequal$val(x: !a, y: !a):<> bool
//
fun
{a:vtflt}
gequal$ref(x: &INV(a), y: &a):<> bool
//
(* ****** ****** *)

fun
{a:vtflt}
tostring$val(x: !a):<> string
fun
{a:vtflt}
tostring$ref(x: &INV(a)):<> string

(* ****** ****** *)

fun
{a:vtflt}
tostrptr$val(x: !a):<!wrt> Strptr1
fun
{a:vtflt}
tostrptr$ref(x: &INV(a)):<!wrt> Strptr1

(* ****** ****** *)
//
(*
fun
{a:vtflt}
fprint$val(out: FILEref, x: !a): void
fun
{a:vtflt}
fprint$ref(out: FILEref, x: &INV(a)): void
*)
//
(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print
"Loading [basics_gen.sats] finishes!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

(* end of [basics_gen.sats] *)
