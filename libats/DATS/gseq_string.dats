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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/string.sats"

(* ****** ****** *)

implement
gseq_streamize<string><char>
  (cs) =
(
  string0_streamize<>(cs)
) // end of [gseq_streamize]

(* ****** ****** *)

implement
gseq_forall<string><char>
  (cs) =
(
  string0_forall<>(cs)
) where
{
implement
string0_forall$test<>(x0) = gseq_forall$test<char>(x0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

implement
gseq_foreach<string><char>
  (cs) =
(
  string0_foreach<>(cs)
) where
{
implement
string0_foreach$work<>(x0) = gseq_foreach$work<char>(x0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

(* end of [gseq_string.dats] *)
