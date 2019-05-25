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
$extval(FILEref, "atspre_stdin")
implement
{}(*tmp*)
the_stdout() =
$extval(FILEref, "atspre_stdout")
implement
{}(*tmp*)
the_stderr() =
$extval(FILEref, "atspre_stderr")

(* ****** ****** *)
//
implement
{}(*tmp*)
fprint_newline
  (out) =
{
//
val () =
$extfcall
(void, "atspre_fprintf", out, "\n")
val () =
$extfcall(void, "atspre_fflush", out)
//
} (* end of [fprint_newline] *)
//
(* ****** ****** *)
//
implement
fprint$val<int>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%i", x)
)
implement
fprint$val<ptr>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%p", x)
)
implement
fprint$val<sint>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%i", x)
)
implement
fprint$val<uint>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%u", x)
)
//
implement
fprint$val<ssize>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%li", x)
)
implement
fprint$val<usize>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%lu", x)
)
//
implement
fprint$val<bool>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, rep)
) where
{
  val rep =
  (if x then "tt" else "ff"): string
}
//
implement
fprint$val<char>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%c", x)
)
//
(* ****** ****** *)
//
implement
fprint$val<ssize>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%li", x)
)
implement
fprint$val<usize>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lu", x)
)
implement
fprint$val<slint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%li", x)
)
implement
fprint$val<ulint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lu", x)
)
implement
fprint$val<sllint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lli", x)
)
implement
fprint$val<ullint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%llu", x)
)

(* ****** ****** *)

implement
fprint$val<float>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%f", f0)
)
implement
fprint$val<double>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%f", f0)
)
implement
fprint$val<ldouble>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%Lf", f0)
)
//
(* ****** ****** *)

implement
fprint$val<string>(out, cs) =
let
  val cs =
  $UNSAFE.cast{charptr}(cs)
in
  $extfcall(void, "atspre_fprintf", out, "%s", cs)
end // end of [fprint$val<string>]

implement
fprint$val<string_vt>(out, cs) =
let
  val cs =
  $UNSAFE.castvwtp1{charptr}(cs)
in
  $extfcall(void, "atspre_fprintf", out, "%s", cs)
end // end of [fprint$val<string>]

(* ****** ****** *)

(* end of [stdio.dats] *)
