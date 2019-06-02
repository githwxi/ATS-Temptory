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

all:: Doublets_dats

######

regress:: Doublets_dats; ./$<

######

testall:: all regress cleanall

######

%_dats: %.dats; \
$(TEMPACC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) Doublets_dats

######

###### end of [Makefile] ######
