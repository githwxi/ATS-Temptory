######
#
# A simple Makefile
#
######

INCLUDE=./../node_modules

######

TEMPACC=\
$(TEMPTORY)/bin/tempacc
TEMPOPT=\
$(TEMPTORY)/bin/tempopt
MYTEMPACC=\
$(TEMPTORY)/bin/mytempacc

######

all:: test01

######

test01: \
test01.dats; \
$(MYTEMPACC) -O2 -I$(INCLUDE) -o $@ $< -lgc

######

regress:: test01; ./test01

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f a.out
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f test01

###### end of [Makefile] ######
