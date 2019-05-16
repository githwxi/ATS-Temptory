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
"Loading [basics_pre.sats] starts!\n"
#endif // end of [VERBOSE_INCLUDE]

(* ****** ****** *)
//
// HX:
// some built-in
// static boolean constants
//
stacst
true_bool : bool = "ext#"
stacst
false_bool : bool = "ext#"
//
sexpdef
tt = true_bool and ff = false_bool
sexpdef
true = true_bool and false = false_bool
//
(* ****** ****** *)
//
// HX: boolean negation
//
stacst
neg_bool: bool -> bool = "ext#"
//
sexpdef ~ = neg_bool // overloaded
sexpdef not = neg_bool // overloaded
//
(* ****** ****** *)
//
// HX: boolean disjunction
//
stacst
add_bool_bool: (bool, bool) -> bool = "ext#"
//
// HX: boolean conjunction
//
stacst
mul_bool_bool: (bool, bool) -> bool = "ext#"
//
sexpdef + = add_bool_bool and || = add_bool_bool
sexpdef * = mul_bool_bool and && = mul_bool_bool
//
(* ****** ****** *)
//
stacst
lt_bool_bool: (bool, bool) -> bool = "ext#"
stacst
lte_bool_bool: (bool, bool) -> bool = "ext#"
//
stacst
gt_bool_bool: (bool, bool) -> bool = "ext#"
stacst
gte_bool_bool: (bool, bool) -> bool = "ext#"
//
sexpdef < = lt_bool_bool and <= = lte_bool_bool
sexpdef > = gt_bool_bool and >= = gte_bool_bool
//
stacst
eq_bool_bool: (bool, bool) -> bool = "ext#"
stacst
neq_bool_bool: (bool, bool) -> bool = "ext#"
//
sexpdef == = eq_bool_bool
sexpdef != = neq_bool_bool
sexpdef <> = neq_bool_bool (* for backward compatibility *)
//
(* ****** ****** *)
//
// HX: arithmetic operations
//
stacst
neg_int: (int) -> int = "ext#"
//
sexpdef ~ = neg_int // overloaded
//
stacst
add_int_int: (int, int) -> int = "ext#"
stacst
sub_int_int: (int, int) -> int = "ext#"
stacst
mul_int_int: (int, int) -> int = "ext#"
stacst
div_int_int: (int, int) -> int = "ext#"
//
sexpdef + = add_int_int and - = sub_int_int
sexpdef * = mul_int_int and / = div_int_int
//
// HX: ndiv: divisor is positive
// HX: idiv: alias for div_int_int
//
stacst
ndiv_int_int: (int, int) -> int = "ext#"
stacst
idiv_int_int: (int, int) -> int = "ext#"
//
sexpdef ndiv = ndiv_int_int // divided by nat
sexpdef idiv = idiv_int_int // divided by int
//
sexpdef
nmod_int_int
(
  x:int, y:int
) = x - y * (x \ndiv_int_int y)
//
sexpdef mod = nmod_int_int
sexpdef nmod = nmod_int_int
sexpdef % (*adopted from C*) = nmod_int_int
//
(* ****** ****** *)
//
// HX: comparison operations
//
stacst
lt_int_int: (int, int) -> bool = "ext#"
stacst
lte_int_int: (int, int) -> bool = "ext#"
//
stacst
gt_int_int: (int, int) -> bool = "ext#"
stacst
gte_int_int: (int, int) -> bool = "ext#"
//
sexpdef < = lt_int_int and <= = lte_int_int
sexpdef > = gt_int_int and >= = gte_int_int
//
stacst
eq_int_int: (int, int) -> bool = "ext#"
stacst
neq_int_int: (int, int) -> bool = "ext#"
//
sexpdef == = eq_int_int
sexpdef != = neq_int_int
sexpdef <> = neq_int_int (* for backward compatibility *)
//
(* ****** ****** *)
//
// HX: various integer ops
//
stacst
abs_int: (int) -> int = "ext#"
//
sexpdef
absrel_int_int
  (x: int, v: int): bool =
  (x >= 0 && x == v) || (x <= 0 && ~x == v)
//
sexpdef abs = abs_int
sexpdef absrel = absrel_int_int
//
stacst
sgn_int: (int) -> int = "ext#"
//
sexpdef
sgnrel_int_int
  (x: int, v: int): bool =
  (x > 0 && v==1) || (x==0 && v==0) || (x < 0 && v==(~1))
//
sexpdef sgn = sgn_int
sexpdef sgnrel = sgnrel_int_int
//
stacst
max_int_int: (int, int) -> int = "ext#"
stacst
min_int_int: (int, int) -> int = "ext#"
//
sexpdef
maxrel_int_int_int
  (x: int, y: int, v: int): bool =
  (x >= y && x == v) || (x <= y && y == v)
//
sexpdef
minrel_int_int_int
  (x: int, y: int, v: int): bool =
  (x >= y && y == v) || (x <= y && x == v)
