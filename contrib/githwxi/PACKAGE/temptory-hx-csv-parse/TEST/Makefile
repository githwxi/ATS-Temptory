######
#
# A simple Makefile
#
######

RMF=rm -f

######

TEMPACC=$(TEMPTORY)/bin/tempacc
TEMPOPT=$(TEMPTORY)/bin/tempopt
MYTEMPACC=$(TEMPTORY)/bin/mytempacc

######

all:: \
test01
test01: \
test01.dats ; \
$(MYTEMPACC) -O2 -o $@ $<

all:: \
test02
test02: \
test02.dats ; \
$(MYTEMPACC) -O2 -o $@ $<

######

all:: \
test03
test03: \
test03.dats ; \
$(MYTEMPACC) -O2 -o $@ $<

######

regress:: test01; ./$<
regress:: test02; ./$<
regress:: test03; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMF) test01
cleanall:: ; $(RMF) test02
cleanall:: ; $(RMF) test03

######
#
export \
PATSHOMELOCS=\
./node_modules:./../node_modules:./../../node_modules
#
###### end of [Makefile] ######
