(*
Makefile.atxt: 1(line=1, offs=1) -- 331(line=19, offs=3)
*)

//
staload
UN = "prelude/SATS/unsafe.sats"
staload
_ (*anon*) = "prelude/DATS/list.dats"
#define l2l list_of_list_vt
//
staload
STR = "libc/SATS/string.sats"
staload
STDIO = "libc/SATS/stdio.sats"
staload TIME = "libc/SATS/time.sats"
//
dynload "libatsdoc/dynloadall.dats"
//
staload "libatsdoc/SATS/libatsdoc_atext.sats"
//

(*
Makefile.atxt: 333(line=20, offs=1) -- 1483(line=86, offs=3)
*)


fn
extrem
(
//
str: string
// extension removal
) : string = let
//
val str =
  string1_of_string(str)
//
fun
loop{n:int}
{i:nat | i <= n} .<n-i>.
(
  str: string n, i: size_t i
) : string =
(
if
string_isnot_atend(str, i)
then let
  val c = str[i]
in
  if c = '.' then let
    val str1 = string_make_substring (str, 0, i) in string_of_strbuf (str1)
  end else loop (str, i + 1)
end else str // end of [if]
) (* end of [loop] *)
//
in
  loop (str, 0)
end // end of [extrem]

fn
isSuffix
(
  str: string, sfx: string
) : bool = let
  val str = string1_of_string (str)
  val l_str = string1_length (str)
  val sfx = string1_of_string (sfx)
  val l_sfx = string1_length (sfx)
in
  if l_str >= l_sfx then let
    val str1 = $UN.cast{string}($UN.cast2ptr(str)+l_str-l_sfx)
  in
    $STR.strcmp (str1, sfx) = 0
  end else false
end // end of [isSuffix]

macdef isSATS (x) = isSuffix (,(x), ".sats")
macdef isDATS (x) = isSuffix (,(x), ".dats")

fn
srcRename
(
  str: string
) : string =
  case+ 0 of
  | _ when isSATS(str) => extrem(str) + "_sats"
  | _ when isDATS(str) => extrem(str) + "_dats"
  | _ (*non-SATS-DATS*) => str
// end of [srcRename]


(*
Makefile.atxt: 1485(line=87, offs=1) -- 11752(line=605, offs=3)
*)

