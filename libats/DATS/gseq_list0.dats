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
#staload "./../SATS/gseq.sats"
#staload "./../SATS/list.sats"

(* ****** ****** *)
//
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
let
typedef xs = list0(x0)
in
  gseq_indexof<gseq><xs,x0>(xs, x0)
end
) (* end of [list0_indexof] *)
//
(* ****** ****** *)

impltmp
(x0:tflt)
gseq_iseqz<
gseq><list0(x0),x0>
  (xs) =
(
  list0_iseqz<>{x0}(xs)
) (* end of [gseq_iseqz] *)
impltmp
(x0:tflt)
gseq_isneqz<
gseq><list0(x0),x0>
  (xs) =
(
  list0_isneqz<>{x0}(xs)
) (* end of [gseq_isneqz] *)

(* ****** ****** *)
//
impltmp
(x0:tflt)
gseq_listize<
gseq><list0(x0),x0>
  (xs) =
(
  list0_listize<x0>(xs)
) (* end of [gseq_listize] *)
impltmp
(x0:tflt)
gseq_rlistize<
gseq><list0(x0),x0>
  (xs) =
(
  list0_rlistize<x0>(xs)
) (* end of [gseq_rlistize] *)
impltmp
(x0:tflt)
gseq_streamize<
gseq><list0(x0),x0>
  (xs) =
(
  list0_streamize<x0>(xs)
) (* end of [gseq_streamize] *)
//
(* ****** ****** *)

impltmp
(x0:tflt)
gseq_forall<
gseq><list0(x0),x0>
  (xs) =
(
  list0_forall<x0>(xs)
) where
{
impltmp
list0_forall$test<x0>(x0) =
  gseq_forall$test<gseq><list0(x0),x0>(x0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_foreach<
gseq><list0(x0),x0>
  (xs) =
(
  list0_foreach<x0>(xs)
) where
{
impltmp
list0_foreach$work<x0>(x0) =
  gseq_foreach$work<gseq><list0(x0),x0>(x0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)

impltmp
(x0:tflt)
gseq_rforall<
gseq><list0(x0),x0>
  (xs) =
(
  list0_rforall<x0>(xs)
) where
{
impltmp
list0_rforall$test<x0>(x0) =
  gseq_rforall$test<gseq><list0(x0),x0>(x0)
} (* end of [gseq_rforall] *)

(* ****** ****** *)

impltmp
(x0:tflt
,r0:vtflt)
gseq_foldleft<
gseq><list0(x0),x0><r0>
  (xs, r0) =
(
list0_foldleft<x0><r0>(xs, r0)
) where
{
impltmp
list0_foldleft$fopr<x0><r0>(r0,x0) =
  gseq_foldleft$fopr<gseq><list0(x0),x0><r0>(r0,x0)
} (* end of [gseq_foldleft] *)

(* ****** ****** *)

impltmp
(x0:tflt
,y0:tflt)
gseq_z2forall<gseq><gseq><list0(x0),x0><list0(y0),y0>
  (xs, ys) =
(
  list0_z2forall<x0,y0>(xs, ys)
) where
{
impltmp
list0_z2forall$test<x0,y0>(x0,y0) =
  gseq_z2forall$test<gseq><gseq><list0(x0),x0><list0(y0),y0>(x0,y0)
} (* end of [gseq_forall] *)

(* ****** ****** *)

impltmp
(x0:tflt
,y0:tflt)
gseq_z2foreach<gseq><gseq><list0(x0),x0><list0(y0),y0>
  (xs, ys) =
(
  list0_z2foreach<x0,y0>(xs, ys)
) where
{
impltmp
list0_z2foreach$work<x0,y0>(x0,y0) =
  gseq_z2foreach$work<gseq><gseq><list0(x0),x0><list0(y0),y0>(x0,y0)
} (* end of [gseq_foreach] *)

(* ****** ****** *)
//
impltmp
{x0}(*tmp*)
list0_iforall(xs) =
(
gseq_iforall<gseq><list0(x0),x0>(xs)
) where
{
impltmp
gseq_iforall$test<gseq><list0(x0),x0>
  (i0, x0) = list0_iforall$test<x0>(i0, x0)
}
impltmp
{x0}(*tmp*)
list0_iforeach(xs) =
(
gseq_iforeach<gseq><list0(x0),x0>(xs)
) where
{
impltmp
gseq_iforeach$work<gseq><list0(x0),x0>
  (i0, x0) = list0_iforeach$work<x0>(i0, x0)
}
impltmp
{x0}{r0}//tmp
list0_ifoldleft(xs, r0) =
(
gseq_ifoldleft<gseq><list0(x0),x0>(xs, r0)
) where
{
impltmp
gseq_ifoldleft$fopr<gseq><list0(x0),x0><r0>
  (r0, i0, x0) = list0_ifoldleft$fopr<x0>(r0, i0, x0)
}
//
(* ****** ****** *)
//
impltmp
{x0}{y0}//tmp
list0_map_list(xs) =
(
gseq_map_list<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_map_rlist(xs) =
(
gseq_map_rlist<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_map_stream(xs) =
(
gseq_map_stream<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_map$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_map$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)
//
impltmp
{x0}{y0}//tmp
list0_mapopt_list(xs) =
(
gseq_mapopt_list<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<
gseq><list0(x0),x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_mapopt_rlist(xs) =
(
  gseq_mapopt_rlist<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<
gseq><list0(x0),x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
impltmp
{x0}{y0}//tmp
list0_mapopt_stream(xs) =
(
gseq_mapopt_stream<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_mapopt$test<
gseq><list0(x0),x0>(x0) = list0_mapopt$test<x0>(x0)
impltmp
gseq_mapopt$fopr<
gseq><list0(x0),x0><y0>(x0) = list0_mapopt$fopr<x0><y0>(x0)
}
//
(* ****** ****** *)

impltmp
{x0}{y0}//tmp
list0_imap_list(xs) =
(
gseq_imap_list<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<
gseq><list0(x0),x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
impltmp
{x0}{y0}//tmp
list0_imap_rlist(xs) =
(
gseq_imap_rlist<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<
gseq><list0(x0),x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
impltmp
{x0}{y0}//tmp
list0_imap_stream(xs) =
(
gseq_imap_stream<gseq><list0(x0),x0><y0>(xs)
) where
{
impltmp
gseq_imap$fopr<
gseq><list0(x0),x0><y0>(i0, x0) = list0_imap$fopr<x0><y0>(i0, x0)
}
//
(* ****** ****** *)

(* end of [gseq_list.dats] *)
