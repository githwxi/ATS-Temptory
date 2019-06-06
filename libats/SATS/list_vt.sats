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
//
castfn
g0ofg1_list_vt
{a:vtflt}
(list1_vt(INV(a))):<> list0_vt(a)
castfn
g1ofg0_list_vt
{a:vtflt}
(list0_vt(INV(a))):<> list1_vt(a)
//
#symload g0ofg1 with g0ofg1_list_vt
#symload g1ofg0 with g1ofg0_list_vt
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_sing
(x0: INV(x0)): list0_vt(x0)
//
(* ****** ****** *)
//
fun{}
list0_vt_iseqz
{x0:vtflt}(!list0_vt(x0)):<> bool
fun{}
list0_vt_isneqz
{x0:vtflt}(!list0_vt(x0)):<> bool
//
#symload iseqz with list0_vt_iseqz
#symload isneqz with list0_vt_isneqz
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_size
(xs: !list0_vt(INV(x0))):<> size
fun
{x0:vtflt}
list0_vt_length
(xs: !list0_vt(INV(x0))):<> Intgte(0)
//
#symload size with list0_vt_size
#symload length with list0_vt_length
//
(* ****** ****** *)
//
fun
{x0:tflt}
list0_vt_head_exn
(xs: !list0_vt(INV(x0))): (x0)
fun
{x0:tflt}
list0_vt_head_opt
(xs: !list0_vt(INV(x0))): optn0_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_free(list0_vt(INV(x0))): void
//
#symload free with list0_vt_free of 10
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_copy
(xs: !list0_vt(INV(x0))): list0_vt(x0)
fun
{x0:vtflt}
list0_vt_rcopy
(xs: !list0_vt(INV(x0))): list0_vt(x0)
//
#symload copy with list0_vt_copy of 10
#symload rcopy with list0_vt_rcopy of 10
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_extend
(
xs: list0_vt(INV(x0)), x0: x0
) : list0_vt(x0) // end-of-fun
//
fun
{x0:vtflt}
list0_vt_append
( xs: list0_vt(INV(x0))
, ys: list0_vt(INV(x0))): list0_vt(x0)
//
fun
{x0:vtflt}
list0_vt_concat
(list0_vt(list0_vt(INV(x0)))): list0_vt(x0)
//
fun
{x0:vtflt}
list0_vt_revapp
( xs: list0_vt(INV(x0))
, ys: list0_vt(INV(x0))): list0_vt(x0)
fun
{x0:vtflt}
list0_vt_reverse
  (xs: list0_vt(INV(x0))): list0_vt(x0)
