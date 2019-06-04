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
"libats/SATS/gint.sats"
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

impltmp
{a}(*tmp*)
list0_nchoose
(xs, n0) =
(
  auxmain(xs, n0)
) where
{
//
typedef xs = list0(a)
//
fun
auxmain
(
xs: list0(a)
,
n0: Intgte(0)
) : stream_vt(list0(a)) =
$ldelay
(
if
(n0 = 0)
then
stream_vt_sing(list0_nil())
else
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  ( lazy_vt_force
    (stream_vt_append<xs>(xss1, xss2))
  ) where
  {
    val xss2 =
    (
      auxmain(xs, n0)
    )
    val xss1 =
    (
      stream_vt_map<xs><xs>
      (auxmain(xs, pred(n0)))
    ) where
    {
      impltmp
      stream_vt_map$fopr<xs><xs>(xs) = list0_cons(x0, xs)
    }
  } (* end of [list0_cons] *)
)
)
} (* end of [list0_nchoose] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_nchoose_rest
(xs, n0) =
(
  auxmain(xs, n0)
) where
{
//
typedef xy =
tup(list0(a), list0(a))
//
fun
auxmain
(
xs: list0(a)
,
n0: Intgte(0)): stream_vt(xy) =
$ldelay
(
if
(n0 = 0)
then
stream_vt_sing
(@(list0_nil(), xs))
else
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  ( lazy_vt_force
    (stream_vt_append<xy>(res1, res2))
  ) where
  {
    val res2 =
    (
    stream_vt_map<xy><xy>(auxmain(xs, n0))
    ) where
    {
    impltmp
    stream_vt_map$fopr<xy><xy>(xy) = (xy.0, list0_cons(x0, xy.1))
    }
    val res1 =
    (
    stream_vt_map<xy><xy>(auxmain(xs, pred(n0)))
    ) where
    {
    impltmp
    stream_vt_map$fopr<xy><xy>(xy) = (list0_cons(x0, xy.0), xy.1)
    }
  } (* end of [list0_cons] *)
)
)
} (* end of [list0_nchoose_rest] *)

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
revappb
( xs:
  list0_vt(a)
, ys:
  !list0_vt(a)): list0_vt(a) =
(
case+ ys of
| list0_vt_nil() => xs
| list0_vt_cons(y0, ys) =>
  revappb(list0_vt_cons(y0, xs), ys)
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
 mcons(x0, auxmain(revappb(xs, ys)))
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
