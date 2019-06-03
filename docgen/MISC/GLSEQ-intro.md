# Verbs for Linear Batch-Processing

Note that the word **linear** comes from **linear logic**, which is a great
logic discovery by French logician Jean-Yves Girard.

The commonly used verbs for linear batch-processing in the GLSEQ
package are essentially the same as those in the GSEQ package. Let us
take the verb `forall` as an example.  There are two variants of
`forall` in GLSEQ: `forall0` and `forall1`, which are referred to as
the 0-version and 1-version of `forall`.  If the verb `forall0`
(`forall1`) is applied to a sequence, the sequence is expected to be
consumed (preserved) at the moment when the application
finishes. Sometimes, we may just use a verb for either its 0-version
or 1-version. For instance, `listize` stands for `listize0` but
`forall` stands for `forall1`. There are really no specific rules for
such conventional use of verbs.

## Let's see some verbs in action!

I would like to revisit the famous 8-queen puzzle that asks the player
to find ways to put eight queen pieces on a chess board such that no
queen piece can attack any other ones. This time I am to present a memory-clean
program to solve the puzzle that frees all the allocated memory before its
execution terminates.

Let us first declare a linear abstract type `board` for values representing
board configurations and then implement it as a linear list:

```ats
(* ****** ****** *)

absvtbox board = ptr
vtypedef boardlst = list_vt(board)

(* ****** ****** *)

extern
fun
board_nil(): board
and
board_free(board): void
and
board_cons1(int, !board): board

(* ****** ****** *)

local

absimpl
board = list0_vt(int)

in(* in-of-local *)

implfun
board_nil() = nil_vt()
implfun
board_cons1(x0, xs) =
let
val
xs = copy(xs) in list0_vt_cons(x0, xs)
end

implfun
board_free(xs) =
list0_vt_free<int>(xs)

impltmp
glseq_listize<board><int>
  (xs) = (xs)
impltmp
glseq_forall1<board><int>
  (xs) =
(
  list0_vt_forall1<int>(xs)
) where
{
impltmp
list0_vt_forall1$test<int>
  (x0) =
(
  glseq_forall1$test<int>(x0)
)
}
impltmp
glseq_rlistize<board><int>(xs) = list0_vt_reverse(xs)

end (* end of [local] *)
```

Note that a board-value can be freed by calling `board_free`.
And as can be expected, the specific template `gfree$val<board>` is
implemented as follows:

```ats
impltmp
gfree$val<board>(xs) = board_free(xs)
```

The rest of the code in
[QueenPuzzle_vt.dats](./CODE/QueenPuzzle_vt.dats) is simply obtained
from modifying the code in
[QueenPuzzle.dats](./CODE/QueenPuzzle.dats):
Non-linear types are replaced with their linear counterparts, and,
consequently, combinators on these non-linear types are replaced with
the corresponding ones on the linear types. Note that the entire
replacement is guided by the type-checking process.

```shell
valgrind ./QueenPuzzle_vt_dats
```

The following output from valgrind attests to the memory-cleaness of
the implemented program and the power of linear types:

```test
==9656== 
==9656== HEAP SUMMARY:
==9656==     in use at exit: 0 bytes in 0 blocks
==9656==   total heap usage: 13,006 allocs, 13,006 frees, 209,104 bytes allocated
==9656== 
==9656== All heap blocks were freed -- no leaks are possible
==9656== 
==9656== For counts of detected and suppressed errors, rerun with: -v
==9656== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
```

Happy programming in ATS-Temptory!!!
