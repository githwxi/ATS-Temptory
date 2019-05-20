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

#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)

exception
ListSubscriptExn of ()

(* ****** ****** *)
//
castfn
g0ofg1_list
{a:tflt}
(list1(INV(a))):<> list0(a)
castfn
g1ofg0_list
{a:tflt}
(list0(INV(a))):<> list1(a)
//
#symload g0ofg1 with g0ofg1_list
#symload g1ofg0 with g1ofg0_list
//
(* ****** ****** *)
//
castfn
list0_vt2t
{a:tflt}
(list0_vt(INV(a))):<> list0(a)
//
(* ****** ****** *)
//
fun{}
list0_iseqz
{x0:tflt}(list0(x0)):<> bool
fun{}
list0_isneqz
{x0:tflt}(list0(x0)):<> bool
//
#symload iseqz with list0_iseqz
#symload isneqz with list0_isneqz
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_size
(xs: list0(INV(x0))):<> size
fun
{x0:tflt}
list0_length
(xs: list0(INV(x0))):<> Intgte(0)
//
#symload size with list0_size
#symload length with list0_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_indexof
(list0(INV(x0)), elt: x0):<> (int)
//
#symload indexof with list0_indexof
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_head_exn
(xs: list0(INV(x0))): (x0)
fun
{x0:tflt}
list0_head_opt
(xs: list0(INV(x0))): optn0_vt(x0)
//
fun
{x0:tflt}
list0_tail_exn
(xs: list0(INV(x0))): list0(x0)
fun
{x0:tflt}
list0_tail_opt
(xs: list0(INV(x0))): optn0_vt(list0(x0))
//
#symload head with list0_head_exn
#symload tail with list0_tail_exn
#symload head_exn with list0_head_exn
#symload tail_exn with list0_tail_exn
#symload head_opt with list0_head_opt
#symload tail_opt with list0_tail_opt
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_get_at_exn
(xs: list0(INV(x0)), i0: int): (x0) 
fun
{x0:tflt}
list0_get_at_opt
(xs: list0(INV(x0)), i0: int): optn0_vt(x0) 
//
#symload [] with list0_get_at_exn
#symload get_at with list0_get_at_exn
#symload get_at_exn with list0_get_at_exn
#symload get_at_opt with list0_get_at_opt
//
(* ****** ****** *)

fun
{x0:tflt}
list0_drop
(list0(x0), i0: int): list0(x0)
fun
{x0:tflt}
list0_take
(list0(x0), i0: int): list0_vt(x0)

