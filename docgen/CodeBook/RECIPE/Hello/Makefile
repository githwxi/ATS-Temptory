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

RMF=rm -f

######

TEMPACC=$(TEMPTORY)/bin/tempacc
TEMPOPT=$(TEMPTORY)/bin/tempopt

######

all:: Hello_dats

######

testall:: all regress cleanall

######

regress:: Hello_dats; ./Hello_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) Hello_dats

######

%_dats: %.dats; $(TEMPACC) -o $@ $<

######

###### end of [Makefile] ######
