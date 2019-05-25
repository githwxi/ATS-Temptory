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
atspacktarzvcf_gmp:: ; $(RMRF) $(PACKNAMEgmp)
atspacktarzvcf_gmp:: ; $(CPRF) ATS-Temptory $(PACKNAMEgmp)
atspacktarzvcf_gmp:: ; \
cd $(TEMPTORYBUILD) && \
make -C srcgen -f Makefile C3NSTRINTKND=gmpknd all
# make -f Makefile_devl C3NSTRINTKND=gmpknd
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
atspacktarzvcf_gmp:: ; $(CPRF) $(TEMPTORYBUILD)/srcgen/CBOOT $(PACKNAMEgmp)/srcgen/
atspacktarzvcf_gmp:: ; $(RMF) $(PACKNAMEgmp)/Makefile_conf
# atspacktarzvcf_gmp:: ; $(RMF) $(PACKNAMEgmp)/missing ; $(CPF) ATS-Temptory/missing $(PACKNAMEgmp)/
# atspacktarzvcf_gmp:: ; $(RMF) $(PACKNAMEgmp)/install-sh ; $(CPF) ATS-Temptory/install-sh $(PACKNAMEgmp)/
atspacktarzvcf_gmp:: ; $(MAKE) -C $(PACKNAMEgmp) cleanall
atspacktarzvcf_gmp:: ; $(TARZVCF) $(PACKNAMEgmp).tgz $(PACKNAMEgmp)/.

#
atspacktarzvcf_gmp_up:: ; \
scp $(PACKNAMEgmp).tgz ats-hwxi,ats-lang@web.sourceforge.net:htdocs/IMPLEMENT/Postiats/$(PACKNAME).tgz
#
######
#
PACKNAMEint=ATS-Temptory-int-0.0.0
PACKNAMEint=ATS-Temptory-int-$(RELVER)
#
atspacktarzvcf_int:: ; $(RMRF) $(PACKNAMEint)
atspacktarzvcf_int:: ; $(CPRF) ATS-Temptory $(PACKNAMEint)
atspacktarzvcf_int:: ; $(RMF) $(PACKNAMEint)/Makefile_conf
atspacktarzvcf_int:: ; $(RMF) $(PACKNAMEint)/missing ; $(CPF) ATS-Temptory/missing $(PACKNAMEint)/
atspacktarzvcf_int:: ; $(RMF) $(PACKNAMEint)/install-sh ; $(CPF) ATS-Temptory/install-sh $(PACKNAMEint)/
atspacktarzvcf_int:: ; $(MAKE) -C $(PACKNAMEint) cleanall
atspacktarzvcf_int:: ; $(TARZVCF) $(PACKNAMEint).tgz $(PACKNAMEint)/.
atspacktarzvcf_int_up:: ; scp $(PACKNAMEint).tgz ats-hwxi,ats-lang@web.sourceforge.net:htdocs/IMPLEMENT/Postiats/$(PACKNAMEint).tgz
#
######
#
# CONTRIBNAME=ATS-Temptory-contrib-0.3.13
# CONTRIBNAME=ATS-Temptory-contrib-$(PATSVER)
# #
# atscontribtarzvcf:: ; $(RMRF) $(CONTRIBNAME)
# atscontribtarzvcf:: ; $(CPRF) ATS-Temptory-contrib $(CONTRIBNAME)
# atscontribtarzvcf:: ; $(TARZVCF)  $(CONTRIBNAME).tgz  $(CONTRIBNAME)/.
# #
# atscontribtarzvcf_up:: ; \
# scp $(CONTRIBNAME).tgz ats-hwxi,ats-lang@web.sourceforge.net:htdocs/IMPLEMENT/Postiats/$(CONTRIBNAME).tgz
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o *_?ats.c
clean:: ; $(RMF) *_atxt.txt
clean:: ; $(RMF) *_atxt.dats
clean:: ; $(RMF) Makefile.exe

cleanall:: clean

###### end of [Makefile] ######
