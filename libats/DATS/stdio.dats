(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
UNSAFE =
"libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/stdio.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
the_stdin() =
$extval(FILEref, "stdin")
implement
{}(*tmp*)
the_stdout() =
$extval(FILEref, "stdout")
implement
{}(*tmp*)
the_stderr() =
$extval(FILEref, "stderr")

(* ****** ****** *)
//
implement
{}(*tmp*)
fprint_newline
  (out) =
{
  val () =
  $extfcall
  (void, "fprintf", out, "\n")
  val () =
  $extfcall(void, "fflush", out)
} (* end of [fprint_newline] *)
//
(* ****** ****** *)
//
implement
fprint$val<int>(out, x) =
(
  $extfcall
  (void, "fprintf", out, "%i", x)
)
//
implement
fprint$val<bool>(out, x) =
(
$extfcall
(void, "fprintf", out, rep)
) where
{
  val rep =
  (if x then "tt" else "ff"): string
}
//
implement
fprint$val<char>(out, x) =
$extfcall(void, "fprintf", out, "%c", x)
//
implement
fprint$val<string>(out, cs) =
(
$extfcall
(void, "fprintf", out, "%s", cs)
) where
{
  val cs = $UNSAFE.cast{charptr}(cs)
}
//
(* ****** ****** *)

(* end of [stdio.dats] *)
