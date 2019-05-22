(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

(* Author: Hongwei Xi *)
(* Start time: December, 2012 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/list_vt.sats"

(* ****** ****** *)

#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"

(* ****** ****** *)

#staload
"./../SATS/linmap_list.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#include "./SHARE/linmap.hats"

(* ****** ****** *)

absimpl
map_vtbox
(k0:vtflt,x0:vtflt) = list0_vt(@(k0, x0))

(* ****** ****** *)

implement
{}(*tmp*)
linmap_nil() = list0_vt_nil()
implement
{}(*tmp*)
linmap_make_nil() = list0_vt_nil()

(* ****** ****** *)

implement
{}(*tmp*)
linmap_iseqz(map) =
(
case+ map of
| list0_vt_nil _ => tt | list0_vt_cons _ => ff
)
implement
{}(*tmp*)
linmap_isneqz(map) =
(
case+ map of
| list0_vt_nil _ => ff | list0_vt_cons _ => tt
)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_size(map) = i2sz(list0_vt_length(map))

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_free(map) = list0_vt_free<(k0,x0)>(map)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_listize(map) = (map) (*list0_vt((k0, x0))*)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_insert
(map, k0, x0, r0) =
let
//
vtypedef kx = @(k0, x0)
//
val
ans =
linmap_takeout<k0,x0>(map, k0, r0)
in
ans where
{
val () =
map := list0_vt_cons{kx}((k0, x0), map)
} (* end of [where] *)
end (* end of [linmap_insert] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_insert_any
(map, k0, x0) = let
//
vtypedef kx = @(k0, x0)
//
in
  map := list0_vt_cons{kx}((k0, x0), map)
end // end of [linmap_insert_any]

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_takeout
  (map, k0, r0) =
(
  loop (map, k0, r0)
) where
{
//
vtypedef kx = @(k0, x0)
vtypedef kxs = list0_vt(kx)
//
fun
loop
( m0
: &list0_vt(kx) >> _
, k0: !k0, r0: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) =
(
//
case+ m0 of
|
@list0_vt_nil() =>
 let
    prval () = fold@(m0)
    prval () = opt_none{x0}(r0) in ff
 end // end of [list_vt_nil]
|
@list0_vt_cons
   (kx, m1) => let
   val iseq =
   equal_key_key<k0>(k0, kx.0)
 in
   if
   iseq
   then
   let
     val () = r0 := kx.1
     val () = gfree$val<k0>(kx.0)
     val m1 = m1
     val () = free@(m0)
     val () = (m0 := m1)
   in
     let
     prval () = opt_some{x0}(r0) in tt
     end
   end // end of [then]
   else
   let
     val opt = loop(m1, k0, r0)
   in
     let prval () = fold@(m0) in opt end
   end // end of [else]
 end // end of [list_vt_cons]
//
) (* end of [loop] *)
//
} (* end of [linmap_takeout] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_forall1(map) =
  ( loop(map) ) where
{
//
vtypedef kx = @(k0, x0)
//
fun
loop
(m0: !list0_vt(kx) >> _): bool =
(
case+ m0 of
|
@list0_vt_nil() =>
 (fold@(m0); true)
|
@list0_vt_cons(kx, m1) =>
 let
   val test =
   linmap_forall1$test<k0,x0>(kx.0, kx.1)
 in
   if
   test
   then
   let
   val opt = loop(m1) in fold@(m0); opt
   end
   else
   let prval () = fold@(m0) in false end
 end
)
} (* end of [linmap_forall1] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
linmap_foreach1(map) =
  ( loop(map) ) where
{
//
vtypedef kx = @(k0, x0)
//
fun
loop
(m0: !list0_vt(kx) >> _): void =
(
case+ m0 of
|
 list0_vt_nil() => ()
|
@list0_vt_cons(kx, m1) =>
 let
 val () =
 linmap_foreach1$work<k0,x0>(kx.0, kx.1)
 in
   let val () = loop(m1) in fold@(m0) end
 end
)
} (* end of [linmap_foreach1] *)

(* ****** ****** *)

(* end of [linmap_list.dats] *)
