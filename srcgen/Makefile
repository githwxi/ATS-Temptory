#
#
# This Makefile is automatically generated
# from executing the following command-line:
#
# make -f Makefile.gen
#
#

######
#
CC=gcc
CCOMP=$(CC)
#
export ATSCCOMP=$(CC)
#
######

DIR=.
ARR=ar -r
CPF=cp -f
RMF=rm -f
WCL=wc -l

######

ATS1CC=$(ATSHOME)/bin/atscc
ATSOPT=$(ATSHOME)/bin/atsopt

######

CFLAGS=-g
CFLAGS=-O -g
CFLAGS=-O2 -g

######
#
GCFLAG=
#
# GCFLAG=-D_ATS_NGC
# GCFLAG=-D_ATS_GCBDW
# GCFLAG=-D_ATS_GCATS
#
######
#
# Bootstrapping:
#
# [gmpknd] for CBOOTgmp
# [intknd] for CBOOTint
#
C3NSTRINTKND=gmpknd
#C3NSTRINTKND=gmpknd
#C3NSTRINTKND=intknd
#
######
#
DATSCC=-DATS \
C3NSTRINTKND=$(C3NSTRINTKND)
#
######

LIBATS=-lats

######
#
# HX: no [gmp]
ifeq ($(C3NSTRINTKND),intknd)
LIBGMP=
endif
#
# HX: [gmp] needed
ifeq ($(C3NSTRINTKND),gmpknd)
LIBGMP=-lgmp
endif
#
######

SOURCES := \
  pats_params.hats \
  pats_error.sats \
  pats_error.dats \
  pats_intinf.sats \
  pats_intinf.dats \
  pats_intinf_int.hats \
  pats_intinf_gmp.hats \
  pats_counter.sats \
  pats_counter.dats \
  pats_utils.sats \
  pats_utils.dats \
  pats_global.sats \
  pats_global.dats \
  pats_basics.sats \
  pats_basics.dats \
  pats_basics.hats \
  pats_comarg.sats \
  pats_comarg.dats \
  pats_stamp.sats \
  pats_stamp.dats \
  pats_symbol.sats \
  pats_symbol.dats \
  pats_filename.sats \
  pats_filename.dats \
  pats_filename_reloc.dats \
  pats_location.sats \
  pats_location.dats \
  pats_location.cats \
  pats_jsonize.sats \
  pats_jsonize.dats \
  pats_errmsg.sats \
  pats_errmsg.dats \
  pats_reader.sats \
  pats_reader.dats \
  pats_reader.cats \
  pats_lexbuf.sats \
  pats_lexbuf.dats \
  pats_lexbuf.cats \
  pats_lexing.sats \
  pats_lexing.dats \
  pats_lexing.cats \
  pats_lexing_print.dats \
  pats_lexing_error.dats \
  pats_lexing_token.dats \
  pats_label.sats \
  pats_label.dats \
  pats_effect.sats \
  pats_effect.dats \
  pats_fixity.sats \
  pats_fixity_prec.dats \
  pats_fixity_fxty.dats \
  pats_syntax.sats \
  pats_syntax.dats \
  pats_syntax_print.dats \
  pats_depgen.sats \
  pats_depgen.dats \
  pats_taggen.sats \
  pats_taggen.dats \
  pats_tokbuf.sats \
  pats_tokbuf.dats \
  pats_tokbuf.cats \
  pats_parsing.sats \
  pats_parsing.dats \
  pats_parsing_error.dats \
  pats_parsing_util.dats \
  pats_parsing_kwds.dats \
  pats_parsing_base.dats \
  pats_parsing_e0xp.dats \
  pats_parsing_sort.dats \
  pats_parsing_staexp.dats \
  pats_parsing_p0at.dats \
  pats_parsing_dynexp.dats \
  pats_parsing_decl.dats \
  pats_parsing_toplevel.dats \
  pats_symmap.sats \
  pats_symmap.dats \
  pats_symmap_avltree.hats \
  pats_symmap_htlinprb.hats \
  pats_symenv.sats \
  pats_symenv.dats \
  pats_staexp1.sats \
  pats_staexp1.dats \
  pats_staexp1_print.dats \
  pats_dynexp1.sats \
  pats_dynexp1.dats \
  pats_dynexp1_print.dats \
  pats_trans1.sats \
  pats_trans1_env.sats \
  pats_trans1_env.dats \
  pats_e1xpval.sats \
  pats_e1xpval.dats \
  pats_e1xpval_error.dats \
  pats_trans1_error.dats \
  pats_trans1_e0xp.dats \
  pats_trans1_effect.dats \
  pats_trans1_sort.dats \
  pats_trans1_staexp.dats \
  pats_trans1_p0at.dats \
  pats_trans1_syndef.dats \
  pats_trans1_dynexp.dats \
  pats_trans1_decl.dats \
  pats_staexp2.sats \
  pats_staexp2.dats \
  pats_stacst2.sats \
  pats_stacst2.dats \
  pats_staexp2_print.dats \
  pats_staexp2_pprint.dats \
  pats_staexp2_sort.dats \
  pats_staexp2_scst.dats \
  pats_staexp2_svar.dats \
  pats_staexp2_svvar.dats \
  pats_staexp2_hole.dats \
  pats_staexp2_ctxt.dats \
  pats_staexp2_dcon.dats \
  pats_staexp2_skexp.dats \
  pats_staexp2_szexp.dats \
  pats_staexp2_util.sats \
  pats_staexp2_util1.dats \
  pats_staexp2_util2.dats \
  pats_staexp2_util3.dats \
  pats_staexp2_error.sats \
  pats_staexp2_error.dats \
  pats_staexp2_solve.sats \
  pats_staexp2_solve.dats \
  pats_patcst2.sats \
  pats_patcst2.dats \
  pats_dynexp2.sats \
  pats_dynexp2.dats \
  pats_dyncst2.sats \
  pats_dyncst2.dats \
  pats_dynexp2_print.dats \
  pats_dynexp2_dcst.dats \
  pats_dynexp2_dvar.dats \
  pats_dynexp2_dmac.dats \
  pats_dynexp2_util.dats \
  pats_staexp2_appenv.hats \
  pats_dynexp2_appenv.hats \
  pats_dynexp2_mapgen.dats \
  pats_trans2.sats \
  pats_namespace.sats \
  pats_namespace.dats \
  pats_trans2_env.sats \
  pats_trans2_env.dats \
  pats_trans2_error.dats \
  pats_trans2_sort.dats \
  pats_trans2_staexp.dats \
  pats_trans2_p1at.dats \
  pats_trans2_dynexp.dats \
  pats_trans2_impdec.dats \
  pats_trans2_decl.dats \
  pats_codegen2.sats \
  pats_codegen2.dats \
  pats_codegen2_util.dats \
  pats_codegen2_absrec.dats \
  pats_codegen2_datype.dats \
  pats_codegen2_fprint.dats \
  pats_jsonize_synent2.sats \
  pats_jsonize_synent2.dats \
  pats_dynexp3.sats \
  pats_dynexp3.dats \
  pats_dynexp3_print.dats \
  pats_trans3.sats \
  pats_trans3_error.dats \
  pats_trans3_util.dats \
  pats_trans3_env.sats \
  pats_trans3_env.dats \
  pats_trans3_env_print.dats \
  pats_trans3_env_scst.dats \
  pats_trans3_env_svar.dats \
  pats_trans3_env_termet.dats \
  pats_trans3_env_effect.dats \
  pats_trans3_env_dvar.dats \
  pats_trans3_env_lamlp.dats \
  pats_trans3_env_pfman.dats \
  pats_trans3_env_lstate.dats \
  pats_dmacro2.sats \
  pats_dmacro2.dats \
  pats_dmacro2_print.dats \
  pats_dmacro2_eval0.dats \
  pats_dmacro2_eval1.dats \
  pats_trans3_p2at.dats \
  pats_trans3_patcon.dats \
  pats_trans3_syncst.dats \
  pats_trans3_dynexp_up.dats \
  pats_trans3_dynexp_dn.dats \
  pats_trans3_appsym.dats \
  pats_trans3_caseof.dats \
  pats_trans3_selab.dats \
  pats_trans3_ptrof.dats \
  pats_trans3_viewat.dats \
  pats_trans3_deref.dats \
  pats_trans3_assgn.dats \
  pats_trans3_xchng.dats \
  pats_trans3_lvalres.dats \
  pats_trans3_fldfrat.dats \
  pats_trans3_looping.dats \
  pats_trans3_decl.dats \
  pats_lintprgm.sats \
  pats_lintprgm.dats \
  pats_lintprgm_print.dats \
  pats_lintprgm_myint.cats \
  pats_lintprgm_myint.dats \
  pats_lintprgm_solve.dats \
  pats_constraint3.sats \
  pats_constraint3.dats \
  pats_constraint3_print.dats \
  pats_constraint3_appenv.hats \
  pats_constraint3_mapgen.dats \
  pats_constraint3_jsonize.dats \
  pats_constraint3_init.dats \
  pats_constraint3_simplify.dats \
  pats_constraint3_icnstr.dats \
  pats_constraint3_solve.dats \
  pats_histaexp.sats \
  pats_histaexp.dats \
  pats_histaexp_print.dats \
  pats_histaexp_funlab.dats \
  pats_hidynexp.sats \
  pats_hidynexp.dats \
  pats_hidynexp_print.dats \
  pats_hidynexp_util.dats \
  pats_typerase.sats \
  pats_typerase_error.dats \
  pats_typerase_staexp.dats \
  pats_typerase_dynexp.dats \
  pats_typerase_decl.dats \
  pats_ccomp.sats \
  pats_ccomp.dats \
  pats_ccomp_error.dats \
  pats_ccomp_print.dats \
  pats_ccomp_hitype.dats \
  pats_ccomp_tmplab.dats \
  pats_ccomp_tmpvar.dats \
  pats_ccomp_d2env.dats \
  pats_ccomp_funlab.dats \
  pats_ccomp_funent.dats \
  pats_ccomp_util.dats \
  pats_ccomp_ccompenv.dats \
  pats_ccomp_instrseq.dats \
  pats_ccomp_hipat.dats \
  pats_ccomp_dynexp.dats \
  pats_ccomp_caseof.dats \
  pats_ccomp_claulst.dats \
  pats_ccomp_lazyeval.dats \
  pats_ccomp_trywith.dats \
  pats_ccomp_looping.dats \
  pats_ccomp_decl.dats \
  pats_ccomp_subst.dats \
  pats_ccomp_environ.dats \
  pats_ccomp_template.dats \
  pats_ccomp_emit.dats \
  pats_ccomp_emit2.dats \
  pats_ccomp_emit3.dats \
  pats_ccomp_main.dats \