//
(*
** HX: pats_main.dats is not include in [SOURCES]
*)
//
val
SOURCES =
$lst{string}
(
//
  "pats_params.hats"
//
, "pats_error.sats"
, "pats_error.dats"
//
, "pats_intinf.sats"
, "pats_intinf.dats"
, "pats_intinf_int.hats"
, "pats_intinf_gmp.hats"
//
, "pats_counter.sats"
, "pats_counter.dats"
//
, "pats_utils.sats"
, "pats_utils.dats"
//
, "pats_global.sats"
, "pats_global.dats"
//
, "pats_basics.sats"
, "pats_basics.dats"
, "pats_basics.hats"
//
, "pats_comarg.sats"
, "pats_comarg.dats"
//
, "pats_stamp.sats"
, "pats_stamp.dats"
//
, "pats_symbol.sats"
, "pats_symbol.dats"
//
, "pats_filename.sats"
, "pats_filename.dats"
, "pats_filename_reloc.dats"
//
, "pats_location.sats"
, "pats_location.dats"
, "pats_location.cats"
//
, "pats_jsonize.sats"
, "pats_jsonize.dats"
//
, "pats_errmsg.sats"
, "pats_errmsg.dats"
//
, "pats_reader.sats"
, "pats_reader.dats"
, "pats_reader.cats"
//
, "pats_lexbuf.sats"
, "pats_lexbuf.dats"
, "pats_lexbuf.cats"
//
, "pats_lexing.sats"
, "pats_lexing.dats"
, "pats_lexing.cats"
, "pats_lexing_print.dats"
, "pats_lexing_error.dats"
, "pats_lexing_token.dats"
//
, "pats_label.sats"
, "pats_label.dats"
//
, "pats_effect.sats"
, "pats_effect.dats"
//
, "pats_fixity.sats"
, "pats_fixity_prec.dats"
, "pats_fixity_fxty.dats"
//
, "pats_syntax.sats"
, "pats_syntax.dats"
, "pats_syntax_print.dats"
//
, "pats_depgen.sats"
, "pats_depgen.dats"
//
, "pats_taggen.sats"
, "pats_taggen.dats"
//
, "pats_tokbuf.sats"
, "pats_tokbuf.dats"
, "pats_tokbuf.cats"
//
, "pats_parsing.sats"
, "pats_parsing.dats"
, "pats_parsing_error.dats"
, "pats_parsing_util.dats"
, "pats_parsing_kwds.dats"
, "pats_parsing_base.dats"
, "pats_parsing_e0xp.dats"
, "pats_parsing_sort.dats"
, "pats_parsing_staexp.dats"
, "pats_parsing_p0at.dats"
, "pats_parsing_dynexp.dats"
, "pats_parsing_decl.dats"
, "pats_parsing_toplevel.dats"
//
, "pats_symmap.sats"
, "pats_symmap.dats"
, "pats_symmap_avltree.hats" // may be included in [pats_symmap.dats]
, "pats_symmap_htlinprb.hats" // may be included in [pats_symmap.dats]
//
, "pats_symenv.sats"
, "pats_symenv.dats"
//
, "pats_staexp1.sats"
, "pats_staexp1.dats"
, "pats_staexp1_print.dats"
//
, "pats_dynexp1.sats"
, "pats_dynexp1.dats"
, "pats_dynexp1_print.dats"
//
, "pats_trans1.sats"
, "pats_trans1_env.sats"
, "pats_trans1_env.dats"
//
, "pats_e1xpval.sats"
, "pats_e1xpval.dats"
, "pats_e1xpval_error.dats"
//
, "pats_trans1_error.dats"
, "pats_trans1_e0xp.dats"
, "pats_trans1_effect.dats"
, "pats_trans1_sort.dats"
, "pats_trans1_staexp.dats"
, "pats_trans1_p0at.dats"
, "pats_trans1_syndef.dats"
, "pats_trans1_dynexp.dats"
, "pats_trans1_decl.dats"
//
, "pats_staexp2.sats"
, "pats_staexp2.dats"
//
, "pats_stacst2.sats"
, "pats_stacst2.dats"
//
, "pats_staexp2_print.dats"
, "pats_staexp2_pprint.dats"
//
, "pats_staexp2_sort.dats"
//
, "pats_staexp2_scst.dats"
, "pats_staexp2_svar.dats"
, "pats_staexp2_svvar.dats"
//
, "pats_staexp2_hole.dats"
, "pats_staexp2_ctxt.dats"
//
, "pats_staexp2_dcon.dats"
//
, "pats_staexp2_skexp.dats"
, "pats_staexp2_szexp.dats"
//
, "pats_staexp2_util.sats"
, "pats_staexp2_util1.dats"
, "pats_staexp2_util2.dats"
, "pats_staexp2_util3.dats"
//
, "pats_staexp2_error.sats"
, "pats_staexp2_error.dats"
//
, "pats_staexp2_solve.sats"
, "pats_staexp2_solve.dats"
//
, "pats_patcst2.sats"
, "pats_patcst2.dats"
//
, "pats_dynexp2.sats"
, "pats_dynexp2.dats"
//
, "pats_dyncst2.sats"
, "pats_dyncst2.dats"
//
, "pats_dynexp2_print.dats"
//
, "pats_dynexp2_dcst.dats"
, "pats_dynexp2_dvar.dats"
, "pats_dynexp2_dmac.dats"
, "pats_dynexp2_util.dats"
//
, "pats_staexp2_appenv.hats"
, "pats_dynexp2_appenv.hats"
//
, "pats_dynexp2_mapgen.dats"
//
, "pats_trans2.sats"
//
, "pats_namespace.sats"
, "pats_namespace.dats"
//
, "pats_trans2_env.sats"
, "pats_trans2_env.dats"
, "pats_trans2_error.dats"
, "pats_trans2_sort.dats"
, "pats_trans2_staexp.dats"
, "pats_trans2_p1at.dats"
, "pats_trans2_dynexp.dats"
, "pats_trans2_impdec.dats"
//
, "pats_trans2_decl.dats"
//
, "pats_codegen2.sats"
, "pats_codegen2.dats"
, "pats_codegen2_util.dats"
, "pats_codegen2_absrec.dats"
, "pats_codegen2_datype.dats"
, "pats_codegen2_fprint.dats"
//
, "pats_jsonize_synent2.sats"
, "pats_jsonize_synent2.dats"
//
, "pats_dynexp3.sats"
, "pats_dynexp3.dats"
, "pats_dynexp3_print.dats"
//
, "pats_trans3.sats"
, "pats_trans3_error.dats"
, "pats_trans3_util.dats"
//
, "pats_trans3_env.sats"
, "pats_trans3_env.dats"
, "pats_trans3_env_print.dats"
, "pats_trans3_env_scst.dats"
, "pats_trans3_env_svar.dats"
, "pats_trans3_env_termet.dats"
, "pats_trans3_env_effect.dats"
, "pats_trans3_env_dvar.dats"
, "pats_trans3_env_lamlp.dats"
, "pats_trans3_env_pfman.dats"
, "pats_trans3_env_lstate.dats"
//
, "pats_dmacro2.sats"
, "pats_dmacro2.dats"
, "pats_dmacro2_print.dats"
, "pats_dmacro2_eval0.dats"
, "pats_dmacro2_eval1.dats"
//
, "pats_trans3_p2at.dats"
, "pats_trans3_patcon.dats"
, "pats_trans3_syncst.dats"
, "pats_trans3_dynexp_up.dats"
, "pats_trans3_dynexp_dn.dats"
, "pats_trans3_appsym.dats"
, "pats_trans3_caseof.dats"
, "pats_trans3_selab.dats"
, "pats_trans3_ptrof.dats"
, "pats_trans3_viewat.dats"
, "pats_trans3_deref.dats"
, "pats_trans3_assgn.dats"
, "pats_trans3_xchng.dats"
, "pats_trans3_lvalres.dats"
, "pats_trans3_fldfrat.dats"
, "pats_trans3_looping.dats"
, "pats_trans3_decl.dats"
//
, "pats_lintprgm.sats"
, "pats_lintprgm.dats"
, "pats_lintprgm_print.dats"
, "pats_lintprgm_myint.cats"
, "pats_lintprgm_myint.dats"
, "pats_lintprgm_solve.dats"
//
, "pats_constraint3.sats"
, "pats_constraint3.dats"
, "pats_constraint3_print.dats"
//
, "pats_constraint3_appenv.hats"
//
, "pats_constraint3_mapgen.dats"
, "pats_constraint3_jsonize.dats"
//
, "pats_constraint3_init.dats"
, "pats_constraint3_simplify.dats"
, "pats_constraint3_icnstr.dats"
, "pats_constraint3_solve.dats"
//
, "pats_histaexp.sats"
, "pats_histaexp.dats"
, "pats_histaexp_print.dats"
, "pats_histaexp_funlab.dats"
//
, "pats_hidynexp.sats"
, "pats_hidynexp.dats"
, "pats_hidynexp_print.dats"
, "pats_hidynexp_util.dats"
//
, "pats_typerase.sats"
, "pats_typerase_error.dats"
, "pats_typerase_staexp.dats"
, "pats_typerase_dynexp.dats"
, "pats_typerase_decl.dats"
//
, "pats_ccomp.sats"
, "pats_ccomp.dats"
, "pats_ccomp_print.dats"
, "pats_ccomp_hitype.dats"
, "pats_ccomp_tmplab.dats"
, "pats_ccomp_tmpvar.dats"
, "pats_ccomp_d2env.dats"
, "pats_ccomp_funlab.dats"
, "pats_ccomp_funent.dats"
, "pats_ccomp_util.dats"
, "pats_ccomp_ccompenv.dats"
, "pats_ccomp_instrseq.dats"
, "pats_ccomp_hipat.dats"
, "pats_ccomp_dynexp.dats"
, "pats_ccomp_caseof.dats"
, "pats_ccomp_claulst.dats"
, "pats_ccomp_lazyeval.dats"
, "pats_ccomp_trywith.dats"
, "pats_ccomp_looping.dats"
, "pats_ccomp_decl.dats"
, "pats_ccomp_subst.dats"
, "pats_ccomp_environ.dats"
, "pats_ccomp_template.dats"
, "pats_ccomp_emit.dats"
, "pats_ccomp_emit2.dats"
, "pats_ccomp_emit3.dats"
, "pats_ccomp_main.dats"
//
) // end of [SOURCES]

