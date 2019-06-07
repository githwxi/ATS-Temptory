(* ****** ****** *)
(*
HX-2019-06-05:
Originally for
MS Admissions at BUCS
*)
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/array.sats"
#staload
"libats/SATS/string.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/stream_vt.sats"
//
#staload
"libats/temp/SATS/hmapref.sats"
#staload
"libats/temp/SATS/taggedval.sats"
//
(* ****** ****** *)
//
#staload
UN =
"libats/SATS/unsafe.sats"
//
(* ****** ****** *)

#define lnone optn0_vt_none
#define lsome optn0_vt_some

(* ****** ****** *)
//
#include
"$PATSHOMELOCS\
/temptory-hx-libpcre/mylibies.hats"
#include
"$PATSHOMELOCS\
/temptory-hx-csv-parse/mylibies.hats"
//
(* ****** ****** *)

#staload CP = $CSV_PARSE
#staload CPL = $CSV_PARSE_LINE

(* ****** ****** *)

#staload "./../SATS/csv_process.sats"

(* ****** ****** *)
//
(*
HX-2019-06-05:
This is a generic one
*)
impltmp
{}(*tmp*)
csv_line2tarr
  ( xs ) =
(
arrszref_make_list0_vt(xs)
) where
{
val xs =
(
list0_vt_map0_list<x0><y0>
  (xs)
) where
{
sexpdef x0 = string_vt
sexpdef y0 = taggedval
impltmp
list0_vt_map0$fopr<x0><y0>
  (x0) =
(
  TVstr( string0_vt2t(x0) )
)
}
} (* end of [csv_line2tarr] *)
//
(* ****** ****** *)
//
(*
HX-2019-06-05:
This is a generic one
*)
impltmp
{}(*tmp*)
csv_line2tobj
(ks, xs) =
(
let
val () =
auxmain(ks, xs)
in
  tobject_encode(href)
end
) where
{
val
href =
hmapref_make_hint(max(1, length(ks)))
//
fun
auxmain
( ks
: list0(string)
, xs
: list0_vt(string_vt)): void =
(
case+ ks of
|
list0_nil() =>
list0_vt_free(xs)
|
list0_cons(k0, ks) =>
(
case+ xs of
|
~list0_vt_nil() => ()
|
~list0_vt_cons(x0, xs) =>
 (
   auxmain(ks, xs)
 ) where
 {
   val x0 =
   TVstr(string0_vt2t(x0))
   val-~lnone() =
   hmapref_insert_opt(href, k0, x0)
 }
) (* end of [list0_cons] *)
)
//
} (* end of [csv_line2tobj] *)
//
(* ****** ****** *)

impltmp
{}//tmp
FILEref_streamize_tarr
  (inp) =
(
let
//
val
rows =
$CP.csv_parse_fileref_vt<>
  (inp)
val-
~stream_vt_cons
 (row0, rows) = !rows
val ks =
$UN.castvwtp0
 {list0(string)}(row0)
//
in
( ks
, stream_vt_map<xs><y0>(rows)
) where
{
//
sexpdef xs =
list0_vt(string_vt)
sexpdef y0 = tarray0
//
impltmp
stream_vt_map$fopr<xs><y0>(xs) = csv_line2tarr<>(xs)
//
} (* end of [where] *)
end
) (* FILEref_streamize_tarr *)

impltmp
{}//tmp
FILEptr0_streamize_tarr
  (inp) =
(
let
val rows =
$CP.csv_parse_fileptr_vt<>
  (inp)
val-
~stream_vt_cons
 (row0, rows) = !rows
val ks =
$UN.castvwtp0{list0(string)}(row0)
in
( ks
, stream_vt_map<xs><y0>(rows)
) where
{
//
sexpdef xs =
list0_vt(string_vt)
sexpdef y0 = tarray0
//
impltmp
stream_vt_map$fopr<xs><y0>(xs) = csv_line2tarr<>(xs)
//
} (* end of [where] *)
end
) (* FILEptr0_streamize_tarr *)

(* ****** ****** *)

impltmp
{}//tmp
FILEref_streamize_tobj
  (inp) =
(
let
val rows =
$CP.csv_parse_fileref_vt(inp)
val-
~stream_vt_cons
 (row0, rows) = !rows
val ks =
$UN.castvwtp0{list0(string)}(row0)
in
( ks
, stream_vt_map<xs><y0>(rows)
) where
{
//
sexpdef xs =
list0_vt(string_vt)
sexpdef y0 = tobject
//
impltmp
stream_vt_map$fopr<xs><y0>(xs) = csv_line2tobj<>(ks, xs)
//
} (* end of [where] *)
end
) (* FILEref_streamize_tobj *)
impltmp
{}//tmp
FILEptr0_streamize_tobj
  (inp) =
(
let
val rows =
$CP.csv_parse_fileptr_vt(inp)
val-
~stream_vt_cons
 (row0, rows) = !rows
val ks =
$UN.castvwtp0{list0(string)}(row0)
in
( ks,
  stream_vt_map<xs><y0>(rows)
) where
{
//
sexpdef xs =
list0_vt(string_vt)
sexpdef y0 = tobject
//
impltmp
stream_vt_map$fopr<xs><y0>(xs) = csv_line2tobj<>(ks, xs)
//
} (* end of [where] *)
end
) (* FILEptr0_streamize_tobj *)

(* ****** ****** *)
//
impltmp
gcompare$val<tobject>
  (t1, t2) =
(
$effmask_all
(tobject_compare<>(t1, t2))
)
//
impltmp
{}(*tmp*)
tobject_compare
(t1, t2) =
let
val fnm =
tobject_compare$fnm<>((*void*))
#macdef un = TVstr_un
in
compare(un(t1[fnm]), un(t2[fnm]))
end (* end of [tobject_compare] *)
//
(* ****** ****** *)
//
impltmp
{}//tmp
tvalue_rematch
  (tv0, re1) =
(
case+ tv0 of
| TVstr(txt) =>
  rematch(re1, txt) >= 0 | _ => false
) where
{
  #macdef
  rematch = $PCRE.regexp_match_string
}
//
(* ****** ****** *)
//
impltmp
{}//tmp
tobject_rematch_all
  (obj, rex) =
(
  tobject_exists(obj)
) where
{
impltmp
tobject_exists$test<>(k0, x0) = tvalue_rematch(x0, rex)
}
//
(* ****** ****** *)

(* end of [csv_process.dats] *)
