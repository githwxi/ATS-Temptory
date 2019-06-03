######
#
# A simple Makefile
#
######
#
# HX-2019-06:
# TEMPTORY is ENV variable
#
######

TEMPACC=\
$(TEMPTORY)/bin/tempacc
TEMPOPT=\
$(TEMPTORY)/bin/tempopt

######

all:: ReadFromSTDIN_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

%_dats: %.dats; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: ReadFromSTDIN_dats; echo 1000000 | ./$<

######

clean:: ; rm -f *~
clean:: ; rm -f a.out
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f ReadFromSTDIN_dats

###### end of [Makefile] ######