SOURCESsta := $(filter %.sats, $(SOURCES))
SOURCESdyn := $(filter %.dats, $(SOURCES))

######

TARGETS := \
BUILD/pats_error_sats.c \
BUILD/pats_error_dats.c \
BUILD/pats_intinf_sats.c \
BUILD/pats_intinf_dats.c \
BUILD/pats_counter_sats.c \
BUILD/pats_counter_dats.c \
BUILD/pats_utils_sats.c \
BUILD/pats_utils_dats.c \
BUILD/pats_global_sats.c \
BUILD/pats_global_dats.c \
BUILD/pats_basics_sats.c \
BUILD/pats_basics_dats.c \
BUILD/pats_comarg_sats.c \
BUILD/pats_comarg_dats.c \
BUILD/pats_stamp_sats.c \
BUILD/pats_stamp_dats.c \
BUILD/pats_symbol_sats.c \
BUILD/pats_symbol_dats.c \
BUILD/pats_filename_sats.c \
BUILD/pats_filename_dats.c \
BUILD/pats_filename_reloc_dats.c \
BUILD/pats_location_sats.c \
BUILD/pats_location_dats.c \
BUILD/pats_jsonize_sats.c \
BUILD/pats_jsonize_dats.c \
BUILD/pats_errmsg_sats.c \
BUILD/pats_errmsg_dats.c \
BUILD/pats_reader_sats.c \
BUILD/pats_reader_dats.c \
BUILD/pats_lexbuf_sats.c \
BUILD/pats_lexbuf_dats.c \
BUILD/pats_lexing_sats.c \
BUILD/pats_lexing_dats.c \
BUILD/pats_lexing_print_dats.c \
BUILD/pats_lexing_error_dats.c \
BUILD/pats_lexing_token_dats.c \
BUILD/pats_label_sats.c \
BUILD/pats_label_dats.c \
BUILD/pats_effect_sats.c \
BUILD/pats_effect_dats.c \
BUILD/pats_fixity_sats.c \
BUILD/pats_fixity_prec_dats.c \
BUILD/pats_fixity_fxty_dats.c \
BUILD/pats_syntax_sats.c \
BUILD/pats_syntax_dats.c \
BUILD/pats_syntax_print_dats.c \
BUILD/pats_depgen_sats.c \
BUILD/pats_depgen_dats.c \
BUILD/pats_taggen_sats.c \
BUILD/pats_taggen_dats.c \
BUILD/pats_tokbuf_sats.c \
BUILD/pats_tokbuf_dats.c \
BUILD/pats_parsing_sats.c \
BUILD/pats_parsing_dats.c \
BUILD/pats_parsing_error_dats.c \
BUILD/pats_parsing_util_dats.c \
BUILD/pats_parsing_kwds_dats.c \
BUILD/pats_parsing_base_dats.c \
BUILD/pats_parsing_e0xp_dats.c \
BUILD/pats_parsing_sort_dats.c \
BUILD/pats_parsing_staexp_dats.c \
BUILD/pats_parsing_p0at_dats.c \
BUILD/pats_parsing_dynexp_dats.c \
BUILD/pats_parsing_decl_dats.c \
BUILD/pats_parsing_toplevel_dats.c \
BUILD/pats_symmap_sats.c \
BUILD/pats_symmap_dats.c \
BUILD/pats_symenv_sats.c \
BUILD/pats_symenv_dats.c \
BUILD/pats_staexp1_sats.c \
BUILD/pats_staexp1_dats.c \
BUILD/pats_staexp1_print_dats.c \
BUILD/pats_dynexp1_sats.c \
BUILD/pats_dynexp1_dats.c \
BUILD/pats_dynexp1_print_dats.c \
BUILD/pats_trans1_sats.c \
BUILD/pats_trans1_env_sats.c \
BUILD/pats_trans1_env_dats.c \
BUILD/pats_e1xpval_sats.c \
BUILD/pats_e1xpval_dats.c \
BUILD/pats_e1xpval_error_dats.c \
BUILD/pats_trans1_error_dats.c \
BUILD/pats_trans1_e0xp_dats.c \
BUILD/pats_trans1_effect_dats.c \
BUILD/pats_trans1_sort_dats.c \
BUILD/pats_trans1_staexp_dats.c \
BUILD/pats_trans1_p0at_dats.c \
BUILD/pats_trans1_syndef_dats.c \
BUILD/pats_trans1_dynexp_dats.c \
BUILD/pats_trans1_decl_dats.c \
BUILD/pats_staexp2_sats.c \
BUILD/pats_staexp2_dats.c \
BUILD/pats_stacst2_sats.c \
BUILD/pats_stacst2_dats.c \
BUILD/pats_staexp2_print_dats.c \
BUILD/pats_staexp2_pprint_dats.c \
BUILD/pats_staexp2_sort_dats.c \
BUILD/pats_staexp2_scst_dats.c \
BUILD/pats_staexp2_svar_dats.c \
BUILD/pats_staexp2_svvar_dats.c \
BUILD/pats_staexp2_hole_dats.c \
BUILD/pats_staexp2_ctxt_dats.c \
BUILD/pats_staexp2_dcon_dats.c \
BUILD/pats_staexp2_skexp_dats.c \
BUILD/pats_staexp2_szexp_dats.c \
BUILD/pats_staexp2_util_sats.c \
BUILD/pats_staexp2_util1_dats.c \
BUILD/pats_staexp2_util2_dats.c \
BUILD/pats_staexp2_util3_dats.c \
BUILD/pats_staexp2_error_sats.c \
BUILD/pats_staexp2_error_dats.c \
BUILD/pats_staexp2_solve_sats.c \
BUILD/pats_staexp2_solve_dats.c \
BUILD/pats_patcst2_sats.c \
BUILD/pats_patcst2_dats.c \
BUILD/pats_dynexp2_sats.c \
BUILD/pats_dynexp2_dats.c \
BUILD/pats_dyncst2_sats.c \
BUILD/pats_dyncst2_dats.c \
BUILD/pats_dynexp2_print_dats.c \
BUILD/pats_dynexp2_dcst_dats.c \
BUILD/pats_dynexp2_dvar_dats.c \
BUILD/pats_dynexp2_dmac_dats.c \
BUILD/pats_dynexp2_util_dats.c \
BUILD/pats_dynexp2_mapgen_dats.c \
BUILD/pats_trans2_sats.c \
BUILD/pats_namespace_sats.c \
BUILD/pats_namespace_dats.c \
BUILD/pats_trans2_env_sats.c \
BUILD/pats_trans2_env_dats.c \
BUILD/pats_trans2_error_dats.c \
BUILD/pats_trans2_sort_dats.c \
BUILD/pats_trans2_staexp_dats.c \
BUILD/pats_trans2_p1at_dats.c \
BUILD/pats_trans2_dynexp_dats.c \
BUILD/pats_trans2_impdec_dats.c \
BUILD/pats_trans2_decl_dats.c \
BUILD/pats_codegen2_sats.c \
BUILD/pats_codegen2_dats.c \
BUILD/pats_codegen2_util_dats.c \
BUILD/pats_codegen2_absrec_dats.c \
BUILD/pats_codegen2_datype_dats.c \
BUILD/pats_codegen2_fprint_dats.c \
BUILD/pats_jsonize_synent2_sats.c \
BUILD/pats_jsonize_synent2_dats.c \
BUILD/pats_dynexp3_sats.c \
BUILD/pats_dynexp3_dats.c \
BUILD/pats_dynexp3_print_dats.c \
BUILD/pats_trans3_sats.c \
BUILD/pats_trans3_error_dats.c \
BUILD/pats_trans3_util_dats.c \
BUILD/pats_trans3_env_sats.c \
BUILD/pats_trans3_env_dats.c \
BUILD/pats_trans3_env_print_dats.c \
BUILD/pats_trans3_env_scst_dats.c \
BUILD/pats_trans3_env_svar_dats.c \
BUILD/pats_trans3_env_termet_dats.c \
BUILD/pats_trans3_env_effect_dats.c \
BUILD/pats_trans3_env_dvar_dats.c \
BUILD/pats_trans3_env_lamlp_dats.c \
BUILD/pats_trans3_env_pfman_dats.c \
BUILD/pats_trans3_env_lstate_dats.c \
BUILD/pats_dmacro2_sats.c \
BUILD/pats_dmacro2_dats.c \
BUILD/pats_dmacro2_print_dats.c \
BUILD/pats_dmacro2_eval0_dats.c \
BUILD/pats_dmacro2_eval1_dats.c \
BUILD/pats_trans3_p2at_dats.c \
BUILD/pats_trans3_patcon_dats.c \
BUILD/pats_trans3_syncst_dats.c \
BUILD/pats_trans3_dynexp_up_dats.c \
BUILD/pats_trans3_dynexp_dn_dats.c \
BUILD/pats_trans3_appsym_dats.c \
BUILD/pats_trans3_caseof_dats.c \
BUILD/pats_trans3_selab_dats.c \
BUILD/pats_trans3_ptrof_dats.c \
BUILD/pats_trans3_viewat_dats.c \
BUILD/pats_trans3_deref_dats.c \
BUILD/pats_trans3_assgn_dats.c \
BUILD/pats_trans3_xchng_dats.c \
BUILD/pats_trans3_lvalres_dats.c \
BUILD/pats_trans3_fldfrat_dats.c \
BUILD/pats_trans3_looping_dats.c \
BUILD/pats_trans3_decl_dats.c \
BUILD/pats_lintprgm_sats.c \
BUILD/pats_lintprgm_dats.c \
BUILD/pats_lintprgm_print_dats.c \
BUILD/pats_lintprgm_myint_dats.c \
BUILD/pats_lintprgm_solve_dats.c \
BUILD/pats_constraint3_sats.c \
BUILD/pats_constraint3_dats.c \
BUILD/pats_constraint3_print_dats.c \
BUILD/pats_constraint3_mapgen_dats.c \
BUILD/pats_constraint3_jsonize_dats.c \
BUILD/pats_constraint3_init_dats.c \
BUILD/pats_constraint3_simplify_dats.c \
BUILD/pats_constraint3_icnstr_dats.c \
BUILD/pats_constraint3_solve_dats.c \
BUILD/pats_histaexp_sats.c \
BUILD/pats_histaexp_dats.c \
BUILD/pats_histaexp_print_dats.c \
BUILD/pats_histaexp_funlab_dats.c \
BUILD/pats_hidynexp_sats.c \
BUILD/pats_hidynexp_dats.c \
BUILD/pats_hidynexp_print_dats.c \
BUILD/pats_hidynexp_util_dats.c \
BUILD/pats_typerase_sats.c \
BUILD/pats_typerase_error_dats.c \
BUILD/pats_typerase_staexp_dats.c \
BUILD/pats_typerase_dynexp_dats.c \
BUILD/pats_typerase_decl_dats.c \
BUILD/pats_ccomp_sats.c \
BUILD/pats_ccomp_dats.c \
BUILD/pats_ccomp_error_dats.c \
BUILD/pats_ccomp_print_dats.c \
BUILD/pats_ccomp_hitype_dats.c \
BUILD/pats_ccomp_tmplab_dats.c \
BUILD/pats_ccomp_tmpvar_dats.c \
BUILD/pats_ccomp_d2env_dats.c \
BUILD/pats_ccomp_funlab_dats.c \
BUILD/pats_ccomp_funent_dats.c \
BUILD/pats_ccomp_util_dats.c \
BUILD/pats_ccomp_ccompenv_dats.c \
BUILD/pats_ccomp_instrseq_dats.c \
BUILD/pats_ccomp_hipat_dats.c \
BUILD/pats_ccomp_dynexp_dats.c \
BUILD/pats_ccomp_caseof_dats.c \
BUILD/pats_ccomp_claulst_dats.c \
BUILD/pats_ccomp_lazyeval_dats.c \
BUILD/pats_ccomp_trywith_dats.c \
BUILD/pats_ccomp_looping_dats.c \
BUILD/pats_ccomp_decl_dats.c \
BUILD/pats_ccomp_subst_dats.c \
BUILD/pats_ccomp_environ_dats.c \
BUILD/pats_ccomp_template_dats.c \
BUILD/pats_ccomp_emit_dats.c \
BUILD/pats_ccomp_emit2_dats.c \
BUILD/pats_ccomp_emit3_dats.c \
BUILD/pats_ccomp_main_dats.c \

