(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define tt true
#define ff false

(* ****** ****** *)

#define none0_vt optn0_vt_none
#define some0_vt optn0_vt_some

(* ****** ****** *)

#staload "./../SATS/gint.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)

implement
{}(*tmp*)
list0_iseqz(xs) =
(
case+ xs of
| list0_nil _ => tt | list0_cons _ => ff
)
implement
{}(*tmp*)
list0_isneqz(xs) =
(
case+ xs of
| list0_nil _ => ff | list0_cons _ => tt
)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_size(xs) =
(
i2sz(list0_length<x0>(xs))
)
implement
{x0}//tmp
list0_length(xs) =
(
$effmask_all(loop(xs, 0))
) where
{
//
typedef r0 = Intgte(0)
//
fun
loop
(xs: list0(x0), i0: r0): r0 =
case+ xs of
| list0_nil() => i0
| list0_cons(_, xs) => loop(xs, succ(i0))
} (* end of [list0_length] *)
(*
implement
{x0}//tmp
list0_length(xs) =
(
gseq_foldleft<list0(x0)><x0><int>(xs, 0)
) where
{
implement
gseq_foldleft$fopr<x0><int>(r0, x0) = succ(r0)
}
*)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_indexof(xs, x0) =
$effmask_all
(
  gseq_indexof<list0(x0)><x0>(xs, x0)
) (* end of [list0_indexof] *)
//
(* ****** ****** *)

implement
{x0}//tmp
list0_head_exn(xs) =
(
case+ xs of
| list0_cons
  (x0, _) => x0
| list0_nil((*void*)) =>
  $raise(ListSubscriptExn())
)
implement
{x0}//tmp
list0_head_opt(xs) =
(
case+ xs of
| list0_nil() => none0_vt()
| list0_cons(x0, _) => some0_vt(x0)
)

(* ****** ****** *)

implement
{x0}//tmp
list0_tail_exn(xs) =
(
case+ xs of
| list0_cons
  (_, xs) => xs
| list0_nil((*void*)) =>
  $raise(ListSubscriptExn())
)
implement
{x0}//tmp
list0_tail_opt(xs) =
(
case+ xs of
| list0_nil() => none0_vt()
| list0_cons(_, xs) => some0_vt(xs)
)

(* ****** ****** *)

implement
{x0}//tmp
list0_get_at_exn
  (xs, i0) =
(
if
(i0 >= 0)
then
loop(xs, i0)
else
$raise(ListSubscriptExn())
) where
{
fun
loop
(xs: list0(x0), i0: int): x0 =
(
case+ xs of
| list0_nil() =>
  $raise(ListSubscriptExn())
| list0_cons(x0, xs) =>
  if i0 <= 0 then x0 else loop(xs, i0-1)
)
} (* end of [list0_get_at_exn] *)

implement
{x0}//tmp
list0_get_at_opt
  (xs, i0) =
(
if
(i0 >= 0)
then loop(xs, i0) else none0_vt()
) where
{
//
vtypedef
r0 = optn0_vt(x0)
//
fun
loop(xs: list0(x0), i0: int): r0 =
(
case+ xs of
| list0_nil() =>
  (
    none0_vt()
  )
| list0_cons(x0, xs) =>
  if i0 <= 0
    then some0_vt(x0) else loop(xs, i0-1)
  // end of [if]
)
} (* end of [list0_get_at_opt] *)

(* ****** ****** *)

implement
{x0}(*tmp*)
list0_drop
  (xs, i0) =
(
  loop(xs, i0)
) where
{
//
fun
loop
( xs
: list0(x0), i0: int) : list0(x0) =
if
i0 <= 0
then xs
else
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(_, xs) => loop(xs, pred(i0))
)
//
} (* end of [list0_drop] *)

(* ****** ****** *)

implement
{x0}(*tmp*)
list0_take
  (xs, i0) =
(
let
var r0: ptr?
in
  loop(xs, i0, r0); r0
end
) where
{
//
fun
loop
( xs
: list0(x0), i0: int
, r0: &ptr? >> list0_vt(x0)
) : void =
if
i0 <= 0
then
(r0 := list0_vt_nil())
else
(
case+ xs of
| list0_nil() =>
  ( r0 :=
    list0_vt_nil() )
| list0_cons(x0, xs) =>
  (
  let
    val () =
    ( r0 :=
      list0_vt_cons
      {x0}(x0, _(*r1*)) )
    val+
    list0_vt_cons(_, r1) = r0
  in
    loop(xs, pred(i0), r1); fold@(r0)
  end
  )
)
//
} (* end of [list0_take] *)

(* ****** ****** *)
//
implement
{x0}//tmp
list0_append
  (xs, ys) =
