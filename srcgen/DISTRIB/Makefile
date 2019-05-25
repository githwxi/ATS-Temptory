######
#
#
# This Makefile is automatically generated
# from executing the following command-line:
#
# make -f Makefile.gen
#
#
######

ATSHOMEQ="$(ATSHOME)"

######

ATSCC=$(ATSHOMEQ)/bin/atscc
ATSOPT=$(ATSHOMEQ)/bin/atsopt
ATSDOC=$(ATSHOMEQ)/bin/atsdoc

######

TEMPHOMEQ=$(TEMPTORYBUILD)

######

INCLATS:=-IATS $(ATSHOMEQ)

######
#
GCFLAG=
#
# GCFLAG=-D_ATS_GCATS
#
######

CAT=cat
CPF=cp -f
CPRF=cp -rf
RMF=rm -f
RMRF=rm -rf
MAKE=make
TARZVCF=tar -zvcf

######

ATSDIST=ATS-Temptory

######

all::
#
######
#
atspackaging:: srcget_home
atspackaging:: srcget_share
#
#
######
#
atspackaging:: srcget_dist_cleanup
#
atspackaging:: ; (cd ATS-Postiats && ./autogen.sh)
#
######

srcget_home:: ; $(CPF) ../../AUTHORS $(ATSDIST)/
srcget_home:: ; $(CPF) ../../COPYING $(ATSDIST)/
srcget_home:: ; $(CPF) ../../INSTALL $(ATSDIST)/
srcget_home:: ; $(CPF) ../../VERSION $(ATSDIST)/
srcget_home:: ; $(CPF) ../../CHANGES-ats2 $(ATSDIST)/
srcget_home:: ; $(CPF) ../../CHANGES-contrib $(ATSDIST)/
#srcget_home:: ; $(CPF) ../../configure.ac $(ATSDIST)/
#srcget_home:: ; $(CPF) ../../config.mk.in $(ATSDIST)/
#srcget_home:: ; $(CPF) ../../bin/patscc_env.sh.in $(ATSDIST)/bin/
#srcget_home:: ; $(CPF) ../../bin/myatscc_env.sh.in $(ATSDIST)/bin/
#srcget_home:: ; $(CPF) ../../bin/patsopt_env.sh.in $(ATSDIST)/bin/

######
#
# srcget_share:: ; \
#   $(CPF) ../../share/Makefile.gen $(ATSDIST)/share/.
# srcget_share:: ; \
#   $(CPF) ../../share/atspre_define.hats $(ATSDIST)/share/.
# srcget_share:: ; \
#   $(CPF) ../../share/atspre_staload.hats $(ATSDIST)/share/.
# srcget_share:: ; \
#   $(CPF) ../../share/atspre_staload_libats_ML.hats $(ATSDIST)/share/.
# srcget_share:: ; \
#   $(CPF) ../../share/H/pats_atslib.h $(ATSDIST)/share/H/.
# srcget_share:: ; \
#   $(CPF) ../../share/HATS/atspre_define_pkgreloc.hats $(ATSDIST)/share/HATS/.
# srcget_share:: ; \
#   $(CPF) ../../share/HATS/atspre_staload_prelude.hats $(ATSDIST)/share/HATS/.
# srcget_share:: ; \
#   $(CPF) ../../share/HATS/atspre_staload_libats_ML.hats $(ATSDIST)/share/HATS/.
# srcget_share:: ; \
#   $(CPF) ../../share/HATS/atslib_staload_libats_libc.hats $(ATSDIST)/share/HATS/.
# #
# srcget_share:: ; $(CPF) ../../share/atsmake-pre.mk $(ATSDIST)/share/.
# srcget_share:: ; $(CPF) ../../share/atsmake-post.mk $(ATSDIST)/share/.
# #
# ######

copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/LICENSE ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/README ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/VERSION ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/share ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/libats ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/ccomp/runtime ATS-Temptory/ccomp
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/contrib ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/share ATS-Temptory
copy_to_build_dir:: ; \
$(CPRF) $(TEMPTORYBUILD)/utils ATS-Temptory

######
RELVER=$(shell cat $(TEMPTORYBUILD)/VERSION)
######
# PACKNAME=$(PACKNAMEgmp)
# atspacktarzvcf: atspacktarzvcf_int
# atspacktarzvcf: atspacktarzvcf_gmp
######
#
PACKNAMEgmp=ATS-Temptory-gmp-0.0.0
PACKNAMEgmp=ATS-Temptory-gmp-$(RELVER)
#
atspacktarzvcf_gmp:: copy_to_build_dir
atspacktarzvcf_gmp:: ; \
$(RMRF) $(PACKNAMEgmp)
atspacktarzvcf_gmp:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen -f Makefile C3NSTRINTKND=gmpknd all
atspacktarzvcf_gmp:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen -f Makefile CBOOTgmp
atspacktarzvcf_gmp:: ; \
(cd ATS-Temptory && sh ./autogen.sh && ./configure) 
atspacktarzvcf_gmp:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen/CBOOT/libc -f Makefile && \
make -C srcgen/CBOOT/libats -f Makefile && \
make -C srcgen/CBOOT/prelude -f Makefile
atspacktarzvcf_gmp:: ; \
$(CPRF) $(TEMPTORYBUILD)/srcgen/CBOOT $(PACKNAMEgmp)/srcgen/
atspacktarzvcf_gmp:: ; \
$(RMF) $(PACKNAMEgmp)/Makefile_conf
atspacktarzvcf_gmp:: ; \
$(MAKE) -C $(PACKNAMEgmp) cleanall
atspacktarzvcf_gmp:: ; \
$(TARZVCF) $(PACKNAMEgmp).tgz $(PACKNAMEgmp)/.
#
# atspacktarzvcf_gmp_up:: ; \
# scp $(PACKNAMEgmp).tgz ats-hwxi,ats-lang@web.sourceforge.net:htdocs/IMPLEMENT/Postiats/$(PACKNAME).tgz
#
######
#
PACKNAMEint=ATS-Temptory-int-0.0.0
PACKNAMEint=ATS-Temptory-int-$(RELVER)
#
atspacktarzvcf_int:: copy_to_build_dir
atspacktarzvcf_int:: ; \
$(RMRF) $(PACKNAMEint)
atspacktarzvcf_int:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen -f Makefile C3NSTRINTKND=intknd all
atspacktarzvcf_int:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen -f Makefile CBOOTint
atspacktarzvcf_int:: ; \
(cd ATS-Temptory && sh ./autogen.sh && ./configure) 
atspacktarzvcf_int:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen/CBOOT/libc -f Makefile && \
make -C srcgen/CBOOT/libats -f Makefile && \
make -C srcgen/CBOOT/prelude -f Makefile
atspacktarzvcf_int:: ; \
$(CPRF) $(TEMPTORYBUILD)/srcgen/CBOOT $(PACKNAMEint)/srcgen/
atspacktarzvcf_int:: ; \
$(RMF) $(PACKNAMEint)/Makefile_conf
atspacktarzvcf_int:: ; \
$(MAKE) -C $(PACKNAMEint) cleanall
atspacktarzvcf_int:: ; \
$(TARZVCF) $(PACKNAMEint).tgz $(PACKNAMEint)/.
#
# atspacktarzvcf_int_up:: ; scp $(PACKNAMEint).tgz ats-hwxi,ats-lang@web.sourceforge.net:htdocs/IMPLEMENT/Postiats/$(PACKNAMEint).tgz
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
