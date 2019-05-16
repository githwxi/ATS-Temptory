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
//
#staload UN = "./../SATS/unsafe.sats"
//
(* ****** ****** *)

implement
{a}//tmp
ptr0_succ(p0) =
g0add_ptr_size(p0, sizeof<a>)
implement
{a}//tmp
ptr0_pred(p0) =
g0sub_ptr_size(p0, sizeof<a>)

implement
{a}//tmp
ptr0_add_size(p0, n0) =
g0add_ptr_size(p0, n0*sizeof<a>)
implement
{a}//tmp
ptr0_sub_size(p0, n0) =
g0sub_ptr_size(p0, n0*sizeof<a>)

implement
{a}//tmp
ptr0_add_sint(p0, n0) =
g0add_ptr_size(p0, i2sz(n0)*sizeof<a>)
implement
{a}//tmp
ptr0_sub_sint(p0, n0) =
g0sub_ptr_size(p0, i2sz(n0)*sizeof<a>)

(* ****** ****** *)
//
implement
{a}//tmp
ptr1_succ(p0) =
$UN.cast
(g0add_ptr_size(p0, sizeof<a>))
implement
{a}//tmp
ptr1_pred(p0) =
$UN.cast
(g0sub_ptr_size(p0, sizeof<a>))
//
(* ****** ****** *)
//
implement
{a}//tmp
cptr0_succ(cp) =
(
ptr2cptr{a}
(g0add_ptr_size(cptr2ptr(cp), sizeof<a>))
)
implement
{a}//tmp
cptr0_pred(cp) =
(
ptr2cptr{a}
(g0sub_ptr_size(cptr2ptr(cp), sizeof<a>))
)
//
(* ****** ****** *)
//
implement
{a}//tmp
g0add_cptr_size(cp, n0) =
(
ptr2cptr{a}
(g0add_ptr_size(cptr2ptr(cp), n0*sizeof<a>))
)
implement
{a}//tmp
g0sub_cptr_size(cp, n0) =
(
ptr2cptr{a}
(g0sub_ptr_size(cptr2ptr(cp), n0*sizeof<a>))
)
//
implement
{a}//tmp
g0add_cptr_sint(cp, n0) =
(
ptr2cptr{a}
(g0add_ptr_size(cptr2ptr(cp), i2sz(n0)*sizeof<a>))
)
implement
{a}//tmp
g0sub_cptr_sint(cp, n0) =
(
ptr2cptr{a}
(g0sub_ptr_size(cptr2ptr(cp), i2sz(n0)*sizeof<a>))
)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
cptr0_forall
  (cp0, cp1) = let
//
fun
loop
(p0: ptr, pz: ptr): bool =
(
if
(p0 >= pz)
then true else
let
val x0 =
$UN.ptr0_get<a>(p0)
val test =
cptr0_forall$test<a>(x0)
//
in (* in-of-let *)
let
prval () =
$UN.cast2void(x0)
in
if
test
then
loop(p0+sizeof<a>, pz) else false
end
end (* end-of-let *)
)
//
in
  loop(cptr2ptr(cp0), cptr2ptr(cp1))
end (* end of [cptr0_forall] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
cptr0_foreach
  (cp0, cp1) =
(
loop
( cptr2ptr(cp0)
, cptr2ptr(cp1) )
) where
{
//
fun
loop
(p0: ptr, pz: ptr): void =
(
if
(p0 < pz)
then
let
val x0 =
$UN.ptr0_get<a>(p0)
val () =
cptr0_foreach$work<a>(x0)
in (* in-of-let *)
let
prval () =
$UN.cast2void(x0) in loop(p0+sizeof<a>, pz)
end
end (* end-of-let *)
)
//
} (* end of [cptr0_foreach] *)
//
(* ****** ****** *)
//
//
implement
{a}(*tmp*)
cptr0_rforall
  (cp1, cp0) =
(
loop
( cptr2ptr(cp0)
, cptr2ptr(cp1) )
) where
{
//
fun
loop
(p0: ptr, pa: ptr): bool =
(
if
(p0 <= pa)
then true else
let
val p0 =
p0 - (sizeof<a>)
val x0 =
$UN.ptr0_get<a>(p0)
val test =
cptr0_forall$test<a>(x0)
in (* in-of-let *)
let
prval () =
$UN.cast2void(x0) in
if test then loop(p0, pa) else false
end
end (* end-of-let *)
)
//
} (* end of [cptr0_rforall] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
cptr0_rforeach
  (cp1, cp0) =
(
loop
( cptr2ptr(cp0)
, cptr2ptr(cp1) )
) where
{
//
fun
loop
(p0: ptr, pa: ptr): void =
(
if
(p0 > pa)
then let
val p0 =
p0 - (sizeof<a>)
val x0 =
$UN.ptr0_get<a>(p0)
val () =
cptr0_foreach$work<a>(x0)
in
let
prval () =
$UN.cast2void(x0) in loop(p0, pa) end
end (* end of [loop] *)
)
//
} (* end of [cptr0_rforeach] *)
//
(* ****** ****** *)

(* end of [gptr.dats] *)
