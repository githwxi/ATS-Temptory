(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author of the file:
// Hongwei Xi (gmhwxiATgmailDOTcom)
// Start Time: September, 2011
//
(* ****** ****** *)

#include "libats/params.hats"

(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print
"Loading [basics_sta.sats] starts!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

#define RD(x) x // for commenting: read-only

(* ****** ****** *)

(*
abstflt atstype_int // internal
abstflt atstype_bool // internal
abstflt atstype_uint // internal
*)
abstflt atstype_size // internal
(*
abstflt atstype_ssize // internal
*)

(* ****** ****** *)
//
// HX: unindexed type for pointers
//
abstbox
ptr_type =
$extype"atstype_ptrk"
abstbox
ptr_addr_type(l:addr) = ptr_type
//
typedef ptr = ptr_type
sexpdef ptr = ptr_addr_type
//
typedef ptr0 = ptr_type
sexpdef ptr1 = ptr_addr_type
//
typedef Ptr = [l:addr] ptr(l)
typedef Ptr0 = [l:agez] ptr(l)
typedef Ptr1 = [l:addr|l > null] ptr(l)
//
typedef
Ptrnul(l:addr) =
  [l1:addr | l1==null || l1==l] ptr(l1)
// end of [Ptrnul]
//
(*
//
// HX-2012-02-14:
// it is an expriment for now:
//
typedef
ptr(n:int) = ptr_addr_tbox(addr_of_int(n))
//
*)
(* ****** ****** *)
//
abstbox
cptr_vtflt_tbox
  (a: vtflt) = $extype"atstype_cptr"
abstbox
cptr_vtflt_addr_tbox
  (a:vtflt, l:addr) = cptr_vtflt_tbox(a)
//
sexpdef cptr = cptr_vtflt_tbox
sexpdef cptr = cptr_vtflt_addr_tbox
//
sexpdef cptr0 = cptr_vtflt_tbox
sexpdef cptr1 = cptr_vtflt_addr_tbox
//
typedef
Cptr(a:vtflt) = [l:addr] cptr(a, l)
typedef
Cptr0(a:vtflt) = [l:agez] cptr(a, l)
typedef
Cptr1(a:vtflt) = [l:addr|l > null] cptr(a, l)
//
(*
typedef
Cptrnul(a:vtflt,l:addr) =
  [l1:addr | l1 == null || l1 == l] cptr(a, l1)
*)
//
(* ****** ****** *)

abstflt
sint_tk = $extype"atstype_sint"
abstflt
uint_tk = $extype"atstype_uint"
abstflt
slint_tk = $extype"atstype_slint"
abstflt
ulint_tk = $extype"atstype_ulint"
abstflt
ssize_tk = $extype"atstype_ssize"
abstflt
usize_tk = $extype"atstype_usize"
abstflt
sllint_tk = $extype"atstype_sllint"
abstflt
ullint_tk = $extype"atstype_ullint"

(* ****** ****** *)
//
abstflt
g0int_t0ype(tknd:tflt) = tknd
abstflt
g1int_int_t0ype(tknd:tflt, int) = tknd
//
sexpdef g0int = g0int_t0ype
sexpdef g1int = g1int_int_t0ype
//
(* ****** ****** *)
//
typedef
int = g0int_t0ype(sint_tk)
typedef
int(i:int) = g1int_int_t0ype(sint_tk, i)
typedef
sint = g0int_t0ype(sint_tk)
typedef
sint(i:int) = g1int_int_t0ype(sint_tk, i)
typedef
uint = g0int_t0ype(uint_tk)
typedef
uint(i:int) = g1int_int_t0ype(uint_tk, i)
//
typedef
lint = g0int_t0ype(slint_tk)
typedef
slint = g0int_t0ype(slint_tk)
typedef
slint(i:int) = g1int_int_t0ype(slint_tk, i)
typedef
ulint = g0int_t0ype(ulint_tk)
typedef
ulint(i:int) = g1int_int_t0ype(ulint_tk, i)
//
typedef
size = g0int_t0ype(usize_tk)
typedef
size(i:int) = g1int_int_t0ype(usize_tk, i)
typedef
ssize = g0int_t0ype(ssize_tk)
typedef
ssize(i:int) = g1int_int_t0ype(ssize_tk, i)
typedef
usize = g0int_t0ype(usize_tk)
typedef
usize(i:int) = g1int_int_t0ype(usize_tk, i)
//
typedef
llint = g0int_t0ype(sllint_tk)
typedef
sllint = g0int_t0ype(sllint_tk)
typedef
sllint(i:int) = g1int_int_t0ype(sllint_tk, i)
typedef
ullint = g0int_t0ype(ullint_tk)
typedef
ullint(i:int) = g1int_int_t0ype(ullint_tk, i)
//
(* ****** ****** *)

typedef
Intgt(i:int) = [a:int | a > i] int(a)
typedef
Intgte(i:int) = [a:int | a >= i] int(a)
typedef
Intlt(i:int) = [a:int | a < i] int(a)
typedef
Intlte(i:int) = [a:int | a <= i] int(a)
typedef
Natlt(i:int) = [a:nat | a < i] int(a)
typedef
Natlte(i:int) = [a:nat | a <= i] int(a)

typedef
Sizegt(i:int) = [a:int | a > i] size(a)
typedef
Sizegte(i:int) = [a:int | a >= i] size(a)
typedef
Sizelt(i:int) = [a:int | a < i] size(a)
typedef
Sizelte(i:int) = [a:int | a <= i] size(a)

(* ****** ****** *)
//
abstflt
bool_t0ype = $extype"atstype_bool"
abstflt
bool_bool_t0ype(bool) = bool_t0ype
typedef bool = bool_t0ype // shorthand
sexpdef bool = bool_bool_t0ype // shorthand
//
typedef Bool = [b:bool] bool (b)
typedef boolLte
  (b1:bool) = [b2:bool] bool (b2 <= b1) // b2 -> b1
typedef boolGte
  (b1:bool) = [b2:bool] bool (b2 >= b1) // b1 -> b2
//
abstflt atstype_bool // HX-2013-09: for internal use
//
(* ****** ****** *)
//
abstflt
byte_t0ype = $extype"atstype_byte"
typedef byte = byte_t0ype // shorthand
//
(* ****** ****** *)
//
// char is signed
//
sortdef int8 = {
  i:int | ~128 <= i; i < 128
} // end of [int8]
sortdef uint8 =
  { i:int | 0 <= i; i < 256 }
// end of [uint8]
//
abstflt
char_t0ype = $extype"atstype_char"
abstflt
char_int_t0ype(c:int) = char_t0ype
//
typedef char = char_t0ype // shorthand
sexpdef char = char_int_t0ype // shorthand
//
typedef Char = [c:int8] char(c)
typedef charNZ = [c:int8 | c != 0] char(c)
//
// signed characters
//
abstflt
schar_t0ype = $extype"atstype_schar"
abstflt
schar_int_t0ype(c:int) = schar_t0ype
//
typedef schar = schar_t0ype // shorthand
sexpdef schar = schar_int_t0ype // shorthand
//
typedef Schar = [c:int8] schar(c)
typedef scharNZ = [c:int8 | c != 0] schar(c)
//
// unsigned characters
//
abstflt
uchar_t0ype = $extype"atstype_uchar"
abstflt
uchar_int_t0ype(c:int) = uchar_t0ype
//
typedef uchar = uchar_t0ype // shorthand
sexpdef uchar = uchar_int_t0ype // shorthand
typedef Uchar = [c:uint8] uchar (c)
typedef ucharNZ = [c:uint8 | c != 0] uchar(c)
//
(* ****** ****** *)
//
abstbox
string_t1ype = $extype"atstype_string"
abstbox
string_int_t1ype(n: int) = string_t1ype
//
sexpdef
string = string_t1ype
sexpdef
string = string_int_t1ype
//
sexpdef
string0 = string_t1ype
sexpdef
string1 = string_int_t1ype
//
typedef
String = [n:int] string(n)
typedef
String0 = [n:int | n >= 0] string(n)
typedef
String1 = [n:int | n >= 1] string(n)
//
(* ****** ****** *)
//
abstbox
stropt_t1ype = string_t1ype
abstbox
stropt_int_t1ype(n:int) = stropt_t1ype
//
sexpdef
stropt = stropt_t1ype
sexpdef
stropt = stropt_int_t1ype
//
sexpdef
stropt0 = stropt_t1ype
sexpdef
stropt1 = stropt_int_t1ype
//
typedef
Stropt = [n:int] stropt(n)
typedef
Stropt0 = [n:int] stropt(n)
typedef
Stropt1 = [n:int | n >= 0] stropt(n)
//
(* ****** ****** *)
//
abstflt
atsvoid_t0ype
(*
= $extype"atsvoid_t0ype"
*)
typedef
void = atsvoid_t0ype // = C-void
//
absvtbox
exception_vtype =
$extype"atstype_exnconptr"
vtypedef exn = exception_vtype
//
absvtflt
opt_vtflt_bool_vtflt
(a:vtflt+, opt:bool) = a
sexpdef opt = opt_vtflt_bool_vtflt
//
(* ****** ****** *)

absprop // invariance
vbox_view_prop(v:view)
propdef
vbox(v:view) = vbox_view_prop(v)

abstbox // invariance
ref_vt0ype_type(a:vtflt) = ptr
typedef
ref(a:vtflt) = ref_vt0ype_type(a)

(* ****** ****** *)
//
// HX:
// suspended computation:
//
abstbox
lazy_t0ype_type(tflt+) = ptr
typedef
lazy(a:tflt) = lazy_t0ype_type(a)
//
// HX:
// suspended linear computation
//
absvtbox
lazy_vt0ype_vtype(vtflt+) = ptr
vtypedef
lazy_vt(a:vtflt) = lazy_vt0ype_vtype(a)
//
(* ****** ****** *)
//
(*
** HX: linear mutable strings
*)
//
absvtbox
strptr_addr_vtype(l:addr) = ptr
vtypedef
strptr(l:addr) = strptr_addr_vtype(l)
//
vtypedef
Strptr = [l:addr] strptr(l)
vtypedef
Strptr0 = [l:addr] strptr(l)
vtypedef
Strptr1 = [l:addr|l > null] strptr(l)
//
absvtbox
strnptr_addr_int_vtype(l:addr,n:int) = ptr
vtypedef
strnptr(l:addr,n:int) = strnptr_addr_int_vtype(l, n)
//
vtypedef
Strnptr = [l:addr;n:int] strnptr(l, n)
vtypedef
Strnptr(n:int) = [l:addr] strnptr(l, n)
//
vtypedef
Strnptr0 = [l:addr;n:int] strnptr(l, n)
vtypedef
Strnptr1 = [l:addr;n:int | n >= 0] strnptr(l, n)
//
(* ****** ****** *)
//
absvtbox
string_vt1ype = $extype"atstype_string"
absvtbox
string_int_vt1ype(n: int) = string_vt1ype
//
vtypedef
string_vt = string_vt1ype
vtypedef
string_vt(n:int) = string_int_vt1ype(n)
//
vtypedef
string0_vt = string_vt1ype
vtypedef
string1_vt(n:int) = string_int_vt1ype(n)
//
vtypedef
String_vt = [n:int] string_vt(n)
vtypedef
String0_vt = [n:int | n >= 0] string_vt(n)
vtypedef
String1_vt = [n:int | n >= 1] string_vt(n)
//
(* ****** ****** *)
//
typedef
tup2
(a0:tflt, a1:tflt) = (a0, a1)
typedef
tup3
( a0:tflt
, a1:tflt, a2:tflt) = (a0, a1, a2)
typedef
tup4
( a0:tflt, a1:tflt
, a2:tflt, a3:tflt) = (a0, a1, a2, a3)
//
sexpdef tup = tup2
sexpdef tup = tup3
sexpdef tup = tup4
//
vtypedef
tup2_vt
(a0:vtflt, a1:vtflt) = (a0, a1)
vtypedef
tup3_vt
( a0:vtflt
, a1:vtflt, a2:vtflt) = (a0, a1, a2)
vtypedef
tup4_vt
( a0:vtflt, a1:vtflt
, a2:vtflt, a3:vtflt) = (a0, a1, a2, a3)
//
sexpdef tup_vt = tup2_vt
sexpdef tup_vt = tup3_vt
sexpdef tup_vt = tup4_vt
//
(* ****** ****** *)
//
typedef
bytes(n:int) = @[byte][n]
viewdef
bytes_v(l:addr, n:int) = bytes(n)@l
//
(* ****** ****** *)
//
// HX:
// for memory deallocation
// (with GC and without GC)
//
absview
mfree_gc_addr_view(addr)
stadef
mfree_gc_v = mfree_gc_addr_view
//
absview
mfree_ngc_addr_view(addr)
stadef
mfree_ngc_v = mfree_ngc_addr_view
//
absview
mfree_libc_addr_view(addr) // libc-mfree
stadef
mfree_libc_v = mfree_libc_addr_view
//
(* ****** ****** *)

typedef
bottom_t0ype_uni = {a:tflt} (a)
typedef
bottom_t0ype_exi = [a:tflt | false] (a)

vtypedef
bottom_vt0ype_uni = {a:vtflt} (a)
vtypedef
bottom_vt0ype_exi = [a:vtflt | false] (a)

(* ****** ****** *)
//
typedef
cmpfunval(a:vtflt) = (!a, !a) -> int(*sgn*)
typedef
cmpfunref(a:vtflt) = (&a, &a) -> int(*sgn*)
//
(* ****** ****** *)
//
(*
//
// HX-2016-02-21:
// these are renamed/relocated elsewhere
//
// HX-2017-10-03:
// Is this even needed? Parsing works but
// $literal(...) does not seem to be in use
// Please see $PATSHOME/utils/atexting/TEST
//
(*
abstbox
literal_int
(value: int) = $extype"atsliteral_int"
abstbox
literal_float
(value: float) = $extype"atsliteral_float"
abstbox
literal_string
(value: string) = $extype"atsliteral_string"
*)
//
*)
//
(* ****** ****** *)
//
abstflt
undefined_t0ype = $extype"atstype_undefined"
absvtflt
undefined_vt0ype = $extype"atstype_undefined"
//
(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print "Loading [basics_sta.sats] finishes!\n"
#endif // end of [VERBOSE_PRELUDE]

(* ****** ****** *)

(* end of [basics_sta.sats] *)
