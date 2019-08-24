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
//
(* #include "share/atspre_staload.hats" *)
#include "share/HATS/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
#staload
STDLIB =
"libats/libc/SATS/stdlib.sats"
#staload
_(*anon*) =
"libats/DATS/stdlib.dats"
//
(* ****** ****** *)
//
// #staload UN = "libats/SATS/unsafe.sats"//$UNSAFE
//
(* ****** ****** *)
//
#staload "./../SATS/atscc.sats"
//
(* ****** ****** *)

#staload _(*anon*) = "./atscc_util.dats"

(* ****** ****** *)

(*
#macdef
unsome(opt) = stropt_unsome(,(opt))
#macdef
issome(opt) = stropt_is_some(,(opt))
*)
#macdef
unsome(opt) = $UN.stropt0_unsome(,(opt))
#macdef
issome(opt) = stropt0_isneqz(,(opt))

#macdef snoc = list0_vt_extend
#macdef list0_vt_snoc = list0_vt_extend

(* ****** ****** *)

typedef ca = commarg

(* ****** ****** *)

implement
print_commarg(ca) = let
//
#macdef
prstr(x) = print_string(,(x))
//
#macdef
propt (opt) = let
//
val opt = ,(opt) in
//
  if issome(opt) then print_string(unsome(opt))
end // end of [propt]
//
in
//
case+ ca of
//
| CAhats() => prstr "CAhats()"
| CAvats() => prstr "CAvats()"
//
| CAccats() => prstr "CAccats()"
| CAtcats() => prstr "CAtcats()"
//
| CAhelp() => prstr "CAhelp()"
//
| CAgline() => prstr "CAgline()"
//
| CAverbose() => prstr "CAverbose()"
//
| CAcleanaft() => prstr "CAcleanaft()"
//
| CAatsccomp(opt) =>
  (
    prstr "CAatsccomp("; propt (opt); prstr ")"
  )
//
| CAdats(0, opt) =>
  (
    prstr "CAdats("; propt (opt); prstr ")"
  )
| CAdats(_, opt) =>
  (
    prstr "CAddats("; propt (opt); prstr ")"
  )
//
| CAiats(0, opt) =>
  (
    prstr "CAiats("; propt (opt); prstr ")"
  )
| CAiats(_, opt) =>
  (
    prstr "CAiiats("; propt (opt); prstr ")"
  )
//
| CAfilats(0, opt) =>
  (
    prstr "CAfilats(0, "; propt (opt); prstr ")"
  )
| CAfilats(_, opt) =>
  (
    prstr "CAfilats(1, "; propt (opt); prstr ")"
  )
//
| CA_tlcalopt_disable() => prstr "CA_tlcalopt_disable"
| CA_constraint_ignore() => prstr "CA_constraint_ignore"
//
| CA_CCOMPitm(itm) =>
  (
    prstr "CA_CCOMPitm("; prstr (itm); prstr ")"
  )
//
(*
| _(*rest-of-commarg*) => (prstr"CA...("; prstr"..."; prstr")")
*)
//
end // end of [fprint_commarg]

(* ****** ****** *)

implement
print_commarglst
  (cas) = let
//
impltmp
print$val<ca>(x) = print_commarg(x)
//
impltmp
list0_print$sep<>() = print_string(" ")
//
in
  list0_print<ca> (cas)
end // end of [fprint_ccomarglst]

(* ****** ****** *)

implement
fprint_atsoptline
  (out, cas, ca0) = let
//
fun aux
(
  out: FILEref, ca: commarg, i: int
) : void = let
in
//
case+ ca of
//
| CAtcats () =>
  {
    //val () = fprint (out, " --typecheck")
    val () = print (" --typecheck")
  }
//
| CAdats (_, opt) =>
  (
    if issome (opt) then aux_dats (out, unsome(opt))
  )
//
| CAiats (_, opt) =>
  (
    if issome (opt) then aux_iats (out, unsome(opt))
  )
//
| _ => ()
//
end (* end of [aux] *)
//
and
aux_dats
(
  out: FILEref, def0: string
) : void =
{
  //val () = fprint! (out, " -DATS ", def0)
  val () = print! (" -DATS ", def0)
}
and
aux_iats
(
  out: FILEref, path: string
) : void =
{
  //val () = fprint! (out, " -IATS ", path)
  val () = print! (" -IATS ", path)
}
//
fun auxlst
(
  out: FILEref, cas: commarglst, i: int
) : void = let
in
//
case+ cas of
//
| list0_cons
    (ca, cas) => let
    val () = aux (out, ca, i) in auxlst (out, cas, i+1)
  end // end of [list_cons]
//
| list0_nil ((*void*)) => ()
//
end // end of [auxlst]
//
val
atsopt = atsopt_get ()
//
val () =
  print_string (atsopt)
//
val () = auxlst (out, cas, 1(*i*))
//
in
//
case+ ca0 of
| CAvats () =>
  {
    //val () = fprintln! (out, " --version")
    val () = println! (" --version")
  }
| CAfilats (knd, opt) =>
  if issome (opt) then
  {
    val name = unsome(opt)
    val outname = atscc_outname (knd, name)
    //val () = fprint! (out, " --output ", outname)
    val () = print! (" --output ", outname)
    val () =
    //  if knd = 0 then fprintln! (out, " --static ", name)
      if knd = 0 then println! (" --static ", name)
    // end of [val]
    val () =
      //if knd > 0 then fprintln! (out, " --dynamic ", name)
      if knd > 0 then println! (" --dynamic ", name)
    // end of [val]
  } (* end of [if] *)
| _ (* rest-of-CA *) => ((*void*))
//
end // end of [fprint_atsoptline]

(* ****** ****** *)

implement
fprint_atsoptline_all
  (out, cas0) = let
//
fun auxlst
(
  out: FILEref, cas1: commarglst_vt, cas2: commarglst
) : void = let
in
//
case+ cas2 of
| list0_nil((*void*)) => let
    val () = list0_vt_free (cas1) in (*nothing*)
  end (* end of [list_nil] *)
//
| list0_cons(ca2, cas2) =>
  (
    case+ ca2 of
//
    | CAvats () => let
        val () =
          fprint_atsoptline (out, $UN.list0_vt2t(cas1), ca2)
        // end of [val]
      in
        auxlst (out, cas1, cas2)
      end (* end of [CAvats] *)
    | CAtcats () => let
        val cas1 =
          list0_vt_snoc (cas1, ca2) in auxlst (out, cas1, cas2)
      end (* end of [CAtcats] *)
//
    | CAdats _ => let
        val cas1 =
          list0_vt_snoc (cas1, ca2) in auxlst (out, cas1, cas2)
      end (* end of [CAdats] *)
    | CAiats _ => let
        val cas1 =
          list0_vt_snoc (cas1, ca2) in auxlst (out, cas1, cas2)
      end (* end of [CAiats] *)
//
    | CAfilats _ => let
        val () =
          fprint_atsoptline (out, $UN.list0_vt2t(cas1), ca2)
        // end of [val]
      in
        auxlst (out, cas1, cas2)
      end (* end of [CAfilats] *)
//
    | _(*ignored*) => auxlst (out, cas1, cas2)
//
  ) (* end of [list_cons] *)
//
end // end of [auxlst]
//
in
  auxlst (out, list0_vt_nil, cas0)
end // end of [fprint_atsoptline_all]

(* ****** ****** *)

implement
fprint_atsccompline
  (out, cas0) = let
//
fun aux
(
  out: FILEref, ca: commarg, i: int
) : void = let
in
//
case+ ca of
//
| CAhats () => ()
| CAvats () => ()
//
| CAccats () => ()
| CAtcats () => ()
//
| CAhelp () => ()
//
| CAgline () => ()
//
| CAcleanaft () => ()
//
| CAverbose _ => ()
//
| CAatsccomp _ => ()
//
| CAdats (0, opt) => ()
| CAdats (_, opt) => (
    if issome (opt) then
    {
      (* val () = fprint! (out, " -D ", unsome(opt)) *)
      val () = print! (" -D ", unsome(opt))
    } else ((*void*)) // end of [if]
  )
//
| CAiats (0, opt) => ()
| CAiats (_, opt) => (
    if issome (opt) then
    {
      //val () = fprint! (out, " -I ", unsome(opt))
      val () = print! (" -I ", unsome(opt))
    } else ((*void*)) // end of [if]
  )
//
| CAfilats (0, opt) =>
  (
    if issome (opt) then aux_fsats (out, unsome(opt))
  )
| CAfilats (_, opt) =>
  (
    if issome (opt) then aux_fdats (out, unsome(opt))
  )
//
| CA_tlcalopt_disable () => ()
| CA_constraint_ignore () => ()
//
| CA_CCOMPitm (itm) => aux_CCOMPitm (out, itm)
//
end // end of [aux]

and
aux_fsats
  (out: FILEref, path: string): void =
{
  val outname =
    atscc_outname (0(*sta*), path)
  (* val () = fprint (out, ' ') *)
  val () = print (' ')
  val () = print_string (outname)
}
and
aux_fdats
  (out: FILEref, path: string): void =
{
  val outname =
    atscc_outname (1(*dyn*), path)
  //val () = fprint (out, ' ')
  val () = print (' ')
  val () = print_string (outname)
}
and
aux_CCOMPitm
  (out: FILEref, item: string): void =
{
  //val () = fprint (out, ' ')
  val () = print (' ')
  val () = print_string (item)
}

fun auxlst
(
  out: FILEref, cas: commarglst, i: int
) : void = let
in
//
case+ cas of
| list0_cons
    (ca, cas) => let
    val () = aux (out, ca, i) in auxlst (out, cas, i+1)
  end // end of [list_cons]
| list0_nil ((*void*)) => ()
//
end // end of [auxlst]
//
val-list0_cons (ca, cas) = cas0
//
val () =
//fprint (out, atsccomp_get ())
print (atsccomp_get ())
//
val () = auxlst (out, cas, 1(*i*))
val () = fprint_newline (out)
//
in
  (* nothing *)
end // end of [fprint_atsccompline]

(* ****** ****** *)

(* end of [atscc_print.dats] *)
