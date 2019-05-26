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
string0_size(cs) =
(
$effmask_all
(gseq_size<string><char>(cs))
)
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
val cp =
ptr2cptr{char}
($UN.malloc(succ(n0)))
val () = $UN.cptr0_set(cp+n0, CNUL)
}
implement
{}(*tmp*)
string0_alloc_sint
  (n0) = cp where
{
val cp =
ptr2cptr{char}
($UN.malloc(succ(n0)))
val () = $UN.cptr0_set(cp+n0, CNUL)
}
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_append
  (cs1, cs2) =
(
string0_vt2t
(string0_append_vt<>(cs1, cs2))
)
implement
{}(*tmp*)
string0_append_vt
  (cs1, cs2) =
  ( res ) where
{
//
val cs1_ =
$UN.string0_t2vt(cs1)
val cs2_ =
$UN.string0_t2vt(cs2)
val res =
string0_vt_append<>(cs1_, cs2_)
//
prval () = $UN.cast2void(cs1_)
prval () = $UN.cast2void(cs2_)
//
} (* end of [string0_append_vt] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_map(cs) =
(
string0_vt2t
(
string0_map_vt(cs)
)
) where
{
implement
string0_map_vt$fopr<>(c0) = string0_map$fopr<>(c0)
}
//
implement
{}(*tmp*)
string0_map_vt(cs) =
(
$UN.castvwtp0{string0_vt}(pa)
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
    (cp, string0_map_vt$fopr<>(c0)) in succ(cp)
  end
} (* end of [val] *)
} (* end of [string0_map_vt] *)
//
(* ****** ****** *)

(*
implement
{}(*tmp*)
string0_copy(cs) =
(
  string0_map<>(cs)
) where
{
  implement
  string0_map$fopr<>(c0) = (c0)
}
implement
{}(*tmp*)
string0_copy_vt(cs) =
(
  string0_map_vt<>(cs)
) where
{
  implement
  string0_map_vt$fopr<>(c0) = (c0)
}
*)
implement
{}(*tmp*)
string0_copy(cs) =
(
string0_vt2t(string0_copy_vt(cs))
)
//
implement
{}(*tmp*)
string0_copy_vt(cs) =
(
$UN.castvwtp0{string_vt}(p0)
) where
{
val p0 =
$UN.malloc(succ(length(cs)))
val p0 = $UN.cast{charptr}(p0)
val cs = $UN.cast{charptr}(cs)
val () =
(
  $extfcall
  (void, "atspre_strcpy", p0, cs)
)
} (* end of [string0_copy_vt] *)
//
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
implement
{}(*tmp*)
string0_make_rlist0_vt
  (cs) =
