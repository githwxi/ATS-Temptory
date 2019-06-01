# Longest Line

Let us write a program to return the longest line in a given file.
If there are multiple lines that are longest, the one that appears
first is supposed to be returned.

I regard it as a good programming style to introduce
type definitions for various concepts occurring in the code:

```ats
vtypedef line = string_vt
vtypedef lines = stream_vt(line)
```

Note that the type `string_vt` is for linear string-values, which can
be safely freed (as linear values cannot be shared).

The following `loop` takes an int-value, a line and a linear stream of
lines such that the int-value is the length of the line, and the line
is the longest one among those that have be processed, and the stream
of lines consists of those that have not be processed:

  

```ats
fun
loop
( N0: int
, line0: line
, lines: stream_vt(line)): line =
(
case+ !lines of
|
~stream_vt_nil() => line0
|
~stream_vt_cons(line1, lines2) =>
 let
   val N1 = length(line1)
 in
   if
   (N0 < N1)
   then (free(line0); loop(N1, line1, lines2))
   else (free(line1); loop(N0, line0, lines2))
 end
)
```

Clearly, what the function `loop` returns is the longest line among
the given one (the 2nd argument) plus the given stream of lines (the
3rd argument). Note that the two linear arguments of `loop` are
considered being consumed at the moment when `loop` returns.

```

The function for find the longest line in a given file can be implemented
as follows

```ats
fun
LongestLine
( filr
: FILEref): loptn(line) =
(
let
val
lines =
FILEref_streamize_line_vt(filr)
in(*in-of-let*)
case+ !lines of
|
~stream_vt_nil
 ((*void*)) => lnone()
|
~stream_vt_cons
 (line, lines) =>
 let val N = length(line) in lsome(loop(N, line, lines)) end
end
) (* end of [LongestLine] *)
```

Please find the entirety of the program [here](./LongestLine.dat).
With valgrind, one can readily verify that the program is
memory-clean, that is, all of the memory allocated during the
execution of the program is supposed to be freed at the point of exit.

Happy programming in ATS-Temptory!!!
