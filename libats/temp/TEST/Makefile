######
#
# A simple Makefile
#
######

all:: testall

######

testall:: ; \
make -C funmap -f Makefile testall
testall:: ; \
make -C slistref -f Makefile testall
testall:: ; \
make -C qlistref -f Makefile testall

######

cleanall:: ; \
make -C funmap -f Makefile cleanall
cleanall:: ; \
make -C slistref -f Makefile cleanall
cleanall:: ; \
make -C qlistref -f Makefile cleanall

###### end of [Makefile] ######