(
  string0_vt2t
  (string0_vt_make_rlist0_vt(cs))
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
// HX: For linear strings
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string0_vt_iseqz(cs) =
$effmask_all
(
iseqz
($UN.cptr0_get(cptrof(cs)))
)
implement
{}(*tmp*)
string0_vt_isneqz(cs) =
$effmask_all
(
isneqz
($UN.cptr0_get(cptrof(cs)))
)
//
(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_size(cs) = 
string0_size($UN.string0_vt2t(cs))
implement
{}(*tmp*)
string0_vt_length(cs) = 
string0_length($UN.string0_vt2t(cs))

(* ****** ****** *)
//
implement
{}(*tmp*)
string0_vt_nil() =
let
val cs = list0_nil()
in
string0_vt_make_list0<>(cs)
end // end of [let]
//
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
length(cs)
val n0 =
$UN.cast{uint}(n0)
val cp0 =
ptr2cptr{char}
($UN.malloc(succ(n0)))
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
val cp0 =
$UN.calloc<char>(succ(n0))
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
// HX:
// calloc makes it unnecessary
val ( ) = $UN.cptr0_set(cp1, CNUL)
//
} (* end of [string0_make_list0_vt] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_make_rlist0_vt
  (cs) =
(
$UN.castvwtp0{string0_vt}(cp0)
) where
{
//
val n0 =
$UN.cast{uint}(length(cs))
val cp0 =
$UN.calloc<char>(succ(n0))
//
val cp1 = cp0 + n0
//
// HX:
// calloc makes it unnecessary:
val ( ) = $UN.cptr0_set(cp1, CNUL)
//
val cp0 =
(
list0_vt_foldleft0<x0><r0>(cs, cp1)
) where
{
  typedef x0 = char
  typedef r0 = cptr0(char)
  implement
  list0_vt_foldleft0$fopr<x0><r0>
    (cp, c0) =
  (
  let
    val cp =
    cptr0_pred(cp) in $UN.cptr0_set(cp, c0); cp
  end
  )
} (* end of [val] *)
//
} (* end of [string0_make_rlist0_vt] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_append
  (cs1, cs2) = let
//
val n12 =
( length(cs1)
+ length(cs2))
//
val cp0 =
$UN.calloc<char>(succ(n12))
//
val cp1 =
(
string0_vt_foldleft1<r0>(cs1, cp0)
) where
{
typedef r0 = cptr(char)
implement
string0_vt_foldleft1$fopr<r0>
  (r0, x0) =
  ($UN.cptr0_set(r0, x0); succ(r0))
}
val cp2 =
(
string0_vt_foldleft1<r0>(cs1, cp1)
) where
{
typedef r0 = cptr(char)
implement
string0_vt_foldleft1$fopr<r0>
  (r0, x0) =
  ($UN.cptr0_set(r0, x0); succ(r0))
}
//
in
let
val () =
$UN.cptr0_set(cp2, CNUL)
in $UN.castvwtp0{string0_vt}(cp0) end
end // end of [string0_vt_append]

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_map1
  (cs) =
(
  $UN.castvwtp0(p0)
) where
{
//
val n0 = length(cs)
val p0 = string0_alloc(n0)
//
val p1 =
(
string0_vt_foldleft1<r0>
  (cs, p0)
) where
{
//
typedef r0 = cptr(char)
//
implement
string0_vt_foldleft1$fopr<r0>
  (cp, c0) =
  let
  val c1 =
  string0_vt_map1$fopr<>(c0)
  val () = $UN.cptr0_set(cp, c1) in succ(cp)
  end
//
} (* end of [where] *)
} (* end of [string0_vt_map1] *)

(* ****** ****** *)

implement
{}(*tmp*)
string0_vt_streamize
  (cs) =
(
  auxmain(cptrof(cs), cs)
) where
{
fun
auxmain
(
cp: cptr(char), cs: string_vt
) : stream_vt(char) =
$ldelay
(
let
val c0 = $UN.cptr0_get(cp)
in
if
iseqz(c0)
then
let
val () =
string0_vt_free(cs) in stream_vt_nil()
end
else
(
  stream_vt_cons(c0, auxmain(succ(cp), cs))
) (* end of [if] *)
end // end of [let]
, string0_vt_free(cs) // called when it is freed
)
} (* end of [string0_vt_streamize] *)

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
//
// HX-2019-05:
// For strings indexed by length
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string1_get_at_sint
(cs, i0) =
$UN.cptr0_get(cptrof(cs)+i0)
implement
{}(*tmp*)
string1_get_at_size
(cs, i0) =
$UN.cptr0_get(cptrof(cs)+i0)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string1_size
(cs) = $UN.cast(string0_size(cs))
implement
{}(*tmp*)
string1_length
(cs) = $UN.cast(string0_length(cs))
//
(* ****** ****** *)
//
implement
{}(*tmp*)
string1_vt_get_at_sint
(cs, i0) =
$UN.cptr0_get(cptrof(cs)+i0)
implement
{}(*tmp*)
string1_vt_get_at_size
(cs, i0) =
$UN.cptr0_get(cptrof(cs)+i0)
//
implement
{}(*tmp*)
string1_vt_set_at_sint
(cs, i0, c0) =
$UN.cptr0_set(cptrof(cs)+i0, c0)
implement
{}(*tmp*)
string1_vt_set_at_size
(cs, i0, c0) =
$UN.cptr0_set(cptrof(cs)+i0, c0)
//
(* ****** ****** *)

implement
{}(*tmp*)
string1_copy(cs) = 
$UN.castvwtp0(string0_copy(cs))
implement
{}(*tmp*)
string1_copy_vt(cs) = 
$UN.castvwtp0(string0_copy_vt(cs))

(* ****** ****** *)

(* end of [string.dats] *)