(
let
  var r0: ptr?
in
  loop(xs, r0); r0
end
) where
{
  fun
  loop
  ( xs: list0(x0)
  , r0: &ptr? >> list0(x0)
  ) : void =
  (
  case+ xs of
  | list0_nil() =>
    {
      val () = (r0 := ys)
    } (* list0_nil *)
  | list0_cons(x0, xs) =>
    {
      val () =
      (r0 := list0_cons(x0, _))
      val+list0_cons(_, r1) = r0
      val () = loop(xs, r1); prval () = fold@(r0)
    } (* list0_cons *)
  ) (* end of [loop] *)
} (* end of [list0_append] *)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_concat(xss) =
(
list0_foldright<xs><xs>(xss, list0_nil())
) where
{
//
typedef xs = list0(x0)
typedef r0 = list0(x0)
//
implement
list0_foldright$fopr<xs><r0>(xs, r0) = list0_append<x0>(xs, r0)
//
} (* end of [list0_concat] *)
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_revapp
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs: list0(x0)
, ys: list0(x0)): list0(x0) =
(
case+ xs of
| list0_nil() => ys
| list0_cons(x0, xs) =>
  loop(xs, list0_cons(x0, ys))
)
} (* end of [list0_revapp] *)
//
implement
{x0}//tmp
list0_reverse(xs) =
(
  list0_revapp<x0>(xs, list0_nil())
) (* end of [list0_reverse] *)
//
(* ****** ****** *)

implement
{x0}(*tmp*)
list0_split
  (xs) =
(
let
var r0: ptr?
and r1: ptr?
in
loop(xs, r0, r1); (r0, r1)
end
) where
{
//
fun
loop
( xs: list0(x0)
, r0: &ptr? >> list0_vt(x0)
, r1: &ptr? >> list0_vt(x0)
) : void =
(
case+ xs of
| list0_nil() =>
  (
  r0 := list0_vt_nil();
  r1 := list0_vt_nil();
  )
| list0_cons(x0, xs) => let
    val c0 =
    list0_split$choose<x0>(x0)
  in
    if
    (c0 <= 0)
    then let
      val () =
      ( r0 :=
        list0_vt_cons(x0, _) )
      val+
      list0_vt_cons(_, rx) = r0 in loop(xs, rx, r1); fold@(r0)
    end
    else let
      val () =
      ( r1 :=
        list0_vt_cons(x0, _) )
      val+
      list0_vt_cons(_, rx) = r1 in loop(xs, r0, rx); fold@(r1)
    end
  end (* end of [list0_cons] *)
)
//
} (* end of [list0_split] *)

(* ****** ****** *)

implement
{x0}(*tmp*)
list0_merge
  (xs, ys) =
