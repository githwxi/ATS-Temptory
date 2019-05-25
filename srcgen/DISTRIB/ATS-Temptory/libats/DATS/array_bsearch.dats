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
(* Start time: April, 2013 *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gptr.sats"
#staload "./../SATS/array.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
array_bsearch
  {n}(A, asz) = let
//
prval () = lemma_array_param(A)
//
fun
half
{n:nat}.<>.
(n:size(n)):<> size(n/2) = n/2
fun
loop
{l,r:nat|l <= r; r <= n} .<r-l>.
(
A0: &array(a, n), l: size(l), r: size(r)
) :<> Sizelte(n) =
(
if
(l < r)
then let
  val m = l + half(r-l)
  val pm = addr@(A0.[m])
  val (
    pf, fpf | pm
  ) = $UN.ptr0_vtake{a}(pm)
  val sgn = array_bsearch$ford<a> (!pm)
  prval () = fpf (pf)
in
  if sgn <= 0 then loop(A0, l, m) else loop(A0, succ(m), r)
end else l (* end of [if] *)
)
//
in
  loop (A, i2sz(0), asz)
end (* end of [array_bsearch] *)

(* ****** ****** *)

(*
//
// HX: [bsearch] is in libc/stdlib
//
void *bsearch
(
  const void *key
, const void *base
, size_t nmemb, size_t size
, int (*compar)(const void *, const void *)
) ; // end of [bsearch]
*)
implement
{a}(*tmp*)
array_bsearch_libc
  (A, asz, key, cmp) = let
in
//
$extfcall
( cptr(a)
, "atspre_bsearch", addr@(key), addr@(A), asz, sizeof<a>, cmp
) // end of [$extfcall]
//
end // end of [array_bsearch_libc]

(* ****** ****** *)

(* end of [array_bsearch.dats] *)
