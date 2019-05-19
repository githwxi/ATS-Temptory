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
//
(* ****** ****** *)
//
// HX-2019-05-12:
// For nonlin strings
//
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
#symload iseqz with string0_isneqz
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
//
(* ****** ****** *)
//
fun
strcmp
(string, string):<> int = "mac#%"
//
(* ****** ****** *)
//
fun{}
string0_length(string):<> (int)
//
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
string0_copy
(src: string): string
fun{}
string0_copy_vt
(src: string): string_vt
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
//
fun{}
string0_foreach(cs: string): void
fun{}
string0_foreach$work(c0: char): void
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
(* ****** ****** *)
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
// HX-2019-05-12:
// For linear strings
//
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
(* ****** ****** *)
//
fun{}
string0_vt_iseqz(!string_vt):<> bool
fun{}
string0_vt_isneqz(!string_vt):<> bool
//
#symload iseqz with string0_vt_iseqz
#symload iseqz with string0_vt_isneqz
//
(* ****** ****** *)
//
fun{}
string0_vt_length(!string_vt):<> (int)
//
#symload length with string0_vt_length
//
(* ****** ****** *)
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

(* end of [string.sats] *)
