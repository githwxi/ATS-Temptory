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
// Start Time: May, 2019
//
(* ****** ****** *)
//
#macdef
ignoret(x) = { val x = ,(x) }
//
(* ****** ****** *)
//
(*
** HX: short form
*)
#macdef
orelse(x, y) =
(
if ,(x) then true else ,(y)
) : bool (* end-of-macdef *)
#macdef
andalso(x, y) =
(
if ,(x) then ,(y) else false
) : bool (* end-of-macdef *)
//
#macdef
||(x, y) = (,(x) orelse ,(y))
#macdef
&&(x, y) = (,(x) andalso ,(y))

(* ****** ****** *)
//
#macdef
exitloc(ecd) =
exit_errmsg(,(ecd), $mylocation)
//
(* ****** ****** *)
//
#macdef
assertloc(prop) =
assert_errmsg(,(prop), $mylocation)
//
(* ****** ****** *)

(* end of [basics_mac.hats] *)
