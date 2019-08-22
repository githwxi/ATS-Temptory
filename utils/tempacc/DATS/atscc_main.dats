(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
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

(* Author: Hongwei Xi *)
(* Authoremail: hwxiATcsDOTbuDOTedu *)
(* Start time: July, 2013 *)

(* ****** ****** *)

(* Modified by: Richard Kent *)
(* Start time: June 2019 *)

(* ****** ****** *)
//
(*
#include
"share/atspre_staload.hats"
*)
#include "share/HATS/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
#staload
STDLIB =
"libats/libc/SATS/stdlib.sats"
#staload
UNISTD =
"libats/libc/SATS/unistd.sats"
//
(* ****** ****** *)

#staload UN = "libats/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/atscc.sats"

(* ****** ****** *)

#staload _(*anon*) = "./atscc_util.dats"

(* ****** ****** *)

typedef ca = commarg

(* ****** ****** *)
//
#macdef
unsome(opt) = $UN.stropt0_unsome(,(opt))
#macdef
issome(opt) = stropt0_isneqz(,(opt))
//
(* ****** ****** *)

#include "./util.dats"

(* ****** ****** *)
//
extern fun filename_test_ext(xs: string, ys: string): bool

implfun filename_test_ext(xs, ys) = to_booln(ext_cmp(xs, ys))

#macdef
isfilsats(name) = filename_test_ext(,(name), "sats")//".sats")
#macdef
isfildats(name) = filename_test_ext(,(name), "dats")//".dats")
#macdef
isfilhats(name) = filename_test_ext(,(name), "hats")//".hats")
//
(* ****** ****** *)

fun{}
argv_getopt_at
  {n:int}{i:nat}
(
  n: int n, argv: !argv(n), i: int i
) : stropt =
(
  if i < n then stropt0_some (argv[i]) else stropt0_none()
) (* end of [argv_getopt_at] *)

(* ****** ****** *)


(* ****** ****** *)

local

fun
auxmain(path: string, sfx: string) : string = res where
{
  val-(base2, ext) = base_ext(path)
  val res = string0_append($UN.castvwtp1{string0}base2, sfx)
  val () = string0_vt_free(base2)
  val () = string0_vt_free(ext)
}

in (* in of [local] *)

implement
atscc_outname
  (flag, path) = let
in
//
if flag = 0
  then auxmain (path, "_sats.c")
  else auxmain (path, "_dats.c")
// end of [if]
//
end // end of [atscc_outname]

end // end of [local]

(* ****** ****** *)

local

fun aux0
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+2>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt =
(
  if i < n then aux1 (n, argv, i, res) else res
) // end of [aux0]

and aux1
  {n:int}
  {i:nat | i < n}
  .<3*(n-i)+1>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
//
val str0 = argv[i]
//
in
//
case+ 0 of
//
| _ when (str0="-h") => let
    val res = list0_vt_cons{ca}(CAhelp(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="--help") => let
    val res = list0_vt_cons{ca}(CAhelp(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-hats") => let
    val res = list0_vt_cons{ca}(CAhats(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-vats") => let
    val res = list0_vt_cons{ca}(CAvats(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-ccats") => let
    val res = list0_vt_cons{ca}(CAccats(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
| _ when (str0="-tcats") => let
    val res = list0_vt_cons{ca}(CAtcats(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="--gline") => let
    val res = list0_vt_cons{ca}(CAgline(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-verbose") => let
    val res = list0_vt_cons{ca}(CAverbose(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-cleanaft") => let
    val res = list0_vt_cons{ca}(CAcleanaft(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ when (str0="-atsccomp") =>
    aux1_atsccomp (n, argv, i+1, res)
//
| _ when (str0="-IATS") =>
    aux1_iats (n, argv, i+1, res)
| _ when (str0="-IIATS") =>
    aux1_iiats (n, argv, i+1, res)
//
| _ when (str0="-DATS") =>
    aux1_dats (n, argv, i+1, res)
| _ when (str0="-DDATS") =>
    aux1_ddats (n, argv, i+1, res)
//
| _ when (str0="-fsats") =>
    aux1_fsats (n, argv, i+1, res)
| _ when (str0="-fdats") =>
    aux1_fdats (n, argv, i+1, res)
//
| _ when isfilsats(str0) =>
    aux1_fsats (n, argv, i+0, res)
| _ when isfildats(str0) =>
    aux1_fdats (n, argv, i+0, res)
//
| _ when isfilhats(str0) => // HX-2014-10-17:
    aux1_fdats (n, argv, i+0, res) // hats -> dats
//
| _ when (
    str0="--tlcalopt-disable"
  ) => let
    val res = list0_vt_cons{ca}(CA_tlcalopt_disable(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
| _ when (
    str0="--constraint-ignore"
  ) => let
    val res = list0_vt_cons{ca}(CA_constraint_ignore(), res)
  in
    aux0 (n, argv, i+1, res)
  end // end of [_ when ...]
//
| _ => let
    val res =
      list0_vt_cons{ca}(CA_CCOMPitm(str0), res)
    // end of [val]
  in
    aux0 (n, argv, i+1, res)
  end // end of [_]
//
end // end of [aux1]

(* ****** ****** *)

and
aux1_atsccomp
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAatsccomp(opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_atsccomp]

(* ****** ****** *)

and
aux1_iats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAiats(0, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_iats]

and
aux1_iiats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAiats(1, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_iiats]

(* ****** ****** *)

and
aux1_dats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAdats(0, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_dats]

and
aux1_ddats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAdats(1, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_ddats]

(* ****** ****** *)

and
aux1_fsats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAfilats(0, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_fsats]

and
aux1_fdats
  {n:int}
  {i:nat | i <= n}
  .<3*(n-i)+0>.
(
  n: int n
, argv: !argv(n)
, i: int i
, res: commarglst_vt
) : commarglst_vt = let
  val opt = argv_getopt_at (n, argv, i)
  val res = list0_vt_cons{ca}(CAfilats(1, opt), res)
in
  if i < n then aux0 (n, argv, i+1, res) else res
end // end of [aux1_fdats]

in (* in of [local] *)

implement
atsccproc_commline
  (argc, argv) = let
//
prval (
) = lemma_argv_param (argv)
//
val res = list0_vt_nil{ca}()
val res = aux0 (argc, argv, 0, res)
val res = list0_vt_reverse (res)
//
in
  g0ofg1(list1_vt2t(g1ofg0(res)))
end // end of [atsccproc_commline]

end (* end of [local] *)

(* ****** ****** *)

local

vtypedef res = stringlst_vt

fun aux
(
  ca: commarg, i: int, res: &res >> _
) : void = let
in
//
case+ ca of
//
| CAtcats() =>
  {
    val (
    ) = res :=
      list0_vt_cons{string}("--typecheck", res)
    // end of [val]
  }
//
| CAgline() =>
  {
    val (
    ) = res := list0_vt_cons{string}("--gline", res)
  }
//
| CAdats(_, opt) =>
  (
    if issome (opt) then aux_dats (unsome(opt), res)
  )
//
| CAiats(_, opt) =>
  (
    if issome (opt) then aux_iats (unsome(opt), res)
  )
//
| CA_tlcalopt_disable() =>
  {
    val (
    ) = res :=
      list0_vt_cons{string}("--tlcalopt-disable", res)
    // end of [val]
  }
//
| CA_constraint_ignore() =>
  {
    val (
    ) = res :=
      list0_vt_cons{string}("--constraint-ignore", res)
    // end of [val]
  }
//
| _ => ()
//
end (* end of [aux] *)
//
and aux_dats
(
  path: string, res: &res >> _
) : void =
{
val () = res := list0_vt_cons{string}("-DATS", res)
val () = res := list0_vt_cons{string}(  path , res)
}
and aux_iats
(
  path: string, res: &res >> _
) : void =
{
val () = res := list0_vt_cons{string}("-IATS", res)
val () = res := list0_vt_cons{string}(  path , res)
}
//
fun auxlst
(
  cas: commarglst, i: int, res: &res >> _
) : void = let
in
//
case+ cas of
| list0_nil
    () => ((*void*))
  // list0_nil
| list0_cons
    (ca, cas) => let
    val () = aux(ca, i, res) in auxlst(cas, i+1, res)
  end // end of [list0_cons]
//
end // end of [auxlst]

fun auxout
  (cas: commarglst): bool =
(
case+ cas of
| list0_nil
    () => true
  // list0_nil
| list0_cons
    (ca, cas) =>
  (
    case+ ca of CAtcats() => false | _ => auxout(cas)
  )
) // end of [auxout]

in (* in of [local] *)

implement
atsoptline_make
  (cas, ca0) = let
//
var res: res = list0_vt_nil()
val () = auxlst(cas, 1(*i*), res)
//
val () =
(
case+ ca0 of
| CAhats() =>
  {
    val () =
    res :=
    list0_vt_cons{string}("--help", res)
  }
| CAvats() =>
  {
    val () =
    res :=
    list0_vt_cons{string}("--version", res)
  }
| CAfilats(knd, opt) =>
  if issome (opt) then
  {
    val name = unsome(opt)
    val outname = atscc_outname (knd, name)
//
    val () =
    if auxout (cas) then
    {
      val () =
        res := list0_vt_cons{string}("--output", res)
      // end of [val]
      val () = res := list0_vt_cons{string}(outname, res)
    } // end of [if] // end of [val]
//
    val () =
      if knd = 0 then res := list0_vt_cons{string}("--static", res)
    // end of [val]
    val () =
      if knd > 0 then res := list0_vt_cons{string}("--dynamic", res)
    // end of [val]
    val () = res := list0_vt_cons{string}(name, res)
//
  } (* end of [if] *)
| _ (*rest-of-commarg*) => ((*void*))
) : void // end of [val]
//
in
  list0_vt_reverse(res)
end // end of [atsoptline_make]

end // end of [local]

(* ****** ****** *)

local
//
vtypedef res = stringlst_vt
vtypedef ress = list0_vt (stringlst_vt)
//
#macdef snoc = list0_vt_extend
//
fun auxlst
(
  cas1: commarglst_vt, cas2: commarglst, ress: &ress >> _
) : void = let
in
//
case+ cas2 of
//
| list0_nil() => let
    val () = list0_vt_free (cas1) in (*nothing*)
  end (* end of [list0_nil] *)
//
| list0_cons
    (ca2, cas2) =>
  (
    case+ ca2 of
//
    | CAhats() => let
        val res =
          atsoptline_make ($UN.list0_vt2t(cas1) , ca2)
        val () = ress := list0_vt_cons{res}(res, ress)
      in
        auxlst (cas1, cas2, ress)
      end (* end of [CAhats] *)
//
    | CAvats() => let
        val res =
          atsoptline_make ($UN.list0_vt2t(cas1), ca2)
        val () = ress := list0_vt_cons{res}(res, ress)
      in
        auxlst (cas1, cas2, ress)
      end (* end of [CAvats] *)
//
    | CAtcats() => let
        val cas1 =
          snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CAtcats] *)
//
    | CAgline() => let
        val cas1 =
          snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CAgline] *)
//
    | CAdats _ => let
        val cas1 =
          snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CAdats] *)
    | CAiats _ => let
        val cas1 =
          snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CAiats] *)
//
    | CAfilats _ => let
        val res =
          atsoptline_make ($UN.list0_vt2t(cas1), ca2)
        val () = ress := list0_vt_cons{res}(res, ress)
      in
        auxlst (cas1, cas2, ress)
      end (* end of [CAfilats] *)
//
    | CA_tlcalopt_disable() => let
        val cas1 = snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CA_tlcalopt_disable] *)
    | CA_constraint_ignore() => let
        val cas1 = snoc (cas1, ca2) in auxlst (cas1, cas2, ress)
      end (* end of [CA_constraint_ignore] *)
//
    | _(*ignored*) => auxlst (cas1, cas2, ress)
//
  ) (* end of [list0_cons] *)
//
end // end of [auxlst]

in (* in of [local] *)

implement
atsoptline_make_all
  (cas0) = let
//
var ress: ress = list0_vt_nil
val () = auxlst (list0_vt_nil, cas0, ress)
//
in
  list0_vt_reverse (ress)
end // end of [atsoptline_make_all]

end // end of [local]

(* ****** ****** *)

local

vtypedef res = stringlst_vt

fun aux
(
  ca: commarg, i: int, res: &res >> _
) : void = let
in
//
case+ ca of
//
| CAhats() => ()
| CAvats() => ()
//
| CAccats() => ()
| CAtcats() => ()
//
| CAhelp() => ()
//
| CAgline() => ()
//
| CAverbose() => ()
| CAcleanaft() => ()
//
| CAatsccomp(opt) => ()
//
| CAdats(0, opt) => ()
| CAdats(_, opt) =>
  if issome(opt) then
  {
    val () = res := list0_vt_cons{string}("-D", res)
    val () = res := list0_vt_cons{string}(unsome(opt), res)
  } else ((*void*)) // end of [if]
//
| CAiats(0, opt) => ()
| CAiats(_, opt) =>
  if issome (opt) then
  {
    val () = res := list0_vt_cons{string}("-I", res)
    val () = res := list0_vt_cons{string}(unsome(opt), res)
  } else ((*void*)) // end of [if]
//
| CAfilats(0, opt) =>
  (
    if issome (opt) then aux_fsats (unsome(opt), res)
  )
| CAfilats(_, opt) =>
  (
    if issome (opt) then aux_fdats (unsome(opt), res)
  )
//
| CA_tlcalopt_disable() => ()
| CA_constraint_ignore() => ()
//
| CA_CCOMPitm (item) => aux_CCOMPitm (item, res)
//
end // end of [aux]

and aux_fsats
  (path: string, res: &res >> _): void =
{
  val outname = atscc_outname (0(*sta*), path)
  val () = res := list0_vt_cons{string}(outname, res)
}
and aux_fdats
  (path: string, res: &res >> _): void =
{
  val outname = atscc_outname (1(*dyn*), path)
  val () = res := list0_vt_cons{string}(outname, res)
}
and aux_CCOMPitm
  (item: string, res: &res >> _): void =
{
  val () = res := list0_vt_cons{string}(item, res)
}

fun auxlst
(
  cas: commarglst, i: int, res: &res >> _
) : void = let
//
(*
val () = println! ("auxlst")
*)
//
in
//
case+ cas of
| list0_nil
    () => ((*void*))
| list0_cons
    (ca, cas) => let
    val () = aux (ca, i, res) in auxlst (cas, i+1, res)
  end // end of [list0_cons]
//
end // end of [loop]

in (* in of [local] *)

implement
atsccompline_make
  (cas0) = let
//
var res: res = list0_vt_nil
val-list0_cons(ca, cas) = cas0
val () = auxlst(cas, 1(*i*), res)
//
in
  list0_vt_reverse(res)
end // end of [atsccompline_make]

end // end of [local]

(* ****** ****** *)

local

#define CNUL '\0'
#define SPACE " "

#symload + with g0add_ptr_int of 10//add_ptr0_bsz of 10

(* ****** ****** *)

fun
auxstr
(
  p0: &ptr >> _, n0: &size >> _, x: string
) : int = let
//
val n = string0_length (x)
//
in
//
if n0 > n then let
  val _ = $extfcall
  (
    ptr, "memcpy", p0, ptrof(x), n
  ) // end of [val]
  val () = p0 := p0 + n and () = n0 := n0 - n
in
  0(*success*)
end else ~1(*failure*) // end of [if]
//
end // end of [auxstr]

fun
auxstrlst_sep
(
  p0: &ptr >> _, n0: &size >> _, sep: string, xs: list0(string)//stringlst
) : int = let
in
//
case+ xs of
| list0_cons
    (x, xs) => let
    val err = auxstr (p0, n0, sep)
    val err =
    (
    if err = 0 then auxstr (p0, n0, x) else ~1
    ) : int // end of [val]
  in
    if err = 0 then auxstrlst_sep (p0, n0, sep, xs) else ~1
  end // end of [list0_cons]
| list0_nil() => 0(*success*)
//
end // end of [auxstrlst_sep]

(* ****** ****** *)

fun
auxline
(
  cmd: string
, args: list0(string)//stringlst
, bsz: Sizegte(1)
) : cptr(char) = let//Strptr1 = let
//
//val (pfat, pfgc| p_st) = malloc_gc (bsz)
val p_st = $UN.calloc<char>(bsz)
//
var p0: ptr = cptr2ptr(p_st): ptr
var n0: size = bsz
val sep: string = SPACE
//
val err = auxstr (p0, n0, cmd)
val err =
(
if err = 0 then auxstrlst_sep (p0, n0, sep, args) else ~1
) : int // end of [val]
//
in
//
if err = 0
  then let
  val () = $UN.ptr0_set<char> (p0, CNUL) in (p_st) end
    //$UN.castvwtp0{Strptr1}((pfat, pfgc | p_st))
  else let
    (* val () = mfree_gc (pfat, pfgc | p_st)  *)
    val () = $UN.cfree(p_st)
  in
    auxline (cmd, args, bsz+bsz)
  end // end of [else]
// end of [if]
end // end of [auxline]

(* ****** ****** *)

in (* in of [local]*)

implement
atsoptline_exec
  (flag, atsopt, arglst) = let
//
val bsz = 1024 // HX: more or less arbitrary
//
//val [l:addr] line = auxline (atsopt, $UN.list0_vt2t(arglst), i2sz(bsz))
val line = auxline (atsopt, $UN.list0_vt2t(arglst), i2sz(bsz))
val () = list0_vt_free (arglst)
//

val () =
if flag > 0 then
{
  val () = println! ("exec(", $UN.castvwtp1{string}line, ")")
} (* end of [if] *)
//
val status = //$STDLIB.system ($UN.strptr2string(line))
  $extfcall(int, "system", $UN.castvwtp1{string}line)
//
val () =
if flag > 0 then
{
  val () = println! ("exec(", $UN.castvwtp1{string}line, ") = ", status)
} (* end of [if] *)
//
(* val () = strptr_free (line) *)
val () = $UN.cfree(line)
//
in
  status
end // end of [atsoptline_exec]

(* ****** ****** *)

implement
atsoptline_exec_all
  (flag, atsopt, lines) = let
//
vtypedef
lines = list0_vt(stringlst_vt)
//
fun auxlst
(
  lines: lines, status: int
) : int = let
in
//
case+ lines of
| ~list0_vt_nil
    () => status
  // list0_vt_nil
| ~list0_vt_cons
    (line, lines) => let
    val status = (
      if status = 0
        then
          atsoptline_exec (flag, atsopt, line)
        else let
          val () = list0_vt_free (line) in status
        end // end of [else]
      // end of [if]
    ) : int // end of [val]
  in
    auxlst (lines, status)
  end // end of [cons]
//
end // end of [auxlst]
//
in

  auxlst (lines, 0(*success*))
end // end of [atsoptline_exec_all]

(* ****** ****** *)

implement
atsccomp_cont
  (cas) = let
//
fun
auxlst
(
  cas: commarglst, n: int
) : bool =
//
case+ cas of
| list0_cons
    (ca, cas) => let
  in
    case+ ca of
    | CAccats _ => false
    | CAtcats _ => false
    | CAhelp() => auxlst (cas, n)
    | CAhats() => auxlst (cas, n)
    | CAvats() => auxlst (cas, n)
    | CAverbose() => auxlst (cas, n)
    | _ (*rest*) => auxlst (cas, n+1)
  end (* end of [cons] *)
| list0_nil ((*void*)) =>
    if n > 0 then true else false
//
in
//
case+ cas of
| list0_nil () => false
| list0_cons (_, cas) => auxlst (cas, 0)
//
end // end of [atsccomp_cont]

(* ****** ****** *)

implement
atsccompline_exec
  (flag, atsccomp, arglst) = let
//
val bsz = 1024 // HX: more or less arbitrary
//
val //[l:addr]
  line = auxline (atsccomp, $UN.list0_vt2t(arglst), i2sz(bsz))
val () = list0_vt_free (arglst)
//
val (
) = if flag > 0 then
{
  val () = println! ("exec(", $UN.castvwtp1{string}line, ")")
} (* end of [if] *)
//
val status = //$STDLIB.system ($UN.strptr2string(line))
  $extfcall(int, "system", line)
//
val (
) = if flag > 0 then
{
  val () = println! ("exec(", $UN.castvwtp1{string}line, ") = ", status)
} (* end of [if] *)
//
val () = $UN.cfree(line)//strptr_free (line)
//
in
  status
end // end of [atsccompline_exec]

end // end of [local]

(* ****** ****** *)

implement
atscc_is_help
  (cas) = let
in
//
case+ cas of
| list0_cons
    (ca, cas) =>
  (
    case+ ca of
    | CAhelp() => true | _ => atscc_is_help(cas)
  )
| list0_nil((*void*)) => false
//
end // end of [atscc_is_help]

(* ****** ****** *)

implement
atscc_is_verbose
  (cas) = let
in
//
case+ cas of
| list0_cons
    (ca, cas) =>
  (
    case+ ca of
    | CAverbose() => true | _ => atscc_is_verbose(cas)
  )
| list0_nil((*void*)) => false
//
end // end of [atscc_verbose]

(* ****** ****** *)

implement
atscc_cleanaft_cont
  (cas) = let
in
//
case+ cas of
| list0_cons
    (ca, cas) =>
  (
    case+ ca of
    | CAcleanaft () => true | _ => atscc_cleanaft_cont(cas)
  )
| list0_nil((*void*)) => false
//
end // end of [atscc_cleanaft_cont]

(* ****** ****** *)

implement
atscc_cleanaft_exec
  (flag, cas0) = let
//
fun rmf
(
  flag: int, opt: stropt
) : void = (
if issome(opt) then
{
  val _(*err*) =
    //$UNISTD.unlink(atscc_outname(flag, unsome(opt)))
      $extfcall(int, "unlink", atscc_outname(flag, unsome(opt)))
  // end of [val]
} // end of [if]
) (* end of [rmf] *)
//
fun auxlst
(
  cas: commarglst
) : void = let
in
//
case+ cas of
| list0_cons
    (ca, cas) =>
  (
    case+ ca of
    | CAfilats
        (flag, opt) =>
      (
      let val () = rmf(flag, opt) in auxlst(cas) end
      ) (* end of [CAfilats] *)
    | _(*skipped*) => auxlst (cas)
  )
| list0_nil((*void*)) => ()
//
end // end of [auxlst]
//
val () =
auxlst(cas0)
//
val () =
if flag > 0 then
{
//
(*
val () = fprintln!
(
  the_stderr<>(), "atscc: removal of generated C-files is done."
)
*)
val () = println!
(
  "atscc: removal of generated C-files is done."
)
//
} (* end of [val] *)
//
in
  // nothing
end // end of [atscc_cleanaft_exec]

(* ****** ****** *)

(* end of [atscc_main.dats] *)
