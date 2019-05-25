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
"libats/SATS/bool.sats"
#staload
"libats/SATS/array.sats"
#staload
"libats/SATS/list_vt.sats"

(* ****** ****** *)

#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"

(* ****** ****** *)

#staload
"./../SATS/hashfun.sats"
#staload
"./../SATS/hashmap_chain.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#include "./SHARE/hashmap.hats"

(* ****** ****** *)
//
implement
{}(*tmp*)
hashmap$hcap() = 64
implement
{k0,x0}//tmp
hashmap_make() =
hashmap_make_hcap
(i2sz(hashmap$hcap<>()))
//
(* ****** ****** *)
//
absvtbox
chain_vtbox
(k0:vtflt, x0:vtflt+) = ptr
//
(* ****** ****** *)

sexpdef chain = chain_vtbox

(* ****** ****** *)
//
extern
fun{}
chain_nil
{k0,x0:vtflt}(): chain(k0, x0)
//
(* ****** ****** *)

extern
fun
{k0,x0:vtflt}
chain_free(chain(k0, INV(x0))): void

(* ****** ****** *)

extern
fun
{k0,x0:vtflt}
chain_listize
(chain(k0, INV(x0))): list0_vt(@(k0, x0))

(* ****** ****** *)
//
extern
fun
{k0,x0:vtflt}
chain_search_ref
(kxs: !chain(k0, INV(x0)), k0: !k0): cptr0(x0)
// end of [chain_search_ref]
//
(* ****** ****** *)
//
extern
fun
{k0,x0:vtflt}
chain_insert
( kxs
: &chain(k0, INV(x0)) >> _
, k0: k0, x0: x0, res: &x0? >> opt(x0, b)
) : #[b:bool] bool (b) // endfun
extern
fun
{k0,x0:vtflt}
chain_insert_any
( kxs
: &chain(k0, INV(x0)) >> _, k0: k0, x0: x0): void
//
(* ****** ****** *)

extern
fun
{k0,x0:vtflt}
chain_takeout
( kxs
: &chain(k0, INV(x0)) >> _
, k0: !k0, res: &x0? >> opt(x0, b)): #[b:bool] bool(b)

(* ****** ****** *)
//
extern
fun
{k0,x0:vtflt}
chain_foreach1
(kxs: !chain(k0, INV(x0))): void
extern
fun
{k0,x0:vtflt}
chain_foreach1$work(k0: !k0, x0: !x0): void
//
(* ****** ****** *)

local
//
#staload
LM = "./../SATS/linmap_list.sats"
//
absimpl
chain_vtbox
(k0:vtflt, x0:vtflt) = $LM.map(k0, x0)
//
in(*in-of-local*)

(* ****** ****** *)

implement
{k0}(*tmp*)
$LM.equal_key_key = equal_key_key<k0>

(* ****** ****** *)
//
implement
{}(*tmp*)
chain_nil() =
$LM.linmap_nil<>((*void*))
//
(* ****** ****** *)
//
implement
{k0,x0}
chain_free
  (map) =
  $LM.linmap_free<k0,x0>(map)
//
(* ****** ****** *)
//
implement
{k0,x0}
chain_listize
  (map) =
  $LM.linmap_listize<k0,x0>(map)
//
(* ****** ****** *)

implement
{k0,x0}
chain_search_ref
(map, k0) =
$LM.linmap_search_ref<k0,x0>(map, k0)

(* ****** ****** *)

implement
{k0,x0}
chain_insert
(map, k0, x0, r0) =
$LM.linmap_insert<k0,x0>(map, k0, x0, r0)
implement
{k0,x0}
chain_insert_any
(map, k0, x0) =
$LM.linmap_insert_any<k0,x0>(map, k0, x0)

(* ****** ****** *)
//
implement
{k0,x0}
chain_takeout(map, k0, res) =
(
  $LM.linmap_takeout<k0,x0>(map, k0, res)
)
//
(* ****** ****** *)

