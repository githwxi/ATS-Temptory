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

#define tt true
#define ff false

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/glseq.sats"
#staload "./../SATS/string.sats"

(* ****** ****** *)

typedef c0 = char
vtypedef cs = string_vt

(* ****** ****** *)

impltmp
glseq_streamize<glseq><cs,c0>
  (cs) =
(
  string0_vt_streamize<>(cs)
) // end of [glseq_streamize]

(* ****** ****** *)

impltmp
glseq_forall1<glseq><cs,c0>
  (cs) =
(
  string0_vt_forall1<>(cs)
) where
{
impltmp
string0_vt_forall1$test<>(c0) =
  glseq_forall1$test<glseq><cs,c0>(c0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
glseq_foreach1<glseq><cs,c0>
  (cs) =
(
  string0_vt_foreach1<>(cs)
) where
{
impltmp
string0_vt_foreach1$work<>(c0) =
  glseq_foreach1$work<glseq><cs,c0>(c0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)
//
(*
impltmp
{r0}(*tmp*)
string0_vt_foldleft1
  (cs, r0) =
(
loop
(string0_vt_cptrof(cs), r0)
) where
{
//
fun
loop
( p0
: cptr(char), r0: r0): r0 =
let
  val c0 = $UN.cptr0_get(p0)
in
if
isneqz(c0)
then
let
val r0 =
string0_vt_foldleft1$fopr<r0>(r0, c0) in loop(succ(p0), r0)
end else r0
end // end-of-let // end of [loop]
//
} (* end of [string0_vt_foldleft1] *)
*)
//
impltmp
{r0}(*tmp*)
string0_vt_foldleft1
  (cs, r0) =
(
glseq_foldleft1<
glseq><string_vt,c0>(cs, r0)
) where
{
impltmp
glseq_foldleft1$fopr<
glseq><string_vt,c0><r0>(r0, c0) = string0_vt_foldleft1$fopr<r0>(r0, c0)
} (* end of [string0_vt_foldleft1] *)
impltmp
{r0}(*tmp*)
string0_vt_foldright1
  (cs, r0) =
(
glseq_foldright1<
glseq><string_vt,c0>(cs, r0)
) where
{
impltmp
glseq_foldright1$fopr<
glseq><string_vt,c0><r0>(c0, r0) = string0_vt_foldright1$fopr<r0>(c0, r0)
} (* end of [string0_vt_foldright1] *)
//
(* ****** ****** *)

(* end of [glseq_string.dats] *)
