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
(* ****** ****** *)
//
#staload "./../SATS/print.sats"
#staload "./../SATS/stdio.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/string.sats"
#staload "./../SATS/stropt.sats"
//
(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

impltmp
{a}(*tmp*)
print$val(x) =
fprint$val<a>(the_stdout<>(), x)
impltmp
{a}(*tmp*)
print$ref(x) =
fprint$ref<a>(the_stdout<>(), x)

(* ****** ****** *)
//
impltmp
{}(*tmp*)
print_newline() =
fprint_newline<>(the_stdout<>())
//
(* ****** ****** *)

impltmp
{}(*tmp*)
print_int(x) = print$val<int>(x)
impltmp
{}(*tmp*)
print_ptr(x) = print$val<ptr>(x)
impltmp
{}(*tmp*)
print_bool(x) = print$val<bool>(x)
impltmp
{}(*tmp*)
print_char(x) = print$val<char>(x)
impltmp
{}(*tmp*)
print_double(f0) = print$val<double>(f0)
impltmp
{}(*tmp*)
print_string(cs) = print$val<string>(cs)

(* ****** ****** *)
//
impltmp
{}(*tmp*)
print_sint(i0) = print$val<sint>(i0)
impltmp
{}(*tmp*)
print_uint(u0) = print$val<uint>(u0)
//
impltmp
{}(*tmp*)
print_size(i0) = print$val<size>(i0)
impltmp
{}(*tmp*)
print_ssize(i0) = print$val<ssize>(i0)
impltmp
{}(*tmp*)
print_usize(u0) = print$val<usize>(u0)
//
impltmp
{}(*tmp*)
print_lint(i0) = print$val<lint>(i0)
impltmp
{}(*tmp*)
print_slint(i0) = print$val<slint>(i0)
impltmp
{}(*tmp*)
print_ulint(u0) = print$val<ulint>(u0)
//
impltmp
{}(*tmp*)
print_llint(i0) = print$val<llint>(i0)
impltmp
{}(*tmp*)
print_sllint(i0) = print$val<sllint>(i0)
impltmp
{}(*tmp*)
print_ullint(u0) = print$val<ullint>(u0)
//
(* ****** ****** *)

impltmp
{}(*tmp*)
print_float(f0) = print$val<float>(f0)
impltmp
{}(*tmp*)
print_ldouble(f0) = print$val<ldouble>(f0)

(* ****** ****** *)
//
impltmp
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
impltmp
{}(*tmp*)
list0_print$beg() = print_string("(")
impltmp
{}(*tmp*)
list0_print$end() = print_string(")")
impltmp
{}(*tmp*)
list0_print$sep() = print_string(",")
//
impltmp
(a:tflt)
print$val<list0(a)>(xs) = list0_print<a>(xs)
//
(* ****** ****** *)
//
(*
//
// requires list1_forall
//
impltmp
{a}(*tmp*)
list1_print(xs) =
(
gseq_print<gseq><xs,a>(xs)
) where
{
//
typedef xs = list1(a)
//
impltmp
gseq_print$beg<
gseq><xs,a>() = list1_print$beg<>()
impltmp
gseq_print$end<
gseq><xs,a>() = list1_print$end<>()
impltmp
gseq_print$sep<
gseq><xs,a>() = list1_print$sep<>()
}
*)
impltmp
{a}(*tmp*)
list1_print(xs) =
(
list1_print$beg<>();
loop(0, xs);
list1_print$end<>();
) where
{
fun
loop
( i0: int
, xs: list1(a)): void =
(
case+ xs of
| list1_nil() => ()
| list1_cons(x0, xs) =>
  (
  if i0 > 0
    then list1_print$sep<>();
  // end of [if]
  print$val<a>(x0); loop(i0+1, xs)
  )
)
} (* end of [list0_print] *)

//
impltmp
{}(*tmp*)
list1_print$beg() = print_string("(")
impltmp
{}(*tmp*)
list1_print$end() = print_string(")")
impltmp
{}(*tmp*)
list1_print$sep() = print_string(",")
//
impltmp
(a:tflt)
print$val<list1(a)>(xs) = list1_print<a>(xs)

(* ****** ****** *)
//
impltmp
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
impltmp
{}(*tmp*)
optn0_print$beg() = print_string("(")
impltmp
{}(*tmp*)
optn0_print$end() = print_string(")")
//
impltmp
(a:tflt)
print$val<optn0(a)>(xs) = optn0_print<a>(xs)
//
(* ****** ****** *)
//
impltmp
{a}//tmp
optn1_print(t0) =
(
case+ t0 of
| optn1_none() =>
  (
   optn1_print$beg<>();
   optn1_print$end<>();
  )
| optn1_some(x0) =>
  (
   optn1_print$beg<>();
   print$val<a>(x0);
   optn1_print$end<>();
  )
)
//
impltmp
{}(*tmp*)
optn1_print$beg() = print_string("(")
impltmp
{}(*tmp*)
optn1_print$end() = print_string(")")
//
impltmp
(a:tflt)
print$val<optn1(a)>(xs) = optn1_print<a>(xs)
//
(* ****** ****** *)

impltmp
{a0,a1}
tuple2_print(xs) =
(
tuple_print$beg<>();
print$val<a0>(xs.0);
tuple_print$sep<>(); print$val<a1>(xs.1);
tuple_print$end<>();
)
impltmp
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
impltmp
{}(*tmp*)
tuple_print$beg() = print_string("(")
impltmp
{}(*tmp*)
tuple_print$end() = print_string(")")
impltmp
{}(*tmp*)
tuple_print$sep() = print_string(",")
//
impltmp
(a0,a1:tflt)
print$val<tup(a0,a1)>(xs) = tuple2_print<a0,a1>(xs)
impltmp
(a0,a1,a2:tflt)
print$val<tup(a0,a1,a2)>(xs) = tuple3_print<a0,a1,a2>(xs)

(* ****** ****** *)
//
impltmp
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
impltmp
(a:vtflt)
print$val<list0_vt(a)>(cs) = list0_vt_print<a>(cs)
//
(* ****** ****** *)

impltmp
{a}(*tmp*)
list1_vt_print(xs) =
(
list1_print$beg<>();
loop(0, xs);
list1_print$end<>();
) where
{
fun
loop
( i0: int
, xs: !list1_vt(a)): void =
(
case+ xs of
| list1_vt_nil() => ()
| list1_vt_cons(x0, xs) =>
  (
  if
  (i0 > 0)
  then list1_print$sep<>();
  print$val<a>(x0); loop(i0+1, xs)
  )
)
}
//
impltmp
(a:vtflt)
print$val<list1_vt(a)>(cs) = list1_vt_print<a>(cs)

(* ****** ****** *)

impltmp
string0_vt_print<>(cs) =
print_string($UN.string0_vt2t(cs))
impltmp
print$val<string_vt>(cs) = string0_vt_print<>(cs)

(* ****** ****** *)

impltmp
stropt0_print<>(opt) =
if
iseqz(opt)
then
print_ptr($UN.stropt0_unnone(opt))
else
print_string($UN.stropt0_unsome(opt))
//
impltmp
stropt0_vt_print<>(opt) =
stropt0_print($UN.stropt0_vt2t(opt))
//
impltmp
print$val<stropt>(opt) = stropt0_print<>(opt)
impltmp
print$val<stropt_vt>(opt) = stropt0_vt_print<>(opt)
//
(* ****** ****** *)
//
impltmp
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
impltmp
{}(*tmp*)
stream_print$beg() = print_string("(")
impltmp
{}(*tmp*)
stream_print$end() = print_string(")")
impltmp
{}(*tmp*)
stream_print$sep() = print_string(",")
//
impltmp
(a:tflt)
print$val<stream(a)>(xs) = stream_print<a>(xs)
//
(* ****** ****** *)
//
impltmp
{a}(*tmp*)
arrszref_print(AZ) =
(
glseq_print<glseq><xs,a>(AZ)
) where
{
//
typedef xs = arrszref(a)
//
impltmp
glseq_print$beg<
glseq><xs,a>() = array_print$beg<>()
impltmp
glseq_print$end<
glseq><xs,a>() = array_print$end<>()
impltmp
glseq_print$sep<
glseq><xs,a>() = array_print$sep<>()
} (* end of [arrszref_print] *)
//
impltmp
{}(*tmp*)
array_print$beg() = print_string("(")
impltmp
{}(*tmp*)
array_print$end() = print_string(")")
impltmp
{}(*tmp*)
array_print$sep() = print_string(",")
//
impltmp
(a:tflt)
print$val<arrszref(a)>(AZ) = arrszref_print<a>(AZ)
//
(* ****** ****** *)
//
// Note that (n < 0) means to print all the values
// n is set by template: stream_vt_print$n
//
impltmp
{a}(*tmp*)
stream_vt_print(xs) =
(
stream_vt_print$beg<>();
(
if n < 0 then loop1(0, xs) else loop2(0, xs)
);
stream_vt_print$end<>()
) where
{
val n = stream_vt_print$n<>()
//
fun
loop1
( i0: int
, xs: stream_vt(a)): void =
(
case+ !xs of
| ~stream_vt_nil() => ()
| ~stream_vt_cons(x, xs) =>
  (
  if (i0 > 0)
    then stream_vt_print$sep<>();
  print$val<a>(x); gfree$val<a>(x); loop1(i0+1, xs)
  )
)
fun
loop2
( i0: int
, xs: stream_vt(a)): void =
(
case+ !xs of
| ~stream_vt_nil() => ()
| ~stream_vt_cons(x, xs) =>
  if (i0 < n) then
  (
  if (i0 > 0)
    then stream_vt_print$sep<>();
  print$val<a>(x); gfree$val<a>(x); loop2(i0+1, xs)
  )
  else (gfree$val<a>(x); ~(xs))
)
}
//
// default: print entire linear stream
//
impltmp{} stream_vt_print$n() = ~1
//
impltmp
{}(*tmp*)
stream_vt_print$beg() = print_string("(")
impltmp
{}(*tmp*)
stream_vt_print$end() = print_string(")")
impltmp
{}(*tmp*)
stream_vt_print$sep() = print_string(",")
//
(* ****** ****** *)

(* end of [print.dats] *)
