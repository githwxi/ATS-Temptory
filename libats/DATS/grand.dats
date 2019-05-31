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
#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/bool.sats"
#staload "./../SATS/char.sats"
//
#staload "./../SATS/grand.sats"
//
#staload "./../SATS/string.sats"
//
(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
uint_rand() =
$extfcall
(uint, "atspre_rand")
//
implement
{}(*tmp*)
nat0_rand() =
$extfcall
(Intgte(0), "atspre_rand")
implement
{}(*tmp*)
sint_rand() =
let
val
nat = nat0_rand<>()
val
sgn = nat0_rand_max<>(2)
in
  (if sgn = 0 then nat else ~nat)
end (* sint_rand *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_rand() =
string0_vt2t
(string0_vt_rand<>())
//
implement
{}(*tmp*)
string0_vt_rand() =
(
  $UN.castvwtp0(p0)
) where
{
val n0 =
string0_rand$len<>()
val p0 = string0_alloc<>(n0)
val p1 =
(
sint_foldleft<r0>(n0, p0)
) where
{
//
  typedef r0 = cptr(char)
//
  implement
  sint_foldleft$fopr<r0>
    (p0, x0) =
  (
  let
  val c0 =
  string0_rand$char<>()
  val () =
  $UN.cptr0_set(p0, c0) in succ(p0)
  end
  ) (* sint_foldleft$fopr *)
}
} (* end of [string0_vt_rand] *)
//
implement
{}(*tmp*)
string0_rand$len
  ((*void*)) = nat0_rand_max(64)
implement
{}(*tmp*)
string0_rand$char
  ((*void*)) =
(
  $UN.cast(1+nat0_rand_max<>(127))
)
//
(* ****** ****** *)

implement
{}(*tmp*)
nat0_rand_max(max) =
let
val
nat =
$extfcall
(Nat, "atspre_rand") in $UN.cast(nat % max)
end (* end of [nat0_rand_max] *)

(* ****** ****** *)

implement
grand$val<sint>() = sint_rand<>()
implement
grand$val<uint>() = uint_rand<>()

(* ****** ****** *)

implement
grand$val<bool>() =
let
val
n01 =
nat0_rand_max<>(2)
in
if n01 = 0 then true else false
end (* grand$val<bool> *)

(* ****** ****** *)

implement
grand$val<char>() =
let
val
code =
nat0_rand_max<>(128) in char0_chr(code)
end (* grand$val<char> *)

(* ****** ****** *)

(* end of [grand.dats] *)
