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
#staload "./../SATS/array.sats"
#staload "./../SATS/string.sats"
//
(* ****** ****** *)

#staload "./../SATS/print.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
grand$ref(x0) =
(x0 := grand$val<a>())
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
uint0_rand() =
$extfcall
(uint, "atspre_rand")
//
impltmp
{}(*tmp*)
snat0_rand() =
$extfcall
(Intgte(0), "atspre_rand")
impltmp
{}(*tmp*)
sint0_rand() =
let
val
nat = snat0_rand<>()
val
sgn = snat0_rand_max<>(2)
in
  (if sgn = 0 then nat else ~nat)
end (* sint_rand *)
//
(* ****** ****** *)

impltmp
{}(*tmp*)
snat0_rand_max(max) =
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
impltmp
{a}(*tmp*)
list0_rand() =
list0_vt2t
(list0_vt_rand<a>())
*)
impltmp
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
gseq_map_list<
gseq><xs,x0><y0>(len)
) where
{
typedef xs = sint
typedef x0 = sint and y0 = a
impltmp
gseq_map$fopr<
gseq><xs,x0><y0>(i0) = grand$val<y0>()
} (* end of [where] *)
//
end (* end of [list0_rand] *)
//
impltmp
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
impltmp
{}(*tmp*)
list0_rand$len
  ((*void*)) = snat0_rand_max(100)
//
(* ****** ****** *)
//
impltmp
{}(*tmp*)
string0_rand() =
string0_vt2t
(string0_vt_rand<>())
//
impltmp
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
sint0_foldleft<r0>(n0, p0)
) where
{
//
  typedef r0 = cptr(char)
//
  impltmp
  sint0_foldleft$fopr<r0>
    (p0, x0) =
  (
  let
  val c0 = string0_rand$char<>()
  val () = $UN.cptr0_set(p0, c0) in succ(p0)
  end
  ) (* sint0_foldleft$fopr *)
}
} (* end of [string0_vt_rand] *)
//
impltmp
{}(*tmp*)
string0_rand$len
  ((*void*)) = snat0_rand_max(100)
//
impltmp
{}(*tmp*)
string0_rand$char
  ((*void*)) =
(
  $UN.cast(1+snat0_rand_max<>(127))
)
//
(* ****** ****** *)
//
impltmp
{a0,a1}
tuple2_rand() =
let
val x0 =
grand$val<a0>()
and x1 =
grand$val<a1>() in (x0, x1) end
impltmp
{a0,a1,a2}
tuple3_rand() =
let
val x0 =
grand$val<a0>()
and x1 =
grand$val<a1>()
and x2 =
grand$val<a2>() in (x0, x1, x2) end
//
(* ****** ****** *)
//
impltmp
{a}//tmp
arrszref_rand() =
let
val AZ =
arrszptr_rand<a>() in arrszptr_refize(AZ) end
//
(* ****** ****** *)
//
// HX-2019-05:
// for specific
// grand$val implementations
//
(* ****** ****** *)

impltmp
grand$val<sint>() = sint0_rand<>()
impltmp
grand$val<uint>() = uint0_rand<>()

(* ****** ****** *)

impltmp
grand$val<bool>() =
let
val
n01 =
snat0_rand_max<>(2)
in
if n01 = 0 then true else false
end (* grand$val<bool> *)

(* ****** ****** *)

impltmp
grand$val<char>() =
let
val
code =
snat0_rand_max<>(128) in char0_chr(code)
end (* grand$val<char> *)

(* ****** ****** *)

impltmp
(a:tflt)
grand$val<list0(a)>() = list0_rand<a>()
impltmp
(a:vtflt)
grand$val<list0_vt(a)>() = list0_vt_rand<a>()

(* ****** ****** *)
//
impltmp
grand$val<string>() = string0_rand<>()
impltmp
grand$val<string_vt>() = string0_vt_rand<>()
//
(* ****** ****** *)

impltmp
(a0,a1:tflt)
grand$val<tup(a0,a1)>() = tuple2_rand<a0,a1>()
impltmp
(a0,a1,a2:tflt)
grand$val<tup(a0,a1,a2)>() = tuple3_rand<a0,a1,a2>()

(* ****** ****** *)

(* end of [grand.dats] *)
