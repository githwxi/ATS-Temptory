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

(* Author: Hongwei Xi *)
(* Start time: Feburary, 2012 *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)

(* ****** ****** *)

#staload "libats/SATS/gint.sats"
#staload "libats/SATS/gptr.sats"
#staload "libats/SATS/array.sats"

(* ****** ****** *)

#staload "./../SATS/dirent.sats"

(* ****** ****** *)

#staload UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
{}(*tmp*)
readdir_forall
  (dir) =
(
  loop(dir)
) where
{
fun
loop
( dir
: cptr(DIR)
) : bool = let
//
val ent = readdir(dir)
//
in
//
if
iseqz(ent)
then true else
let
val test =
readdir_forall$test<>(ent)
in
  if test then loop(dir) else false
end // end of [else]
//
end // end of [loop]
//
} (* end of [readdir_forall] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
readdir_r_streamize
  (dir) =
( auxmain(dir) ) where
{
//
fun
auxmain
(
  dir: cptr(DIR)
) : stream_vt(dirent) = $ldelay
(
let
//
val nx =
  stream_vt_cons{dirent}(_, _)
//
val+stream_vt_cons(ent, xs) = nx
//
var res: cptr(dirent)?
val err = readdir_r(dir, ent, res)
//
in
//
if
isneqz(res)
then
(
  xs := auxmain(dir); fold@(nx); nx
) (* end of [then] *)
else
let
  val () = free@(nx)
  val err = closedir(dir) in stream_vt_nil()
end // end of [else]
//
end : stream_vt_con(dirent) // end of [let]
//
,
//
let val err = closedir(dir) in (*closed*) end
//
) (* end of [auxmain] *)
//
} (* end of [readdir_r_streamize] *)

(* ****** ****** *)

(* end of [dirent.dats] *)

