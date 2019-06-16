(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the 17th of July, 2016
//
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/char.sats"
//
#staload
"libats/SATS/print.sats"
#staload
"libats/SATS/stdio.sats"
#staload
"libats/SATS/filebas.sats"
//
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/string.sats"
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
csv_unparse_field
(ent: string): void
extern
fun{}
csv_unparse_fields
(ent: list0(string)): void
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
extern
fun{}
csv_parse_fileptr_vt
  (inp: FILEptr0)
: stream_vt(list0_vt(string_vt))
//
(* ****** ****** *)
//
extern
fun{}
csv_parse_stream_lines
( lines
: stream_vt(string_vt))
: stream_vt(list0_vt(string_vt))
//
(* ****** ****** *)

impltmp
{}(*tmp*)
csv_unparse_field
  (fld) =
let
//
val eol = '\n'
val cmm =
char0_chr
($LINE.csv_parse_line$comma())
val dqt =
char0_chr
($LINE.csv_parse_line$dquote())
//
val isexi =
(
string0_exists(fld)
) where
{
impltmp
string0_exists$test<>(c0) =
(c0 = dqt || c0 = cmm || c0 = eol)
}
in

if
isexi
then
(
print(dqt);
string0_foreach(fld);
print(dqt);
) where
{
impltmp
string0_foreach$work<>(c0) =
(
if
(c0 != dqt)
then print(c0) else print!(c0, c0)
)
} (* end of [then] *)
else
(
string0_foreach(fld)
) where
{
impltmp
string0_foreach$work<>(c0) = print(c0)
} (* end of [else] *)

end (* csv_unparse_field *)

(* ****** ****** *)

impltmp
{}(*tmp*)
csv_unparse_fields(xs) =
(
println!() where
{
val () =
list0_iforeach<string>(xs)
}
) where
{
val cmm =
char0_chr
($LINE.csv_parse_line$comma())
//
impltmp
list0_iforeach$work<string>
  (i0, x0) =
  (csv_unparse_field<>(x0)) where
{
  val () = if i0 > 0 then print(cmm)
}
} (* end of [csv_unparse_fields] *)

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
in
  csv_parse_stream_lines(lines)
end // end of [let]
//
) (* end of [csv_parse_fileref_vt] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
csv_parse_fileptr_vt(inp) =
(
//
let
val lines =
FILEptr0_streamize_line_vt<>(inp)
in
  csv_parse_stream_lines(lines)
end // end of [let]
//
) (* end of [csv_parse_fileptr_vt] *)

(* ****** ****** *)

impltmp
{}(*tmp*)
csv_parse_stream_lines
  (lines) =
(
//
let
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
) (* end of [csv_parse_stream_lines] *)

(* ****** ****** *)

(* end of [csv_parse.dats] *)