TARGETS += BUILD/pats_main_dats.c
TARGETS += BUILD/pats_main_none_dats.c

######

OBJECTS := \
BUILD/pats_error_sats.o \
BUILD/pats_error_dats.o \
BUILD/pats_intinf_sats.o \
BUILD/pats_intinf_dats.o \
BUILD/pats_counter_sats.o \
BUILD/pats_counter_dats.o \
BUILD/pats_utils_sats.o \
BUILD/pats_utils_dats.o \
BUILD/pats_global_sats.o \
BUILD/pats_global_dats.o \
BUILD/pats_basics_sats.o \
BUILD/pats_basics_dats.o \
BUILD/pats_comarg_sats.o \
BUILD/pats_comarg_dats.o \
BUILD/pats_stamp_sats.o \
BUILD/pats_stamp_dats.o \
BUILD/pats_symbol_sats.o \
BUILD/pats_symbol_dats.o \
BUILD/pats_filename_sats.o \
BUILD/pats_filename_dats.o \
BUILD/pats_filename_reloc_dats.o \
BUILD/pats_location_sats.o \
BUILD/pats_location_dats.o \
BUILD/pats_jsonize_sats.o \
BUILD/pats_jsonize_dats.o \
BUILD/pats_errmsg_sats.o \
BUILD/pats_errmsg_dats.o \
BUILD/pats_reader_sats.o \
BUILD/pats_reader_dats.o \
BUILD/pats_lexbuf_sats.o \
BUILD/pats_lexbuf_dats.o \
BUILD/pats_lexing_sats.o \
BUILD/pats_lexing_dats.o \
BUILD/pats_lexing_print_dats.o \
BUILD/pats_lexing_error_dats.o \
BUILD/pats_lexing_token_dats.o \
BUILD/pats_label_sats.o \
BUILD/pats_label_dats.o \
BUILD/pats_effect_sats.o \
BUILD/pats_effect_dats.o \
BUILD/pats_fixity_sats.o \
BUILD/pats_fixity_prec_dats.o \
BUILD/pats_fixity_fxty_dats.o \
BUILD/pats_syntax_sats.o \
BUILD/pats_syntax_dats.o \
BUILD/pats_syntax_print_dats.o \
BUILD/pats_depgen_sats.o \
BUILD/pats_depgen_dats.o \
BUILD/pats_taggen_sats.o \
BUILD/pats_taggen_dats.o \
BUILD/pats_tokbuf_sats.o \
BUILD/pats_tokbuf_dats.o \
BUILD/pats_parsing_sats.o \
BUILD/pats_parsing_dats.o \
BUILD/pats_parsing_error_dats.o \
BUILD/pats_parsing_util_dats.o \
BUILD/pats_parsing_kwds_dats.o \
BUILD/pats_parsing_base_dats.o \
BUILD/pats_parsing_e0xp_dats.o \
BUILD/pats_parsing_sort_dats.o \
BUILD/pats_parsing_staexp_dats.o \
BUILD/pats_parsing_p0at_dats.o \
BUILD/pats_parsing_dynexp_dats.o \
BUILD/pats_parsing_decl_dats.o \
BUILD/pats_parsing_toplevel_dats.o \
BUILD/pats_symmap_sats.o \
BUILD/pats_symmap_dats.o \
BUILD/pats_symenv_sats.o \
BUILD/pats_symenv_dats.o \
BUILD/pats_staexp1_sats.o \
BUILD/pats_staexp1_dats.o \
BUILD/pats_staexp1_print_dats.o \
BUILD/pats_dynexp1_sats.o \
BUILD/pats_dynexp1_dats.o \
BUILD/pats_dynexp1_print_dats.o \
BUILD/pats_trans1_sats.o \
BUILD/pats_trans1_env_sats.o \
BUILD/pats_trans1_env_dats.o \
BUILD/pats_e1xpval_sats.o \
BUILD/pats_e1xpval_dats.o \
BUILD/pats_e1xpval_error_dats.o \
BUILD/pats_trans1_error_dats.o \
BUILD/pats_trans1_e0xp_dats.o \
BUILD/pats_trans1_effect_dats.o \
BUILD/pats_trans1_sort_dats.o \
BUILD/pats_trans1_staexp_dats.o \
BUILD/pats_trans1_p0at_dats.o \
BUILD/pats_trans1_syndef_dats.o \
BUILD/pats_trans1_dynexp_dats.o \
BUILD/pats_trans1_decl_dats.o \
BUILD/pats_staexp2_sats.o \
BUILD/pats_staexp2_dats.o \
BUILD/pats_stacst2_sats.o \
BUILD/pats_stacst2_dats.o \
BUILD/pats_staexp2_print_dats.o \
BUILD/pats_staexp2_pprint_dats.o \
BUILD/pats_staexp2_sort_dats.o \
BUILD/pats_staexp2_scst_dats.o \
BUILD/pats_staexp2_svar_dats.o \
BUILD/pats_staexp2_svvar_dats.o \
BUILD/pats_staexp2_hole_dats.o \
BUILD/pats_staexp2_ctxt_dats.o \
BUILD/pats_staexp2_dcon_dats.o \
BUILD/pats_staexp2_skexp_dats.o \
BUILD/pats_staexp2_szexp_dats.o \
BUILD/pats_staexp2_util_sats.o \
BUILD/pats_staexp2_util1_dats.o \
BUILD/pats_staexp2_util2_dats.o \
BUILD/pats_staexp2_util3_dats.o \
BUILD/pats_staexp2_error_sats.o \
BUILD/pats_staexp2_error_dats.o \
BUILD/pats_staexp2_solve_sats.o \
BUILD/pats_staexp2_solve_dats.o \
BUILD/pats_patcst2_sats.o \
BUILD/pats_patcst2_dats.o \
BUILD/pats_dynexp2_sats.o \
BUILD/pats_dynexp2_dats.o \
BUILD/pats_dyncst2_sats.o \
BUILD/pats_dyncst2_dats.o \
BUILD/pats_dynexp2_print_dats.o \
BUILD/pats_dynexp2_dcst_dats.o \
BUILD/pats_dynexp2_dvar_dats.o \
BUILD/pats_dynexp2_dmac_dats.o \
BUILD/pats_dynexp2_util_dats.o \
BUILD/pats_dynexp2_mapgen_dats.o \
BUILD/pats_trans2_sats.o \
BUILD/pats_namespace_sats.o \
BUILD/pats_namespace_dats.o \
BUILD/pats_trans2_env_sats.o \
BUILD/pats_trans2_env_dats.o \
BUILD/pats_trans2_error_dats.o \
BUILD/pats_trans2_sort_dats.o \
BUILD/pats_trans2_staexp_dats.o \
BUILD/pats_trans2_p1at_dats.o \
BUILD/pats_trans2_dynexp_dats.o \
BUILD/pats_trans2_impdec_dats.o \
BUILD/pats_trans2_decl_dats.o \
BUILD/pats_codegen2_sats.o \
BUILD/pats_codegen2_dats.o \
BUILD/pats_codegen2_util_dats.o \
BUILD/pats_codegen2_absrec_dats.o \
BUILD/pats_codegen2_datype_dats.o \
BUILD/pats_codegen2_fprint_dats.o \
BUILD/pats_jsonize_synent2_sats.o \
BUILD/pats_jsonize_synent2_dats.o \
BUILD/pats_dynexp3_sats.o \
BUILD/pats_dynexp3_dats.o \
BUILD/pats_dynexp3_print_dats.o \
BUILD/pats_trans3_sats.o \
BUILD/pats_trans3_error_dats.o \
BUILD/pats_trans3_util_dats.o \
BUILD/pats_trans3_env_sats.o \
BUILD/pats_trans3_env_dats.o \
BUILD/pats_trans3_env_print_dats.o \
BUILD/pats_trans3_env_scst_dats.o \
BUILD/pats_trans3_env_svar_dats.o \
BUILD/pats_trans3_env_termet_dats.o \
BUILD/pats_trans3_env_effect_dats.o \
BUILD/pats_trans3_env_dvar_dats.o \
BUILD/pats_trans3_env_lamlp_dats.o \
BUILD/pats_trans3_env_pfman_dats.o \
BUILD/pats_trans3_env_lstate_dats.o \
BUILD/pats_dmacro2_sats.o \
BUILD/pats_dmacro2_dats.o \
BUILD/pats_dmacro2_print_dats.o \
BUILD/pats_dmacro2_eval0_dats.o \
BUILD/pats_dmacro2_eval1_dats.o \
BUILD/pats_trans3_p2at_dats.o \
BUILD/pats_trans3_patcon_dats.o \
BUILD/pats_trans3_syncst_dats.o \
BUILD/pats_trans3_dynexp_up_dats.o \
BUILD/pats_trans3_dynexp_dn_dats.o \
BUILD/pats_trans3_appsym_dats.o \
BUILD/pats_trans3_caseof_dats.o \
BUILD/pats_trans3_selab_dats.o \
BUILD/pats_trans3_ptrof_dats.o \
BUILD/pats_trans3_viewat_dats.o \
BUILD/pats_trans3_deref_dats.o \
BUILD/pats_trans3_assgn_dats.o \
BUILD/pats_trans3_xchng_dats.o \
BUILD/pats_trans3_lvalres_dats.o \
BUILD/pats_trans3_fldfrat_dats.o \
BUILD/pats_trans3_looping_dats.o \
BUILD/pats_trans3_decl_dats.o \
BUILD/pats_lintprgm_sats.o \
BUILD/pats_lintprgm_dats.o \
BUILD/pats_lintprgm_print_dats.o \
BUILD/pats_lintprgm_myint_dats.o \
BUILD/pats_lintprgm_solve_dats.o \
BUILD/pats_constraint3_sats.o \
BUILD/pats_constraint3_dats.o \
BUILD/pats_constraint3_print_dats.o \
BUILD/pats_constraint3_mapgen_dats.o \
BUILD/pats_constraint3_jsonize_dats.o \
BUILD/pats_constraint3_init_dats.o \
BUILD/pats_constraint3_simplify_dats.o \
BUILD/pats_constraint3_icnstr_dats.o \
BUILD/pats_constraint3_solve_dats.o \
BUILD/pats_histaexp_sats.o \
BUILD/pats_histaexp_dats.o \
BUILD/pats_histaexp_print_dats.o \
BUILD/pats_histaexp_funlab_dats.o \
BUILD/pats_hidynexp_sats.o \
BUILD/pats_hidynexp_dats.o \
BUILD/pats_hidynexp_print_dats.o \
BUILD/pats_hidynexp_util_dats.o \
BUILD/pats_typerase_sats.o \
BUILD/pats_typerase_error_dats.o \
BUILD/pats_typerase_staexp_dats.o \
BUILD/pats_typerase_dynexp_dats.o \
BUILD/pats_typerase_decl_dats.o \
BUILD/pats_ccomp_sats.o \
BUILD/pats_ccomp_dats.o \
BUILD/pats_ccomp_error_dats.o \
BUILD/pats_ccomp_print_dats.o \
BUILD/pats_ccomp_hitype_dats.o \
BUILD/pats_ccomp_tmplab_dats.o \
BUILD/pats_ccomp_tmpvar_dats.o \
BUILD/pats_ccomp_d2env_dats.o \
BUILD/pats_ccomp_funlab_dats.o \
BUILD/pats_ccomp_funent_dats.o \
BUILD/pats_ccomp_util_dats.o \
BUILD/pats_ccomp_ccompenv_dats.o \
BUILD/pats_ccomp_instrseq_dats.o \
BUILD/pats_ccomp_hipat_dats.o \
BUILD/pats_ccomp_dynexp_dats.o \
BUILD/pats_ccomp_caseof_dats.o \
BUILD/pats_ccomp_claulst_dats.o \
BUILD/pats_ccomp_lazyeval_dats.o \
BUILD/pats_ccomp_trywith_dats.o \
BUILD/pats_ccomp_looping_dats.o \
BUILD/pats_ccomp_decl_dats.o \
BUILD/pats_ccomp_subst_dats.o \
BUILD/pats_ccomp_environ_dats.o \
BUILD/pats_ccomp_template_dats.o \
BUILD/pats_ccomp_emit_dats.o \
BUILD/pats_ccomp_emit2_dats.o \
BUILD/pats_ccomp_emit3_dats.o \
BUILD/pats_ccomp_main_dats.o \