(* ****** ****** *)

fn
SOURCES_process
(
// argless
) : atext = let
  fun
  fopr
  (
    x: string
  ) : atext = let
    val res = sprintf ("  %s \\\n", @(x)) in atext_strptr(res)
  end // end of [f]
  val res = list_map_fun(SOURCES, fopr)
  val res = list_of_list_vt (res)
in
  atext_concatxt(res)
end // end of [SOURCES_process]

fn
TARGETS_process
(
// argless
) : atext = let
//
fun aux
(
  xs: List(string)
) : atextlst =
(
  case+ xs of
  | list_nil() =>
    list_nil(*void*)
  | list_cons(x, xs) =>
    (
    case+ 0 of
    | _ when isSATS(x) => let
        val x1 = extrem(x)
        val x2 =
	sprintf("BUILD/%s_sats.c \\\n", @(x1))
        val x2 = atext_strptr(x2)
      in
        list_cons(x2, aux(xs))
      end
    | _ when isDATS(x) => let
        val x1 = extrem(x)
        val x2 =
	sprintf("BUILD/%s_dats.c \\\n", @(x1))
        val x2 = atext_strptr(x2)
      in
        list_cons(x2, aux(xs))
      end
    | _ => aux (xs)
    )
) (* end of [aux] *)
//
val res = aux(SOURCES)
//
in
  atext_concatxt(res)
