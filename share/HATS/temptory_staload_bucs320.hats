(* ****** ****** *)
(*
** For customization!!!
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// AuthorEmail: gmhwxiATgmailCOM
//
(* ****** ****** *)

#ifndef
SHARE_TEMPTORY_STALOAD_BUCS320
#define
SHARE_TEMPTORY_STALOAD_BUCS320 1

(* ****** ****** *)
//
(*
#define
TEMPLIB_targetloc
"$TEMPTORY/libats" // for ATSPRE
*)
//
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
//
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/gref.sats"
//
#staload
"libats/SATS/bool.sats"
#staload
"libats/SATS/char.sats"
//
#staload
"libats/SATS/gseq.sats"
//
#staload
"libats/SATS/range.sats"
//
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/optn.sats"
//
#staload
"libats/SATS/float.sats"
#staload
"libats/SATS/string.sats"
#staload
"libats/SATS/stream.sats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/glseq.sats"
//
#staload
"libats/SATS/refcnt.sats"
//
#staload
"libats/SATS/array.sats"
#staload
"libats/SATS/qlist.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/list_rc.sats"
#staload
"libats/SATS/optn_vt.sats"
#staload
"libats/SATS/stream_vt.sats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"
#staload
"libats/SATS/filebas.sats"
//
(* ****** ****** *)
//
// HX-2019-05:
// For statically loading
// code implementing templates
//
(* ****** ****** *)
//
#staload _ =
"libats/DATS/basics.dats"
//
(* ****** ****** *)
//
#staload _ =
"libats/DATS/gint.dats"
#staload _ =
"libats/DATS/gptr.dats"
#staload _ =
"libats/DATS/gref.dats"
#staload _ =
"libats/DATS/bool.dats"
#staload _ =
"libats/DATS/char.dats"
#staload _ =
"libats/DATS/gseq.dats"
//
#staload _ =
"libats/DATS/list.dats"
#staload _ =
"libats/DATS/optn.dats"
//
#staload _ =
"libats/DATS/float.dats"
#staload _ =
"libats/DATS/string.dats"
#staload _ =
"libats/DATS/stream.dats"
//
#staload _ =
"libats/DATS/gseq_gint.dats"
#staload _ =
"libats/DATS/gseq_cptr.dats"
#staload _ =
"libats/DATS/gseq_list0.dats"
#staload _ =
"libats/DATS/gseq_optn0.dats"
#staload _ =
"libats/DATS/gseq_array.dats"
#staload _ =
"libats/DATS/gseq_string.dats"
#staload _ =
"libats/DATS/gseq_stream.dats"
//
(* ****** ****** *)
//
#staload _ =
"libats/DATS/glseq.dats"
//
#staload _ =
"libats/DATS/refcnt.dats"
//
#staload _ =
"libats/DATS/array.dats"
//
#staload _ =
"libats/DATS/qlist.dats"
#staload _ =
"libats/DATS/list_vt.dats"
#staload _ =
"libats/DATS/list_rc.dats"
#staload _ =
"libats/DATS/optn_vt.dats"
#staload _ =
"libats/DATS/stream_vt.dats"
//
(* ****** ****** *)

#staload _ =
"libats/DATS/glseq_list0.dats"
#staload _ =
"libats/DATS/glseq_array.dats"
#staload _ =
"libats/DATS/glseq_string.dats"
#staload _ =
"libats/DATS/glseq_stream.dats"

(* ****** ****** *)
//
#staload _ =
"libats/DATS/print.dats"
#staload _ =
"libats/DATS/stdio.dats"
#staload
"libats/DATS/filebas.dats"
//
(* ****** ****** *)
//
#staload
UN =
"libats/SATS/unsafe.sats"
(*
#staload
UNSF =
"libats/SATS/unsafe.sats"
#staload
UNSAFE =
"libats/SATS/unsafe.sats"
*)
//
#staload
_(*UNSAFE*) =
"libats/DATS/unsafe.dats"
//
(* ****** ****** *)
//
#staload _ =
"libats/DATS/array_bsearch.dats"
#staload _ =
"libats/DATS/array_quicksort.dats"
//
#staload _ =
"libats/DATS/list_vt_mergesort.dats"
#staload _ =
"libats/DATS/list_vt_quicksort.dats"
//
(* ****** ****** *)

sexpdef list = list0
sexpdef optn = optn0

(* ****** ****** *)

#define :: list0_cons

#define nil list0_nil
#define cons list0_cons
#define none optn0_none
#define some optn0_some

#define sing(x) cons(x, nil())

(* ****** ****** *)

#define nil0 list0_nil
#define cons0 list0_cons
#define none0 optn0_none
#define some0 optn0_some

#define nil1 list1_nil
#define cons1 list1_cons
#define none1 optn1_none
#define some1 optn1_some

(* ****** ****** *)

sexpdef llist = list0_vt
sexpdef loptn = optn0_vt

sexpdef list_vt = list0_vt
sexpdef optn_vt = optn0_vt

(* ****** ****** *)

#define lnil list0_vt_nil
#define lcons list0_vt_cons
#define lnone optn0_vt_none
#define lsome optn0_vt_some
#define lsing(x) cons_vt(x, nil_vt())

#define nil_vt list0_vt_nil
#define cons_vt list0_vt_cons
#define none_vt optn0_vt_none
#define some_vt optn0_vt_some
#define sing_vt(x) cons_vt(x, nil_vt())

(* ****** ****** *)

#define lnil0 list0_vt_nil
#define lcons0 list0_vt_cons
#define lnone0 optn0_vt_none
#define lsome0 optn0_vt_some

#define nil0_vt list0_vt_nil
#define cons0_vt list0_vt_cons
#define none0_vt optn0_vt_none
#define some0_vt optn0_vt_some

(* ****** ****** *)

#define lnil1 list1_vt_nil
#define lcons1 list1_vt_cons
#define lnone1 optn1_vt_none
#define lsome1 optn1_vt_some

#define nil1_vt list1_vt_nil
#define cons1_vt list1_vt_cons
#define none1_vt optn1_vt_none
#define some1_vt optn1_vt_some

(* ****** ****** *)

sexpdef list_rc = list0_rc

(* ****** ****** *)

#define nil_rc list0_rc_nil
#define cons_rc list0_rc_cons

#define nil0_rc list0_rc_nil
#define cons0_rc list0_rc_cons

(* ****** ****** *)
//
#staload
"libats/temp/SATS/hashfun.sats"
#staload
"libats/temp/SATS/hmapref.sats"
#staload _ =
"libats/temp/DATS/hashfun.dats"
#staload _ =
"libats/temp/DATS/hmapref.dats"
#staload _ =
"libats/temp/DATS/linmap_list.dats"
#staload _ =
"libats/temp/DATS/hashmap_chain.dats"
//
(* ****** ****** *)

#staload
"libats/temp/SATS/taggedval.sats"

(* ****** ****** *)

#endif // SHARE_TEMPTORY_STALOAD_BUCS320

(* ****** ****** *)

(* end of [temptory_staload_bucs320.hats] *)
