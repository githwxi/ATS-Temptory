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

all:: WordFrqncyCnt_dats

######

regress:: \
WordFrqncyCnt_dats; \
$(CAT) WordFrqncyCnt.dats | ./$<

######

testall:: all regress cleanall

######
#
# %_dats: %.dats; \
# $(TEMPACC) -O2 -DATS_MEMALLOC_LIBC -o $@ $<
#
%_dats: %.dats; \
$(TEMPACC) -O2 -DATS_MEMALLOC_GCBDW -o $@ $< -lgc
#
######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) WordFrqncyCnt_dats

######

###### end of [Makefile] ######
