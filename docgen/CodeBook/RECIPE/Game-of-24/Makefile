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

all:: Game-of-24_dats

######

regress:: \
Game-of-24_dats; \
$(CAT) Game-of-24.dats | ./$<

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
cleanall:: ; $(RMF) Game-of-24_dats

######

###### end of [Makefile] ######