end // end of [TARGETS_process]

fn
OBJECTS_process
(
// argless
) : atext = let
//
fun aux
(
  xs: List(string)
) : atextlst =
(
  case+ xs of
  | list_nil() =>
    list_nil(*void*)
  | list_cons(x, xs) =>
    (
    case+ 0 of
    | _ when
        isSATS(x) => let
        val x1 = extrem(x)
        val x2 = sprintf("BUILD/%s_sats.o \\\n", @(x1))
        val x2 = atext_strptr(x2)
      in
        list_cons(x2, aux(xs))
      end // end of [isSATS]
    | _ when
        isDATS(x) => let
        val x1 = extrem(x)
        val x2 = sprintf("BUILD/%s_dats.o \\\n", @(x1))
        val x2 = atext_strptr(x2)
      in
        list_cons(x2, aux(xs))
      end // end of [isDATS]
    | _ => aux (xs)
    )
) (* end of [aux] *)
//
val res = aux(SOURCES)
//
in
  atext_concatxt(res)
end // end of [OBJECTS_process]

(* ****** ****** *)

local

fun fproc
  (src: string): atextopt_vt = let
in
//
case+ 0 of
| _ when
    isSATS(src) => let
    val src1 = extrem (src)
    val line1 = sprintf
    (
      "BUILD/%s_sats.c: %s.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<\n", @(src1, src1)
    ) // end of [val]
    val line1 = atext_strptr(line1)
    val line2 = sprintf
    (
      "BUILD/%s_sats.o: BUILD/%s_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<\n\n", @(src1, src1)
    ) // end of [val]
    val line2 = atext_strptr(line2)
  in
    Some_vt (atext_apptxt2 (line1, line2))
  end // end of [isSATS]
| _ when
    isDATS(src) => let
    val src1 =
      extrem(src)
    // end of [val]
//
    val line1 = sprintf
    (
      "BUILD/%s_dats.c: %s.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<\n", @(src1, src1)
    ) // end of [val]
    val line1 = atext_strptr(line1)
//
    val line2 = sprintf
    (
      "BUILD/%s_dats.o: BUILD/%s_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<\n\n", @(src1, src1)
    ) // end of [val]
    val line2 = atext_strptr(line2)
//
  in
    Some_vt(atext_apptxt2(line1, line2))
  end // end of [isDATS]
| _(*non-SATS-DATS*) => None_vt((*void*)) // HX: .cats? .hats?
//
end // end of [fproc]

in // in of [local]

fun
process_compile_lines
  ((*void*)) = let
//
val ys =
list_mapopt_fun<string><atext>
  (SOURCES, fproc)
// end of [val]
val res1 = atext_concatxt ((l2l)ys)
(*
val-
~Some_vt
  (res2) = fproc ("pats_main.dats")
// end of [val]
*)
in
  res1
(*
  atext_apptxt2 (res1, res2)
*)
end // end of [process_compile_lines]

end // end of [local]


(*
Makefile.atxt: 12513(line=676, offs=2) -- 12530(line=676, offs=19)
*)
val __tok1 = SOURCES_process()
val () = theAtextMap_insert_str ("__tok1", __tok1)

(*
Makefile.atxt: 12642(line=684, offs=2) -- 12659(line=684, offs=19)
*)
val __tok2 = TARGETS_process()
val () = theAtextMap_insert_str ("__tok2", __tok2)

(*
Makefile.atxt: 12757(line=691, offs=2) -- 12774(line=691, offs=19)
*)
val __tok3 = OBJECTS_process()
val () = theAtextMap_insert_str ("__tok3", __tok3)

(*
Makefile.atxt: 13938(line=749, offs=2) -- 13961(line=749, offs=25)
*)
val __tok4 = process_compile_lines()
val () = theAtextMap_insert_str ("__tok4", __tok4)

(*
Makefile.atxt: 14983(line=803, offs=1) -- 15056(line=805, offs=3)
*)

implement main () = fprint_filsub (stdout_ref, "Makefile_atxt.txt")

