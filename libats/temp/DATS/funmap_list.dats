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
"libats/SATS/bool.sats"
#staload
"libats/SATS/gseq.sats"
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/list_vt.sats"

#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"

(* ****** ****** *)
//
#staload
"./../SATS/funmap_list.sats"
//
(* ****** ****** *)
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./SHARE/funmap.hats"
//
(* ****** ****** *)
//
absimpl
map_tbox
(k0:tflt,x0:tflt) = list0(tup(k0, x0))
//
(* ****** ****** *)
//
implement
{}(*tmp*)
funmap_nil() = list0_nil()
implement
{}(*tmp*)
funmap_make_nil() = list0_nil()
//
(* ****** ****** *)
//
implement
{}(*tmp*)
funmap_iseqz(kxs) = list0_iseqz<>(kxs)
implement
{}(*tmp*)
funmap_isneqz(kxs) = list0_isneqz<>(kxs)
//
(* ****** ****** *)
//
implement
{k0,x0}
funmap_size(kxs) =
i2sz
($UN.cast{Nat}(list0_length<(k0,x0)>(kxs)))
implement
{k0,x0}
funmap_length(kxs) = list0_length<(k0,x0)>(kxs)
//
(* ****** ****** *)
//
implement
{k0,x0}
funmap_search
(map, k0, r0) =
(
  loop(map, k0, r0)
) where
{
//
typedef kx = (k0, x0)
typedef m0 = list0(kx)
//
fun
loop
( m0: m0
, k0: k0
, r0
: &x0? >> opt(x0, b)
) : #[b:bool] bool(b) =
(
//
case+ m0 of
| list0_nil() =>
  ( false
  ) where
  { prval () = opt_none{x0}(r0) }
| list0_cons(kx, kxs) =>
  if
  equal_key_key<k0>(k0, kx.0)
  then
  let
    val () = r0 := kx.1
  in
    true where
    { prval () = opt_some{x0}(r0) }
  end (* then *)
  else loop(kxs, k0, r0) (* else *)
//
) (* end of [loop] *)
//
} (* end of [funmap_search] *)

(* ****** ****** *)

implement
{k0,x0}
funmap_insert
(
  map, k0, x0, r0
) =
( found
) where
{
//
typedef kx = (k0, x0)
//
val
found =
funmap_takeout<k0,x0>(map, k0, r0)
val () =
(map := list0_cons{kx}((k0,x0), map))
//
} (* end of [funmap_insert] *)

(* ****** ****** *)
//
implement
{k0,x0}
funmap_insert_any
  (map, k0, x0) =
(
  map :=
  list0_cons{(k0,x0)}((k0, x0), map)
)
//
(* ****** ****** *)

implement
{k0,x0}
funmap_takeout
  (map, k0, r0) =
(
loop
(map, k0, r0, kxs1, kxs2)
) where
{
//
val kxs1 = map
and kxs2 = list0_vt_nil()
//
typedef kx = (k0, x0)
typedef m0 = map(k0, x0)
//
fun loop
( m0: &m0 >> _
, k0: k0
, r0: &x0? >> opt (x0, b)
, kxs1: list0(kx), kxs2: list0_vt(kx)
) : #[b:bool] bool(b) =
(
//
case+ kxs1 of
|
list0_nil((*void*)) =>
let
  val () =
  list0_vt_free<kx>(kxs2)
in
  false where
  { prval () = opt_none{x0}(r0) }
end // end of [list0_nil]
|
list0_cons(kx1, kxs1) =>
(
  if
  equal_key_key<k0>(k0, kx1.0)
  then
  ( true
  ) where
  {
    val () = (r0 := kx1.1)
  prval () = opt_some{x0}(r0)
    val () =
    m0 :=
    (
    list0_vt_foldleft0<kx><r0>(kxs2, kxs1)
    ) where
    {
    typedef r0 = list0(kx)
    implement
    list0_vt_foldleft0$fopr<kx><r0>
      (r0, kx) = list0_cons{kx}(kx, r0)
    }
  } else
  (
    loop(m0, k0, r0, kxs1, kxs2)
  ) where
  { 
    val kxs2 = list0_vt_cons{kx}(kx1, kxs2)
  }
) (* end of [list0_cons] *)
//
) (* end of [loop] *)
} (* end of [funmap_takeout] *)

(* ****** ****** *)

(* end of [funmap_list.dats] *)
