(* ****** ****** *)
//
// API in ATS for PCRE
//
(* ****** ****** *)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/gptr.sats"
#staload
"libats/SATS/string.sats"
#staload
"libats/SATS/stropt.sats"
//
#staload
UN = "libats/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/pcre.sats"

(* ****** ****** *)

implement
{}(*tmp*)
pcre_match_string
  (code, subj) = let
//
val subj = g1ofg0(subj)
//
in
//
pcre_match_substring
(code, subj, 0(*st*), length(subj))
//
end // end of [pcre_match_string]

(* ****** ****** *)

implement
{}(*tmp*)
pcre_match_substring
  {n}{st,ln}
(
  code, subj, st, ln
) = ret where
{
//
val extra =
$UN.castvwtp0{pcreptr0_extra}(0)
//
val subj2 =
$UN.cast{arrayref(char,st+ln)}(subj)
//
val length = st+ln
val offset = st and options = 0
val offvec = $UN.cast{arrayref(int,0)}(0)
//
val ret =
pcre_exec(code, extra, subj2, length, offset, options, offvec, 0)
//
prval ((*void*)) = $UN.cast2void(extra)
//
} (* end of [pcre_match_substring] *)

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match_string
  (rex, src) = let
//
val src = g1ofg0(src)
//
in
//
regexp_match_substring
(rex, src, 0(*st*), length(src))
//
end // end of [regexp_match_string]

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match_substring
  (rex0, subj, st, ln) = let
//
var errptr: ptr
var erroffset: int
//
val tableptr = the_null_ptr
//
val code =
pcre_compile
(rex0, 0(*opts*), errptr, erroffset, tableptr)
//
val codep = ptrof(code)
//
in
//
if
isneqz(codep)
then
(
  rets
) where
{
  val
  rets =
  pcre_match_substring(code, subj, st, ln)
  val ((*freed*)) = pcre_free(code)
} else let
  val ((*freed*)) = pcre_free_null(code)
in
  ~1(*PCRE_ERROR_NOMATCH*)
end // end of [if]
//
end // end of [regexp_match_substring]

(* ****** ****** *)

local

#define BSZ1 16
#define BSZ3 48

in(*in-of-local*)

implement
{}(*tmp*)
pcre_match2_substring
  {n}{st,ln}
(
  code
, subj
, st, ln
, mbeg, mend
) = retval where
{
//
val
extra =
$UN.castvwtp0{pcreptr0_extra}(0)
//
val subj2 =
$UN.cast{arrayref(char,st+ln)}(subj)
//
val length = st+ln
val offset = st and options = (0)
//
(*
HX: is [16] adequate?
HX: the last 1/3 cannot be used!!!
*)
var int3 = @[int][BSZ3]()
val offvec =
$UN.cast{arrayref(int,BSZ3)}(addr@int3)
//
val
retval =
pcre_exec
(
  code
, extra
, subj2, length
, offset, options, offvec, BSZ3(* =48 *)
) (* end of [val] *)
val ((*freed*)) = pcre_free_study_null(extra)
//
val
[n0:int] mbeg_ =
(
  if retval >= 0 then $UN.cast{Int}(int3.[0]) else ~1
) : Int // end of [val]
val
[n1:int] mend_ =
(
  if retval >= 0 then $UN.cast{Int}(int3.[1]) else ~1
) : Int // end of [val]
//
val () = mbeg := mbeg_ and () = mend := mend_
//
prval () = $UN.prop_assert{n0 <= n1&&n1 <= st+ln}((*void*))
//
} (* end of [pcre_match2_substring] *)

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match2_string
(
  rex0, subj, mbeg, mend
) = let
in
//
regexp_match2_substring
(
  rex0, subj
, 0(*start*), length(subj), mbeg, mend
) (* regexp_match2_substring *)
//
end // end of [regexp_match2_string]

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match2_substring
( rex0
, subj, st, ln, mbeg, mend
) = let
//
var errptr: ptr
var erroff: int
val tablep = ptr0_null()
//
val code =
pcre_compile
(rex0, 0(*opts*), errptr, erroff, tablep)
//
val codep = ptrof(code)
//
in
//
if
isneqz(codep)
then
(
  rets
) where
{
  val
  rets =
  pcre_match2_substring
    (code, subj, st, ln, mbeg, mend)
  // end of [val]
  val ((*freed*)) = pcre_free(code)
} (* end of [then] *)
else let
  val () = mbeg := ~1
  and () = mend := ~1
  val ((*freed*)) = pcre_free_null(code)
in
  ~1(*PCRE_ERROR_NOMATCH*)
end // end of [else] // end of [if]
//
end // end of [regexp_match2_substring]

end // end of [local]

(* ****** ****** *)

local

#define BSZ1 16
#define BSZ3 48

vtypedef
res_vt = list0_vt(stropt_vt)

extern
fun
memcpy
( dst: cptr(char)
, src: cptr(char), length: size
) : void = "mac#temptory_hx_libpcre_memcpy"
// end of [memcpy]

in (* in of [local] *)

implement
{}(*tmp*)
pcre_match3_substring
  {n}{st,ln}