(
let
var r0: ptr?
in
  loop(xs, ys, r0); r0
end
) where
{
//
fun
loop
( xs0: list0(x0)
, ys0: list0(x0)
, res: &ptr? >> list0_vt(x0)
) : void =
(
case+ xs0 of
| list0_nil() =>
  ( res :=
    list0_listize<x0>(ys0) )
| list0_cons(x0, xs1) =>
  (
  case+ ys0 of
  | list0_nil() =>
    ( res :=
      list0_listize<x0>(xs0)
    )
  | list0_cons(y0, ys1) => let
      val c0 =
      list0_merge$choose<x0>(x0, y0)
    in
      if
      (c0 <= 0)
      then
      let
        val () =
        res :=
        list0_vt_cons(x0, _)
        val+
        list0_vt_cons(x0, rsx) = res
      in
        loop(xs1, ys0, rsx); fold@(res)
      end
      else
      let
        val () =
        res :=
        list0_vt_cons(y0, _)
        val+
        list0_vt_cons(y0, rsx) = res
      in
        loop(xs0, ys1, rsx); fold@(res)
      end
    end
  ) (* end of [list0_cons] *)
)
//
} (* end of [list0_merge] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_listize
  (xs) =
(
let
  var r0: ptr?
in
  loop(xs, r0); r0
end
) where
{
//
typedef xs = list0(x0)
//
fun
loop
( xs: xs
, r0: &ptr? >> list0_vt(x0)
) : void =
(
case+ xs of
| list0_nil() =>
  (r0 := list0_vt_nil())
| list0_cons(x0, xs) =>
  {
    val () =
    (r0 := list0_vt_cons(x0, _))
    val+list0_vt_cons(_, r1) = r0
    val () = loop(xs, r1); prval () = fold@(r0)
  } // end of [list0_cons]
)
} (* end of [list0_listize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_rlistize
  (xs) =
(
loop(xs, list0_vt_nil())
) where
{
//
typedef xs = list0(x0)
vtypedef r0 = list0_vt(x0)
//
fun
loop(xs: xs, r0: r0): r0 =
(
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  loop(xs, list0_vt_cons(x0, r0))
)
} (* end of [list0_rlistize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_streamize
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
(
xs: list0(x0)
) : stream_vt(x0) = $ldelay
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  stream_vt_cons(x0, auxmain(xs))
)
} (* end of [list0_streamize] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_forall(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0(x0)): bool =
(
case+ xs of
| list0_nil() => tt
| list0_cons(x0, xs) =>
  if
  list0_forall$test<x0>(x0) then loop(xs) else ff
)
} (* end of [list0_forall] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_foreach(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0(x0)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x0, xs) =>
  let
    val () = list0_foreach$work<x0>(x0) in loop(xs)
  end // end of [list0_cons]
) (* end of [loop] *)
//
} (* end of [list0_foreach] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_rforall(xs) =
(
loop
(list0_rlistize<x0>(xs))
) where
{
//
sexpdef xs = list0_vt(x0)
//
fun
free
(xs: xs): void =
(
case xs of
| ~list0_vt_nil() => ()
| ~list0_vt_cons(x0, xs) => free(xs)
)
fun
loop(xs: xs): bool =
(
case+ xs of
|
~list0_vt_nil() => tt
|
~list0_vt_cons(x0, xs) =>
  if
  list0_rforall$test<x0>(x0)
  then loop(xs) else let val () = free(xs) in ff end
) (* end of [loop] *)
//
} (* end of [list0_rforall] *)

(* ****** ****** *)

implement
{x0}//tmp
list0_rforeach(xs) =
(
loop
(list0_rlistize<x0>(xs))
) where
{
//
sexpdef xs = list0_vt(x0)
//
fun
loop(xs: xs): void =
(
case+ xs of
|
~list0_vt_nil() => ()
|
~list0_vt_cons(x0, xs) =>
 let
   val () = list0_rforeach$work<x0>(x0) in loop(xs)
 end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list0_rforeach] *)

(* ****** ****** *)
//
// HX-2019-05-09:
// tail-recursion
//
implement
{x0}{r0}
list0_foldleft
  (xs, r0) =
(
  loop(xs, r0)
) where
{
//
typedef xs = list0(x0)
//
fun
loop
(xs: xs, r0: r0): r0 =
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  loop(xs, list0_foldleft$fopr<x0><r0>(r0, x0))
} (* end of [list0_foldleft] *)

(* ****** ****** *)
//
// HX-2019-05-09:
// tail-recursion
//
implement
{x0}{r0}
list0_foldright
  (xs, r0) =
(
loop
(list0_rlistize(xs), r0)
) where
{
//
sexpdef xs = list0_vt(x0)
//
fun
loop
(xs: xs, r0: r0): r0 =
case+ xs of
|
~list0_vt_nil() => r0
|
~list0_vt_cons(x0, xs) =>
 loop(xs, list0_foldright$fopr<x0><r0>(x0, r0))
//  
} (* end of [list0_foldright] *)
//
(*
implement
{x0}{r0}
list0_foldright
  (xs, r0) =
(
  auxlst(xs, r0)
) where
{
//
typedef xs = list0(x0)
//
fun
auxlst
(xs: xs, r0: r0): r0 =
case+ xs of
| list0_nil() => r0
| list0_cons(x0, xs) =>
  list0_foldright$fopr<x0><r0>(x0, auxlst(xs, r0))
} (* end of [list0_foldright] *)
*)
//
(* ****** ****** *)
//
implement
{x0}(*tmp*)
list0_iforall(xs) =
(
  gseq_iforall<list0(x0)><x0>(xs)
) where
{
implement
gseq_iforall$test<x0>
  (i0, x0) = list0_iforall$test<x0>(i0, x0)
}
implement
{x0}(*tmp*)
list0_iforeach(xs) =
(
  gseq_iforeach<list0(x0)><x0>(xs)
) where
{
implement
gseq_iforeach$work<x0>
  (i0, x0) = list0_iforeach$work<x0>(i0, x0)
}
implement
{x0}{r0}//tmp
list0_ifoldleft(xs, r0) =
(
  gseq_ifoldleft<list0(x0)><x0>(xs, r0)
) where
{
implement
gseq_ifoldleft$fopr<x0><r0>
  (r0, i0, x0) = list0_ifoldleft$fopr<x0>(r0, i0, x0)
}
//
(* ****** ****** *)
//
implement
{x0}{y0}//tmp
list0_map(xs) =
list0_vt2t
(list0_map_list<x0><y0>(xs))
//
implement
{x0}{y0}//tmp
list0_map_list(xs) =
(
  gseq_map_list<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
implement
{x0}{y0}//tmp
list0_map_rlist(xs) =
(
  gseq_map_rlist<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
implement
{x0}{y0}//tmp
list0_map_stream(xs) =
(
  gseq_map_stream<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)
//
implement
{x0}//tmp
list0_filter(xs) =
(
list0_vt2t
(list0_mapopt_list<x0><x0>(xs))
) where
{
implement
list0_mapopt$test<x0>(x0) =
list0_filter$test<x0>(x0)
implement
list0_mapopt$fopr<x0><x0>(x0) = x0
}
implement
{x0}{y0}//tmp
list0_mapopt(xs) =
list0_vt2t
(list0_mapopt_list<x0><y0>(xs))
//
implement
{x0}{y0}//tmp
list0_mapopt_list(xs) =
(
  gseq_mapopt_list<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
implement
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
implement
{x0}{y0}//tmp
list0_mapopt_rlist(xs) =
(
  gseq_mapopt_rlist<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
implement
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
implement
{x0}{y0}//tmp
list0_mapopt_stream(xs) =
(
  gseq_mapopt_stream<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
implement
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)
//
implement
{x0}{y0}//tmp
list0_imap(xs) =
list0_vt2t
(list0_imap_list<x0><y0>(xs))
//
implement
{x0}{y0}//tmp
list0_imap_list(xs) =
(
  gseq_imap_list<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
implement
{x0}{y0}//tmp
list0_imap_rlist(xs) =
(
  gseq_imap_rlist<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
implement
{x0}{y0}//tmp
list0_imap_stream(xs) =
(
  gseq_imap_stream<list0(x0)><x0><y0>(xs)
) where
{
implement
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
//
(* ****** ****** *)

implement
{a}(*tmp*)
list0_mergesort$cmp
(x1, x2) = gcompare$val<a>(x1, x2)
implement
{a}(*tmp*)
list0_quicksort$cmp
(x1, x2) = gcompare$val<a>(x1, x2)

(* ****** ****** *)

implement
{a}(*tmp*)
list0_mergesort(xs) =
(
list0_vt2t
(
list0_vt_mergesort<a>(list0_listize<a>(xs))
)
) where
{
implement
list0_vt_mergesort$cmp<a>(x1, x2) = list0_mergesort$cmp<a>(x1, x2)
} (* end of [list0_mergesort] *)

implement
{a}(*tmp*)
list0_quicksort(xs) =
(
list0_vt2t
(
list0_vt_quicksort<a>(list0_listize<a>(xs))
)
) where
{
implement
list0_vt_quicksort$cmp<a>(x1, x2) = list0_quicksort$cmp<a>(x1, x2)
} (* end of [list0_quicksort] *)

(* ****** ****** *)
//
// HX-2019-05:
// For lists indexed by length
//
(* ****** ****** *)

implement
{}(*tmp*)
list1_iseqz(xs) =
(
case+ xs of
| list1_nil _ => tt | list1_cons _ => ff
)
implement
{}(*tmp*)
list1_isneqz(xs) =
(
case+ xs of
| list1_nil _ => ff | list1_cons _ => tt
)

(* ****** ****** *)
//
implement
{x0}(*tmp*)
list1_length(xs) =
($UN.cast(list0_length<x0>(g0ofg1(xs))))
//
(* ****** ****** *)

implement
{x0}(*tmp*)
list1_get_at
  (xs, i0) =
(
  loop(xs, i0)
) where
{
//
fun
loop
{n:int}
{i:nat|i < n}
( xs
: list1(x0, n), i0: int(i)
) : x0 =
case+ xs of
| list1_cons(x0, xs) =>
  if i0 = 0 then x0 else loop(xs, pred(i0))
//
} (* end of [list1_get_at] *)

(* ****** ****** *)

implement
{x0}(*tmp*)
list1_drop
  (xs, i0) =
(
  loop(xs, i0)
) where
{
//
fun
loop
{n:int}
{i:nat|i <= n}
(
xs: list1(x0, n), i0: int(i)
) : list1(x0, n-i) =
if
i0 = 0
then xs
else
(
case+ xs of
| list1_cons(_, xs) => loop(xs, pred(i0))
)
//
} (* end of [list1_drop] *)

(* ****** ****** *)

implement
{x0}(*tmp*)
list1_take
  (xs, i0) =
(
let
var r0: ptr?
in
  loop(xs, i0, r0); r0
end
) where
{
//
fun
loop
{n:int}
{i:nat|i <= n}
( xs
: list1(x0,n), i0: int(i)
, r0: &ptr? >> list1_vt(x0, i)): void =
if
i0 = 0
then
(r0 := list1_vt_nil())
else
(
case+ xs of
| list1_cons(x0, xs) =>
  (
  let
    val () =
    ( r0 :=
      list1_vt_cons
      {x0}{0}(x0, _(*r1*)) )
    val+
    list1_vt_cons(_, r1) = r0
  in
    loop(xs, pred(i0), r1); fold@(r0)
  end
  )
)
//
} (* end of [list1_take] *)

(* ****** ****** *)

(* end of [list.dats] *)
