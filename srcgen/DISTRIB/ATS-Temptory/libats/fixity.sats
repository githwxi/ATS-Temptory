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
// Author: Hongwei Xi
// Authoremail: hwxiATcsDOTbuDOTedu
//
// This one was
// there at the very beginning of ATS
//
(* ****** ****** *)
//
(*
HX: fixity declarations
*)
#include "libats/params.hats"
//
(* ****** ****** *)

#if
VERBOSE_FIXITY
#then
#print "Loading [fixity.ats] starts!\n"
#endif // end of [VERBOSE_FIXITY]

(* ****** ****** *)
//
(*
#prefix 00 ! (* static *)
*)
//
#prefix 99 ! (* dynamic *)
//
(* ****** ****** *)

(*
#prefix 81 ID (* identity *)
*)

(* ****** ****** *)

(*
postfix 80 .lab // dynamic
postfix 80 ->lab // dynamic
*)

(* ****** ****** *)

(*
#prefix 79 & // dynamic
*)

(* ****** ****** *)

(*
#infixl 70 app
*)

(* ****** ****** *)

(*
postfix 69 ?
*)

(* ****** ****** *)
//
// HX-2015-08-04:
// mostly following the Fortran convention
//
(* ****** ****** *)

#infixr 61 ** (*exp*)

(* ****** ****** *)
//
// multiplicative
//
#infixl 60 * / % mod
//
(*
#infixl 60 nmul ndiv nmod
*)
//
(* ****** ****** *)

#prefix 51 ~ (*negative*)

(* ****** ****** *)
//
#infixl 50 + - (*additive*)
//
(*
#infixr (+) ++ // concatenative
*)
//
(* ****** ****** *)

#infixl 41 asl asr
#infixl 41 lsl lsr

(* ****** ****** *)
//
#infix0 40 < <= > >=
//
(*
//
// HX-2012-07: removed
//
#infixl ( < ) ilt flt plt ult
#infixl ( <= ) ilte flte plte ulte
#infixl ( > ) igt fgt pgt ugt
#infixl ( >= ) igte fgte pgte ugte
*)
//
(* ****** ****** *)

#infixr 40 :: @

(* ****** ****** *)

#infix0 30 = == != <>

(* ****** ****** *)

(*
//
// HX-2012-07: removed
//
#infix0 ( = ) ieq feq peq ueq
#infix0 ( <> ) ineq fneq pneq uneq
*)

(* ****** ****** *)

#infixl 21 &&
#infixl ( && ) andalso land

(* ****** ****** *)

#infixl 20 ||
#infixl ( || ) xor orelse lor lxor

(* ****** ****** *)

#infixr 10 ->

(* ****** ****** *)

#infix0 0 := // HX: assign
#infix0 0 :=: // HX: exchange

(* ****** ****** *)

#infixl 0 << (* g0int_asl, g0uint_lsl *)
#infixr 0 >> (* g0int_asr, g0uint_lsr *)

(* ****** ****** *)

#prefix 0 ++ -- // inc and dec
#prefix 0 !++ --! // getinc and decget
#infixr 0 =++ --= // setinc and decset

(* ****** ****** *)

#infix0 0 :+= :-= :*= :/= // x:=x+a, x:=x-a, ...
#infix0 0 :=+ :=- :=* :=/ // x:=a+x, x:=a-x, ...

(* ****** ****** *)

#prefix 0 ignoret // ignoring a funcall return

(* ****** ****** *)

#if
VERBOSE_FIXITY
#then
#print "Loading [fixity.ats] finishes!\n"
#endif // end of [VERBOSE_FIXITY]

(* end of [fixity.sats] *)