######

all:: tempopt

######
#
# AS-20130407:
# link order matters to GNU ld
# please keep the order '$(LIBATS) $(LIBGMP)'
# as the former depends on the latter
#
tempopt:: ; \
$(CPF) pats_*.cats BUILD
#
tempopt:: $(TARGETS)
tempopt:: $(OBJECTS) ; \
$(ATS1CC) $(CFLAGS) $(GCFLAG) \
-o BUILD/$@ pats_main.dats $(OBJECTS) $(LIBATS) $(LIBGMP)
#
######
#
libatsopt:: $(TARGETS)
#
libatsopt:: $(OBJECTS) \
BUILD/pats_main_none_dats.o; $(ARR) libatsopt.a $^
#
######
#
# for building tempopt through CMake
#
BUILD/init: ; cd BUILD; cmake ..; cd ..
BUILD/clean: ; make -C BUILD -f Makefile clean
BUILD/tempopt: ; make -C BUILD -j8 -f Makefile tempopt
#
######
CBOOT:: CBOOTgmp
######
#
CBOOTgmp:: ; $(CPF) pats_*.cats CBOOT
CBOOTgmp:: ; $(CPF) BUILD/pats_*_sats.c CBOOT
CBOOTgmp:: ; $(CPF) BUILD/pats_*_dats.c CBOOT
CBOOTgmp:: ; $(CPF) Makefile_CBOOTgmp CBOOT/Makefile
#
######
#
CBOOTint:: ; $(CPF) pats_*.cats CBOOT
CBOOTint:: ; $(CPF) BUILD/pats_*_sats.c CBOOT
CBOOTint:: ; $(CPF) BUILD/pats_*_dats.c CBOOT
CBOOTint:: ; $(CPF) Makefile_CBOOTint CBOOT/Makefile
#
######