//
sexpdef max = max_int_int
sexpdef min = min_int_int
sexpdef maxrel = maxrel_int_int_int
sexpdef minrel = minrel_int_int_int
//
sexpdef
nsub (x:int, y:int) = max (x-y, 0)
//
sexpdef
ndivrel_int_int_int // HX: y > 0
  (x: int, y: int, q: int): bool =
  (q * y <= x) && (x < q * y + y)
//
sexpdef ndivrel = ndivrel_int_int_int
//
sexpdef
idivrel_int_int_int
  (x: int, y: int, q: int) = ( // HX: y != 0
  x >= 0 && y > 0 && ndivrel_int_int_int ( x,  y,  q)
) || (
  x >= 0 && y < 0 && ndivrel_int_int_int ( x, ~y, ~q)
) || (
  x <  0 && y > 0 && ndivrel_int_int_int (~x,  y, ~q)
) || (
  x <  0 && y < 0 && ndivrel_int_int_int (~x, ~y,  q)
) (* end of [idivrel_int_int_int] *)
//
sexpdef idivrel = idivrel_int_int_int
//
sexpdef
divmodrel_int_int_int_int
  (x: int, y: int, q: int, r: int) : bool =
  (0 <= r && r < y && x == q*y + r)
//
sexpdef divmodrel = divmodrel_int_int_int_int
//
(* ****** ****** *)
//
stacst
ifint_bool_int_int
  : (bool, int, int) -> int = "ext#"
//
sexpdef
ifintrel_bool_int_int_int
(
  b:bool, x:int, y:int, r:int
) : bool = (b && r==x) || (~b && r==y)
//
sexpdef ifint = ifint_bool_int_int
sexpdef ifintrel = ifintrel_bool_int_int_int
//
(* ****** ****** *)

sexpdef
bool2int(b: bool): int = ifint(b, 1, 0)
sexpdef int2bool (i: int): bool = (i != 0)
sexpdef b2i = bool2int and i2b = int2bool

(* ****** ****** *)
//
(*
** HX: pointer <-> integer
*)
stacst int_of_addr: addr -> int = "ext#"
stacst addr_of_int: int -> addr = "ext#"
sexpdef a2i = int_of_addr and i2a = addr_of_int
//
(* ****** ****** *)
//
sexpdef pow2_7 = 128
sexpdef pow2_8 = 256
sexpdef i2u_int8 (i:int) = ifint (i >= 0, i, i+pow2_8)
sexpdef i2u8 = i2u_int8
sexpdef u2i_int8 (u:int) = ifint (u < pow2_7, u, u-pow2_8)
sexpdef u2i8 = u2i_int8
//
sexpdef pow2_15 = 32768
sexpdef pow2_16 = 65536
sexpdef i2u_int16 (i:int) = ifint (i >= 0, i, i+pow2_16)
sexpdef i2u16 = i2u_int16
sexpdef u2i_int16 (u:int) = ifint (u < pow2_15, u, u-pow2_16)
sexpdef u2i16 = u2i_int16
//
(* ****** ****** *)

sexpdef pow2_32 = 0x100000000
sexpdef pow2_64 = 0x10000000000000000

(* ****** ****** *)
//
stacst
null_addr: addr = "ext#"
sexpdef null: addr = null_addr
//
stacst
add_addr_int: (addr, int) -> addr = "ext#"
stacst
sub_addr_int: (addr, int) -> addr = "ext#"
stacst
sub_addr_addr: (addr, addr) -> int = "ext#"
//
sexpdef + = add_addr_int
sexpdef - = sub_addr_int and - = sub_addr_addr
//
(* ****** ****** *)
//
stacst
lt_addr_addr: (addr, addr) -> bool = "ext#"
stacst
lte_addr_addr: (addr, addr) -> bool = "ext#"
//
stacst
gt_addr_addr: (addr, addr) -> bool = "ext#"
stacst
gte_addr_addr: (addr, addr) -> bool = "ext#"
//
sexpdef < = lt_addr_addr and <= = lte_addr_addr
sexpdef > = gt_addr_addr and >= = gte_addr_addr
//
stacst
eq_addr_addr: (addr, addr) -> bool = "ext#"
stacst
neq_addr_addr: (addr, addr) -> bool = "ext#"
//
sexpdef == = eq_addr_addr
sexpdef != = neq_addr_addr
sexpdef <> = neq_addr_addr (* for backward compatibility *)
//
(* ****** ****** *)
//
// HX-2017-11-07:
//
abstflt types_nil
abstflt types_cons(vtflt+, tflt+)
(*
stacst types_nil : types
stacst types_cons : (vtflt+, types+) -> types
*)
//
(* ****** ****** *)
//
// HX: this is a special constant!
//
stacst
sizeof_t0ype_int: tflt -> int = "ext#"
//
sexpdef
sizeof(a : vtflt): int = sizeof_t0ype_int(a?)
//
(* ****** ****** *)

sortdef nat = { n:int | n >= 0 }
sortdef nat1 = { n:nat | n < 1 } // for 0
sortdef nat2 = { n:nat | n < 2 } // for 0, 1
sortdef nat3 = { n:nat | n < 3 } // for 0, 1, 2
sortdef nat4 = { n:nat | n < 4 } // for 0, 1, 2, 3

