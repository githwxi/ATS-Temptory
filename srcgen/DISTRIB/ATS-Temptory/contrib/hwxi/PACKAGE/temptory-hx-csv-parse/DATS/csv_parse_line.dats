(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: the 17th of July, 2016
//
(* ****** ****** *)
(*
HX:
Please find a detailed specification of CSV:
super-csv.github.io/super-csv/csv_specification.html
*)
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/char.sats"
#staload
"libats/SATS/string.sats"
#staload
"libats/SATS/list_vt.sats"
#staload
"libats/SATS/stream_vt.sats"
//
#staload
"libats/SATS/print.sats"
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)
//
extern
fun{}
csv_parse_line_nerr
( line: string
, nerr: &int >> _): list0_vt(string_vt)
//
(* ****** ****** *)
//
extern
fun{}
csv_parse_line$comma(): Intgte(1)
extern
fun{}
csv_parse_line$dquote(): Intgte(1)
//
(* ****** ****** *)
//
// HX:
// For handling line-breaks
//
extern
fun{}
stream_vt_csv_line_repair
( lines
: stream_vt(string_vt)): stream_vt(string_vt)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
csv_parse_line$comma() =
$UN.cast{Intgte(1)}(char0_ord(','))
(*
//
// HX: for TSV-parsing
//
implement
{}(*tmp*)
csv_parse_line$comma() =
$UN.cast{Intgte(1)}(char0_ord('\t'))
*)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
csv_parse_line$dquote() =
$UN.cast{Intgte(1)}(char0_ord('"'))
//
(* ****** ****** *)

local
//
extern
fun{}
getpos(): int
//
extern
fun{}
is_end(): bool
//
extern
fun{}
char_get0(): int
extern
fun{}
char_get1(): int
extern
fun{}
char_incby1(): void
extern
fun{}
char_getinc(): int
//
extern
fun{}
Intgte_check
{n:int}
(int, n:int(n)): Intgte(n)
//
in (* in-of-local *)
//
implement
{}(*tmp*)
csv_parse_line_nerr
  (line, nerr) = let
//
var _i_: int = 0
//
val p_i =
ptr2cptr{int}(addr@_i_)
//
#macdef
get_i() =
$UN.cptr0_get(p_i)
#macdef
inc_i() = let
val i0 =
  $UN.cptr0_get(p_i)
in
  $UN.cptr0_set(p_i, i0+1)
end
#macdef
set_i(i0) =
$UN.cptr0_set(p_i, ,(i0))
//
(* ****** ****** *)
//
val line = g1ofg0(line)
val len0 = length(line)
//
(* ****** ****** *)

implement
getpos<>() = get_i()
//
implement
is_end<>() = get_i() >= len0
//
implement
char_get0<>() = let
  val i0 = get_i()
  val i0 = Intgte_check(i0, 0)
//
in
  if i0 < len0 then char0_ord(line[i0]) else (~1)
end // end of [char_get]
implement
char_get1<>() = let
  val i0 = get_i()
  val i1 = Intgte_check(i0+1, 0)
//
in
  if i1 < len0 then char0_ord(line[i1]) else (~1)
end // end of [char_get]
implement
char_getinc<>() = let
  val i0 = get_i()
  val i0 = Intgte_check(i0, 0)
//
in
  if i0 < len0 then (inc_i(); char0_ord(line[i0])) else (~1)
end // end of [char_getinc]

(* ****** ****** *)

implement
{}(*tmp*)
Intgte_check(x, n) =
let
val x = g1ofg0(x)
val _ = assertloc(x >= n) in x
end

(* ****** ****** *)
//
#macdef
COMMA = csv_parse_line$comma<>()
#macdef
DQUOTE = csv_parse_line$dquote<>()
//
(* ****** ****** *)

fun
parse_char
(
c0: int
,
nerr: &int >> int
) : bool = let
//
val c1 = char_getinc()
//
in
//
if
(c1 >= 0)
then
(
if
(c0 = c1)
then true
else
( nerr := nerr + 1
; parse_char(c0, nerr))
) (* end of [else] *)
else (false)
//
end // end of [parse_char]

(* ****** ****** *)

vtypedef
chars_vt = list0_vt(char)

#macdef
string_vt_sbfmk(cs) =
string0_vt_make_rlist0_vt(,(cs))

(* ****** ****** *)

fun
parse_item
( nerr
: &int >> int
) : string_vt = let
//
val c0 = char_get0()
val sbf = list0_vt_nil()
//
in
//
if
(c0 != DQUOTE)
then
(
  parse_item_loop1(sbf, nerr)
)
else
let
  val () = inc_i()
in
  parse_item_loop2(sbf, nerr)
end // end of [else]
//
end // end of [parse_item]

(* ****** ****** *)

and
parse_item_loop1
( sbf0: chars_vt 
, nerr: &int >> int
) : string_vt = let
//
val c1 =
  g1ofg0(char_get0())
