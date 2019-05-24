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
"temptory.temp.slistref."
//
(* ****** ****** *)
//
abstbox
slistref_vtflt_tbox(a:vtflt) = ptr
typedef
slistref(a:vtflt) = slistref_vtflt_tbox(a)
//
(*
abstbox
slistptr_vtflt_vtbox(a:vtflt) = ptr
typedef
slistptr(a:vtflt) = slistptr_vtflt_vtbox(a)
*)
(* ****** ****** *)
//
fun{}
slistref_nil
{a:vtflt}((*void*)): slistref(a)
fun{}
slistref_make_nil
{a:vtflt}((*void*)): slistref(a)
//
(* ****** ****** *)
//
fun
{a:vtflt}
slistref_sing(x: a): slistref(a)
//
(* ****** ****** *)
//
fun
{a:vtflt}
slistref_iseqz(slistref(a)): bool
fun
{a:vtflt}
slistref_isneqz(slistref(a)): bool
//
#symload iseqz with slistref_iseqz
#symload isneqz with slistref_isneqz
//
(* ****** ****** *)
//
fun
{a:vtflt}
slistref_size(slistref(a)): size
fun
{a:vtflt}
slistref_length(slistref(a)): sint
//
#symload size with slistref_size
#symload length with slistref_length
//
(* ****** ****** *)
//
fun
{a:vtflt}
slistref_insert
(stk: slistref(a), x0: a): void
//
#symload insert with slistref_insert
//
(* ****** ****** *)
//
fun
{a:vtflt}
slistref_takeout
  (stk: slistref(a)): (a)
fun
{a:vtflt}
slistref_takeout_opt
  (stk: slistref(a)): optn0_vt(a)
fun
{a:vtflt}
slistref_takeout_all
  (stk: slistref(a)): list0_vt(a)
//
#symload
takeout with slistref_takeout
#symload
takeout_opt with slistref_takeout_opt
#symload
takeout_all with slistref_takeout_all
//
(* ****** ****** *)
//
fun{}
slistref_print$beg(): void // "("
fun{}
slistref_print$end(): void // ")"
fun{}
slistref_print$sep(): void // ";"
//
fun
{a:vtflt}
slistref_print(slistref(a)): void
//
#symload print with slistref_print
//
(* ****** ****** *)
//
fun
{x0:vtflt}
slistref_forall1
(stk: slistref(x0)): bool
fun
{x0:vtflt}
slistref_forall1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
slistref_foreach1
(stk: slistref(x0)): void
fun
{x0:vtflt}
slistref_foreach1$work(x0: !x0): void
//
(* ****** ****** *)

(* end of [slistref.sats] *)