//
#symload ++ with list0_vt_append
//
#symload extend with list0_vt_extend
#symload append with list0_vt_append
#symload concat with list0_vt_concat
#symload revapp with list0_vt_revapp
#symload reverse with list0_vt_reverse
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_streamize
( xs
: list0_vt(INV(x0))): stream_vt(x0)
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall0$test(x0: x0): bool
fun
{x0:vtflt}
list0_vt_exists0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_exists0$test(x0: x0): bool
//
fun
{x0:vtflt}
list0_vt_foreach0
(xs: list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach0$work(x0: x0): void
//
#symload forall0 with list0_vt_forall0
#symload foreach0 with list0_vt_foreach0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforall0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_rforall0$test(x0: x0): bool
//
fun
{x0:vtflt}
list0_vt_rforeach0
(xs: list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_rforeach0$work(x0: x0): void
//
#symload rforall0 with list0_vt_rforall0
#symload rforeach0 with list0_vt_rforeach0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft0
(xs: list0_vt(INV(x0)), r0: r0): r0
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldleft0$fopr(r0: r0, x0: x0): r0
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldright0
(xs: list0_vt(INV(x0)), r0: r0): r0
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldright0$fopr(x0: x0, r0: r0): r0
//
#symload foldleft with list0_vt_foldleft0
#symload foldright with list0_vt_foldright0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_iforall0
(xs: list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_iforall0$test(i0: int, x0: x0): bool
//
fun
{x0:vtflt}
list0_vt_iforeach0
(xs: list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_iforeach0$work(i0: int, x0: x0): void
//
#symload iforall0 with list0_vt_iforall0
#symload iforeach0 with list0_vt_iforeach0
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map0$fopr(x0): (y0)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map0
(list0_vt(INV(x0))):list0_vt(y0)
#symload map0 with list0_vt_map0
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map0_list
(xs: list0_vt(INV(x0))): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map0_rlist
(xs: list0_vt(INV(x0))): list0_vt(y0)
//
#symload map0_list with list0_vt_map0_list
#symload map0_rlist with list0_vt_map0_rlist
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_filter0$test(x0): bool
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_mapopt0$test(x0): bool
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_mapopt0$fopr(x0): (y0)
//
fun
{x0:vtflt}
list0_vt_filter0
(xs: list0_vt(INV(x0))): list0_vt(x0)
#symload filter0 with list0_vt_filter0
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_mapopt0
(xs: list0_vt(INV(x0))): list0_vt(y0)
#symload mapopt0 with list0_vt_mapopt0
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_mapopt0_list
(xs: list0_vt(INV(x0))): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_mapopt0_rlist
(xs: list0_vt(INV(x0))): list0_vt(y0)
//
#symload
mapopt0_list with list0_vt_mapopt0_list
#symload
mapopt0_rlist with list0_vt_mapopt0_rlist
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap0$fopr
  (i0: int, x0: x0): (y0)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap0
(list0_vt(INV(x0))):list0_vt(y0)
#symload imap0 with list0_vt_imap0
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap0_list
(xs: list0_vt(INV(x0))): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap0_rlist
(xs: list0_vt(INV(x0))): list0_vt(y0)
//
#symload imap0_list with list0_vt_imap0_list
#symload imap0_rlist with list0_vt_imap0_rlist
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall1
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall1$test(!x0): bool
fun
{x0:vtflt}
list0_vt_exists1
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_exists1$test(!x0): bool
//
fun
{x0:vtflt}
list0_vt_foreach1
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach1$work(!x0): void
//
#symload forall1 with list0_vt_forall1
#symload exists1 with list0_vt_exists1
#symload foreach1 with list0_vt_foreach1
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_rforall1
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_rforall1$test(!x0): bool
//
fun
{x0:vtflt}
list0_vt_rforeach1
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_rforeach1$work(!x0): void
//
#symload rforall1 with list0_vt_rforall1
#symload rforeach1 with list0_vt_rforeach1
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft1
(xs: !list0_vt(INV(x0)), r0: r0): r0
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldleft1$fopr(r0: r0, x0: !x0): r0
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldright1
(xs: !list0_vt(INV(x0)), r0: r0): r0
fun
{x0:vtflt}{r0:vtflt}
list0_vt_foldright1$fopr(x0: !x0, r0: r0): r0
//
#symload foldleft1 with list0_vt_foldleft1
#symload foldright1 with list0_vt_foldright1
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map1$fopr(!x0): (y0)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map1
(xs:
!list0_vt(INV(x0))):list0_vt(y0)
#symload map1 with list0_vt_map1
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map1_list
(xs: !list0_vt(INV(x0))): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_map1_rlist
(xs: !list0_vt(INV(x0))): list0_vt(y0)
//
#symload map1_list with list0_vt_map1_list
#symload map1_rlist with list0_vt_map1_rlist
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap1$fopr
  (i0: int, x0: !x0): (y0)
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap1
(xs:
!list0_vt(INV(x0))):list0_vt(y0)
#symload imap1 with list0_vt_imap1
//
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap1_list
(xs: !list0_vt(INV(x0))): list0_vt(y0)
fun
{x0:vtflt}
{y0:vtflt}
list0_vt_imap1_rlist
(xs: !list0_vt(INV(x0))): list0_vt(y0)
//
#symload imap1_list with list0_vt_imap1_list
#symload imap1_rlist with list0_vt_imap1_rlist
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_forall1_ref
(xs: !list0_vt(INV(x0))): bool
fun
{x0:vtflt}
list0_vt_forall1_ref$test(&x0 >> _): bool
//
(* ****** ****** *)
//
fun
{x0:vtflt}
list0_vt_foreach1_ref
(xs: !list0_vt(INV(x0))): void
fun
{x0:vtflt}
list0_vt_foreach1_ref$work(&x0 >> _): void
//
(* ****** ****** *)
//
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft1_ref(!list0_vt(x0), r0): r0
fun
{x0:vtflt}
{r0:vtflt}
list0_vt_foldleft1_ref$fopr(r0, &(x0) >> _): r0
//
(* ****** ****** *)
//
fun
{a:vtflt}
list0_vt_mergesort
(xs: list0_vt(INV(a))): list0_vt(a)
fun
{a:vtflt}
list0_vt_quicksort
(xs: list0_vt(INV(a))): list0_vt(a)
//
#symload mergesort with list0_vt_mergesort
#symload quicksort with list0_vt_quicksort
//
fun
{a:vtflt} // (-)(0)(+)
list0_vt_mergesort$cmp(x: &a, y: &a): int(*sgn*)
fun
{a:vtflt} // (-)(0)(+)
list0_vt_quicksort$cmp(x: &a, y: &a): int(*sgn*)
//
(* ****** ****** *)
//
// HX-2019-05-15: for linear lists
//
(* ****** ****** *)
//
prfun
lemma_list1_vt_param
{a:vtflt}{n:int}
(!list1_vt(INV(a), n)): [n >= 0] void
//
(* ****** ****** *)

fun
{a:vtflt}
list1_vt_length
{n:int}(!list1_vt(INV(a), n)): int(n)

(* ****** ****** *)
//
fun
{a:vtflt}
list1_vt_mergesort
{ n:int }
(xs: list1_vt(INV(a), n)): list1_vt(a, n)
fun
{a:vtflt}
list1_vt_quicksort
{ n:int }
(xs: list1_vt(INV(a), n)): list1_vt(a, n)
//
#symload mergesort with list1_vt_mergesort
#symload quicksort with list1_vt_quicksort
//
fun
{a:vtflt}
list1_vt_mergesort$cmp(x: &a, y: &a): int(*sgn*)
fun
{a:vtflt}
list1_vt_quicksort$cmp(x: &a, y: &a): int(*sgn*)
//
(* ****** ****** *)

(* end of [list_vt.sats] *)
