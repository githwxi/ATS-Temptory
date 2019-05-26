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
val length = st+ln and offset = st and options = 0
val optvec = $UN.cast{arrayref(int,0)}(0)
val ret =
  pcre_exec(code, extra, subj2, length, offset, options, optvec, 0)
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
rets where
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
val length = st+ln and offset = st and options = 0
//
(*
HX: is [16] adequate?
*)
var int3 = @[int][48]()
val optvec =
$UN.cast{arrayref(int,48)}(addr@int3)
//
val
retval =
pcre_exec
(
  code, extra
, subj2, length, offset, options, optvec, 48
) (* end of [val] *)
val ((*void*)) = pcre_free_study_null(extra)
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
rets where
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
////
(* ****** ****** *)

(*
local

#define BSZ 16
#define BSZ3 48

vtypedef
res_vt = list0_vt(stropt_vt)

extern
fun
memcpy
(
  ptr, ptr, size_t
) : ptr = "mac#temptory_hx_libpcre_memcpy"
// end of [memcpy]

fun
auxlst
(
  subject: string
, p0: ptr, ret: int
) : res_vt = let
//
fun aux
(
  b: int, e: int
) : Strptr0 = let
//
val n = $UN.cast{Size}(e-b)
val n1 = g1uint_succ_size (n)
val (pf, pfgc | p) = malloc_gc (n1)
//
val p = memcpy
  (p, ptr_add<char>(string2ptr(subject), b), n)
//
val p_n = ptr_add<char> (p, n)
val ((*void*)) = $UN.ptr0_set<char> (p_n, '\000')
//
in
  $UN.castvwtp0((pf, pfgc | p))
end // end of [aux]
//
val ret1 =
(
if ret = 0
  then BSZ-1 else ret-1
) : int // end of [ret1]
val p2 = ptr_add<int> (p0, 2)
//
fun loop
(
  p: ptr, i: int, res: &ptr? >> res_vt
) : void =
  if i < ret1 then let
    val b = $UN.ptr0_get<int> (p)
    val p = ptr_succ<int> (p)
    val e = $UN.ptr0_get<int> (p)
    val p = ptr_succ<int> (p)
    val be = (
    if b >= 0
      then aux (b, e) else strptr_null ()
    // end of [if]
    ) : Strptr0 // end of [val]
    val () = res := list_vt_cons{Strptr0}{0}(be, _)
    val+list_vt_cons (_, res1) = res
    val ((*void*)) = loop (p, i+1, res1)
  in
    fold@ (res)
  end else (
    res := list_vt_nil(*void*)
  ) (* end of [if] *)
//
var res: ptr
val () = loop (p2, 0, res)
//
in
  res
end // end of [auxlst]

in (* in of [local] *)

implement
pcre_match3_substring
  {n}{st,ln}
(
  code, subject, st, ln
, matched_beg, matched_end, err
) = let
//
prval () = lemma_g1uint_param(st)
prval () = lemma_g1uint_param(ln)
//
val
extra =
$UN.castvwtp0{pcreptr_extra(null)}(0)
val
subject2 =
$UN.cast{arrayref(char, st+ln)}(subject)
//
val length = sz2i(st+ln)
val startoffset = sz2i(st)
val options = 0u
var int3 = @[int][BSZ3]() // HX: is [16] adequate?
val ovector = $UN.cast{arrayref(int,BSZ3)}(addr@int3)
val ret = pcre_exec
(
  code, extra, subject2, length, startoffset, options, ovector, BSZ3
) (* end of [val] *)
prval ((*void*)) = pcre_free_study_null (extra)
//
val () = err := ret
//
val [n0:int] _beg =
(
  if ret >= 0 then $UN.cast{Int}(int3.[0]) else ~1
) : Int // end of [val]
val [n1:int] _end =
(
  if ret >= 0 then $UN.cast{Int}(int3.[1]) else ~1
) : Int // end of [val]
//
val () = matched_beg := _beg and () = matched_end := _end
//
prval () =
__assert() where
{
  extern praxi __assert(): [n0 <= n1; n1 <= st+ln] void
} (* end of [prval] *)
//
in
  if ret >= 0 then auxlst(subject, addr@int3, ret) else list_vt_nil(*void*)
end // end of [pcre_match3_substring]

end // end of [local]
*)

(* ****** ****** *)

(* end of [pcre.dats] *)