//
in
//
if
(c1 >= 0)
then
(
//
if
(c1 != COMMA)
then
( inc_i();
  if
  (c1 > 0)
  then
  let
//
  val () =
  if (c1 = DQUOTE)
  then nerr := nerr + 1;
//
  val c1 = char0_chr(c1)
  val sbf1 =
  list0_vt_cons(c1, sbf0)
  in
    parse_item_loop1(sbf1, nerr)
  end
  else
  (
    parse_item_loop1(sbf0, nerr)
  )
) (* end of [then] *)
else string_vt_sbfmk(sbf0)
) (* end of [then] *)
else string_vt_sbfmk(sbf0)
//
end // end of [parse_item_loop1]

(* ****** ****** *)

and
parse_item_loop2
( sbf0
: chars_vt
, nerr: &int >> int
) : string_vt = let
//
val c1 = char_get0()
//
in
//
if
(c1 >= 0)
then
(
//
if
(c1 != DQUOTE)
then
( inc_i();
  if
  (c1 > 0)
  then
  let
//
    val c1 =
    char0_chr(c1)
//
    val sbf1 =
    list0_vt_cons(c1, sbf0)
//
  in
    parse_item_loop2(sbf1, nerr)
  end
  else
  (
    parse_item_loop2(sbf0, nerr)
  )
) (* end of [then] *)
else
let
//
// c1 = DQUOTE
//
  val c2 = char_get1()
in
  if
  (c2 != DQUOTE)
  then let
    val () = inc_i()
  in
     string_vt_sbfmk(sbf0)
  end // end-of-then
  else
  (
    parse_item_loop2(sbf1, nerr)
  ) where
  {
//
// c2 = DQUOTE  
//
    val () = inc_i()
    val () = inc_i()
    val c2 = char0_chr(c2)
    val sbf1 = list0_vt_cons(c2, sbf0)
  } // end of [else]
end // end of [else]
) (* end of [then] *)
else
let
val () = (nerr := nerr+1) in string_vt_sbfmk(sbf0)
end // end of [else]
//
end // end of [parse_item_loop2]

(* ****** ****** *)

vtypedef
res_vt = list0_vt(string_vt)

(* ****** ****** *)

fun
parse_itemlst
( nerr
: &int >> int): res_vt = let
//
fun
auxlst
( nerr: &int >> int
, res0: res_vt): res_vt = let
//
val c0 = char_get0()
//
in
//
if
(c0 >= 0)
then let
//
val itm =
  parse_item(nerr)
val res0 =
  list0_vt_cons(itm, res0)
//
val more = parse_char(COMMA, nerr)
//
in
if more then auxlst(nerr, res0) else res0
end // end of [then]
else
(
let
val
itm =
string0_vt_nil() in list0_vt_cons(itm, res0)
end
) (* end of [else] *)
//
end // end of [auxlst]
//
in
//
if
(
char_get0() < 0
) then list0_vt_nil((*void*))
  else auxlst(nerr, list0_vt_nil((* res0 *)))
//
end // end of [parse_itemlst]

(* ****** ****** *)
//
in
let
val
res0 =
parse_itemlst(nerr) in list0_vt_reverse<string_vt>(res0)
end
end // end of [csv_parse_line_nerr]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(*
extern
fun{}
stream_vt_csv_line_repair
( lines
: stream_vt(string_vt)): stream_vt(string_vt)
*)
implement
{}(*tmp*)
stream_vt_csv_line_repair
  (xs) =
( aux0(xs) ) where
{
//
#macdef
DQUOTE =
csv_parse_line$dquote<>()
//
fun
string_ncs
(cs: !string_vt): int =
(
string0_vt_foldleft1<r0>(cs, 0)
) where
{
  typedef x0 = char
  typedef r0 = sint
  implement
  string0_vt_foldleft1$fopr<r0>
  (r, c) =
  if char0_ord(c) != DQUOTE then r else r+1
}
//
fun
isevn
(cs: !string_vt): bool = (string_ncs(cs) % 2 = 0)
fun
isodd
(cs: !string_vt): bool = (string_ncs(cs) % 2 != 0)
//
fun
aux0
( xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
$ldelay
(
case+ !xs of
| ~stream_vt_nil
   () => stream_vt_nil()
| ~stream_vt_cons
   (x0, xs) => !(aux1(x0, xs))
, lazy_vt_free(xs) // when the stream is freed
)
and
aux1
( x0: string_vt
, xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
$ldelay
(
(
if
isodd(x0)
then !(aux2(x0, xs))
else stream_vt_cons(x0, aux0(xs))
)
, (free(x0); lazy_vt_free(xs)) // for freeing
)
//
and
aux2
( x0: string_vt
, xs
: stream_vt(string_vt)
) : stream_vt(string_vt) =
let
fun
stradd
( x0: string_vt
, x1: string_vt): string_vt =
let
val
res =
string0_vt_append(x0, x1)
in
  free(x0); free(x1); res
end
in
$ldelay
(
case+ !xs of
| ~stream_vt_nil() =>
   stream_vt_sing(x0) // missing DQUOTE
| ~stream_vt_cons(x1, xs) =>
  (
    if isevn(x1)
      then
      (
        !(aux2(stradd(x0,x1), xs))
      )
      else
      let
        val x2 = stradd(x0,x1)
      in
        stream_vt_cons(x2, aux0(xs))
      end
  )
, (free(x0); lazy_vt_free(xs)) // for freeing
)
end
//
} (* end of [stream_vt_csv_line_repair] *)

(* ****** ****** *)

(* end of [csv_parse_line.dats] *)
