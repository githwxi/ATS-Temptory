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
#staload "./../SATS/glseq.sats"
#staload "./../SATS/list_vt.sats"
//
#staload UN = "./../SATS/unsafe.sats"
//
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
g0lt_str_str
(x1, x2) = (strcmp(x1, x2) < 0)
implement
{}(*tmp*)
g0gt_str_str
(x1, x2) = (strcmp(x1, x2) > 0)
implement
{}(*tmp*)
g0eq_str_str
(x1, x2) = (strcmp(x1, x2) = 0)
implement
{}(*tmp*)
g0lte_str_str
(x1, x2) = (strcmp(x1, x2) <= 0)
implement
{}(*tmp*)
g0gte_str_str
(x1, x2) = (strcmp(x1, x2) >= 0)
implement
{}(*tmp*)
g0neq_str_str
(x1, x2) = (strcmp(x1, x2) != 0)
//
implement
{}(*tmp*)
g0cmp_str_str(x1, x2) = strcmp(x1, x2)
//
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
//
implement
{}(*tmp*)
string0_alloc_size
  (n0) = cp where
{
val cp = $UN.calloc<char>(succ(n0))
val () = $UN.cptr0_set(cp+n0, CNUL)
}
implement
{}(*tmp*)
string0_alloc_sint
  (n0) = cp where
{
val cp = $UN.calloc<char>(succ(n0))
val () = $UN.cptr0_set(cp+n0, CNUL)
}
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_map(cs) =
(
  $UN.cast{string0}(pa)
) where
{
val n0 = length(cs)
val n0 = $UN.cast{Nat}(n0)
val pa = string0_alloc(n0)
val pz =
(
  string0_foldleft<r0>(cs, pa)
) where
{
  typedef r0 = cptr0(char)
  implement
  string0_foldleft$fopr<r0>(cp, c0) =
  let
    val () =
    $UN.cptr0_set
    (cp, string0_map$fopr<>(c0)) in succ(cp)
  end
} (* end of [val] *)
} (* end of [string0_map] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_tolower(cs) =
(
  string0_map<>(cs)
) where
{
  implement
  string0_map$fopr<>(c0) = tolower(c0)
}
implement
{}(*tmp*)
string0_toupper(cs) =
(
  string0_map<>(cs)
) where
{
  implement
  string0_map$fopr<>(c0) = toupper(c0)
}

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
  string0_vt2t
  (string0_vt_make_list0(cs))
)
implement
{}(*tmp*)
string0_make_list0_vt
  (cs) =
(
  string0_vt2t
  (string0_vt_make_list0_vt(cs))
)

(* ****** ****** *)

implement
{}(*tmp*)
string0_listize
  (cs) =
(
  gseq_listize<string><char>(cs)
) (* end of [string0_listize] *)
implement
{}(*tmp*)
string0_rlistize
  (cs) =
(
  gseq_rlistize<string><char>(cs)
) (* end of [string0_rlistize] *)

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
//
fun
loop(p0: cptr(char)): void =
let
  val c0 = $UN.cptr0_get(p0)
