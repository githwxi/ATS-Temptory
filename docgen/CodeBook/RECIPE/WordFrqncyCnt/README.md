# Counting Words

This example gives an implementation that counts words in
a given source and then sorts these words according to their
frequencies.

I regard it as a good programming style to introduce
type definitions for various concepts occurring in the code:
  
```ats
//
typedef word = string
typedef iword = (int, string)
//
typedef words = list0(word)
typedef iwords = list0(iword)
//
```

The type `iword` is just for each pair consisting of an int-value and a
string-value.

Let us first read all the words from the standard input (STDIN):

```ats
val words =
FILEref_streamize_word(the_stdin())
```

At the this point, `words` is a linear stream of string-values. We can
turn this stream into a linear list:

```ats
val words = listize(words)
```

As we do not plan to use a linear list in this example, we turn this linear
list into a non-linear list:

```ats
val words = list0_vt2t(words)
```

Then we can merge-sort the list of words obtained so far:

```ats
val words = mergesort(words)
```

At this point, we have a list of words sorted according to the standard lexicographic
ordering on string-values.

The next step is to turn the sorted list of words into a list of iword-values:

```ats
val iwords =
(
  loop(words)
) where
{
fun
loop(xs: words): iwords =
(
case+ xs of
| nil() => nil()
| cons(x0, xs) => loop2(xs, x0, 1, nil())
) (* end of [loop2] *)

and
loop2
( xs: words
, x0: word, i0: int
, res: iwords): iwords =
(
case+ xs of
| nil() => 
  cons((i0, x0), res)
| cons(x1, xs) =>
  if x0 = x1
  then loop2(xs, x0, i0+1, res)
  else loop2(xs, x1, 1, cons((i0, x0), res))
) (* end of [loop2] *)
}
```

For each iword-value in `iwords`, the int-value indicates the number of
times the string-value appears in `words`.

We can now sort `iwords` based on a specific order:

```ats
val iwords =
(
mergesort(iwords)
) where
{
implement
list0_mergesort$cmp<iword>
  (iw1, iw2) =
let
  val i1 = iw1.0
  val i2 = iw2.0
in
  if i1 > i2 then ~1 else (if i1 < i2 then 1 else compare(iw1.1, iw2.1))
end
}
```

Note that the specified order indicates that one iword-value `iw1` is
less than another one `iw2` if the int-value in `iw1` is less than
that in `iw2` or the two int-values are equal and the string-value in
`iw1` is less than that in `iw2`.

Let print out the first 250 (or fewer) words together with their
frquencies:


```ats
//
#define N 250
//
val
_(*bool*) =
(
list0_iforall(iwords)
) where
{
implement
list0_iforall$test<iword>
  (i0, iw) =
if
(i0 < N)
then (println!("word#", i0+1, ": ", iw.1, "(", iw.0, ")"); true)
else false
} (* end of [val] *)
//
```

Happy programming in ATS-Temptory!!!
