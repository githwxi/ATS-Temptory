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
(* Start time: February, 2019 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#staload
"libats/SATS/list.sats"

(* ****** ****** *)

#staload
"./../SATS/divconq.sats"

(* ****** ****** *)
//
implement
{i}{o}//tmp
divconq_solve(x0) =
(
  divconq_solve_beg<i><o>(x0)
)
(* ****** ****** *)
//
(*
implement
{i}{o}//tmp
divconq_solve_rec(x0) =
(
  divconq_solve_beg<i><o>(x0)
)
*)
//
(* ****** ****** *)

implement
{i}{o}//tmp
divconq_solve_beg
  (x0) = let
//
val
opt =
divconq_solve_opt<i><o>(x0)
//
in (* in-of-let *)
//
case+ opt of
|
~optn0_vt_none() => r0
 where {
 val xs =
 divconq_divide<i><o>(x0)
 val r0 =
 divconq_conquer<i><o>(xs)
 val () =
 divconq_conquer_aft<i><o>(x0, r0)
 } (* end of [where] *)
|
~optn0_vt_some(y0) => y0
//
end // end of [divconq_solve_beg]

(* ****** ****** *)
//
implement
{i}{o}//tmp
divconq_conquer
  (xs) = r0 where
{
//
val rs =
(
list0_map<i><o>(xs)
) where
{
implement
list0_map$fopr<i><o>
(x0) =
divconq_solve_rec<i><o>(x0)
}
//
val r0 =
divconq_conquer_cmb<i><o>(rs)
//
} (* end of [divconq_conquer] *)
//
(* ****** ****** *)
//
implement
{i}{o}//tmp
divconq_conquer_aft(x0, r0) = ()
//
(* ****** ****** *)

(* end of [cs320_divconq.dats] *)
