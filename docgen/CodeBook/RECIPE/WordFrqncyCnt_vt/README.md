# Counting Words

This example gives another implementation that counts words in a given
source and then sorts these words according to their frequencies.
What is special about this implementation is that it is done in a
memory-clean manner. In other words, all of the bytes allocated during
the execution of the implemented program are supposed to be freed
before the execution terminates.

Implementing memory-clean program can be highly challenging. This
claim is strongly supported by the fact that memory leaks commonly
appear during the execution of programs written in C or C++. With
languages like Java that rely on GC at run-time for memory management,
implementing memory-clean program can hardly be even attempted.

The code in `WordFreqCnt_vt.dats` is obtained from modifying the code
in `WordFreqCnt.dats`. Non-linear types like `string` and `list0`
are replaced with their linear counterparts `string_vt` and
`list0_vt`, respectively.  Consequently, combinators on these
non-linear types are replaced with the corresponding ones on the linear
types. Note that the entire replacement is guided by the type-checking
process.

One can readily execute `make` to generate `WordFrqncyCnt_vt_dats`.
To test for memory-cleaness, one can issue the following command-line:

```shell
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | valgrind ./WordFrqncyCnt_vt_dats
```

The following output from valgrind attests to the memory-cleaness of
the implemented program and the power of linear types:

```test
==19963== 
==19963== HEAP SUMMARY:
==19963==     in use at exit: 0 bytes in 0 blocks
==19963==   total heap usage: 5,539,369 allocs, 5,539,369 frees, 84,048,674 bytes allocated
==19963== 
==19963== All heap blocks were freed -- no leaks are possible
==19963== 
==19963== For counts of detected and suppressed errors, rerun with: -v
==19963== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

Happy programming in ATS-Temptory!!!
