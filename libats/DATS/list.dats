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
#staload "./../SATS/bool.sats"
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/list_vt.sats"
#staload "./../SATS/stream_vt.sats"

(* ****** ****** *)

#staload UN = "./../SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_sing(x0) =
list0_cons(x0, list0_nil())
//
(* ****** ****** *)

impltmp
{}(*tmp*)
list0_iseqz(xs) =
(
case+ xs of
| list0_nil _ => tt | list0_cons _ => ff
)
impltmp
{}(*tmp*)
list0_isneqz(xs) =
(
case+ xs of
| list0_nil _ => ff | list0_cons _ => tt
)

(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_size(xs) =
(
i2sz(list0_length<x0>(xs))
)
impltmp
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
impltmp
{x0}//tmp
list0_length(xs) =
(
gseq_foldleft<list0(x0)><x0><int>(xs, 0)
) where
{
impltmp
gseq_foldleft$fopr<x0><int>(r0, x0) = succ(r0)
}
*)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_indexof(xs, x0) =
$effmask_all
(
  gseq_indexof<list0(x0)><x0>(xs, x0)
) (* end of [list0_indexof] *)
//
(* ****** ****** *)

impltmp
{x0}//tmp
list0_head_exn(xs) =
(
case+ xs of
| list0_cons
  (x0, _) => x0
| list0_nil((*void*)) =>
  $raise(ListSubscriptExn())
)
impltmp
{x0}//tmp
list0_head_opt(xs) =
(
case+ xs of
| list0_nil() => none0_vt()
| list0_cons(x0, _) => some0_vt(x0)
)

(* ****** ****** *)

impltmp
{x0}//tmp
list0_tail_exn(xs) =
(
case+ xs of
| list0_cons
  (_, xs) => xs
| list0_nil((*void*)) =>
  $raise(ListSubscriptExn())
)
impltmp
{x0}//tmp
list0_tail_opt(xs) =
(
case+ xs of
| list0_nil() => none0_vt()
| list0_cons(_, xs) => some0_vt(xs)
)

(* ****** ****** *)

impltmp
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

impltmp
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

impltmp
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

impltmp
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

impltmp
{x0}(*tmp*)
list0_copy_vt(xs) = list0_listize<x0>(xs)

