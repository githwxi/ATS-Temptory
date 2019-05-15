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

#define EOL '\n'

(* ****** ****** *)
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/bool.sats"
#staload "./../SATS/char.sats"
#staload "./../SATS/string.sats"
//
#staload "./../SATS/stream_vt.sats"
//
#staload "./../SATS/stdio.sats"
#staload "./../SATS/filebas.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
FILEref_open_opt
(fp0, fm0) = let
//
val fil =
$extfcall
(ptr0, "atspre_fopen", fp0, fm0)
//
in
if
iseqz(fil)
then
optn0_vt_none(*void*)
else
optn0_vt_some($UN.cast{FILEref}(fil))
end // end of [FILEref_open]

implement
{}(*tmp*)
FILEptr0_open_opt
(fp0, fm0) = let
//
val fil =
$extfcall
(ptr0, "atspre_fopen", fp0, fm0)
//
in
if
iseqz(fil)
then
optn0_vt_none(*void*)
else
optn0_vt_some($UN.castvwtp0{FILEptr0}(fil))
end // end of [FILEptr0_open]

(* ****** ****** *)
//
implement
{}(*tmp*)
FILEref_close(fil) =
$extfcall
(void, "atspre_fclose", fil)
implement
{}(*tmp*)
FILEptr0_close(fil) =
$extfcall
( void
, "atspre_fclose", $UN.castvwtp0{ptr}(fil))
//
(* ****** ****** *)

implement
{}(*tmp*)
FILEref_streamize_char
  (inp) =
(
  auxmain(inp)
) where
{
fun
auxmain
( inp
: FILEref
) : stream_vt(char) = $ldelay
(
let
val
c0 = 
$extfcall(int, "atspre_fgetc", inp)
in
if
(c0 >= 0)
then
let
val c0 =
$UN.cast{char}(c0)
in
  stream_vt_cons(c0, auxmain(inp))
end
else stream_vt_nil()
end
, () // HX: [FILEref_close] is not called!
)
} (* end of [FILEref_streamize_char] *)

(* ****** ****** *)

implement
{}(*tmp*)
FILEptr0_streamize_char
  (inp) =
(
  auxmain(inp)
) where
{
fun
auxmain
( inp
: FILEptr
) : stream_vt(char) = $ldelay
(
let
val p0 =
$UN.castvwtp1{ptr}(inp)
val c0 = 
$extfcall(int, "atspre_fgetc", p0)
//
in
  if
  (c0 >= 0)
  then
  let
  val c0 = $UN.cast{char}(c0)
  in
  stream_vt_cons(c0, auxmain(inp))
  end
  else
  let
  val () =
  FILEptr0_close(inp) in stream_vt_nil() end
end, FILEptr0_close(inp) // HX: close it!
)
} (* end of [FILEptr0_streamize_char] *)

(* ****** ****** *)

implement
{}(*tmp*)
FILEref_streamize_line
  (inp) =
(
stream_vt_map<x0><y0>
(
stream_vt_group_line<char>(cs)
) where
{
//
val cs =
  FILEref_streamize_char<>(inp)
//
implement
stream_vt_group_line$iseol<char>(c0) = (c0 = EOL)
}
) where
{
vtypedef y0 = string
vtypedef x0 = list0_vt(char)
implement
stream_vt_map$fopr<x0><y0>(x0) = string0_make_list0_vt<>(x0)
} (* end of [FILEref_streamize_line] *)

implement
{}(*tmp*)
FILEptr0_streamize_line
  (inp) =
(
stream_vt_map<x0><y0>
(
stream_vt_group_line<char>(cs)
) where
{
//
val cs =
  FILEptr0_streamize_char<>(inp)
//
implement
stream_vt_group_line$iseol<char>(c0) = (c0 = EOL)
}
) where
{
vtypedef y0 = string
vtypedef x0 = list0_vt(char)
implement
stream_vt_map$fopr<x0><y0>(x0) = string0_make_list0_vt<>(x0)
} (* end of [FILEptr0_streamize_line] *)

(* ****** ****** *)

implement
{}(*tmp*)
FILEref_streamize_word
  (inp) =
(
stream_vt_map<x0><y0>
(
stream_vt_group_word<char>(cs)
) where
{
//
val cs =
  FILEref_streamize_char<>(inp)
//
implement
stream_vt_group_word$isalpha<char>
(c0) = FILEref_streamize_word$isalpha<>(c0)
}
) where
{
vtypedef y0 = string
vtypedef x0 = list0_vt(char)
implement
stream_vt_map$fopr<x0><y0>(x0) = string0_make_list0_vt<>(x0)
} (* end of [FILEref_streamize_word] *)

implement
{}(*tmp*)
FILEptr0_streamize_word
  (inp) =
(
stream_vt_map<x0><y0>
(
stream_vt_group_word<char>(cs)
) where
{
//
val cs =
  FILEptr0_streamize_char<>(inp)
//
implement
stream_vt_group_word$isalpha<char>
(c0) = FILEptr0_streamize_word$isalpha<>(c0)
}
) where
{
vtypedef y0 = string
vtypedef x0 = list0_vt(char)
implement
stream_vt_map$fopr<x0><y0>(x0) = string0_make_list0_vt<>(x0)
} (* end of [FILEptr0_streamize_word] *)

implement
FILEref_streamize_word$isalpha<>(c0) = char0_isalpha(c0)
implement
FILEptr0_streamize_word$isalpha<>(c0) = char0_isalpha(c0)

(* ****** ****** *)

(* end of [filebas.dats] *)
