######
#
# A simple Makefile
#
######

TEMPOPT= \
$(TEMPTORY)/bin/tempopt

######

all:: test00
all:: test01
all:: test02

######

test00: \
test00.dats; $(TEMPOPT) -tc -d $<
test01: \
test01.dats; $(TEMPOPT) -cc -d $<
test02: \
test02.dats; $(TEMPOPT) -cc -d $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

###### end of [Makefile] ######