(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_extend
  (xs, x0) =
(
list0_vt2t
(list0_extend_vt<x0>(xs, x0))
)
impltmp
{x0}//tmp
list0_extend_vt
  (xs, x0) =
(
list0_append_vt<x0>(xs, list0_vt_sing(x0))
)
//
(* ****** ****** *)
//
impltmp
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
impltmp
{x0}//tmp
list0_append_vt
  (xs, ys) =
(
let
val ys = list0_vt2t(ys)
in
$UN.castvwtp0
{list0_vt(x0)}
(list0_append<x0>(xs, ys))
end // end of [list0_append_vt]
)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_concat(xss) =
(
list0_foldright<xs><r0>
  (xss, list0_nil())
) where
{
//
typedef xs = list0(x0)
typedef r0 = list0(x0)
//
fun
append
( xs
: list0(x0)
, ys
: list0(x0)
) : list0(x0) =
(
case+ ys of
| list0_nil _ => xs
| list0_cons _ => list0_append<x0>(xs, ys)
)
//
impltmp
list0_foldright$fopr<xs><r0>(xs, r0) = append(xs, r0)
//
} (* end of [list0_concat] *)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_concat_vt(xss) =
(
list0_foldright<xs><r0>
  (xss, list0_vt_nil())
) where
{
//
typedef xs = list0(x0)
vtypedef r0 = list0_vt(x0)
//
fun
append
( xs
: list0(x0)
, ys
: list0_vt(x0)
) : list0_vt(x0) = list0_append_vt<x0>(xs, ys)
//
impltmp
list0_foldright$fopr<xs><r0>(xs, r0) = append(xs, r0)
//
} (* end of [list0_concat_vt] *)
//
(* ****** ****** *)
//
impltmp
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
impltmp
{x0}//tmp
list0_reverse(xs) =
(
list0_revapp<x0>(xs, list0_nil())
)
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_revapp_vt
  (xs, ys) =
(
let
val ys = list0_vt2t(ys)
in
$UN.castvwtp0
{list0_vt(x0)}
(list0_revapp<x0>(xs, ys))
end // end of [list0_revapp_vt]
)
//
impltmp
{x0}//tmp
list0_reverse_vt(xs) =
(
  loop(xs, list0_vt_nil())
) where
{
  fun
  loop
  ( xs
  : list0(x0)
  , ys
  : list0_vt(x0)
  ) : list0_vt(x0) =
  (
  case+ xs of
  | list0_nil() => ys
  | list0_cons(x0, xs) => loop(xs, list0_vt_cons(x0, ys))
  )
} (* end of [list0_reverse_vt] *)
//
(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
list0_mcons
  (x0, xss) =
(
list0_vt2t
(list0_mcons_vt<x0>(x0, xss))
)
//
impltmp
{x0}(*tmp*)
list0_mcons_vt
  (x0, xss) =
(
list0_map_list<xs><ys>(xss)
) where
{
typedef
xs = list0(x0) and ys = list0(x0)
impltmp
list0_map$fopr<xs><ys>(xs) = list0_cons(x0, xs)
}
//
(* ****** ****** *)

impltmp
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

impltmp
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

impltmp
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

impltmp
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

impltmp
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

impltmp
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
//
impltmp
{x0}//tmp
list0_exists(xs) =
(
not(list0_forall<x0>(xs))
) where
{
impltmp
list0_forall$test<x0>(x0) = 
not(list0_exists$test<x0>(x0))
} (* end of [list0_exists] *)
//
(*
impltmp
{x0}//tmp
list0_exists(xs) =
  (loop(xs)) where
{
//
fun
loop
(xs: list0(x0)): bool =
(
case+ xs of
| list0_nil() => ff
| list0_cons(x0, xs) =>
  if
  list0_exists$test<x0>(x0) then tt else loop(xs)
)
} (* end of [list0_exists] *)
*)
//
(* ****** ****** *)

impltmp
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

impltmp
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

impltmp
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
impltmp
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
impltmp
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
impltmp
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
impltmp
{x0}(*tmp*)
list0_iforall(xs) =
(
  gseq_iforall<list0(x0)><x0>(xs)
) where
{
impltmp
gseq_iforall$test<x0>
  (i0, x0) = list0_iforall$test<x0>(i0, x0)
}
impltmp
{x0}(*tmp*)
list0_iforeach(xs) =
(
  gseq_iforeach<list0(x0)><x0>(xs)
) where
{
impltmp
gseq_iforeach$work<x0>
  (i0, x0) = list0_iforeach$work<x0>(i0, x0)
}
impltmp
{x0}{r0}//tmp
list0_ifoldleft(xs, r0) =
(
  gseq_ifoldleft<list0(x0)><x0>(xs, r0)
) where
{
impltmp
gseq_ifoldleft$fopr<x0><r0>
  (r0, i0, x0) = list0_ifoldleft$fopr<x0>(r0, i0, x0)
}
//
(* ****** ****** *)
//
impltmp
{x0}{y0}//tmp
list0_map(xs) =
list0_vt2t
(list0_map_list<x0><y0>(xs))
//
impltmp
{x0}{y0}//tmp
list0_map_list(xs) =
(
  gseq_map_list<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_map_rlist(xs) =
(
  gseq_map_rlist<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_map_stream(xs) =
(
  gseq_map_stream<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)
//
impltmp
{x0}//tmp
list0_filter(xs) =
(
list0_vt2t
(list0_mapopt_list<x0><x0>(xs))
) where
{
impltmp
list0_mapopt$test<x0>(x0) =
list0_filter$test<x0>(x0)
impltmp
list0_mapopt$fopr<x0><x0>(x0) = x0
}
impltmp
{x0}{y0}//tmp
list0_mapopt(xs) =
list0_vt2t
(list0_mapopt_list<x0><y0>(xs))
//
impltmp
{x0}{y0}//tmp
list0_mapopt_list(xs) =
(
  gseq_mapopt_list<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_mapopt_rlist(xs) =
(
  gseq_mapopt_rlist<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_mapopt_stream(xs) =
(
  gseq_mapopt_stream<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)
//
impltmp
{x0}{y0}//tmp
list0_imap(xs) =
list0_vt2t
(list0_imap_list<x0><y0>(xs))
//
impltmp
{x0}{y0}//tmp
list0_imap_list(xs) =
(
  gseq_imap_list<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
impltmp
{x0}{y0}//tmp
list0_imap_rlist(xs) =
(
  gseq_imap_rlist<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
impltmp
{x0}{y0}//tmp
list0_imap_stream(xs) =
(
  gseq_imap_stream<list0(x0)><x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
//
(* ****** ****** *)

impltmp
{x0}{y0}
list0_mapjoin(xs) =
(
  auxlst1(yss)
) where
{
//
typedef ys = list0(y0)
//
val yss =
(
list0_map_rlist<x0><ys>(xs)
) where
{
  impltmp
  list0_map$fopr<x0><ys>(x0) =
  list0_mapjoin$fopr<x0><y0>(x0)
}
//
fun
auxlst1
( yss
: list0_vt(ys)): list0(y0) =
(
case+ yss of
| ~list0_vt_nil
   ((*void*)) => list0_nil()
| ~list0_vt_cons
   (ys0, yss1) => auxlst2(yss1, ys0)
)
and
auxlst2
( yss
: list0_vt(ys)
, res: list0(y0)): list0(y0) =
(
case+ yss of
| ~list0_vt_nil
   ((*void*)) => res
| ~list0_vt_cons
   (ys0, yss) => auxlst2(yss, append(ys0, res))
)
//
} (* end of [list0_mapjoin] *)

(* ****** ****** *)

impltmp
{x0}{y0}
list0_mapjoin_vt(xs) =
(
  auxlst1(yss)
) where
{
//
vtypedef ys = list0_vt(y0)
//
val yss =
(
list0_map_rlist<x0><ys>(xs)
) where
{
  impltmp
  list0_map$fopr<x0><ys>(x0) =
  list0_mapjoin_vt$fopr<x0><y0>(x0)
}
//
fun
auxlst1
( yss
: list0_vt(ys)): list0_vt(y0) =
(
case+ yss of
| ~list0_vt_nil
   ((*void*)) => list0_vt_nil()
| ~list0_vt_cons
   (ys0, yss1) => auxlst2(yss1, ys0)
)
and
auxlst2
( yss
: list0_vt(ys)
, res: list0_vt(y0)): list0_vt(y0) =
(
case+ yss of
| ~list0_vt_nil
   ((*void*)) => res
| ~list0_vt_cons
   (ys0, yss) => auxlst2(yss, append(ys0, res))
)
//
} (* end of [list0_mapjoin_vt] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_equal
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs: list0(a)
, ys: list0(a)): bool =
(
case+ xs of
| list0_nil() =>
  (
  case+ ys of
  | list0_nil() => true
  | list0_cons _ => false
  )
| list0_cons(x0, xs) =>
  (
  case+ ys of
  | list0_nil() => true
  | list0_cons(y0, ys) =>
    let
      val ans =
      gequal$val<a>(x0, y0)
    in
      if ans then loop(xs, ys) else false
    end
  )
) (* end of [loop] *)
} (* end of [list0_equal] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_compare
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs: list0(a)
, ys: list0(a)): sint =
(
case+ xs of
| list0_nil() =>
  (
  case+ ys of
  | list0_nil _ => 0
  | list0_cons _ => ~1
  )
| list0_cons(x0, xs) =>
  (
  case+ ys of
  | list0_nil _ => 1
  | list0_cons(y0, ys) =>
    let
      val sgn =
      gcompare$val<a>(x0, y0)
    in
      if sgn != 0 then sgn else loop(xs, ys)
    end
  )
) (* end of [loop] *)
} (* end of [list0_compare] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_nchoose
(xs, n0) =
(
  auxmain(xs, n0)
) where
{
//
typedef xs = list0(a)
//
fun
auxmain
(
xs: list0(a)
,
n0: Intgte(0)
) : stream_vt(list0(a)) =
$ldelay
(
if
(n0 = 0)
then
stream_vt_sing(list0_nil())
else
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  ( lazy_vt_force
    (stream_vt_append<xs>(xss1, xss2))
  ) where
  {
    val xss2 =
    (
      auxmain(xs, n0)
    )
    val xss1 =
    (
      stream_vt_map<xs><xs>
      (auxmain(xs, pred(n0)))
    ) where
    {
      impltmp
      stream_vt_map$fopr<xs><xs>(xs) = list0_cons(x0, xs)
    }
  } (* end of [list0_cons] *)
)
)
} (* end of [list0_nchoose] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_nchoose_rest
(xs, n0) =
(
  auxmain(xs, n0)
) where
{
//
typedef xy =
tup(list0(a), list0(a))
//
fun
auxmain
(
xs: list0(a)
,
n0: Intgte(0)): stream_vt(xy) =
$ldelay
(
if
(n0 = 0)
then
stream_vt_sing
(@(list0_nil(), xs))
else
(
case+ xs of
| list0_nil() =>
  stream_vt_nil()
| list0_cons(x0, xs) =>
  ( lazy_vt_force
    (stream_vt_append<xy>(res1, res2))
  ) where
  {
    val res2 =
    (
    stream_vt_map<xy><xy>(auxmain(xs, n0))
    ) where
    {
    impltmp
    stream_vt_map$fopr<xy><xy>(xy) = (xy.0, list0_cons(x0, xy.1))
    }
    val res1 =
    (
    stream_vt_map<xy><xy>(auxmain(xs, pred(n0)))
    ) where
    {
    impltmp
    stream_vt_map$fopr<xy><xy>(xy) = (list0_cons(x0, xy.0), xy.1)
    }
  } (* end of [list0_cons] *)
)
)
} (* end of [list0_nchoose_rest] *)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_mergesort$cmp
(x1, x2) = gcompare$val<a>(x1, x2)
impltmp
{a}(*tmp*)
list0_quicksort$cmp
(x1, x2) = gcompare$val<a>(x1, x2)

(* ****** ****** *)

impltmp
{a}(*tmp*)
list0_mergesort(xs) =
(
list0_vt2t
(
list0_vt_mergesort<a>(list0_listize<a>(xs))
)
) where
{
impltmp
list0_vt_mergesort$cmp<a>(x1, x2) = list0_mergesort$cmp<a>(x1, x2)
} (* end of [list0_mergesort] *)

impltmp
{a}(*tmp*)
list0_quicksort(xs) =
(
list0_vt2t
(
list0_vt_quicksort<a>(list0_listize<a>(xs))
)
) where
{
impltmp
list0_vt_quicksort$cmp<a>(x1, x2) = list0_quicksort$cmp<a>(x1, x2)
} (* end of [list0_quicksort] *)

(* ****** ****** *)
//
// HX-2019-05:
// For lists indexed by length
//
(* ****** ****** *)

impltmp
{}(*tmp*)
list1_iseqz(xs) =
(
case+ xs of
| list1_nil _ => tt | list1_cons _ => ff
)
impltmp
{}(*tmp*)
list1_isneqz(xs) =
(
case+ xs of
| list1_nil _ => ff | list1_cons _ => tt
)

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
list1_length(xs) =
($UN.cast(list0_length<x0>(g0ofg1(xs))))
//
(* ****** ****** *)

impltmp
{x0}(*tmp*)
list1_head(xs) =
(
case+ xs of list1_cons(x0, xs) => x0
)
impltmp
{x0}(*tmp*)
list1_tail(xs) =
(
case+ xs of list1_cons(x0, xs) => xs
)

(* ****** ****** *)

impltmp
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

impltmp
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

impltmp
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