TAGATS:: ; $(RMF) $@
TAGATS:: ; $(ATSOPT) --output-a $@ --taggen -s $(SOURCESsta) -d $(SOURCESdyn)

######
#
BUILD/pats_error_sats.c: pats_error.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_error_sats.o: BUILD/pats_error_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_error_dats.c: pats_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_error_dats.o: BUILD/pats_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_intinf_sats.c: pats_intinf.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_intinf_sats.o: BUILD/pats_intinf_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_intinf_dats.c: pats_intinf.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_intinf_dats.o: BUILD/pats_intinf_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_counter_sats.c: pats_counter.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_counter_sats.o: BUILD/pats_counter_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_counter_dats.c: pats_counter.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_counter_dats.o: BUILD/pats_counter_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_utils_sats.c: pats_utils.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_utils_sats.o: BUILD/pats_utils_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_utils_dats.c: pats_utils.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_utils_dats.o: BUILD/pats_utils_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_global_sats.c: pats_global.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_global_sats.o: BUILD/pats_global_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_global_dats.c: pats_global.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_global_dats.o: BUILD/pats_global_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_basics_sats.c: pats_basics.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_basics_sats.o: BUILD/pats_basics_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_basics_dats.c: pats_basics.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_basics_dats.o: BUILD/pats_basics_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_comarg_sats.c: pats_comarg.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_comarg_sats.o: BUILD/pats_comarg_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_comarg_dats.c: pats_comarg.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_comarg_dats.o: BUILD/pats_comarg_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_stamp_sats.c: pats_stamp.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_stamp_sats.o: BUILD/pats_stamp_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_stamp_dats.c: pats_stamp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_stamp_dats.o: BUILD/pats_stamp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symbol_sats.c: pats_symbol.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_symbol_sats.o: BUILD/pats_symbol_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symbol_dats.c: pats_symbol.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_symbol_dats.o: BUILD/pats_symbol_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_filename_sats.c: pats_filename.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_filename_sats.o: BUILD/pats_filename_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_filename_dats.c: pats_filename.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_filename_dats.o: BUILD/pats_filename_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_filename_reloc_dats.c: pats_filename_reloc.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_filename_reloc_dats.o: BUILD/pats_filename_reloc_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_location_sats.c: pats_location.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_location_sats.o: BUILD/pats_location_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_location_dats.c: pats_location.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_location_dats.o: BUILD/pats_location_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_jsonize_sats.c: pats_jsonize.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_jsonize_sats.o: BUILD/pats_jsonize_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_jsonize_dats.c: pats_jsonize.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_jsonize_dats.o: BUILD/pats_jsonize_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_errmsg_sats.c: pats_errmsg.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_errmsg_sats.o: BUILD/pats_errmsg_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_errmsg_dats.c: pats_errmsg.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_errmsg_dats.o: BUILD/pats_errmsg_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_reader_sats.c: pats_reader.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_reader_sats.o: BUILD/pats_reader_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_reader_dats.c: pats_reader.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_reader_dats.o: BUILD/pats_reader_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexbuf_sats.c: pats_lexbuf.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_lexbuf_sats.o: BUILD/pats_lexbuf_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexbuf_dats.c: pats_lexbuf.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lexbuf_dats.o: BUILD/pats_lexbuf_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexing_sats.c: pats_lexing.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_lexing_sats.o: BUILD/pats_lexing_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexing_dats.c: pats_lexing.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lexing_dats.o: BUILD/pats_lexing_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexing_print_dats.c: pats_lexing_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lexing_print_dats.o: BUILD/pats_lexing_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexing_error_dats.c: pats_lexing_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lexing_error_dats.o: BUILD/pats_lexing_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lexing_token_dats.c: pats_lexing_token.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lexing_token_dats.o: BUILD/pats_lexing_token_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_label_sats.c: pats_label.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_label_sats.o: BUILD/pats_label_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_label_dats.c: pats_label.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_label_dats.o: BUILD/pats_label_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_effect_sats.c: pats_effect.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_effect_sats.o: BUILD/pats_effect_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_effect_dats.c: pats_effect.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_effect_dats.o: BUILD/pats_effect_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_fixity_sats.c: pats_fixity.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_fixity_sats.o: BUILD/pats_fixity_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_fixity_prec_dats.c: pats_fixity_prec.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_fixity_prec_dats.o: BUILD/pats_fixity_prec_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_fixity_fxty_dats.c: pats_fixity_fxty.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_fixity_fxty_dats.o: BUILD/pats_fixity_fxty_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_syntax_sats.c: pats_syntax.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_syntax_sats.o: BUILD/pats_syntax_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_syntax_dats.c: pats_syntax.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_syntax_dats.o: BUILD/pats_syntax_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_syntax_print_dats.c: pats_syntax_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_syntax_print_dats.o: BUILD/pats_syntax_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_depgen_sats.c: pats_depgen.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_depgen_sats.o: BUILD/pats_depgen_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_depgen_dats.c: pats_depgen.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_depgen_dats.o: BUILD/pats_depgen_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_taggen_sats.c: pats_taggen.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_taggen_sats.o: BUILD/pats_taggen_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_taggen_dats.c: pats_taggen.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_taggen_dats.o: BUILD/pats_taggen_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_tokbuf_sats.c: pats_tokbuf.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_tokbuf_sats.o: BUILD/pats_tokbuf_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_tokbuf_dats.c: pats_tokbuf.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_tokbuf_dats.o: BUILD/pats_tokbuf_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_sats.c: pats_parsing.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_parsing_sats.o: BUILD/pats_parsing_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_dats.c: pats_parsing.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_dats.o: BUILD/pats_parsing_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_error_dats.c: pats_parsing_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_error_dats.o: BUILD/pats_parsing_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_util_dats.c: pats_parsing_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_util_dats.o: BUILD/pats_parsing_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_kwds_dats.c: pats_parsing_kwds.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_kwds_dats.o: BUILD/pats_parsing_kwds_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_base_dats.c: pats_parsing_base.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_base_dats.o: BUILD/pats_parsing_base_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_e0xp_dats.c: pats_parsing_e0xp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_e0xp_dats.o: BUILD/pats_parsing_e0xp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_sort_dats.c: pats_parsing_sort.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_sort_dats.o: BUILD/pats_parsing_sort_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_staexp_dats.c: pats_parsing_staexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_staexp_dats.o: BUILD/pats_parsing_staexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_p0at_dats.c: pats_parsing_p0at.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_p0at_dats.o: BUILD/pats_parsing_p0at_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_dynexp_dats.c: pats_parsing_dynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_dynexp_dats.o: BUILD/pats_parsing_dynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_decl_dats.c: pats_parsing_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_decl_dats.o: BUILD/pats_parsing_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_parsing_toplevel_dats.c: pats_parsing_toplevel.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_parsing_toplevel_dats.o: BUILD/pats_parsing_toplevel_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symmap_sats.c: pats_symmap.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_symmap_sats.o: BUILD/pats_symmap_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symmap_dats.c: pats_symmap.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_symmap_dats.o: BUILD/pats_symmap_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symenv_sats.c: pats_symenv.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_symenv_sats.o: BUILD/pats_symenv_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_symenv_dats.c: pats_symenv.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_symenv_dats.o: BUILD/pats_symenv_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp1_sats.c: pats_staexp1.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_staexp1_sats.o: BUILD/pats_staexp1_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp1_dats.c: pats_staexp1.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp1_dats.o: BUILD/pats_staexp1_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp1_print_dats.c: pats_staexp1_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp1_print_dats.o: BUILD/pats_staexp1_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp1_sats.c: pats_dynexp1.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_dynexp1_sats.o: BUILD/pats_dynexp1_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp1_dats.c: pats_dynexp1.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp1_dats.o: BUILD/pats_dynexp1_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp1_print_dats.c: pats_dynexp1_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp1_print_dats.o: BUILD/pats_dynexp1_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_sats.c: pats_trans1.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans1_sats.o: BUILD/pats_trans1_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_env_sats.c: pats_trans1_env.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans1_env_sats.o: BUILD/pats_trans1_env_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_env_dats.c: pats_trans1_env.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_env_dats.o: BUILD/pats_trans1_env_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_e1xpval_sats.c: pats_e1xpval.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_e1xpval_sats.o: BUILD/pats_e1xpval_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_e1xpval_dats.c: pats_e1xpval.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_e1xpval_dats.o: BUILD/pats_e1xpval_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_e1xpval_error_dats.c: pats_e1xpval_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_e1xpval_error_dats.o: BUILD/pats_e1xpval_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_error_dats.c: pats_trans1_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_error_dats.o: BUILD/pats_trans1_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_e0xp_dats.c: pats_trans1_e0xp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_e0xp_dats.o: BUILD/pats_trans1_e0xp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_effect_dats.c: pats_trans1_effect.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_effect_dats.o: BUILD/pats_trans1_effect_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_sort_dats.c: pats_trans1_sort.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_sort_dats.o: BUILD/pats_trans1_sort_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_staexp_dats.c: pats_trans1_staexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_staexp_dats.o: BUILD/pats_trans1_staexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_p0at_dats.c: pats_trans1_p0at.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_p0at_dats.o: BUILD/pats_trans1_p0at_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_syndef_dats.c: pats_trans1_syndef.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_syndef_dats.o: BUILD/pats_trans1_syndef_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_dynexp_dats.c: pats_trans1_dynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_dynexp_dats.o: BUILD/pats_trans1_dynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans1_decl_dats.c: pats_trans1_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans1_decl_dats.o: BUILD/pats_trans1_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_sats.c: pats_staexp2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_staexp2_sats.o: BUILD/pats_staexp2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_dats.c: pats_staexp2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_dats.o: BUILD/pats_staexp2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_stacst2_sats.c: pats_stacst2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_stacst2_sats.o: BUILD/pats_stacst2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_stacst2_dats.c: pats_stacst2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_stacst2_dats.o: BUILD/pats_stacst2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_print_dats.c: pats_staexp2_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_print_dats.o: BUILD/pats_staexp2_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_pprint_dats.c: pats_staexp2_pprint.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_pprint_dats.o: BUILD/pats_staexp2_pprint_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_sort_dats.c: pats_staexp2_sort.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_sort_dats.o: BUILD/pats_staexp2_sort_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_scst_dats.c: pats_staexp2_scst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_scst_dats.o: BUILD/pats_staexp2_scst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_svar_dats.c: pats_staexp2_svar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_svar_dats.o: BUILD/pats_staexp2_svar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_svvar_dats.c: pats_staexp2_svvar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_svvar_dats.o: BUILD/pats_staexp2_svvar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_hole_dats.c: pats_staexp2_hole.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_hole_dats.o: BUILD/pats_staexp2_hole_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_ctxt_dats.c: pats_staexp2_ctxt.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_ctxt_dats.o: BUILD/pats_staexp2_ctxt_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_dcon_dats.c: pats_staexp2_dcon.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_dcon_dats.o: BUILD/pats_staexp2_dcon_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_skexp_dats.c: pats_staexp2_skexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_skexp_dats.o: BUILD/pats_staexp2_skexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_szexp_dats.c: pats_staexp2_szexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_szexp_dats.o: BUILD/pats_staexp2_szexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_util_sats.c: pats_staexp2_util.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_staexp2_util_sats.o: BUILD/pats_staexp2_util_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_util1_dats.c: pats_staexp2_util1.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_util1_dats.o: BUILD/pats_staexp2_util1_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_util2_dats.c: pats_staexp2_util2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_util2_dats.o: BUILD/pats_staexp2_util2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_util3_dats.c: pats_staexp2_util3.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_util3_dats.o: BUILD/pats_staexp2_util3_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_error_sats.c: pats_staexp2_error.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_staexp2_error_sats.o: BUILD/pats_staexp2_error_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_error_dats.c: pats_staexp2_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_error_dats.o: BUILD/pats_staexp2_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_solve_sats.c: pats_staexp2_solve.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_staexp2_solve_sats.o: BUILD/pats_staexp2_solve_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_staexp2_solve_dats.c: pats_staexp2_solve.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_staexp2_solve_dats.o: BUILD/pats_staexp2_solve_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_patcst2_sats.c: pats_patcst2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_patcst2_sats.o: BUILD/pats_patcst2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_patcst2_dats.c: pats_patcst2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_patcst2_dats.o: BUILD/pats_patcst2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_sats.c: pats_dynexp2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_dynexp2_sats.o: BUILD/pats_dynexp2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_dats.c: pats_dynexp2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_dats.o: BUILD/pats_dynexp2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dyncst2_sats.c: pats_dyncst2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_dyncst2_sats.o: BUILD/pats_dyncst2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dyncst2_dats.c: pats_dyncst2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dyncst2_dats.o: BUILD/pats_dyncst2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_print_dats.c: pats_dynexp2_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_print_dats.o: BUILD/pats_dynexp2_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_dcst_dats.c: pats_dynexp2_dcst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_dcst_dats.o: BUILD/pats_dynexp2_dcst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_dvar_dats.c: pats_dynexp2_dvar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_dvar_dats.o: BUILD/pats_dynexp2_dvar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_dmac_dats.c: pats_dynexp2_dmac.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_dmac_dats.o: BUILD/pats_dynexp2_dmac_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_util_dats.c: pats_dynexp2_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_util_dats.o: BUILD/pats_dynexp2_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp2_mapgen_dats.c: pats_dynexp2_mapgen.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp2_mapgen_dats.o: BUILD/pats_dynexp2_mapgen_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_sats.c: pats_trans2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans2_sats.o: BUILD/pats_trans2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_namespace_sats.c: pats_namespace.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_namespace_sats.o: BUILD/pats_namespace_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_namespace_dats.c: pats_namespace.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_namespace_dats.o: BUILD/pats_namespace_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_env_sats.c: pats_trans2_env.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans2_env_sats.o: BUILD/pats_trans2_env_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_env_dats.c: pats_trans2_env.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_env_dats.o: BUILD/pats_trans2_env_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_error_dats.c: pats_trans2_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_error_dats.o: BUILD/pats_trans2_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_sort_dats.c: pats_trans2_sort.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_sort_dats.o: BUILD/pats_trans2_sort_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_staexp_dats.c: pats_trans2_staexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_staexp_dats.o: BUILD/pats_trans2_staexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_p1at_dats.c: pats_trans2_p1at.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_p1at_dats.o: BUILD/pats_trans2_p1at_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_dynexp_dats.c: pats_trans2_dynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_dynexp_dats.o: BUILD/pats_trans2_dynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_impdec_dats.c: pats_trans2_impdec.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_impdec_dats.o: BUILD/pats_trans2_impdec_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans2_decl_dats.c: pats_trans2_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans2_decl_dats.o: BUILD/pats_trans2_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_sats.c: pats_codegen2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_codegen2_sats.o: BUILD/pats_codegen2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_dats.c: pats_codegen2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_codegen2_dats.o: BUILD/pats_codegen2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_util_dats.c: pats_codegen2_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_codegen2_util_dats.o: BUILD/pats_codegen2_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_absrec_dats.c: pats_codegen2_absrec.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_codegen2_absrec_dats.o: BUILD/pats_codegen2_absrec_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_datype_dats.c: pats_codegen2_datype.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_codegen2_datype_dats.o: BUILD/pats_codegen2_datype_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_codegen2_fprint_dats.c: pats_codegen2_fprint.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_codegen2_fprint_dats.o: BUILD/pats_codegen2_fprint_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_jsonize_synent2_sats.c: pats_jsonize_synent2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_jsonize_synent2_sats.o: BUILD/pats_jsonize_synent2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_jsonize_synent2_dats.c: pats_jsonize_synent2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_jsonize_synent2_dats.o: BUILD/pats_jsonize_synent2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp3_sats.c: pats_dynexp3.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_dynexp3_sats.o: BUILD/pats_dynexp3_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp3_dats.c: pats_dynexp3.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp3_dats.o: BUILD/pats_dynexp3_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dynexp3_print_dats.c: pats_dynexp3_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dynexp3_print_dats.o: BUILD/pats_dynexp3_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_sats.c: pats_trans3.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans3_sats.o: BUILD/pats_trans3_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_error_dats.c: pats_trans3_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_error_dats.o: BUILD/pats_trans3_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_util_dats.c: pats_trans3_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_util_dats.o: BUILD/pats_trans3_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_sats.c: pats_trans3_env.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_trans3_env_sats.o: BUILD/pats_trans3_env_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_dats.c: pats_trans3_env.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_dats.o: BUILD/pats_trans3_env_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_print_dats.c: pats_trans3_env_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_print_dats.o: BUILD/pats_trans3_env_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_scst_dats.c: pats_trans3_env_scst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_scst_dats.o: BUILD/pats_trans3_env_scst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_svar_dats.c: pats_trans3_env_svar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_svar_dats.o: BUILD/pats_trans3_env_svar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_termet_dats.c: pats_trans3_env_termet.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_termet_dats.o: BUILD/pats_trans3_env_termet_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_effect_dats.c: pats_trans3_env_effect.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_effect_dats.o: BUILD/pats_trans3_env_effect_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_dvar_dats.c: pats_trans3_env_dvar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_dvar_dats.o: BUILD/pats_trans3_env_dvar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_lamlp_dats.c: pats_trans3_env_lamlp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_lamlp_dats.o: BUILD/pats_trans3_env_lamlp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_pfman_dats.c: pats_trans3_env_pfman.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_pfman_dats.o: BUILD/pats_trans3_env_pfman_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_env_lstate_dats.c: pats_trans3_env_lstate.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_env_lstate_dats.o: BUILD/pats_trans3_env_lstate_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dmacro2_sats.c: pats_dmacro2.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_dmacro2_sats.o: BUILD/pats_dmacro2_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dmacro2_dats.c: pats_dmacro2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dmacro2_dats.o: BUILD/pats_dmacro2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dmacro2_print_dats.c: pats_dmacro2_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dmacro2_print_dats.o: BUILD/pats_dmacro2_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dmacro2_eval0_dats.c: pats_dmacro2_eval0.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dmacro2_eval0_dats.o: BUILD/pats_dmacro2_eval0_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_dmacro2_eval1_dats.c: pats_dmacro2_eval1.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_dmacro2_eval1_dats.o: BUILD/pats_dmacro2_eval1_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_p2at_dats.c: pats_trans3_p2at.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_p2at_dats.o: BUILD/pats_trans3_p2at_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_patcon_dats.c: pats_trans3_patcon.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_patcon_dats.o: BUILD/pats_trans3_patcon_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_syncst_dats.c: pats_trans3_syncst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_syncst_dats.o: BUILD/pats_trans3_syncst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_dynexp_up_dats.c: pats_trans3_dynexp_up.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_dynexp_up_dats.o: BUILD/pats_trans3_dynexp_up_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_dynexp_dn_dats.c: pats_trans3_dynexp_dn.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_dynexp_dn_dats.o: BUILD/pats_trans3_dynexp_dn_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_appsym_dats.c: pats_trans3_appsym.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_appsym_dats.o: BUILD/pats_trans3_appsym_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_caseof_dats.c: pats_trans3_caseof.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_caseof_dats.o: BUILD/pats_trans3_caseof_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_selab_dats.c: pats_trans3_selab.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_selab_dats.o: BUILD/pats_trans3_selab_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_ptrof_dats.c: pats_trans3_ptrof.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_ptrof_dats.o: BUILD/pats_trans3_ptrof_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_viewat_dats.c: pats_trans3_viewat.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_viewat_dats.o: BUILD/pats_trans3_viewat_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_deref_dats.c: pats_trans3_deref.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_deref_dats.o: BUILD/pats_trans3_deref_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_assgn_dats.c: pats_trans3_assgn.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_assgn_dats.o: BUILD/pats_trans3_assgn_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_xchng_dats.c: pats_trans3_xchng.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_xchng_dats.o: BUILD/pats_trans3_xchng_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_lvalres_dats.c: pats_trans3_lvalres.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_lvalres_dats.o: BUILD/pats_trans3_lvalres_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_fldfrat_dats.c: pats_trans3_fldfrat.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_fldfrat_dats.o: BUILD/pats_trans3_fldfrat_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_looping_dats.c: pats_trans3_looping.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_looping_dats.o: BUILD/pats_trans3_looping_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_trans3_decl_dats.c: pats_trans3_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_trans3_decl_dats.o: BUILD/pats_trans3_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lintprgm_sats.c: pats_lintprgm.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_lintprgm_sats.o: BUILD/pats_lintprgm_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lintprgm_dats.c: pats_lintprgm.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lintprgm_dats.o: BUILD/pats_lintprgm_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lintprgm_print_dats.c: pats_lintprgm_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lintprgm_print_dats.o: BUILD/pats_lintprgm_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lintprgm_myint_dats.c: pats_lintprgm_myint.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lintprgm_myint_dats.o: BUILD/pats_lintprgm_myint_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_lintprgm_solve_dats.c: pats_lintprgm_solve.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_lintprgm_solve_dats.o: BUILD/pats_lintprgm_solve_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_sats.c: pats_constraint3.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_constraint3_sats.o: BUILD/pats_constraint3_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_dats.c: pats_constraint3.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_dats.o: BUILD/pats_constraint3_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_print_dats.c: pats_constraint3_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_print_dats.o: BUILD/pats_constraint3_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_mapgen_dats.c: pats_constraint3_mapgen.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_mapgen_dats.o: BUILD/pats_constraint3_mapgen_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_jsonize_dats.c: pats_constraint3_jsonize.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_jsonize_dats.o: BUILD/pats_constraint3_jsonize_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_init_dats.c: pats_constraint3_init.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_init_dats.o: BUILD/pats_constraint3_init_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_simplify_dats.c: pats_constraint3_simplify.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_simplify_dats.o: BUILD/pats_constraint3_simplify_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_icnstr_dats.c: pats_constraint3_icnstr.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_icnstr_dats.o: BUILD/pats_constraint3_icnstr_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_constraint3_solve_dats.c: pats_constraint3_solve.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_constraint3_solve_dats.o: BUILD/pats_constraint3_solve_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_histaexp_sats.c: pats_histaexp.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_histaexp_sats.o: BUILD/pats_histaexp_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_histaexp_dats.c: pats_histaexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_histaexp_dats.o: BUILD/pats_histaexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_histaexp_print_dats.c: pats_histaexp_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_histaexp_print_dats.o: BUILD/pats_histaexp_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_histaexp_funlab_dats.c: pats_histaexp_funlab.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_histaexp_funlab_dats.o: BUILD/pats_histaexp_funlab_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_hidynexp_sats.c: pats_hidynexp.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_hidynexp_sats.o: BUILD/pats_hidynexp_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_hidynexp_dats.c: pats_hidynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_hidynexp_dats.o: BUILD/pats_hidynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_hidynexp_print_dats.c: pats_hidynexp_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_hidynexp_print_dats.o: BUILD/pats_hidynexp_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_hidynexp_util_dats.c: pats_hidynexp_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_hidynexp_util_dats.o: BUILD/pats_hidynexp_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_typerase_sats.c: pats_typerase.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_typerase_sats.o: BUILD/pats_typerase_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_typerase_error_dats.c: pats_typerase_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_typerase_error_dats.o: BUILD/pats_typerase_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_typerase_staexp_dats.c: pats_typerase_staexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_typerase_staexp_dats.o: BUILD/pats_typerase_staexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_typerase_dynexp_dats.c: pats_typerase_dynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_typerase_dynexp_dats.o: BUILD/pats_typerase_dynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_typerase_decl_dats.c: pats_typerase_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_typerase_decl_dats.o: BUILD/pats_typerase_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_sats.c: pats_ccomp.sats; $(ATSOPT) $(DATSCC) -o $@ -s $<
BUILD/pats_ccomp_sats.o: BUILD/pats_ccomp_sats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_dats.c: pats_ccomp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_dats.o: BUILD/pats_ccomp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

