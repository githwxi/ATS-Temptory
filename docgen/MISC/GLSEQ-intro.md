# Verbs for Linear Batch-Processing

Note that the word **linear** comes from **linear logic**, which is a great
logic discovery by French logician Jean-Yves Girard.

The commonly used verbs for linear batch-processing are essentially
the same as those in the GSEQ package. Let us take the verb `forall`
as an example.  In GLSEQ, there are two variants of `forall` that are
`forall0` and `forall1`, which are referred to as the 0-version and
1-version of the verb When the verb `forall0` (`forall1`) is applied
to a sequence, the sequence is expected to be consumed (preserved)
when the application finishes. Sometimes, we may just use a verb for
either its 0-version or 1-version. For instance, `listize` stands for
`listize0` but `forall` stands for `forall1`. There are no specific
rules for such conventional use of verbs.
