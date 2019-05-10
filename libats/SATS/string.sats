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
ATS_PACKNAME "temptory"
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
castfn
string0_ptrof(string):<> ptr
castfn
string0_cptrof(string):<> cptr(char)
//
#symload ptrof with string0_ptrof
#symload cptrof with string0_cptrof
//
(* ****** ****** *)
//
fun{}
string0_iseqz(string):<> bool
fun{}
string0_isneqz(string):<> bool
//
#symload iseqz with string0_iseqz
#symload iseqz with string0_isneqz
//
(* ****** ****** *)
//
fun{}
string0_length(string):<> (int)
//
#symload length with string0_length
//
(* ****** ****** *)
//
fun{}
string0_indexof
  (cs: string, c0: char):<> (int)
//
#symload indexof with string0_indexof
//
(* ****** ****** *)
//
fun{}
string0_forall(cs: string): bool
fun{}
string0_forall$test(c0: char): bool
//
(* ****** ****** *)
//
fun{}
string0_foreach(cs: string): void
fun{}
string0_foreach$work(c0: char): void
//
(* ****** ****** *)
//
fun{}
string0_listize(string): list0_vt(char)
fun{}
string0_streamize(string): stream_vt(char)
//
(* ****** ****** *)

(* end of [string.sats] *)