in
if
isneqz(c0) then
(string0_foreach$work<>(c0); loop(succ(p0)))
end // end of [loop]
//
} (* end of [string0_foreach] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_rforall(cs) =
  (loop1(p1)) where
{
//
val p0 =
string0_cptrof(cs)
//
val p1 = loop0(p0) where
{
fun
loop0
( p1
: cptr(char)): cptr(char) =
let
val c1 = $UN.cptr0_get(p1)
in
//
if
iseqz(c1)
then p1 else loop0(succ(p1))
//
end // end of [loop0]
//
} (* where *) // end of [val]
//
fun
loop1(p1: cptr(char)): bool =
(
if
p1 <= p0
then true else
let
val p1 = pred(p1)
val c1 = $UN.cptr0_get(p1)
val
test = string0_rforall$test<>(c1)
in
  if test then loop1(p1) else false
end // end of [let]
)
//
} (* end of [string0_rforall] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_rforeach(cs) =
  (loop1(p1)) where
{
//
val p0 =
string0_cptrof(cs)
//
val p1 = loop0(p0) where
{
fun
loop0
( p1
: cptr(char)): cptr(char) =
let
val c1 = $UN.cptr0_get(p1)
in
//
if
iseqz(c1)
then p1 else loop0(succ(p1))
//
end // end of [loop0]
//
} (* where *) // end of [val]
//
fun
loop1(p1: cptr(char)): void =
(
if
p1 > p0
then let
val p1 = pred(p1)
val c1 = $UN.cptr0_get(p1)
in
  (string0_rforeach$work<>(c1); loop1(p1))
end // end of [let]
)
//
} (* end of [string0_rforeach] *)
//
(* ****** ****** *)

implement
{r0}(*tmp*)
string0_foldleft
  (cs, r0) =
(
gseq_foldleft<string><char>(cs, r0)
) where
{
typedef x0 = char
implement
gseq_foldleft$fopr<x0><r0>(r0, c0) = string0_foldleft$fopr<r0>(r0, c0)
} (* end of [string0_foldleft] *)
implement
{r0}(*tmp*)
string0_foldright
  (cs, r0) =
(
gseq_foldright<string><char>(cs, r0)
) where
{
typedef x0 = char
implement
gseq_foldright$fopr<x0><r0>(c0, r0) = string0_foldright$fopr<r0>(c0, r0)
} (* end of [string0_foldright] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_vt_make_list0
  (cs) =
(
$UN.castvwtp0{string0_vt}(cp0)
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
} (* end of [string0_vt_make_list0] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_make_list0_vt
  (cs) =
(
$UN.castvwtp0{string0_vt}(cp0)
) where
{
//
val n0 =
$UN.cast{uint}(length(cs))
val cp0 = $UN.calloc<char>(n0)
//
val cp1 =
(
list0_vt_foldleft0<x0><r0>(cs, cp0)
) where
{
  typedef x0 = char
  typedef r0 = cptr0(char)
  implement
  list0_vt_foldleft0$fopr<x0><r0>
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
string0_vt_forall0
  (cs) =
(
let
val
test =
string0_vt_forall1<>(cs)
val () = string0_vt_free(cs) in test
end where
{
implement
string0_vt_forall1$test<>(c0) = string0_vt_forall0$test<>(c0)
}
) (* end of [string0_vt_forall0] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_foreach0
  (cs) =
(
let
val () =
string0_vt_foreach1<>(cs) in string0_vt_free(cs)
end where
{
implement
string0_vt_foreach1$work<>(c0) = string0_vt_foreach0$work<>(c0)
}
) (* end of [string0_vt_foreach0] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_vt_forall1(cs) =
(
loop(string0_vt_cptrof(cs))
) where
{
//
fun
loop(p0: cptr(char)): bool =
let
  val c0 = $UN.cptr0_get(p0)
in
//
if
isneqz(c0)
then
let
val
test =
string0_vt_forall1$test<>(c0)
in
if
test
then loop(succ(p0)) else false
end
else true // if
end // end of [loop]
//
} (* end of [string0_vt_forall1] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_vt_foreach1(cs) =
(
loop(string0_vt_cptrof(cs))
) where
{
//
fun
loop(p0: cptr(char)): void =
let
  val c0 = $UN.cptr0_get(p0)
in
if
isneqz(c0)
then
let
val () = string0_vt_foreach1$work<>(c0) in loop(succ(p0))
end // end of [then]
end // end of [loop]
//
} (* end of [string0_vt_foreach1] *)
//
(* ****** ****** *)
//
(*
implement
{r0}(*tmp*)
string0_vt_foldleft1
  (cs, r0) =
(
loop
(string0_vt_cptrof(cs), r0)
) where
{
//
fun
loop
( p0
: cptr(char), r0: r0): r0 =
let
  val c0 = $UN.cptr0_get(p0)
in
if
isneqz(c0)
then
let
val r0 =
string0_vt_foldleft1$fopr<r0>(r0, c0) in loop(succ(p0), r0)
end else r0
end // end-of-let // end of [loop]
//
} (* end of [string0_vt_foldleft1] *)
*)
//
implement
{r0}(*tmp*)
string0_vt_foldleft1
  (cs, r0) =
(
glseq_foldleft1<string_vt><char>(cs, r0)
) where
{
typedef x0 = char
implement
glseq_foldleft1$fopr<x0><r0>(r0, c0) = string0_vt_foldleft1$fopr<r0>(r0, c0)
} (* end of [string0_vt_foldleft1] *)
implement
{r0}(*tmp*)
string0_vt_foldright1
  (cs, r0) =
(
glseq_foldright1<string_vt><char>(cs, r0)
) where
{
typedef x0 = char
implement
glseq_foldright1$fopr<x0><r0>(c0, r0) = string0_vt_foldright1$fopr<r0>(c0, r0)
} (* end of [string0_vt_foldright1] *)
//
(* ****** ****** *)

(* end of [string.dats] *)
