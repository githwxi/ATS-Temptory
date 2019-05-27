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
stropt_vt2t
(cs: stropt_vt):<> stropt
castfn
stropt1_vt2t
{n:int}
(cs: stropt_vt(n)):<> stropt(n)
//
(* ****** ****** *)
//
castfn
stropt0_ptrof
  (cs: stropt):<> ptr
castfn
stropt0_cptrof
  (cs: stropt):<> cptr(char)
//
#symload ptrof with stropt0_ptrof
#symload cptrof with stropt0_cptrof
//
(* ****** ****** *)
//
fun
stropt0_none
  ((*void*)):<> stropt = "mac#%"
fun
stropt0_some
  (cs: string):<> stropt = "mac#%"
//
(* ****** ****** *)
//
fun{}
stropt0_iseqz(stropt):<> bool
fun{}
stropt0_isneqz(stropt):<> bool
//
#symload iseqz with stropt0_iseqz
#symload isneqz with stropt0_isneqz
//
(* ****** ****** *)
//
// HX-2019-05-26:
// For linear stropts
//
(* ****** ****** *)
//
castfn
stropt0_vt_ptrof
  (cs: !stropt_vt):<> ptr
castfn
stropt0_vt_cptrof
  (cs: !stropt_vt):<> cptr(char)
//
#symload ptrof with stropt0_vt_ptrof
#symload cptrof with stropt0_vt_cptrof
//
(* ****** ****** *)
//
fun
stropt0_vt_none
  ((*void*)):<> stropt_vt = "mac#%"
fun
stropt0_vt_some
  (cs: string_vt):<> stropt_vt = "mac#%"
//
(* ****** ****** *)

fun{}
stropt0_vt_free
(opt: stropt_vt): void
#symload free with stropt0_vt_free

(* ****** ****** *)
//
fun{}
stropt0_vt_iseqz
(opt: !stropt_vt):<> bool
fun{}
stropt0_vt_isneqz
(opt: !stropt_vt):<> bool
//
#symload iseqz with stropt0_vt_iseqz
#symload isneqz with stropt0_vt_isneqz
//
(* ****** ****** *)

(* end of [stropt.sats] *)
