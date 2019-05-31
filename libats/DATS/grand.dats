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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/grand.sats"
//
#staload "./../SATS/list.sats"
#staload "./../SATS/string.sats"
//
(* ****** ****** *)

#staload "./../SATS/print.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
implement
{a}(*tmp*)
grand$ref(x0) =
(x0 := grand$val<a>())
//
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

implement
{}(*tmp*)
nat0_rand_max(max) =
(
  $UN.cast(nat % max)
) where
{
val
nat = $extfcall(Nat, "atspre_rand")
} (* end of [nat0_rand_max] *)

(* ****** ****** *)
//
(*
implement
{a}(*tmp*)
list0_rand() =
list0_vt2t
(list0_vt_rand<a>())
*)
implement
{a}(*tmp*)
list0_rand() = let
//
val
len = list0_rand$len<>()
//
(*
val () =
println!
("list0_rand: len = ", len)
*)
//
in
//
list0_vt2t
(
gseq_map_list<xs><x0><y0>(len)
) where
{
  typedef xs = sint
  typedef x0 = sint and y0 = a
  implement
  gseq_map$fopr<x0><y0>(i0) = grand$val<y0>()
} (* end of [where] *)
//
end (* end of [list0_rand] *)
//
implement
{a}(*tmp*)
list0_vt_rand() = let
//
val
len = list0_rand$len<>()
//
fun
loop
( i0: int
, r0: &ptr? >> list0_vt(a)): void =
(
if
i0 >= len
then
(
r0 :=
list0_vt_nil()
)
else let
//
val () =
(
r0 :=
list0_vt_cons(_, _)
)
val+
list0_vt_cons(x0, r1) = r0
//
val () = grand$ref<a>(x0)
(*
val () = (x0 := grand$val<a>())
*)
//
in
  loop(succ(i0), r1); fold@(r0)
end
) (* end of [loop] *)
//
in
  let var r0: ptr? in loop(0(*i0*), r0); r0 end
end // end of [list0_vt_rand]
//
implement
{}(*tmp*)
list0_rand$len
  ((*void*)) = nat0_rand_max(100)
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
  val c0 = string0_rand$char<>()
  val () = $UN.cptr0_set(p0, c0) in succ(p0)
  end
  ) (* sint_foldleft$fopr *)
}
} (* end of [string0_vt_rand] *)
//
implement
{}(*tmp*)
string0_rand$len
  ((*void*)) = nat0_rand_max(100)
//
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
//
implement
grand$val<string>() = string0_rand<>()
implement
grand$val<string_vt>() = string0_vt_rand<>()
//
(* ****** ****** *)

implement
(a:tflt)
grand$val<list0(a)>() = list0_rand<a>()
implement
(a:vtflt)
grand$val<list0_vt(a)>() = list0_vt_rand<a>()

(* ****** ****** *)

(* end of [grand.dats] *)
