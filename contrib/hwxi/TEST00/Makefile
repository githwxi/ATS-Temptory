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
test02: \
test02.dats; $(TEMPOPT) -cc -d $<

######

test01_dats: test01_dats.c ; \
gcc -std=c99 -D_XOPEN_SOURCE -I${TEMPTORY} -I${TEMPTORY}/ccomp/runtime -o $@ $<
test01_dats.c: test01.dats; $(TEMPOPT) -cc -o $@ -d $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats

###### end of [Makefile] ######
