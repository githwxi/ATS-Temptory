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

#define CNUL '\000'

(* ****** ****** *)
//
#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/bool.sats"
#staload "./../SATS/char.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/string.sats"
#staload "./../SATS/list_vt.sats"
//
#staload UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_implode
  (cs) =
(
string0_make_list0(cs)
)
implement
{}(*tmp*)
string0_make_list0
  (cs) =
(
  $UN.cast{string0}(cp0)
) where
{
//
val n0 =
$UN.cast{uint}(length(cs))
val cp0 = $UN.calloc<char>(n0)
//
val cp1 =
(
list0_foldleft<x0><r0>(cs, cp0)
) where
{
  typedef x0 = char
  typedef r0 = cptr0(char)
  implement
  list0_foldleft$fopr<x0><r0>
    (cp, c0) =
  (
    $UN.cptr0_set(cp, c0); cptr0_succ(cp)
  )
} (* end of [val] *)
//
val () = $UN.cptr0_set(cp1, CNUL)
//
} (* end of [string0_make_list0] *)
implement
{}(*tmp*)
string0_make_list0_vt
  (cs) =
(
  $UN.cast{string0}(cp0)
) where
{
//
val n0 =
$UN.cast{uint}(length(cs))
val cp0 = $UN.calloc<char>(n0)
//
val cp1 =
(
list0_vt_foldleft<x0><r0>(cs, cp0)
) where
{
  typedef x0 = char
  typedef r0 = cptr0(char)
  implement
  list0_vt_foldleft$fopr<x0><r0>
    (cp, c0) =
  (
    $UN.cptr0_set(cp, c0); cptr0_succ(cp)
  )
} (* end of [val] *)
//
val () = $UN.cptr0_set(cp1, CNUL)
//
} (* end of [string0_make_list0_vt] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_iseqz(cs) =
$effmask_all
(
iseqz
($UN.cptr0_get(cptrof(cs)))
)
implement
{}(*tmp*)
string0_isneqz(cs) =
$effmask_all
(
isneqz
($UN.cptr0_get(cptrof(cs)))
)

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_length(cs) =
(
$effmask_all
(gseq_length<string><char>(cs))
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_indexof(cs, c0) =
(
$effmask_all
(gseq_indexof<string><char>(cs, c0))
)
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_streamize
  (cs) =
(
  auxmain
  (string0_cptrof(cs))
) where
{
fun
auxmain
(
cp: cptr(char)
) : stream_vt(char) = $ldelay
(
let
  val c0 = $UN.cptr0_get(cp)
in
  if
  iseqz(c0)
  then stream_vt_nil()
  else stream_vt_cons(c0, auxmain(succ(cp)))
end // end of [let]
)
} (* end of [string0_streamize] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_forall(cs) =
(
loop(string0_cptrof(cs))
) where
{
fun
loop(p0: cptr(char)): bool =
let
  val c0 = $UN.cptr0_get(p0)
in
if
iseqz(c0)
then true else
(
let
val
test =
string0_forall$test<>(c0)
in
if test then loop(succ(p0)) else false
end // end of [let]
)
end // end of [loop]
} (* end of [string0_forall] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_foreach(cs) =
(
loop(string0_cptrof(cs))
) where
{
fun
loop(p0: cptr(char)): void =
let
  val c0 = $UN.cptr0_get(p0)
in
if
isneqz(c0) then
(string0_foreach$work<>(c0); loop(succ(p0)))
end // end of [loop]
} (* end of [string0_foreach] *)
//
(* ****** ****** *)

(* end of [string.dats] *)
