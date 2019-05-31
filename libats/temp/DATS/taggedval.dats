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

#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/print.sats"

(* ****** ****** *)

#staload
UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/hmapref.sats"
#staload "./../SATS/taggedval.sats"

(* ****** ****** *)

impltmp
{}(*tmp*)
tvalue_iseqz
  (x0) =
(
case+ x0 of
| TVnil() => true | _ => false
)
impltmp
{}(*tmp*)
tvalue_isneqz
  (x0) =
(
case+ x0 of
| TVnil() => false | _ => (true)
)

(* ****** ****** *)

impltmp
{}(*tmp*)
tvalue_print
  (x0) =
(
case+ x0 of
| TVnil() =>
  print!("TV(", ")")
//
| TVint(x) =>
  print!("TVint(", x, ")")
| TVptr(x) =>
  print!("TVptr(", x, ")")
//
| TVflt(x) =>
  print!("TVflt(", x, ")")
| TVstr(x) =>
  print!("TVstr(", x, ")")
//
| TVarr(x) =>
  print!("TVarr(", x, ")")
| TVlst(x) =>
  print!("TVlst(", x, ")")
| TVobj(x) =>
  print!("TVobj(", x, ")")
//
| TVfun(x) =>
  print!("TVfun(", "<cloref>", ")")
//
) (* end of [print_tvalue] *)

(* ****** ****** *)

local
//
typedef k0 = string
typedef x0 = tvalue
//
absimpl
tobject =
hmapref(string, tvalue)
//
in(* in-of-local *)

(* ****** ****** *)

impltmp
{}(*tmp*)
tobject_get_at
  (obj, k0) =
(
let
val cp =
hmapref_search_ref<k0,x0>(obj, k0)
in
if
isneqz(cp)
then $UN.cptr0_get(cp) else TVnil()
end // end of [let]
) (* end of [tobject_get_at] *)
impltmp
{}(*tmp*)
tobject_set_at
  (obj, k0, x0) =
(
let
//
var res: x0?
//
val opt =
hmapref_insert<k0,x0>
  (obj, k0, x0, res)
in
let
prval () = opt_clear(res) in ignoret(opt)
end
end
) (* end of [tobject_set_at] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
tobject_print(obj) = hmapref_print<k0,x0>(obj)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [taggedval.dats] *)