sortdef pos = { i:int | i >  0 } // positive ints
sortdef neg = { i:int | i <  0 } // negative ints
sortdef npos = { i:int | i <= 0 } // non-positive ints
sortdef nneg = { i:int | i >= 0 } // non-negative ints

(* ****** ****** *)

sortdef sgn = { i:int | ~1 <= i; i <= 1 }

(* ****** ****** *)

sortdef igz = { i:int | i > 0 }
sortdef igez = { i:int | i >= 0 }
sortdef ilez = { i:int | i <= 0 }

sortdef agz = { l:addr | l > null }
sortdef agez = { l:addr | l >= null }
sortdef alez = { l:addr | l <= null }

(* ****** ****** *)

#define CHAR_MAX 127
#define CHAR_MIN ~128
#define UCHAR_MAX 0xFF

(* ****** ****** *)
//
stacst effnil : eff // nothing
stacst effall : eff // everything
//
stacst effntm : eff // nonterm
stacst effexn : eff // exception
stacst effref : eff // reference
stacst effwrt : eff // writeover
//
stacst add_eff_eff : (eff, eff) -> eff
sexpdef + = add_eff_eff // union of effsets
stacst sub_eff_eff : (eff, eff) -> eff
sexpdef - = add_eff_eff // difference of effsets
//
(* ****** ****** *)
//
// HX: some overloaded symbols
//
symintr ~ not
(*
symintr && || // macros
*)
symintr lnot lor lxor land
symintr + - * / % mod ndiv nmod
symintr < <= > >= = == != <> compare
symintr isltz isltez isgtz isgtez iseqz isneqz
symintr neg abs max min
symintr succ pred half double
symintr square sqrt cube cbrt pow
//
symintr ! [] // deref subscript
symintr << >> // for L/R-shifting
//
symintr inc dec
symintr ++ -- // inc and dec
symintr get set exch
symintr getinc setinc exchinc
symintr decget decset decexch
symintr !++ --! // getinc and decget
symintr =++ --= // setinc and decset
//
symintr assert
//
symintr encode decode
//
symintr uncons unsome
//
symintr ptrcast (* taking the address of a boxed val *)
symintr g0ofg1 g1ofg0 (* casting: indexed <-> un-indexed *)
//
symintr copy free length
//
symintr print prerr fprint gprint
symintr println prerrln fprintln gprintln
//
(*
//
symintr forall
symintr iforall
//
symintr foreach
symintr foreach2
symintr iforeach
symintr rforeach
//
*)
//
symintr ofstring ofstrptr
symintr tostring tostrptr
//
(* ****** ****** *)
//
// HX-2014-02:
// for dot-notation overloading
//
symintr .size
symintr .len .length
symintr .get .set .exch
symintr .nrow .ncol
symintr .head .tail
symintr .next .prev
symintr .init .last
symintr .eval // HX: convention: using "!"
//
(* ****** ****** *)
//
absview // S2Eat
at_vt0ype_addr_view(a:vtflt+, l:addr)
//
viewdef @ // HX: @ is infix
  (a:vtflt, l:addr) = at_vt0ype_addr_view(a, l)
//
(* ****** ****** *)
//
abstflt clo_t0ype_t0ype(a:tflt) = a
absvtflt clo_vt0ype_vt0ype(a:vtflt) = a
//
(* ****** ****** *)
//
(*
vtypedef READ(a:vtflt) = a // HX: used as a comment
vtypedef WRITE(a:vtflt) = a // HX: used as a comment (rarely)
*)
//
(*
vtypedef SHARED (a:vtflt) = a // HX: used as a comment
vtypedef NSHARED (a:vtflt) = a // HX: used as a comment (rarely)
*)
//
(* ****** ****** *)
//
absprop
invar_prop_prop(a:prop)
absview
invar_view_view(a:view)
//
abstflt // S2Einvar
invar_t0ype_t0ype(a:tflt) = a
absvtflt // S2Einvar
invar_vt0ype_vt0ype(a:vtflt) = a
//
// HX: this order is significant
// 
viewdef
INV(a:view) = invar_view_view(a)
propdef
INV(a:prop) = invar_prop_prop(a)
//
vtypedef
INV
(a:vtflt) = invar_vt0ype_vt0ype(a)
//
typedef
INV(a:tflt) = invar_t0ype_t0ype(a)
//
(* ****** ****** *)
//
absview
vcopyenv_view_view(v:view)
absvtflt
vcopyenv_vt0ype_vt0ype(vt:vtflt) = vt
//
sexpdef vcopyenv_v = vcopyenv_view_view
sexpdef vcopyenv_vt = vcopyenv_vt0ype_vt0ype
//
(* ****** ****** *)

#if
VERBOSE_PRELUDE
#then
#print "Loading [basics_pre.sats] finishes!\n"
#endif // end of [VERBOSE_INCLUDE]

(* ****** ****** *)

(* end of [basics_pre.sats] *)
