######
#
# A simple Makefile
#
######

GCC=gcc \
-std=c99 -D_XOPEN_SOURCE

TEMPOPT= $(TEMPTORY)/bin/tempopt

######

all:: test00
all:: test01_dats
all:: test02_dats

######

test00: \
test00.dats; $(TEMPOPT) -tc -d $<

######

test01_dats: test01_dats.c ; \
$(GCC) -I${TEMPTORY} -I${TEMPTORY}/ccomp/runtime -o $@ $<
test01_dats.c: test01.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test02_dats: test02_dats.c ; \
$(GCC) -I${TEMPTORY} -I${TEMPTORY}/ccomp/runtime -o $@ $<
test02_dats.c: test02.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test03_dats: test03_dats.c ; \
$(GCC) -I${TEMPTORY} -I${TEMPTORY}/ccomp/runtime -o $@ $<
test03_dats.c: test03.dats; $(TEMPOPT) -cc -o $@ -d $<

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats
cleanall:: ; $(RMF) test03_dats

###### end of [Makefile] ######