# RK
BUILD/pats_ccomp_error_dats.c: pats_ccomp_error.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_error_dats.o: BUILD/pats_ccomp_error_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<
#

BUILD/pats_ccomp_print_dats.c: pats_ccomp_print.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_print_dats.o: BUILD/pats_ccomp_print_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_hitype_dats.c: pats_ccomp_hitype.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_hitype_dats.o: BUILD/pats_ccomp_hitype_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_tmplab_dats.c: pats_ccomp_tmplab.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_tmplab_dats.o: BUILD/pats_ccomp_tmplab_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_tmpvar_dats.c: pats_ccomp_tmpvar.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_tmpvar_dats.o: BUILD/pats_ccomp_tmpvar_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_d2env_dats.c: pats_ccomp_d2env.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_d2env_dats.o: BUILD/pats_ccomp_d2env_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_funlab_dats.c: pats_ccomp_funlab.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_funlab_dats.o: BUILD/pats_ccomp_funlab_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_funent_dats.c: pats_ccomp_funent.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_funent_dats.o: BUILD/pats_ccomp_funent_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_util_dats.c: pats_ccomp_util.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_util_dats.o: BUILD/pats_ccomp_util_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_ccompenv_dats.c: pats_ccomp_ccompenv.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_ccompenv_dats.o: BUILD/pats_ccomp_ccompenv_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_instrseq_dats.c: pats_ccomp_instrseq.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_instrseq_dats.o: BUILD/pats_ccomp_instrseq_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_hipat_dats.c: pats_ccomp_hipat.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_hipat_dats.o: BUILD/pats_ccomp_hipat_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_dynexp_dats.c: pats_ccomp_dynexp.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_dynexp_dats.o: BUILD/pats_ccomp_dynexp_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_caseof_dats.c: pats_ccomp_caseof.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_caseof_dats.o: BUILD/pats_ccomp_caseof_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_claulst_dats.c: pats_ccomp_claulst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_claulst_dats.o: BUILD/pats_ccomp_claulst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_lazyeval_dats.c: pats_ccomp_lazyeval.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_lazyeval_dats.o: BUILD/pats_ccomp_lazyeval_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_trywith_dats.c: pats_ccomp_trywith.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_trywith_dats.o: BUILD/pats_ccomp_trywith_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_looping_dats.c: pats_ccomp_looping.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_looping_dats.o: BUILD/pats_ccomp_looping_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_decl_dats.c: pats_ccomp_decl.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_decl_dats.o: BUILD/pats_ccomp_decl_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_subst_dats.c: pats_ccomp_subst.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_subst_dats.o: BUILD/pats_ccomp_subst_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_environ_dats.c: pats_ccomp_environ.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_environ_dats.o: BUILD/pats_ccomp_environ_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_template_dats.c: pats_ccomp_template.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_template_dats.o: BUILD/pats_ccomp_template_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_emit_dats.c: pats_ccomp_emit.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_emit_dats.o: BUILD/pats_ccomp_emit_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_emit2_dats.c: pats_ccomp_emit2.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_emit2_dats.o: BUILD/pats_ccomp_emit2_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_emit3_dats.c: pats_ccomp_emit3.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_emit3_dats.o: BUILD/pats_ccomp_emit3_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<

