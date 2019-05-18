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
//
#staload "./../SATS/gseq.sats"
#staload "./../SATS/glseq.sats"
//
#staload "./../SATS/print.sats"
#staload "./../SATS/stdio.sats"
//
(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
print$val(x) =
fprint$val<a>(the_stdout<>(), x)
implement
{a}(*tmp*)
print$ref(x) =
fprint$ref<a>(the_stdout<>(), x)

(* ****** ****** *)
//
implement
{}(*tmp*)
print_newline() =
fprint_newline<>(the_stdout<>())
//
(* ****** ****** *)

implement
{}(*tmp*)
print_int(x) = print$val<int>(x)
implement
{}(*tmp*)
print_sint(x) = print$val<sint>(x)
implement
{}(*tmp*)
print_bool(x) = print$val<bool>(x)
implement
{}(*tmp*)
print_char(x) = print$val<char>(x)
implement
{}(*tmp*)
print_double(f0) = print$val<double>(f0)
implement
{}(*tmp*)
print_string(cs) = print$val<string>(cs)

(* ****** ****** *)

implement
{}(*tmp*)
print_uint(u0) = print$val<uint>(u0)
implement
{}(*tmp*)
print_lint(i0) = print$val<lint>(i0)
implement
{}(*tmp*)
print_slint(i0) = print$val<slint>(i0)
implement
{}(*tmp*)
print_llint(i0) = print$val<llint>(i0)
implement
{}(*tmp*)
print_sllint(i0) = print$val<sllint>(i0)

(* ****** ****** *)

implement
{}(*tmp*)
print_float(f0) = print$val<float>(f0)
implement
{}(*tmp*)
print_ldouble(f0) = print$val<ldouble>(f0)

(* ****** ****** *)
//
implement
{a}(*tmp*)
list0_print(xs) =
(
list0_print$beg<>();
loop(0, xs);
list0_print$end<>();
) where
{
fun
loop
( i0: int
, xs: list0(a)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x0, xs) =>
  (
  if i0 > 0
    then list0_print$sep<>();
  // end of [if]
  print$val<a>(x0); loop(i0+1, xs)
  )
)
} (* end of [list0_print] *)
//
implement
{}(*tmp*)
list0_print$beg() = print_string("(")
implement
{}(*tmp*)
list0_print$end() = print_string(")")
implement
{}(*tmp*)
list0_print$sep() = print_string(",")
//
implement
(a:tflt)
print$val<list0(a)>(xs) = list0_print<a>(xs)
//
(* ****** ****** *)
//
implement
{a}//tmp
optn0_print(t0) =
(
case+ t0 of
| optn0_none() => 
  (
   optn0_print$beg<>();
   optn0_print$end<>();
  )
| optn0_some(x0) => 
  (
   optn0_print$beg<>();
   print$val<a>(x0);
   optn0_print$end<>();
  )
)
//
implement
{}(*tmp*)
optn0_print$beg() = print_string("(")
implement
{}(*tmp*)
optn0_print$end() = print_string(")")
//
implement
(a:tflt)
print$val<optn0(a)>(xs) = optn0_print<a>(xs)
//
(* ****** ****** *)

implement
{a0,a1}
tuple2_print(xs) =
(
tuple_print$beg<>();
print$val<a0>(xs.0);
tuple_print$sep<>(); print$val<a1>(xs.1);
tuple_print$end<>();
)
implement
{a0,a1,a2}
tuple3_print(xs) =
(
tuple_print$beg<>();
print$val<a0>(xs.0);
tuple_print$sep<>(); print$val<a1>(xs.1);
tuple_print$sep<>(); print$val<a2>(xs.2);
tuple_print$end<>();
)
//
implement
{}(*tmp*)
tuple_print$beg() = print_string("(")
implement
{}(*tmp*)
tuple_print$end() = print_string(")")
implement
{}(*tmp*)
tuple_print$sep() = print_string(",")
//
implement
(a0,a1:tflt)
print$val<tup(a0,a1)>(xs) = tuple2_print<a0,a1>(xs)
implement
(a0,a1,a2:tflt)
print$val<tup(a0,a1,a2)>(xs) = tuple3_print<a0,a1,a2>(xs)

(* ****** ****** *)
//
implement
{a}(*tmp*)
stream_print(xs) =
(
stream_print$beg<>();
loop(0, xs);
stream_print$end<>();
) where
{
fun
loop
( i0: int
, xs: stream(a)): void =
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x0, xs) =>
  (
  if i0 > 0
    then stream_print$sep<>();
  // end of [if]
  print$val<a>(x0); loop(i0+1, xs)
  )
)
} (* end of [stream_print] *)
//
implement
{}(*tmp*)
stream_print$beg() = print_string("(")
implement
{}(*tmp*)
stream_print$end() = print_string(")")
implement
{}(*tmp*)
stream_print$sep() = print_string(",")
//
implement
(a:tflt)
print$val<stream(a)>(xs) = stream_print<a>(xs)
//
(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_print(AZ) =
(
glseq_print<arrszref(a)><a>(AZ);
) where
{
implement
gseq_print$beg<>() = array_print$beg<>()
implement
gseq_print$end<>() = array_print$end<>()
implement
gseq_print$sep<>() = array_print$sep<>()
} (* end of [arrszref_print] *)

(* ****** ****** *)
//
implement
{a}(*tmp*)
list0_vt_print(xs) =
(
list0_print$beg<>();
loop(0, xs);
list0_print$end<>();
) where
{
fun
loop
( i0: int
, xs: !list0_vt(a)): void =
(
case+ xs of
| list0_vt_nil() => ()
| list0_vt_cons(x0, xs) =>
  (
  if
  (i0 > 0)
  then list0_print$sep<>();
  print$val<a>(x0); loop(i0+1, xs)
  )
)
}
//
implement
(a:vtflt)
print$val<list0_vt(a)>(xs) = list0_vt_print<a>(xs)
//
(* ****** ****** *)

(* end of [print.dats] *)
