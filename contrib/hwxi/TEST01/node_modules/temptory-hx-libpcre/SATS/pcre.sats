(* ****** ****** *)
//
// API in ATS for PCRE
// And various convenience wraps
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
%{#
#include \
"temptory-hx-libpcre/CATS/pcre.cats"
%}(* %{# *)
//
(* ****** ****** *)
//
#define
ATS_PACKNAME "temptory.hx.libpcre."
#define
ATS_EXTERN_PREFIX "temptory_hx_libpcre_"
//
(* ****** ****** *)
//
(*
abstflt
pcre =
$extype"temptory_hx_pcre"
abstflt
pcre_extra =
$extype"temptory_hx_pcre_extra"
*)
//
absvtbox pcreptr0 =
  $extype"temptory_hx_pcreptr"
absvtbox pcreptr0_extra =
  $extype"temptory_hx_pcreptr_extra"
//
(* ****** ****** *)
//
castfn
pcreptr0_ptrof
  (p0: !pcreptr0): ptr0
castfn
pcreptr0_extra_ptrof
  (p0: !pcreptr0_extra): ptr0
//
#symload ptrof with pcreptr0_ptrof
#symload ptrof with pcreptr0_extra_ptrof
//
(* ****** ****** *)

typedef ieqz = sint
typedef igtez = sint

(* ****** ****** *)
//
/*
const char *
pcre_version( void ) ;
*/
fun
pcre_version((*void*)): string = "mac#%"
//
(* ****** ****** *)
//
fun{}
pcre_match_string
( code
: !pcreptr0, subj: string): ieqz
fun{}
pcre_match_substring
{n:int}
{st,ln:nat|st+ln <= n}
( code
: !pcreptr0
, subj: string(n)
, st: sint(st), ln: sint(ln)): ieqz
//
(* ****** ****** *)
//
fun{}
regexp_match_string
(rexp: string, subj: string): ieqz
fun{}
regexp_match_substring
{n:int}
{st,ln:nat|st+ln <= n}
( rexp: string
, subj: string(n), st: sint(st), ln: sint(ln)
) : ieqz // end of [regexp_match_substring]
//
(* ****** ****** *)
//
fun{}
pcre_match2_substring
  {n:int}
  {st,ln:nat|st+ln <= n}
( code
: !pcreptr0
, subj: string(n), st: sint(st), ln: sint(ln)
, mbeg: &int? >> int(n0), mend: &int? >> int(n1)
) : #[n0,n1:int | n0 <= n1; n1 <= st+ln] ieqz
//
(* ****** ****** *)
//
fun{}
regexp_match2_string
  {n:int}
( rexp: string
, subj: string(n)
, mbeg: &int? >> int(n0)
, mend: &int? >> int(n1)
) : #[n0,n1:int | n0 <= n1; n1 <= n] igtez
fun{}
regexp_match2_substring
  {n:int}
  {st,ln:nat|st+ln <= n}
( rexp: string
, subj: string(n)
, st: sint(st), ln: sint(ln)
, mbeg: &int? >> int(n0)
, mend: &int? >> int(n1)
) : #[n0,n1:int | n0 <= n1; n1 <= st+ln] igtez
//
(* ****** ****** *)
//
fun{}
pcre_match3_substring
  {n:int}
  {st,ln:nat|st+ln <= n}
( code
: !pcreptr0
, subj: string(n), st: sint(st), ln: sint(ln)
, mbeg: &int? >> int(n0), mend: &int? >> int(n1), err: &int? >> int
) : #[n0,n1:int | n0 <= n1; n1 <= st+ln] list0_vt(stropt_vt)
//
(* ****** ****** *)
//
fun{}
regexp_match3_string
  {n:int}
( rexp: string
, subj: string(n)
, mbeg: &int? >> int(n0)
, mend: &int? >> int(n1), err: &int? >> int
) : #[n0,n1:int|n0 <= n1; n1 <= n] list0_vt(stropt_vt)
//
fun{}
regexp_match3_substring
  {n:int}
  {st,ln:nat|st+ln <= n}
( rexp: string
, subj: string(n)
, st: sint(st), ln: sint(ln)
, mbeg: &int? >> int(n0)
, mend: &int? >> int(n1), err: &int? >> int
) : #[n0,n1:int|n0 <= n1; n1 <= st+ln] list0_vt(stropt_vt)
//
(* ****** ****** *)
//
fun{}
regexp_match3_string_easy
( rexp: string
, subj: string): optn0_vt(list0_vt(stropt_vt))
fun{}
regexp_match3_substring_easy
  {n:int}
  {st,ln:nat|st+ln <= n}
( rexp: string
, subj: string(n)
, st: sint(st), ln: sint(ln)): optn0_vt(list0_vt(stropt_vt))
//
(* ****** ****** *)
//
#macdef
PCRE_ERROR_NOMATCH =
$extval(int, "PCRE_ERROR_NOMATCH") // (-1)
//
(* ****** ****** *)
//
/*
void pcre_free(pcre *pcre);
*/
fun
pcre_free(code: pcreptr0): void = "mac#%"
fun
pcre_free_null(code: pcreptr0): void = "mac#%"
//
/*
void pcre_free_study(pcre_extra *extra);
*/
fun
pcre_free_study(pcreptr0_extra): void = "mac#%"
fun
pcre_free_study_null(pcreptr0_extra): void = "mac#%"
//
(* ****** ****** *)
//
/*
pcre *
pcre_compile
( const char *pattern
, int options
, const char **errptr
, int *erroffset
, const unsigned char *tablep
) ;
*/
fun
pcre_compile
( pat: string
, options: int(*bits*)
, errptr: &ptr? >> ptr
, erroffset: &int? >> int, tablep: ptr): pcreptr0 = "mac#%"
//
(* ****** ****** *)
//
/*
int pcre_exec
( const pcre *code
, const pcre_extra *extra
, const char *subject
, int length, int startoffset
, int options, int *ovector, int ovecsize
) ;
*/
fun
pcre_exec
{n1,n2:int}
{i1:nat|i1 <= n1}
( code
: !pcreptr0
, extra
: !pcreptr0_extra
, subj
: arrayref(char, n1)
, length: int(n1), offset: int(i1)
, options: sint(*nbit*)
, ovector: arrayref(int, n2), ovecsize: int(n2)): int = "mac#%"
//
(* ****** ****** *)

(* end of [pcre.sats] *)
