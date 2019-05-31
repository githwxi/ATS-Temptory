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
#staload "./../SATS/refcnt.sats"
#staload "./../SATS/list_rc.sats"

(* ****** ****** *)

impltmp
{x0}//tmp
list0_rc_length(xs) =
(
let
val
(pf0,fpf|p0) = vtakeout(xs)
val r0 = loop(!p0, 0(*init*))
in
let prval () = fpf(pf0) in r0 end
end
) where
{
//
vtypedef
nx = list0_rc_con(x0)
//
fun
loop
(nx: &nx, r0: int): int =
(
case+ nx of
| list0_rc_nil() => r0
| list0_rc_cons(x0, xs) =>
  let
    val
    (pf0,fpf|p0) = vtakeout(xs)
    val r0 = loop(!p0, succ(r0))
  in
    let prval () = fpf(pf0) in r0 end
  end
)
//
} (* end of [list0_rc_length] *)

(* ****** ****** *)
(*
impltmp
{x0}//tmp
list0_rc_length0
  (xs) =
(
  loop(xs, 0)
) where
{
//
vtypedef
xs = list0_rc(x0)
//
fun
loop
(xs: xs, r0: int): int =
(
let
val nx =
refcnt_get0_elt(xs)
in
case+ nx of
|
~list0_rc_nil() => r0
|
~list0_rc_cons(x0, xs) =>
  (gfree$val<x0>(x0); loop(xs, succ(r0)))
end
)
//
} (* end of [list0_rc_length0] *)
*)
(*
impltmp
{x0}//tmp
list0_rc_length1(xs) =
list0_rc_length0<x0>(incref(xs))
*)
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_rc_free
(rfc) =
refcnt_decref<list0_rc_con(x0)>(rfc)
//
impltmp
{x0}//tmp
list0_rc_con_free(con) =
  ( loop(con) ) where
{
fun
loop
(con: list0_rc_con(x0)): void =
let
impltmp
gfree$val<
list0_rc_con(x0)>(con) = loop(con)
in
(
case+ con of
|
~list0_rc_nil() => ()
|
~list0_rc_cons(x0, xs) =>
 (gfree$val<x0>(x0); list0_rc_free<x0>(xs))
)
end
} (* end of [list0_rc_free_con] *)
//
(* ****** ****** *)
//
impltmp
(x0:vtflt)
gfree$val<
list0_rc_con(x0)>(con) = list0_rc_con_free<x0>(con)
//
(* ****** ****** *)

impltmp
{x0}//tmp
list0_rc_forall1(xs) =
(
let
val
(pf0,fpf|p0)
=
vtakeout(xs)
val
test = loop(!p0)
in
test where {prval()=fpf(pf0)}
end
) where
{
//
vtypedef
nx = list0_rc_con(x0)
//
fun
loop(nx: &nx): bool =
(
case+ nx of
| list0_rc_nil() => tt
| list0_rc_cons(x0, xs) =>
  let
    val
    test =
    list0_rc_forall1$test<x0>(x0)
  in
    if
    test
    then
    let
    val
    (pf0,fpf|p0)
    =
    vtakeout(xs)
    val
    test = loop(!p0)
    in
      test where {prval()=fpf(pf0)}
    end
    else false // end of [if]
  end
)
//
} (* end of [list0_rc_forall1] *)

(* ****** ****** *)

impltmp
{x0}//tmp
list0_rc_foreach1(xs) =
(
let
val
(pf0,fpf|p0)
=
vtakeout(xs) in
let
val () = loop(!p0)
in
let prval () = fpf(pf0) in () end
end
end
) where
{
//
vtypedef
nx = list0_rc_con(x0)
//
fun
loop(nx: &nx): void =
(
case+ nx of
| list0_rc_nil() => ()
| list0_rc_cons(x0, xs) =>
  let
    val () =
    list0_rc_foreach1$work<x0>(x0)
    val (pf0,fpf|p0) = vtakeout(xs)
  in
    let val () = loop(!p0); prval () = fpf(pf0) in () end
  end
)
//
} (* end of [list0_rc_foreach1] *)

(* ****** ****** *)

(* end of [list_rc.dats] *)
