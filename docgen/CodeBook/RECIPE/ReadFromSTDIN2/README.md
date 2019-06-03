# Read from STDIN (2)

If you have not yet read [ReadFromSTDIN](./../ReadFromSTDIN), please
do so first.

The code in this example does essentially the same as the code in
[ReadFromSTDIN](./../ReadFromSTDIN), but it is written in a style that
stresses the use of combinators in functional programming.

The following function `prompts` returns a linear stream of
integers:
  
```ats
fun
prompts
(
// argless
) : stream_vt(int) =
stream_vt_map<int><int>
(
sint_streamize_gte(0) // HX: generating 0, 1, 2, 3, ...
) where
{
  impltmp
  stream_vt_map$fopr<int><int>(i) =
  (println!("Please input an integer or type Ctrl-D:"); i)
}
```

For each integer in the stream to be computed, a message (for the
purpose of prompting the user) is printed onto the standard output
(STDOUT).

The function `tally` can be given the following combinator-based
implementation:


```ats
fun
tally() = let
  val ps = prompts()
  val xs =
  FILEref_streamize_line(the_stdin())
  val xs =
  stream_vt_filter<string>(xs) where
  {
  impltmp
  stream_vt_filter$test<string>(x0) = isneqz(x0)
  }
  val ys =
  (
  stream_vt_z2map<int,string><int>(ps, xs)
  ) where
  {
  impltmp
  stream_vt_z2map$fopr<int,string><int>(p0, x0) = $extfcall(int, "atoi", x0)
  }
in
  stream_vt_foldleft0<int><int>(ys, 0) where
  {
    impltmp
    stream_vt_foldleft0$fopr<int><int>(r0, y0) = r0 + y0
  }
end // end of [tally]
```

The code for `tally` is largely self-explanatory: `ps` refers to a
stream for producing prompts and `xs` to a stream of strings
representing non-empty lines read from STDIN; calling `z2map` on `ps`
and `xs` builds a stream `ys` of int-values where each value is
converted from a string in `xs`; calling `foldleft0` on `ys` returns
the sum of all of the int-values contained in `ys` (while consuming
the linear stream `ys`).

Happy programming in ATS!!!
