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

impltmp
{}(*tmp*)
the_stdin() =
$extval(FILEref, "atspre_stdin")
impltmp
{}(*tmp*)
the_stdout() =
$extval(FILEref, "atspre_stdout")
impltmp
{}(*tmp*)
the_stderr() =
$extval(FILEref, "atspre_stderr")

(* ****** ****** *)

impltmp
{}(*tmp*)
feof(fil) =
$extfcall(sint, "atspre_feof", fil)
impltmp
{}(*tmp*)
fgetc(inp) =
$extfcall(sint, "atspre_fgetc", inp)

(* ****** ****** *)
//
impltmp
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
impltmp
fprint$val<int>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%i", x)
)
impltmp
fprint$val<ptr>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%p", x)
)
impltmp
fprint$val<sint>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%i", x)
)
impltmp
fprint$val<uint>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%u", x)
)
//
impltmp
fprint$val<ssize>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%li", x)
)
impltmp
fprint$val<usize>(out, x) =
(
$extfcall
(void, "atspre_fprintf", out, "%lu", x)
)
//
impltmp
fprint$val<bool>(out, x) =
(
$extfcall
( void
, "atspre_fprintf", out, "%s", rep)
) where
{
  val rep =
  (if x then "tt" else "ff"): string
}
//
impltmp
fprint$val<char>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%c", x)
)
//
(* ****** ****** *)
//
impltmp
fprint$val<ssize>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%li", x)
)
impltmp
fprint$val<usize>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lu", x)
)
impltmp
fprint$val<slint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%li", x)
)
impltmp
fprint$val<ulint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lu", x)
)
impltmp
fprint$val<sllint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%lli", x)
)
impltmp
fprint$val<ullint>(out, x) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%llu", x)
)

(* ****** ****** *)

impltmp
fprint$val<float>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%f", f0)
)
impltmp
fprint$val<double>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%f", f0)
)
impltmp
fprint$val<ldouble>(out, f0) =
(
  $extfcall
  (void, "atspre_fprintf", out, "%Lf", f0)
)
//
(* ****** ****** *)

impltmp
fprint$val<string>(out, cs) =
let
  val cs =
  $UNSAFE.cast{charptr}(cs)
in
  $extfcall(void, "atspre_fprintf", out, "%s", cs)
end // end of [fprint$val<string>]

impltmp
fprint$val<string_vt>(out, cs) =
let
  val cs =
  $UNSAFE.castvwtp1{charptr}(cs)
in
  $extfcall(void, "atspre_fprintf", out, "%s", cs)
end // end of [fprint$val<string>]

(* ****** ****** *)

(* end of [stdio.dats] *)
