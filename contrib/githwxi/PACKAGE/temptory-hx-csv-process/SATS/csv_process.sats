(* ****** ****** *)
(*
HX-2019-06-05:
Originally for
MS Admissions at BUCS
*)
(* ****** ****** *)

#staload
"libats/SATS/stdio.sats"
#staload
"libats\
/temp/SATS/taggedval.sats"

(* ****** ****** *)
//
fun{}
csv_line2tarr
( xs
: list0_vt(string_vt)): tarray0
fun{}
csv_line2tobj
( ks
: list0(string)
, xs
: list0_vt(string_vt)): tobject
//
(* ****** ****** *)
//
fun{}
FILEref_streamize_tarr
(inp: FILEref):
(list0(string), stream_vt(tarray0))
fun{}
FILEptr0_streamize_tarr
(inp: FILEptr0):
(list0(string), stream_vt(tarray0))
//
(* ****** ****** *)
//
fun{}
FILEref_streamize_tobj
(inp: FILEref):
(list0(string), stream_vt(tobject))
fun{}
FILEptr0_streamize_tobj
(inp: FILEptr0):
(list0(string), stream_vt(tobject))
//
(* ****** ****** *)
//
fun{}
stream_vt_line2tarr
( lines
: stream_vt(string_vt))
: (list0(string), stream_vt(tarray0))
fun{}
stream_vt_line2tobj
( lines
: stream_vt(string_vt))
: (list0(string), stream_vt(tobject))
//
(* ****** ****** *)
//
fun{}
tobject_compare
(tobject, tobject): int
fun{}
tobject_compare$fnm(): string
//
(* ****** ****** *)
//
fun{}
tvalue_rematch
(tvalue, string(*RE*)): bool
//
fun{}
tobject_rematch_all
(tobject, string(*RE*)): bool
//
(* ****** ****** *)

(* end of [csv_process.sats] *)
