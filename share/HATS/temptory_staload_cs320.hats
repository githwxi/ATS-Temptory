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
SHARE_TEMPTORY_STALOAD_CS320
#define
SHARE_TEMPTORY_STALOAD_CS320 1

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
(* ****** ****** *)
//
#staload
"libats/SATS/gptr.sats"
#staload _ =
"libats/DATS/gptr.dats"
//
(* ****** ****** *)

#staload
"libats/SATS/bool.sats"
#staload _ =
"libats/DATS/bool.dats"

(* ****** ****** *)

#staload
"libats/SATS/char.sats"
#staload _ =
"libats/DATS/char.dats"

(* ****** ****** *)
//
#staload
"libats/SATS/gseq.sats"
#staload _ =
"libats/DATS/gseq.dats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/list.sats"
#staload _ =
"libats/DATS/list.dats"
//
#staload _ =
"libats/DATS/gseq_list0.dats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/list_vt.sats"
#staload _ =
"libats/DATS/list_vt.dats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/optn.sats"
#staload _ =
"libats/DATS/optn.dats"
//
#staload _ =
"libats/DATS/gseq_optn0.dats"
//
(* ****** ****** *)

#staload
"libats/SATS/float.sats"
#staload _ =
"libats/DATS/float.dats"

(* ****** ****** *)
//
#staload
"libats/SATS/string.sats"
#staload _ =
"libats/DATS/string.dats"
//
#staload _ =
"libats/DATS/gseq_string.dats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/print.sats"
#staload _ =
"libats/DATS/print.dats"
(* ****** ****** *)
//
#staload
"libats/SATS/stdio.sats"
#staload _ =
"libats/DATS/stdio.dats"
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

sexpdef list = list0
sexpdef optn = optn0

#define :: list0_cons

#define nil list0_nil
#define cons list0_cons
#define none optn0_none
#define some optn0_some

#define sing(x) cons(x, nil)

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

#endif // SHARE_TEMPTORY_STALOAD_CS320

(* ****** ****** *)

(* end of [temptory_staload_cs320.hats] *)
