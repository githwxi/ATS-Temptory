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
(* Start time: February, 2019 *)
(* Authoremail: gmmhwxiATgmailDOTcom *)

(* ****** ****** *)
//
#define
ATS_PACKNAME
"temptory.temp.taggedval."
//
(* ****** ****** *)
//
(*
HX:
For tagged values
*)
//
(* ****** ****** *)

abstbox tobject = ptr

(* ****** ****** *)
//
datatype
taggedval =
//
| TVnil of ()
//
| TVint of (int)
| TVptr of (ptr)
//
| TVflt of double
| TVstr of string
//
| TVarr of tarray0
| TVlst of tvalist
//
| TVobj of tobject
//
//
| TVfun of tcloref
//
where
tvalue = taggedval
and
tvalist = list0(tvalue)
and
tarray0 = arrszref(tvalue)
(*
and
tobject =
hmapref(string, tvalue)
*)
and
tcloref =
(tvalist) -<cloref1> tvalue
//
(* ****** ****** *)
//
fun{}
tvalue_print(tvalue): void
fun{}
tobject_print(tobject): void
//
#symload print with tvalue_print
#symload print with tobject_print
//
(* ****** ****** *)
//
local
#staload "./hmapref.sats"
in
  typedef
  hmapref =
  hmapref(string, tvalue)
  fun{}
  tobject_encode(hmapref): tobject
  fun{}
  tobject_decode(tobject): hmapref
end // local
//
(* ****** ****** *)

#macdef
TVint_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVint(i0) => i0 | _ =>
  let val () = assertloc(false) in exit(1) end
end
) : int // end of [TVint_un]

(* ****** ****** *)

#macdef
TVptr_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVptr(p0) => p0 | _ =>
  let val () = assertloc(false) in exit(1) end
end
) : ptr // end of [TVptr_un]

(* ****** ****** *)

#macdef
TVflt_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVflt(f0) => f0 | _ =>
  let val () = assertloc(false) in exit(1) end
end
) : double // end of [TVflt_un]

#macdef
TVstr_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVstr(str) => str | _ =>
    let val () = assertloc(false) in exit(1) end
// end of [case+]
end
) : string // end of [TVstr_un]

(* ****** ****** *)

#macdef
TVlst_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVlst(lst) => lst | _ =>
    let val () = assertloc(false) in exit(1) end
// end of [case+]
end
) : tvalist // end of [TVlst_un]

(* ****** ****** *)

#macdef
TVobj_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVobj(obj) => obj | _ =>
    let val () = assertloc(false) in exit(1) end
// end of [case+]
end
) : tobject // end of [TVobj_un]

(* ****** ****** *)

#macdef
TVfun_un(x0) =
(
let
val x0 = ,(x0)
in
case+ x0 of
| TVfun(tfn) => tfn | _ =>
    let val () = assertloc(false) in exit(1) end
end
) : tcloref // end of [TVfun_un]

(* ****** ****** *)
//
fun{}
tvalue_iseqz(tvalue): bool
fun{}
tvalue_isneqz(tvalue): bool
//
#symload iseqz with tvalue_iseqz
#symload isneqz with tvalue_isneqz
//
(* ****** ****** *)
//
fun{}
tobject_get_at
( obj
: tobject, k0: string): tvalue
fun{}
tobject_set_at
( obj
: tobject, k0: string, x0: tvalue): void
//
#symload [] with tobject_get_at of 10
#symload [] with tobject_set_at of 10
//
(* ****** ****** *)
//
fun{}
tobject_forall
(t0: tobject): bool
fun{}
tobject_forall$test
(k0: string, x0: tvalue): bool
fun{}
tobject_exists
(t0: tobject): bool
fun{}
tobject_exists$test
(k0: string, x0: tvalue): bool
//
fun{}
tobject_foreach
(t0: tobject): void
fun{}
tobject_foreach$work
(k0: string, x0: tvalue): void
//
(* ****** ****** *)

(* end of [taggedval.sats] *)