implement
{k0,x0}
chain_foreach1(map) =
(
$LM.linmap_foreach1<k0,x0>(map)
) where
{
implement
$LM.linmap_foreach1$work<k0,x0> = chain_foreach1$work<k0,x0>
} (* end of [chain_foreach1] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
datavtype hashmap
(k0:vtflt, x0:vtflt+) =
| {m:int | m >= 1}
  HASHMAP of
  (arrayptr(chain(k0, x0), m), size(m), size)
// end of [hashmap]
//
(* ****** ****** *)

absimpl
hashmap_vtbox(k0:vtflt, x0:vtflt) = hashmap(k0, x0)

(* ****** ****** *)
//
implement
{k0,x0}
hashmap_make_hcap
([m:int]cap) =
(
HASHMAP(A0, cap, i2sz(0))
) where
{
//
vtypedef
chain = chain(k0, x0)
//
(*
val c0 =
chain_nil{k0,x0}()
val c0 =
$UN.castvwtp0{ptr}(c0)
val A0 =
arrayptr_make_elt<ptr>(cap, c0)
val A0 =
$UN.castvwtp0{arrayptr(chain,m)}(A0)
*)
val A0 = $UN.calloc<ptr>(cap)
val A0 = $UN.castvwtp0{arrayptr(chain,m)}(A0)
//
} (* end of [hashmap_make_nil] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
hashmap_size
  (map) = let
//
val+
HASHMAP
( A0
, cat
, ntot) = map in g1ofg0(ntot)
//
end // end of [hashmap_size]

(* ****** ****** *)

implement
{}(*tmp*)
hashmap_hcap
  (map) = let
//
val+
HASHMAP
(A0, cap, ntot) = map in (cap)
//
end // end of [hashmap_get_hcap]

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_free
  (map) = let
//
val+
~HASHMAP
 (A0, cap, n0) = map
//
val () =
(
  loop(p0, p0 + cap)
) where
{
//
val p0 = cptrof(A0)
//
vtypedef
chain = chain(k0, x0)
//
fun
loop
( p0: cptr(chain)
, p1: cptr(chain)): void =
(
if
(p0 < p1)
then let
  val kxs = $UN.cptr0_get(p0)
in
  chain_free<k0,x0>(kxs); loop(succ(p0), p1)
end (* end of [then] *)
)
//
} (* end of [where] *)
in
arrayptr_free($UN.castvwtp0{arrayptr(ptr,0)}(A0))
end // end of [hashmap_free]

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_search_ref
  (map, k0) =
(
let
prval () = fpf(pf0) in res
end
) where
{
//
val+
HASHMAP(A0, cap, n0) = map
//
val h0 = hash_key<k0>(k0)
val h0 = $UN.cast{size}(h0)
val i0 = g1mod_usize_usize(g1ofg0(h0), cap)
//
val pi = cptrof(A0) + i0
val
(pf0, fpf | pi) = $UN.cptr0_vtake(pi)
//
val res = chain_search_ref<k0,x0>(!pi, k0)
//
} (* end of [hashmap_search_ref] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_insert
(map, k0, x0, r0) =
  ( yn ) where
{
//
val+@HASHMAP(A0, cap, n0) = map
//
val h0 = hash_key<k0>(k0)
val h0 = $UN.cast{size}(h0)
val i0 = g1mod_usize_usize(g1ofg0(h0), cap)
//
val pi = cptrof(A0) + i0
//
val
(pf0,fpf|pi) = $UN.cptr0_vtake(pi)
//
val yn =
chain_insert<k0,x0>(!pi, k0, x0, r0)
//
val () = let prval () = fpf(pf0) in () end
//
val () =
if
not(yn)
then n0 := succ(n0)
//
prval
((*folded*)) = fold@(map)
//
val () =
if
not(yn)
then
(
  if
  hashmap$resizable() > 0
  then
  let
  val
  cap =
  hashmap_adjust_hcap<k0,x0>(map)
  in
    ((*nothing*))
  end // end of [then] // end of [if]
)
//
} (* end of [hashmap_insert] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_insert_any
  (map, k0, x0) =
  ( (* void *) ) where
{
//
val+@HASHMAP(A0, cap, n0) = map
//
val h0 = hash_key<k0>(k0)
val h0 = $UN.cast{size}(h0)
val i0 = g1mod_usize_usize(g1ofg0(h0), cap)
//
val pi = cptrof(A0) + i0
//
val
(pf0,fpf|pi) = $UN.cptr0_vtake(pi)
//
val () =
chain_insert_any<k0,x0>(!pi, k0, x0)
//
val () =
  let prval () = fpf(pf0) in () end
//
val () =
let
val () = (n0 := succ(n0)) in fold@(map)
end // end of [val]
//
val () =
(
  if
  hashmap$resizable() > 0
  then
  let
  val
  cap =
  hashmap_adjust_hcap<k0,x0>(map)
  in
    (*nothing*)
  end // end of [then] // end of [if]
)
//
} (* end of [hashmap_insert_any] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_takeout
  (map, k0, res) =
(
let
prval () = fold@(map) in yn
end
) where
{
//
val+@HASHMAP(A0, cap, n0) = map
//
val h0 = hash_key<k0>(k0)
val h0 = $UN.cast{size}(h0)
val i0 = g1mod_usize_usize(g1ofg0(h0), cap)
//
val pi = cptrof(A0) + i0
//
val
(pf0,fpf|pi) = $UN.cptr0_vtake(pi)
//
val yn =
chain_takeout<k0,x0>(!pi, k0, res)
//
val () =
  let prval () = fpf(pf0) in () end
//
val () = if yn then n0 := pred(n0) // removed
//
} (* end of [hashmap_takeout] *)

(* ****** ****** *)

implement
{k0,x0}//tmp
hashmap_takeout_all
  (map) = let
//
val+@HASHMAP(A0, cap, n0) = map
//
val pa = cptrof(A0)
val pz = (pa + cap)
val res =
(
loop(pa, pz, res)
) where
{
//
vtypedef kx = @(k0, x0)
vtypedef kxs = list0_vt(kx)
vtypedef chain = chain(k0, x0)
//
fun
loop
( pa: cptr(chain)
, pz: cptr(chain)
, res: list0_vt(kx)): list0_vt(kx) =
(
if
(pa >= pz)
then res
else let
  val pz = pred(pz)
  val kxs =
  $UN.cptr0_exch(pz, chain_nil())
  val kxs = chain_listize<k0,x0>(kxs)
in
  loop(pa, pz, list0_vt_append(kxs, res))
end // end of [then]
)
val res = list0_vt_nil{kx}((*void*))
}
//
in
let
val () = (n0 := i2sz(0)) in fold@(map); res
end
end // end of [hashmap_takeout_all]

(* ****** ****** *)

implement
{k0,x0}
hashmap_reset_hcap
( map, [m2:int]cap2 ) =
(
let
//
val () = A1 := A2
val () = cap1 := cap2
//
prval() = fold@(map) in true(*always!*)
end
) where
{
//
vtypedef
kx = @(k0, x0)
vtypedef
chain = chain(k0, x0)
//
val+
@HASHMAP(A1, cap1, n0) = map
//
(*
val c0 =
chain_nil{k0,x0}()
val c0 =
$UN.castvwtp0{ptr}(c0)
val A2 =
arrayptr_make_elt<ptr>(cap2, c0)
val A2 =
$UN.castvwtp0{arrayptr(chain, m2)}(A2)
*)
//
val A2 =
$UN.calloc<ptr>(cap2)
val A2 =
$UN.castvwtp0{arrayptr(chain, m2)}(A2)
//
local
val
A2 = cptrof(A2)
in(* in-of-local *)
//
fun loop1
(
  kxs: list0_vt(kx)
) : void =
(
case+ kxs of
|
~list0_vt_nil() => ()
|
~list0_vt_cons(kx0, kxs) =>
 (
 let
 prval () = fpf(pf0) in loop1(kxs)
 end
 )  where
 {
   val k0 = kx0.0
   val x0 = kx0.1
   val h0 =
   hash_key<k0>(k0)
   val h0 =
   $UN.cast{size}(h0)
   val i0 =
   g1mod_usize_usize(g1ofg0(h0), cap2)
   val pi = (A2 + i0)
   val
   (pf0, fpf | pi) = $UN.cptr0_vtake(pi)
   val () = chain_insert_any<k0,x0>(!pi, k0, x0)
 } (* end of [list0_vt_cons] *)
)
fun loop2
( p0: cptr(chain)
, p1: cptr(chain)): void =
if
(p0 < p1)
then let
  val kxs =
  $UN.cptr0_exch(p0, chain_nil())
  val kxs = chain_listize<k0,x0>(kxs)
in
  let
  val () = loop1(kxs) in loop2(succ(p0), p1)
  end
end // end of [then]
end // end of [local]
//
val () =
let val p0 =
cptrof(A1) in loop2(p0, p0+cap1) end
val () =
arrayptr_free($UN.castvwtp0{arrayptr(ptr,0)}(A1))
//
} (* end of [hashmap_reset_hcap] *)

(* ****** ****** *)
//
(*
HX:
please
re-implement if needed
*)
//
implement
{k0,x0}//tmp
hashmap_adjust_hcap
  (map) = let
//
val+HASHMAP(A0, cap, n0) = map
//
in
//
if
(i2sz(5) * cap <= n0)
then
(
hashmap_reset_hcap<k0,x0>(map, cap + cap)
) else false // end of [if]
//
end // end of [hashmap_adjust_hcap]
//
(* ****** ****** *)

implement
{k0,x0:vtflt}
hashmap_foreach1(map) =
let
//
val+HASHMAP(A0, cap, n0) = map
//
vtypedef chain = chain(k0, x0)
//
fun
loop
( p0: cptr(chain)
, p1: cptr(chain)): void =
(
if
(p0 < p1)
then let
  val kxs = $UN.cptr0_get(p0)
  val ( ) =
  (
    chain_foreach1<k0,x0>(kxs)
  ) where
  {
    implement
    chain_foreach1$work<k0,x0>(k0, x0) =
    hashmap_foreach1$work<k0, x0>(k0, x0)
  }
in
let
prval ( ) =
$UN.cast2void(kxs) in loop(succ(p0), p1) end
end // end of [then]
) (* end of [loop] *)
//
in
let val p0 = cptrof(A0) in loop(p0, p0 + cap) end
end // end of [hashmap_foreach1]

(* ****** ****** *)

(* end of [hashmap_chain.dats] *)
