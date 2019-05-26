######
#
# A simple Makefile
#
######
#
# HX-2018-01-05:
# TEMPTORY is environmental
#
######

CAT=cat
RMF=rm -f

######

TEMPACC=$(TEMPTORY)/bin/tempacc
TEMPOPT=$(TEMPTORY)/bin/tempopt

######

all:: WordFrqncyCnt_vt_dats

######

regress:: \
WordFrqncyCnt_vt_dats; \
$(CAT) WordFrqncyCnt_vt.dats | ./$<

######

testall:: all regress cleanall

######

%_dats: %.dats; \
$(TEMPACC) -O2 -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) WordFrqncyCnt_vt_dats

######

###### end of [Makefile] ######