( code
, subj, st, ln
, mbeg, mend, err) = let
//
fun
auxlst
( subj
: string
, cp
: cptr(int)
, ret: int): res_vt = let
//
fun
auxone
(
b0: int, e0: int
) : string_vt = let
//
val n0 =
$UN.cast{size}(e0-b0)
val p1 = string0_alloc(n0)
//
val p0 = cptrof(subj)
val b0 = $UN.cast{uint}(b0)
//
in
//
let
val () =
  memcpy(p1, p0+b0, n0)
in
  $UN.castvwtp0{string_vt}(p1)
end
//
end // end of [aux]
//
val
ret =
(
if ret = 0
  then BSZ1-1 else ret-1
) : int // end of [ret1]
//
fun
loop
( cp: cptr(int)
, i0: int, res: &ptr? >> res_vt
) : void =
  if
  (i0 < ret)
  then let
    val b0 =
    $UN.cptr0_get<int>(cp)
    val e0 =
    $UN.cptr0_get<int>(cp+1)
    val be =
    (
    if
    (b0 < 0)
    then
    stropt0_vt_none()
    else
    stropt0_vt_some(auxone(b0, e0))
    // end of [if]
    ) : stropt_vt // end of [val]
    val () =
    (
    res :=
    list0_vt_cons{stropt_vt}(be, _)
    )
    val+list0_vt_cons(_, res1) = res
  in
    loop(cp+2, i0+1, res1); fold@(res)
  end
  else (res := list0_vt_nil((*void*)))
//
in
  let var res: ptr? in loop(cp + 2, 0, res); res end
end // end of [auxlst]
//
val
extra =
$UN.castvwtp0
{pcreptr0_extra}(0)
val
subj2 =
$UN.cast
{arrayref(char, st+ln)}(subj)
//
val length = st+ln
val offset = st and options = (0)
//
// HX: is [16] adequate?
//
var int3 = @[int][BSZ3]()
val offvec =
$UN.cast{arrayref(int,BSZ3)}(addr@int3)
//
val ret =
pcre_exec
(
  code
, extra
, subj2, length
, offset, options, offvec, BSZ3 (* =48 *)
) (* end of [val] *)
val ((*void*)) = pcre_free_study_null(extra)
//
val () =
(err := ret)
//
val
[n0:int] mbeg_ =
(
if ret >= 0
  then $UN.cast{Int}(int3.[0]) else (~1)
) : Int // end of [val]
val
[n1:int] mend_ =
(
if ret >= 0
  then $UN.cast{Int}(int3.[1]) else (~1)
) : Int // end of [val]
//
val () = mbeg := mbeg_ and () = mend := mend_
//
prval () =
$UN.prop_assert{n0 <= n1&&n1 <= st+ln}((*void*))
//
in
let
val cp0 = ptr2cptr{int}(addr@int3)
in
  if ret >= 0 then auxlst(subj, cp0, ret) else list0_vt_nil(*void*)
end
end // end of [pcre_match3_substring]

end // end of [local]

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match3_string
( rexp
, subj
, mbeg, mend, err
) = let
//
val st = (0)
and ln = length(subj)
//
in
//
regexp_match3_substring
(
  rexp, subj, st, ln, mbeg, mend, err
) (* regexp_match3_substring *)
//
end // end of [regexp_match3_string]

implement
{}(*tmp*)
regexp_match3_substring
( rexp
, subj, st, ln
, mbeg, mend, err ) = let
//
var errptr: ptr
var erroff: int
val tablep = ptr0_null()
//
val code =
pcre_compile
(rexp, 0(*opts*), errptr, erroff, tablep)
//
val codep = ptrof(code)
//
in
//
if
isneqz(codep)
then
let
val () = pcre_free(code) in rets
end where
{
  val
  rets =
  pcre_match3_substring
  (code, subj, st, ln, mbeg, mend, err)
} (* end of [then] *)
else let
  val () = err := ~1
  val () = mbeg := ~1
  and () = mend := ~1
  val ((*freed*)) = pcre_free_null(code)
in
  list0_vt_nil((*void*))
end // end of [else] // end of [if]
//
end // end of [regexp_match3_substring]

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match3_string_easy
(rexp, subj) = let
//
val subj = g1ofg0(subj)
//
in
regexp_match3_substring_easy(rexp, subj, 0, length(subj))
end // end of [regexp_match3_string_easy]

(* ****** ****** *)

implement
{}(*tmp*)
regexp_match3_substring_easy
(rexp, subj, st, ln) = let
//
var mbeg: int?
and mend: int?
var err0: int?
//
val rets =
regexp_match3_substring
(rexp, subj, st, ln, mbeg, mend, err0)
//
in
//
if
(err0 >= 0)
then
optn0_vt_some(rets)
else
(
optn0_vt_none(*void*)
) where
{
val () = loop(rets) where
{
fun
loop(xs: list0_vt(stropt_vt)): void =
(
  case+ xs of
  | ~list0_vt_nil() => ()
  | ~list0_vt_cons(x, xs) => (stropt0_vt_free(x); loop(xs))
)
} (* end of [val] *)
} (* end of [else] *)
//
end // end of [regexp_match3_string_easy]

(* ****** ****** *)

(* end of [pcre.dats] *)
