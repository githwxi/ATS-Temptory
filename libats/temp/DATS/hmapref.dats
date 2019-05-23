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
"libats/SATS/print.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/hashfun.sats"
#staload "./../SATS/hmapref.sats"

(* ****** ****** *)
//
implement
{}(*tmp*)
hmapref$hint((*void*)) = 64
implement
{k0,x0}
hmapref_make() =
hmapref_make_hint<k0,x0>(hmapref$hint<>())
//
(* ****** ****** *)

local

#staload
"./../SATS/hashmap_chain.sats"

extern
castfn
ref2ptr
{k0,x0:vtflt}(hmapref(k0,x0)): hashmap(k0,x0)
extern
castfn
ptr2ref
{k0,x0:vtflt}(hashmap(k0,x0)): hmapref(k0,x0)

in (* in-of-local *)

implement
{k0,x0}
hmapref_make_hint
  (hint) =
(
ptr2ref
(hashmap_make_hcap(i2sz(hint)))
) (* end of [hmapref_make_hint] *)

(* ****** ****** *)

implement
{}//tmp
hmapref_size
  (map) = let
val map = ref2ptr(map)
val res = hashmap_size<>(map)
in
  let prval () = $UN.cast2void(map) in res end
end (* end of [hmapref_size] *)

(* ****** ****** *)

implement
{k0,x0}
hmapref_search_ref
  (map, k0) = let
val map = ref2ptr(map)
val res =
hashmap_search_ref<k0,x0>(map, k0)
in
  let prval () = $UN.cast2void(map) in res end
end (* end of [hmapref_search_ref] *)

implement
{k0,x0}
hmapref_search_opt
  (map, k0) = let
val map = ref2ptr(map)
val opt =
hashmap_search_opt<k0,x0>(map, k0)
in
  let prval () = $UN.cast2void(map) in opt end
end (* end of [hmapref_search_opt] *)

implement
{k0,x0}
hmapref_insert_any
  (map, k0, x0) = let
val map = ref2ptr(map)
val res =
hashmap_insert_any<k0,x0>(map, k0, x0)
in
  let prval () = $UN.cast2void(map) in ( ) end
end (* end of [hmapref_insert_any] *)

implement
{k0,x0}
hmapref_insert_opt
  (map, k0, x0) = let
val map = ref2ptr(map)
val opt =
hashmap_insert_opt<k0,x0>(map, k0, x0)
in
  let prval () = $UN.cast2void(map) in opt end
end (* end of [hmapref_insert_opt] *)

implement
{k0,x0}
hmapref_remove
  (map, k0) = let
val map = ref2ptr(map)
val opt =
hashmap_remove<k0,x0>(map, k0)
in
  let prval () = $UN.cast2void(map) in opt end
end (* end of [hmapref_remove] *)
implement
{k0,x0}
hmapref_takeout_opt
  (map, k0) = let
val map = ref2ptr(map)
val opt =
hashmap_takeout_opt<k0,x0>(map, k0)
in
  let prval () = $UN.cast2void(map) in opt end
end (* end of [hmapref_takeout_opt] *)

(* ****** ****** *)

implement
{k0,x0}
hmapref_foreach
  (map) =
(
let
prval () =
$UN.cast2void(map) in ()
end
) where
{
//
val map = ref2ptr(map)
//
val res =
(
  hashmap_foreach1(map)
) where
{
implement
hashmap_foreach1$work<k0,x0> = hmapref_foreach$work<k0,x0>
} (* end of [val] *)
//
} (* end of [hmapref_foreach] *)

end // end of [local]

(* ****** ****** *)
//
implement
hmapref_print$beg<>() = print("(")
implement
hmapref_print$end<>() = print(")")
implement
hmapref_print$sep<>() = print(",")
implement
hmapref_print$mapto<>() = print("->")
//
(* ****** ****** *)

implement
{k0,x0:vtflt}
hmapref_print(map) =
(
hmapref_print$beg<>();
hmapref_foreach<k0,x0>(map);
hmapref_print$end<>();
) where
{
//
var i0 = (0:int)
//
val p0 =
$UN.cast{ref(int)}(addr@i0)
//
implement
hmapref_foreach$work<k0,x0>(k0, x0) =
(
let
val i0 = !p0
val () = !p0 := i0 + 1
in
if
(i0 > 0)
then
hmapref_print$sep<>();
//
print$val<k0>(k0); hmapref_print$mapto<>(); print$val<x0>(x0);
//
end
) (* end of [where] *)
} (* end of [hmapref_print] *)

(* ****** ****** *)

(* end of [hmapref.dats] *)
