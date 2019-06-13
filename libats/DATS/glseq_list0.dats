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

#staload "./../SATS/gint.sats"
#staload "./../SATS/glseq.sats"
#staload "./../SATS/list.sats"
#staload "./../SATS/list_vt.sats"

(* ****** ****** *)

impltmp
(x0:vtflt)
glseq_forall0<
glseq><list0_vt(x0),x0>
  (xs) =
(
  list0_vt_forall0<x0>(xs)
) where
{
impltmp
list0_vt_forall0$test<x0>(x0) =
  glseq_forall0$test<glseq><list0_vt(x0),x0>(x0)
} (* end of [glseq_forall0] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
glseq_forall1<
glseq><list0_vt(x0),x0>
  (xs) =
(
  list0_vt_forall1<x0>(xs)
) where
{
impltmp
list0_vt_forall1$test<x0>(x0) =
  glseq_forall1$test<glseq><list0_vt(x0),x0>(x0)
} (* end of [glseq_forall1] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
glseq_foreach1<
glseq><list0_vt(x0),x0>
  (xs) =
(
  list0_vt_foreach1<x0>(xs)
) where
{
impltmp
list0_vt_foreach1$work<x0>(x0) =
  glseq_foreach1$work<glseq><list0_vt(x0),x0>(x0)
} (* end of [glseq_foreach1] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
glseq_rforall1<
glseq><list0_vt(x0),x0>
  (xs) =
(
  list0_vt_rforall1<x0>(xs)
) where
{
impltmp
list0_vt_rforall1$test<x0>(x0) =
  glseq_rforall1$test<glseq><list0_vt(x0),x0>(x0)
} (* end of [glseq_rforall1] *)

(* ****** ****** *)

impltmp
(x0:vtflt)
glseq_forall1_ref<
glseq><list0_vt(x0),x0>
  (xs) =
(
  list0_vt_forall1_ref<x0>(xs)
) where
{
impltmp
list0_vt_forall1_ref$test<x0>(x0) =
glseq_forall1_ref$test<glseq><list0_vt(x0),x0>(x0)
} (* end of [glseq_forall1_ref] *)

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
list0_vt_iforall0(xs) =
(
glseq_iforall0<glseq><xs,x0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_iforall0$test<glseq><xs,x0>
(i0, x0) = list0_vt_iforall0$test<x0>(i0, x0)
//
} (* end of [list0_vt_iforall0] *)
//
impltmp
{x0}(*tmp*)
list0_vt_iforeach0(xs) =
(
glseq_iforeach0<glseq><xs,x0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_iforeach0$work<glseq><xs,x0>
(i0, x0) = list0_vt_iforeach0$work<x0>(i0, x0)
//
} (* end of [list0_vt_iforeach0] *)
//
(* ****** ****** *)

impltmp
{x0}{y0}
list0_vt_map0_list(xs) =
(
glseq_map0_list<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_map0$fopr<
glseq><xs,x0><y0>(x0) = list0_vt_map0$fopr<x0><y0>(x0)
//
} // list0_vt_map0_list
impltmp
{x0}{y0}
list0_vt_map0_rlist(xs) =
(
glseq_map0_rlist<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_map0$fopr<
glseq><xs,x0><y0>(x0) = list0_vt_map0$fopr<x0><y0>(x0)
//
} // list0_vt_map0_rlist
//
(* ****** ****** *)

impltmp
{x0}{y0}
list0_vt_imap0_list(xs) =
(
glseq_imap0_list<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_imap0$fopr<
glseq><xs,x0><y0>(i0, x0) = list0_vt_imap0$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap0_list
impltmp
{x0}{y0}
list0_vt_imap0_rlist(xs) =
(
glseq_imap0_rlist<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_imap0$fopr<
glseq><xs,x0><y0>(i0, x0) = list0_vt_imap0$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap0_rlist
//
(* ****** ****** *)
//
impltmp
{x0}{y0}
list0_vt_map1_list(xs) =
(
glseq_map1_list<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_map1$fopr<
glseq><xs,x0><y0>(x0) = list0_vt_map1$fopr<x0><y0>(x0)
//
} // list0_vt_map1_list
impltmp
{x0}{y0}
list0_vt_map1_rlist(xs) =
(
glseq_map1_rlist<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_map1$fopr<
glseq><xs,x0><y0>(x0) = list0_vt_map1$fopr<x0><y0>(x0)
//
} // list0_vt_map1_rlist
//
(* ****** ****** *)
//
impltmp
{x0}{y0}
list0_vt_imap1_list(xs) =
(
glseq_imap1_list<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_imap1$fopr<
glseq><xs,x0><y0>(i0, x0) = list0_vt_imap1$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap1_list
impltmp
{x0}{y0}
list0_vt_imap1_rlist(xs) =
(
glseq_imap1_rlist<glseq><xs,x0><y0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_imap1$fopr<
glseq><xs,x0><y0>(i0, x0) = list0_vt_imap1$fopr<x0><y0>(i0, x0)
//
} // list0_vt_imap1_rlist
//
(* ****** ****** *)

impltmp
{x0}//tmp
list0_vt_foreach1_ref
  (xs) =
(
glseq_foreach1_ref<glseq><xs,x0>(xs)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_foreach1_ref$work<glseq><xs,x0>(px) = list0_vt_foreach1_ref$work<x0>(px)
}

(* ****** ****** *)

impltmp
{x0}{r0}//tmp
list0_vt_foldleft1_ref
  (xs, r0) =
(
glseq_foldleft1_ref<glseq><xs,x0><r0>(xs, r0)
) where
{
//
vtypedef xs = list0_vt(x0)
//
impltmp
glseq_foldleft1_ref$fopr<glseq><xs,x0><r0>(r0, px) = list0_vt_foldleft1_ref$fopr<x0><r0>(r0, px)
}

(* ****** ****** *)

(* end of [glseq_list0.dats] *)
