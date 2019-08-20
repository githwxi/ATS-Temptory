(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2011-2019 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#define
ATS_PACKNAME "temptory."
#define
ATS_EXTERN_PREFIX "temptory_"

(* ****** ****** *)
//
castfn
string0_vt2t
(cs: string_vt):<> string
castfn
string1_vt2t
{n:int}
(cs: string_vt(n)):<> string(n)
//
(* ****** ****** *)
//
// HX-2019-05-12:
// For nonlin strings
//
(* ****** ****** *)
//
castfn
g0ofg1_string
{i:int}
(cs: string(i)):<> string
castfn
g1ofg0_string
(cs: string):<> [i:nat] string(i)
//
#symload g0ofg1 with g0ofg1_string
#symload g1ofg0 with g1ofg0_string
//
(* ****** ****** *)

prfun
lemma_string_param
{n:int}(string(n)): [n >= 0] void

(* ****** ****** *)
//
castfn
string0_ptrof
  (cs: string):<> ptr
castfn
string0_cptrof
  (cs: string):<> cptr(char)
//
#symload ptrof with string0_ptrof
#symload cptrof with string0_cptrof
//
(* ****** ****** *)
//
fun{}
string0_iseqz(string):<> bool
fun{}
string0_isneqz(string):<> bool
//
#symload iseqz with string0_iseqz
#symload isneqz with string0_isneqz
//
(* ****** ****** *)
//
fun{}
g0lt_str_str
(x: string, y: string):<> bool
fun{}
g0gt_str_str
(x: string, y: string):<> bool
fun{}
g0eq_str_str
(x: string, y: string):<> bool
//
fun{}
g0lte_str_str
(x: string, y: string):<> bool
fun{}
g0gte_str_str
(x: string, y: string):<> bool
fun{}
g0neq_str_str
(x: string, y: string):<> bool
//
fun{}
g0cmp_str_str
(x: string, y: string):<> sint
//
#symload < with g0lt_str_str of 10
#symload > with g0gt_str_str of 10
#symload = with g0eq_str_str of 10
#symload <= with g0lte_str_str of 10
#symload >= with g0gte_str_str of 10
#symload != with g0neq_str_str of 10
(*
#symload <=> with g0cmp_str_str of 10
*)
#symload compare with g0cmp_str_str of 10
//
fun
strcmp(string, string):<> sint = "mac#%"
//
(* ****** ****** *)
//
fun{}
string0_size(string):<> size
fun{}
string0_length(string):<> Intgte(0)
//
#symload size with string0_size
#symload length with string0_length
//
(* ****** ****** *)
//
fun{}
string0_indexof
  (cs: string, c0: char):<> (int)
//
#symload indexof with string0_indexof
//
(* ****** ****** *)
//
fun{}
string0_alloc_size
  (bsz: size): cptr0(char)
fun{}
string0_alloc_sint
  {n:nat}(int(n)): cptr0(char)
//
#symload
string0_alloc with string0_alloc_size
#symload
string0_alloc with string0_alloc_sint
//
(* ****** ****** *)
//
fun{}
string0_append
  (string, string): string
fun{}
string0_append_vt
  (string, string): string_vt
//
fun{}
string0_list0_concat(list0(string)): string
//
(* ****** ****** *)
//
fun{}
string0_map
(src: string): string
fun{}
string0_map$fopr(char): char
fun{}
string0_map_vt
(src: string): string_vt
fun{}
string0_map_vt$fopr(char): char
//
fun{}
string0_copy(string): string
fun{}
string0_copy_vt(string): string_vt
//
#symload copy with string0_copy
#symload copy_vt with string0_copy_vt
//
(* ****** ****** *)
//
fun{}
string0_tolower
(src: string): string
fun{}
string0_toupper
(src: string): string
//
#symload tolower with string0_tolower
#symload toupper with string0_toupper
//
(* ****** ****** *)
//
fun{}
string0_implode
(cs: list0(char)): string
fun{}
string0_make_list0
(cs: list0(char)): string
//
fun{}
string0_make_list0_vt
(cs: list0_vt(char)): string
fun{}
string0_make_rlist0_vt
(cs: list0_vt(char)): string
fun{}
string0_make_stream_vt
(cs: stream_vt(char)): string
//
#symload
string0_make with string0_make_list0
#symload
string0_make with string0_make_list0_vt
#symload
string0_make with string0_make_stream_vt
//
(* ****** ****** *)
//
fun{}
string0_listize
  (cs: string): list0_vt(char)
fun{}
string0_rlistize
  (cs: string): list0_vt(char)
fun{}
string0_streamize
  (cs: string): stream_vt(char)
//
(* ****** ****** *)
//
fun{}
string0_forall(cs: string): bool
fun{}
string0_forall$test(c0: char): bool
fun{}
string0_exists(cs: string): bool
fun{}
string0_exists$test(c0: char): bool
//
fun{}
string0_foreach(cs: string): void
fun{}
string0_foreach$work(c0: char): void
//
fun{}
string0_iforeach(cs: string): void
fun{}
string0_iforeach$work(i: int, c0: char): void
//
(* ****** ****** *)
//
fun{}
string0_rforall(cs: string): bool
fun{}
string0_rforall$test(c0: char): bool
//
fun{}
string0_rforeach(cs: string): void
fun{}
string0_rforeach$work(c0: char): void
//
(* ****** ****** *)
//
fun
{r0:vtflt}
string0_foldleft(cs: string, r0: r0): r0
fun
{r0:vtflt}
string0_foldleft$fopr(r0: r0, c0: char): r0
//
fun
{r0:vtflt}
string0_foldright(cs: string, r0: r0): r0
fun
{r0:vtflt}
string0_foldright$fopr(c0: char, r0: r0): r0
//
(* ****** ****** *)
//
fun
{r0:vtflt}
string0_ifoldleft(cs: string, r0: r0): r0
fun
{r0:vtflt}
string0_ifoldleft$fopr(r0: r0, i0: int, c0: char): r0
//
fun
{r0:vtflt}
string0_ifoldright(cs: string, r0: r0): r0
fun
{r0:vtflt}
string0_ifoldright$fopr(i0: int, c0: char, r0: r0): r0
//
(* ****** ****** *)
//
// HX-2019-05-12:
// For linear strings
//
(* ****** ****** *)
//
castfn
g0ofg1_string_vt
{i:int}
(cs: string_vt(i)):<> string_vt
castfn
g1ofg0_string_vt
(cs: string_vt):<> [i:int] string_vt(i)
//
#symload g0ofg1 with g0ofg1_string_vt
#symload g1ofg0 with g1ofg0_string_vt
//
(* ****** ****** *)

prfun
lemma_string_vt_param
{n:int}(!string_vt(n)): [n >= 0] void

(* ****** ****** *)
//
castfn
string0_vt_ptrof
  (cs: !string_vt):<> ptr
castfn
string0_vt_cptrof
  (cs: !string_vt):<> cptr(char)
//
#symload ptrof with string0_vt_ptrof
#symload cptrof with string0_vt_cptrof
//
(* ****** ****** *)
//
fun
string0_vt_free
(cs: string_vt): void = "mac#%"
//
#symload free with string0_vt_free
//
(* ****** ****** *)
//
fun{}
string0_vt_iseqz
(cs: !string_vt):<> bool
fun{}
string0_vt_isneqz
(cs: !string_vt):<> bool
//
#symload iseqz with string0_vt_iseqz
#symload isneqz with string0_vt_isneqz
//
(* ****** ****** *)
//
fun{}
g0lt_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0gt_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0eq_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0lte_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0gte_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0neq_lstr_lstr
(!string_vt, !string_vt):<> bool
fun{}
g0cmp_lstr_lstr
(!string_vt, !string_vt):<> sint
//
#symload = with g0eq_lstr_lstr of 10
#symload != with g0neq_lstr_lstr of 10
#symload compare with g0cmp_lstr_lstr of 10
(*
#symload <=> with g0cmp_lstr_lstr of 10
*)
fun
strcmp_vt
(!string_vt, !string_vt):<> sint = "mac#%"
//
(* ****** ****** *)
//
fun{}
string0_vt_size
(cs: !string_vt):<> size
fun{}
string0_vt_length
(cs: !string_vt):<> Intgte(0)
//
#symload size with string0_vt_size
#symload length with string0_vt_length
//
(* ****** ****** *)
//
fun{}
string0_vt_nil(): string_vt
//
fun{}
string0_vt_implode
(cs: list0(char)): string_vt
fun{}
string0_vt_make_list0
(cs: list0(char)): string_vt
//
fun{}
string0_vt_make_list0_vt
(cs: list0_vt(char)): string_vt
fun{}
string0_vt_make_rlist0_vt
(cs: list0_vt(char)): string_vt
fun{}
string0_vt_make_stream_vt
(cs: list0_vt(char)): string_vt
//
#symload
string0_vt_make with string0_vt_make_list0
#symload
string0_vt_make with string0_vt_make_list0_vt
#symload
string0_vt_make with string0_vt_make_stream_vt
//
(* ****** ****** *)
//
fun{}
string0_vt_append
( cs2: !string_vt
, cs1: !string_vt): string_vt
//
(* ****** ****** *)
//
fun{}
string0_vt_map0
(src: string_vt): string_vt
fun{}
string0_vt_map0$fopr(char): char
//
(* ****** ****** *)
//
fun{}
string0_vt_map1
(src: !string_vt): string_vt
fun{}
string0_vt_map1$fopr(char): char
//
(* ****** ****** *)
//
fun{}
string0_vt_streamize
  (cs: string_vt): stream_vt(char)
//
(* ****** ****** *)
//
fun{}
string0_vt_forall0(cs: string_vt): bool
fun{}
string0_vt_forall0$test(c0: (char)): bool
//
(* ****** ****** *)
//
fun{}
string0_vt_foreach0(cs: string_vt): void
fun{}
string0_vt_foreach0$work(c0: char): void
//
(* ****** ****** *)
//
fun{}
string0_vt_forall1(!string_vt): bool
fun{}
string0_vt_forall1$test(c0: char): bool
//
(* ****** ****** *)
//
fun{}
string0_vt_foreach1(!string_vt): void
fun{}
string0_vt_foreach1$work(c0: char): void
//
(* ****** ****** *)
//
fun
{r0:vtflt}
string0_vt_foldleft1(!string_vt, r0): r0
fun
{r0:vtflt}
string0_vt_foldleft1$fopr(r0: r0, c0: char): r0
//
(* ****** ****** *)
//
fun
{r0:vtflt}
string0_vt_foldright1(!string_vt, r0): r0
fun
{r0:vtflt}
string0_vt_foldright1$fopr(c0: char, r0: r0): r0
//
(* ****** ****** *)
//
// HX-2019-05:
// For nonlin
// strings indexed by length
//
(* ****** ****** *)
//
castfn
string1_ptrof
{n:int}
(cs: string(n)):<> ptr
castfn
string1_cptrof
{n:int}
(cs: string(n)):<> cptr(char)
//
#symload ptrof with string1_ptrof of 11
#symload cptrof with string1_cptrof of 11
//
(* ****** ****** *)
//
fun{}
string1_get_at_sint
{n:int}
{i:nat|i < n}
(cs: string(n), i0: int(i)): char
fun{}
string1_get_at_size
{n:int}
{i:nat|i < n}
(cs: string(n), i0: size(i)): char
//
#symload [] with string1_get_at_sint
#symload [] with string1_get_at_size
//
(* ****** ****** *)
//
fun{}
string1_size
{n:int}(string(n)): size(n)
fun{}
string1_length
{n:int}(string(n)): [n >= 0] sint(n)
//
#symload size with string1_size of 11
#symload length with string1_length of 11
//
(* ****** ****** *)
//
fun{}
string1_copy
{n:int}(src: string(n)): string(n)
fun{}
string1_copy_vt
{n:int}(src: string(n)): string_vt(n)
//
#symload copy with string1_copy of 11
#symload copy_vt with string1_copy_vt of 11
//
(* ****** ****** *)
//
fun{}
string1_make_substring
{n:int}
{st,ln:nat|st+ln <= n}
(src: string(n), st: int(st), ln: int(ln)): string(ln)
fun{}
string1_make_substring_vt
{n:int}
{st,ln:nat|st+ln <= n}
(src: string(n), st: int(st), ln: int(ln)): string_vt(ln)
//
(* ****** ****** *)
//
// HX-2019-05:
// For lstrings indexed by length
//
(* ****** ****** *)
//
castfn
string1_vt_ptrof
{n:int}
(cs: !string_vt(n)):<> ptr
castfn
string1_vt_cptrof
{n:int}
(cs: !string_vt(n)):<> cptr(char)
//
#symload ptrof with string1_vt_ptrof of 11
#symload cptrof with string1_vt_cptrof of 11
//
(* ****** ****** *)
//
fun
string1_vt_free
{n:int}
(string1_vt(n)): void = "mac#%"
//
#symload free with string1_vt_free
//
(* ****** ****** *)
//
fun{}
string1_vt_get_at_sint
{n:int}
{i:nat|i < n}
(cs: !string_vt(n), i0: int(i)): char
fun{}
string1_vt_get_at_size
{n:int}
{i:nat|i < n}
(cs: !string_vt(n), i0: size(i)): char
//
#symload [] with string1_vt_get_at_sint
#symload [] with string1_vt_get_at_size
//
(* ****** ****** *)
//
fun{}
string1_vt_set_at_sint
{n:int}
{i:nat|i < n}
( cs: !string_vt(n)
, i0: int(i), c0: char): void
fun{}
string1_vt_set_at_size
{n:int}
{i:nat|i < n}
( cs: !string_vt(n)
, i0: size(i), c0: char): void
//
#symload [] with string1_vt_set_at_sint
#symload [] with string1_vt_set_at_size
//
(* ****** ****** *)
//
fun{}
string1_vt_size
{n:int}(!string_vt(n)): size(n)
fun{}
string1_vt_length
{n:int}(!string_vt(n)): [n >= 0] sint(n)
//
#symload size with string1_vt_size of 11
#symload length with string1_vt_length of 11
//
(* ****** ****** *)

(* end of [string.sats] *)