BUILD/pats_ccomp_main_dats.c: pats_ccomp_main.dats; $(ATSOPT) $(DATSCC) -o $@ -d $<
BUILD/pats_ccomp_main_dats.o: BUILD/pats_ccomp_main_dats.c; $(ATS1CC) $(CFLAGS) -c -o $@ $<


#
BUILD/pats_main_dats.c: \
  pats_main.dats ; $(ATSOPT) $(DATSCC) -o $@ -d $<
#
BUILD/pats_main_none_dats.o: \
BUILD/pats_main_none_dats.c; $(ATSOPT) $(CFLAGS) -o $@ $<
BUILD/pats_main_none_dats.c: \
  pats_main.dats ; $(ATSOPT) $(DATSCC) -DATS PATSOPT_MAIN_NONE -o $@ -d $<
#
######
#
# HX: '-o .depend' means appending instead of overwriting
#
depend::
	$(RMF) .depend
	$(ATSOPT) --output-a .depend --depgen -d pats_main.dats
	$(ATSOPT) --output-a .depend --depgen -s $(SOURCESsta) -d $(SOURCESdyn)
#
-include .depend
#
######
#
srclines:: ; $(WCL)   pats_main.dats $(SOURCES)
#
liblines:: ; $(WCL)   ../prelude/*.sats   ../prelude/?ATS/*.?ats   ../libc/?ATS/*.?ats   ../libats/?ATS/*.?ats ../libats/?ATS/SHARE/*.?ats
#
######

clean:: ; $(RMF) $(DIR)/*~
clean:: ; $(RMF) $(DIR)/*_?ats.c
clean:: ; $(RMF) $(DIR)/BUILD/*_?ats.o
clean:: ; $(RMF) $(DIR)/BUILD/*_?ats.c
clean:: ; $(RMF) $(DIR)/BUILD/pats_*.cats

cleanall:: clean
cleanall:: ; $(RMF) TAGATS
cleanall:: ; $(RMF) BUILD/tempopt
#

###### end of [Makefile] ######
