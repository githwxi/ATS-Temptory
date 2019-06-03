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
(* Start time: June, 2019 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.bucs320."
//
(* ****** ****** *)
//
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/stream_vt.sats"
//
(* ****** ****** *)
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/mylist.sats"

(* ****** ****** *)
//
impltmp
{a}(*tmp*)
list0_permute(xs) =
$UN.castvwtp0(list0_permute_vt<a>(xs))
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_permute_vt
  (xs) =
(
(
auxmain(xs)
) where
{
val xs =
list0_copy_vt<a>(xs)
}
) where
{
//
fun
mcons
( x0: a
, xss
: stream_vt(list0_vt(a))
)
: stream_vt(list0_vt(a)) =
$ldelay
(
case+ !xss of
|
~stream_vt_nil
 ((*void*)) =>
 stream_vt_nil()
|
~stream_vt_cons
 (xs0, xss) =>
 stream_vt_cons
 (list0_vt_cons(x0, xs0), mcons(x0, xss))
,
let val () = lazy_vt_free(xss) in (*freed*) end
)
//
fun
revapp
( xs:
  list0_vt(a)
, ys:
  !list0_vt(a)): list0_vt(a) =
(
case+ ys of
| list0_vt_nil() => xs
| list0_vt_cons(y0, ys) =>
  revapp(list0_vt_cons(y0, xs), ys)
)
//
fun
auxmain
(
xs: list0_vt(a)
) : stream_vt(list0_vt(a)) =
$ldelay
(
case+ xs of
| list0_vt_nil() =>
  stream_vt_sing(xs)
| list0_vt_cons _ => !
  (auxmain2(xs, list0_vt_nil()))
,
let
val () = list0_vt_free<a>(xs) in (*freed*)
end
)
and
auxmain2
(
xs: list0_vt(a)
,
ys: list0_vt(a)
) : stream_vt(list0_vt(a)) =
$ldelay
(
case+ xs of
|
~list0_vt_nil() =>
 (
   stream_vt_nil()
 ) where
 {
   val () = list0_vt_free<a>(ys)
 }
|
~list0_vt_cons(x0, xs) =>
 lazy_vt_force
 (
 stream_vt_append<list0_vt(a)>
 (
 let
 val xs = copy(xs)
 in
 mcons(x0, auxmain(revapp(xs, ys)))
 end
 ,
 auxmain2(xs, list0_vt_cons(x0, ys))
 )
 )
,
let
val () = list0_vt_free<a>(xs)
val () = list0_vt_free<a>(ys) in (*freed*)
end
)
} (* end of [list0_permute_vt] *)

(* ****** ****** *)

(* end of [cs320_mylist.sats] *)