(* ****** ****** *)
//
fun
{x0:tflt}
list0_append
( xs: list0(INV(x0))
, ys: list0(INV(x0))): list0(x0)
fun
{x0:tflt}
list0_concat
(list0(list0(INV(x0)))): list0(x0)
//
fun
{x0:tflt}
list0_revapp
( xs: list0(INV(x0))
, ys: list0(INV(x0))): list0(x0)
fun
{x0:tflt}
list0_reverse(list0(INV(x0))): list0(x0)
//
#symload append with list0_append
#symload concat with list0_concat
#symload revapp with list0_revapp
#symload reverse with list0_reverse
//
(* ****** ****** *)
//
(*
// HX-2019-05:
// [split$choose] returns 0/1
// to indicate whether the current
// element joins the 1st or 2nd returned list
// [merge$choose] returns 0/1 to
// indicate which element, from either the
// 1st or 2nd list, currently joins the returned list
*)
//
fun
{x0:tflt}
list0_split
( xs
: list0(x0)
) :
(list0_vt(x0), list0_vt(x0))
fun
{x0:tflt}
list0_split$choose(x0): sint
//
fun
{x0:tflt}
list0_merge
( xs: list0(x0)
, ys: list0(x0)): list0_vt(x0)
fun
{x0:tflt}
list0_merge$choose(x0, x0): sint
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_listize
(xs: list0(INV(x0))): list0_vt(x0)
fun
{x0:tflt}
list0_rlistize
(xs: list0(INV(x0))): list0_vt(x0)
fun
{x0:tflt}
list0_streamize
(xs: list0(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_forall
(xs: list0(INV(x0))): bool
fun
{x0:tflt}
list0_forall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_foreach
(xs: list0(INV(x0))): void
fun
{x0:tflt}
list0_foreach$work(x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_rforall
(xs: list0(INV(x0))): bool
fun
{x0:tflt}
list0_rforall$test(x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_rforeach
(xs: list0(INV(x0))): void
fun
{x0:tflt}
list0_rforeach$work(x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
{r0:vtflt}
list0_foldleft
(xs: list0(INV(x0)), r0: r0): r0
fun
{x0:tflt}
{r0:vtflt}
list0_foldright
(xs: list0(INV(x0)), r0: r0): r0
//
fun
{x0:tflt}{r0:vtflt}
list0_foldleft$fopr(r0: r0, x0: x0): r0
fun
{x0:tflt}{r0:vtflt}
list0_foldright$fopr(x0: x0, r0: r0): r0
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_iforall
(xs: list0(INV(x0))): bool
fun
{x0:tflt}
list0_iforall$test(int, x0): bool
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_iforeach
(xs: list0(INV(x0))): void
fun
{x0:tflt}
list0_iforeach$work(int, x0): void
//
(* ****** ****** *)
//
fun
{x0:tflt}
{r0:vtflt}
list0_ifoldleft
(xs: list0(INV(x0)), r0: r0): r0
//
fun
{x0:tflt}{r0:vtflt}
list0_ifoldleft$fopr(r0: r0, i0: int, x0: x0): r0
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
list0_map$fopr(x0): (y0)
//
fun
{x0:tflt}
{y0:tflt}
list0_map
(list0(INV(x0))): list0(y0)
#symload map with list0_map
//
fun
{x0:tflt}
{y0:vtflt}
list0_map_list
(xs: list0(INV(x0))): list0_vt(y0)
fun
{x0:tflt}
{y0:vtflt}
list0_map_rlist
(xs: list0(INV(x0))): list0_vt(y0)
//
fun
{x0:tflt}
{y0:vtflt}
list0_map_stream
(xs: list0(INV(x0))): stream_vt(y0)
//
#symload map_list with list0_map_list
#symload map_rlist with list0_map_rlist
#symload map_stream with list0_map_stream
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_filter$test(x0): bool
fun
{x0:tflt}
{y0:vtflt}
list0_mapopt$fopr(x0): (y0)
fun
{x0:tflt}
list0_mapopt$test(x0): bool
//
fun
{x0:tflt}
list0_filter
(xs: list0(INV(x0))): list0(x0)
#symload filter with list0_filter
fun
{x0:tflt}
{y0:tflt}
list0_mapopt
(xs: list0(INV(x0))): list0(y0)
#symload mapopt with list0_mapopt
//
fun
{x0:tflt}
{y0:vtflt}
list0_mapopt_list
(xs: list0(INV(x0))): list0_vt(y0)
fun
{x0:tflt}
{y0:vtflt}
list0_mapopt_rlist
(xs: list0(INV(x0))): list0_vt(y0)
//
fun
{x0:tflt}
{y0:vtflt}
list0_mapopt_stream
(xs: list0(INV(x0))): stream_vt(y0)
//
#symload mapopt_list with list0_mapopt_list
#symload mapopt_rlist with list0_mapopt_rlist
#symload mapopt_stream with list0_mapopt_stream
//
(* ****** ****** *)
//
fun
{x0:tflt}
{y0:vtflt}
list0_imap$fopr
  (i0: int, x0: x0): (y0)
//
fun
{x0:tflt}
{y0:tflt}
list0_imap
(list0(INV(x0))): list0(y0)
#symload imap with list0_imap
//
fun
{x0:tflt}
{y0:vtflt}
list0_imap_list
(xs: list0(INV(x0))): list0_vt(y0)
fun
{x0:tflt}
{y0:vtflt}
list0_imap_rlist
(xs: list0(INV(x0))): list0_vt(y0)
//
fun
{x0:tflt}
{y0:vtflt}
list0_imap_stream
(xs: list0(INV(x0))): stream_vt(y0)
//
#symload imap_list with list0_imap_list
#symload imap_rlist with list0_imap_rlist
#symload imap_stream with list0_imap_stream
//
(* ****** ****** *)
//
fun
{a:tflt}
list0_mergesort
  (xs: list0(INV(a))): list0(a)
fun
{a:tflt}
list0_mergesort$cmp(x1: a, x2: a): int(*sgn*)
//
(* ****** ****** *)
//
fun
{a:tflt}
list0_quicksort
  (xs: list0(INV(a))): list0(a)
fun
{a:tflt}
list0_quicksort$cmp(x1: a, x2: a): int(*sgn*)
//
(* ****** ****** *)
//
// HX-2019-05:
// For lists indexed by length
//
(* ****** ****** *)
//
fun{}
list1_iseqz
{x0:tflt}{n:int}
(xs: list1(x0, n)):<> bool(n==0)
fun{}
list1_isneqz
{x0:tflt}{n:int}
(xs: list1(x0, n)):<> bool(n > 0)
//
#symload iseqz with list1_iseqz
#symload isneqz with list1_isneqz
//
(* ****** ****** *)
//
fun
{x0:tflt}
list1_size
{n:int}
(xs: list1(INV(x0))):<> size(n)
fun
{x0:tflt}
list1_length
{n:int}
(xs: list1(INV(x0))):<> sint(n)
//
#symload size with list1_size
#symload length with list1_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
list1_get_at
{n:int}{i:nat|i < n}
( xs
: list1(INV(x0), n), i0: int(i)): (x0)
//
#symload [] with list1_get_at of 10
#symload get_at with list1_get_at of 10
//
(* ****** ****** *)

fun
{x0:tflt}
list1_drop
{n:int}{i:nat|i <= n}
( xs
: list1(INV(x0), n), i0: int(i)): list1(x0, n-i)
fun
{x0:tflt}
list1_take
{n:int}{i:nat|i <= n}
( xs
: list1(INV(x0), n), i0: int(i)): list1_vt(x0, i)

(* ****** ****** *)

(* end of [list.sats] *)
