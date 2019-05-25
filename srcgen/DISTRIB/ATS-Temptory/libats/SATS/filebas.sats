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

#staload "./stdio.sats"

(* ****** ****** *)
//
fun{}
FILEref_open_opt
( fpath: strcst
, fmode: strcst): optn0_vt(FILEref)
fun{}
FILEptr0_open_opt
( fpath: strcst
, fmode: strcst): optn0_vt(FILEptr0)
//
(* ****** ****** *)

fun{}
FILEref_close(FILEref): void
fun{}
FILEptr0_close(FILEptr): void

(* ****** ****** *)
//
fun{}
FILEref_streamize_char
  (out: FILEref): stream_vt(char)
fun{}
FILEptr0_streamize_char
  (out: FILEptr0): stream_vt(char)
//
(* ****** ****** *)
//
fun{}
FILEref_streamize_line
  (out: FILEref): stream_vt(string)
fun{}
FILEptr0_streamize_line
  (out: FILEptr): stream_vt(string)
//
//
fun{}
FILEref_streamize_line_vt
  (out: FILEref): stream_vt(string_vt)
fun{}
FILEptr0_streamize_line_vt
  (out: FILEptr): stream_vt(string_vt)
//
(* ****** ****** *)
//
fun{}
FILEref_streamize_word
  (out: FILEref): stream_vt(string)
fun{}
FILEref_streamize_word$isalpha(char): bool
//
fun{}
FILEptr0_streamize_word
  (out: FILEptr): stream_vt(string)
fun{}
FILEptr0_streamize_word$isalpha(char): bool
//
(* ****** ****** *)
//
fun{}
FILEref_streamize_word_vt
  (out: FILEref): stream_vt(string_vt)
(*
fun{}
FILEref_streamize_word$isalpha(char): bool
==
fun{}
FILEref_streamize_word_vt$isalpha(char): bool
*)
//
fun{}
FILEptr0_streamize_word_vt
  (out: FILEptr): stream_vt(string_vt)
(*
fun{}
FILEptr0_streamize_word$isalpha(char): bool
==
fun{}
FILEptr0_streamize_word$_vtisalpha(char): bool
*)
//
(* ****** ****** *)

(* end of [filebas.sats] *)
