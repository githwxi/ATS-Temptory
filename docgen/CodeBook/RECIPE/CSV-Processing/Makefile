######
#
# A simple Makefile
#
######

INCLUDE=./node_modules

######

TEMPACC=\
$(TEMPTORY)/bin/tempacc
TEMPOPT=\
$(TEMPTORY)/bin/tempopt
MYTEMPACC=\
$(TEMPTORY)/bin/mytempacc

######

all:: CSV-Processing

######

regress:: CSV-Processing; ./CSV-Processing

######

CSV-Processing: \
CSV-Processing.dats; \
$(MYTEMPACC) -O2 -I$(INCLUDE) -o $@ $< -lpcre -lgc

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f a.out
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f CSV-Processing

###### end of [Makefile] ######
