(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

(* Author: Hongwei Xi *)
(* Start time: November, 2016 *)
(* Authoremail: gmmhwxiATgmailDOTcom *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.qlistref"
//
(* ****** ****** *)
//
abstbox
qlistref_vtflt_tbox(a:vtflt) = ptr
//
typedef
qlistref(a:vtflt) = qlistref_vtflt_tbox(a)
//
(* ****** ****** *)
//
fun{}
qlistref_nil
  {a:vtflt}((*void*)): qlistref(a)
fun{}
qlistref_make_nil
  {a:vtflt}((*void*)): qlistref(a)
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlistref_iseqz(qlistref(a)): bool
fun
{a:vtflt}
qlistref_isneqz(qlistref(a)): bool
//
#symload iseqz with qlistref_iseqz
#symload isneqz with qlistref_isneqz
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlistref_size(qlistref(a)): size
fun
{a:vtflt}
qlistref_length(qlistref(a)): sint
//
#symload size with qlistref_size
#symload length with qlistref_length
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlistref_insert
(stk: qlistref(a), x0: a): void
//
#symload insert with qlistref_insert
//
(* ****** ****** *)
//
fun
{a:vtflt}
qlistref_takeout
  (stk: qlistref(a)): (a)
fun
{a:vtflt}
qlistref_takeout_opt
  (stk: qlistref(a)): optn0_vt(a)
fun
{a:vtflt}
qlistref_takeout_all
  (stk: qlistref(a)): list0_vt(a)
//
#symload
takeout with qlistref_takeout
#symload
takeout_opt with qlistref_takeout_opt
#symload
takeout_all with qlistref_takeout_all
//
(* ****** ****** *)
//
fun{}
qlistref_print$beg(): void // "("
fun{}
qlistref_print$end(): void // ")"
fun{}
qlistref_print$sep(): void // ";"
//
fun
{a:vtflt}
qlistref_print(qlistref(a)): void
//
#symload print with qlistref_print
//
(* ****** ****** *)
//
fun
{x0:vtflt}
qlistref_forall1
(stk: qlistref(x0)): bool
fun
{x0:vtflt}
qlistref_forall1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
qlistref_foreach1
(stk: qlistref(x0)): void
fun
{x0:vtflt}
qlistref_foreach1$work(x0: !x0): void
//
(* ****** ****** *)

(* end of [qlistref.sats] *)
