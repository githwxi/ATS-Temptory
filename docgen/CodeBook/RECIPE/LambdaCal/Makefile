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

all:: LambdaCal_dats
all:: LambdaCal_rc_dats

######

regress:: \
LambdaCal_dats; \
$(CAT) LambdaCal.dats | ./$<

regress:: \
LambdaCal_rc_dats; \
$(CAT) LambdaCal_rc.dats | ./$<

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
cleanall:: ; $(RMF) LambdaCal_dats
cleanall:: ; $(RMF) LambdaCal_rc_dats

######

###### end of [Makefile] ######
