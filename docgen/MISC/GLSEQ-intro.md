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

