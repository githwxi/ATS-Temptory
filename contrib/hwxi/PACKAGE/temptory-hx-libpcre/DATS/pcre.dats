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

(* end of [pcre.dats] *)
