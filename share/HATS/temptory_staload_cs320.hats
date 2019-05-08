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
#define
TEMPLIB_targetloc
"$TEMPTORY/libats" // for ATSPRE
//
(* ****** ****** *)

#define nil list0_nil
#define cons list0_cons
#define none optn0_none
#define some optn0_some

#define nil0 list0_nil
#define cons0 list0_cons
#define none0 optn0_none
#define some0 optn0_some

#define nil1 list1_nil
#define cons1 list1_cons
#define none1 optn1_none
#define some1 optn1_some

(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
//
(* ****** ****** *)
//
#staload
"libats/SATS/print.sats"
#staload _ =
"libats/DATS/print.dats"
#staload _ =
"libats/DATS/stdio.dats"
//
(* ****** ****** *)
//
#staload
UN = "libats/SATS/unsafe.sats"
(*
#staload
UNSF = "libats/SATS/unsafe.sats"
#staload
UNSAFE = "libats/SATS/unsafe.sats"
*)
//
(* ****** ****** *)

#endif // SHARE_TEMPTORY_STALOAD_CS320

(* ****** ****** *)

(* end of [temptory_staload_cs320.hats] *)
