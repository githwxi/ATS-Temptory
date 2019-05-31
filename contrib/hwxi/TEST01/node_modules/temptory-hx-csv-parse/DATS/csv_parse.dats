(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the 17th of July, 2016
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
#staload
"libats/SATS/string.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/stream_vt.sats"
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
LINE = "./csv_parse_line.dats"
//
(* ****** ****** *)
//
extern
fun{}
csv_parse_fileref
  (inp: FILEref)
: stream_vt(list0(string))
extern
fun{}
csv_parse_fileref_vt
  (inp: FILEref)
: stream_vt(list0_vt(string_vt))
//
(* ****** ****** *)

impltmp
{}(*tmp*)
csv_parse_fileref(inp) =
(
  $UN.castvwtp0
  (csv_parse_fileref_vt<>(inp))
)

(* ****** ****** *)

impltmp
{}(*tmp*)
csv_parse_fileref_vt(inp) =
(
//
let
val lines =
FILEref_streamize_line_vt<>(inp)
val lines =
$LINE.stream_vt_csv_line_repair<>(lines)
in
//
(
stream_vt_map<x0><y0>(lines)
) where
{
//
vtypedef x0 = string_vt
vtypedef y0 = list0_vt(string_vt)
//
impltmp
stream_vt_map$fopr<x0><y0>
  (line) =
( fields ) where
{
  var nerr = (0:int)
  val fields =
  $LINE.csv_parse_line_nerr<>($UN.string0_vt2t(line), nerr)
  val ((*free*)) =
  string0_vt_free(line)
} (* end of [stream_vt_map$fopr] *)
//
}
end // end of [let]
//
) (* end of [csv_parse_fileref_vt] *)

(* ****** ****** *)

(* end of [csv_parse.dats] *)
