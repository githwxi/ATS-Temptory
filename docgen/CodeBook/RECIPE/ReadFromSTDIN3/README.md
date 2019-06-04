# Read from STDIN (3)

A common issue with getting input from STDIN is that the wait time
can be indefinite. In this example, this issue of indefinite waiting
is addressed by making use of the alarm signal (SIGALRM) in Unix.

The following function `FILEref_streamize_ascii` is supposed to return
a stream of ASCII codes of the characters from a given file handle (of
the type FILEref):
  
```ats
fun{}
FILEref_streamize_ascii
(inp: FILEref): stream_vt(int)
```

One can readily
implement `FILEref_streamize_ascii` by calling
`stream_vt_tabulate` with `fgetc` (declared in stdio.h):


```ats
impltmp
{}//tmp
FILEref_streamize_ascii
  (inp) =
(
  stream_vt_tabulate<int>()
) where
{
  impltmp
  stream_vt_tabulate$fopr<int>(_) =
  (
    $extfcall(int, "fgetc", inp)
  )
}

```

Note that `stream_vt_tabulate` returns an infinite stream.  In case
there are no more chars to read, `fget` returns EOF.  Conceptually, one
may think that a stream returned by `FILEref_streamize_ascii` consists
of some ASCII codes followed by infinitely many EOF's.

One can also implement
`FILEref_streamize_ascii` by calling `stream_vt_tabulopt` with `fgetc`
(declared in stdio.h):

```ats
impltmp
{}//tmp
FILEref_streamize_ascii
  (inp) =
(
  stream_vt_tabulopt<int>()
) where
{
  impltmp
  stream_vt_tabulopt$fopr<int>(_) =
  (
    $extfcall(int, "fgetc", inp)
  )
  impltmp
  stream_vt_tabulopt$test<int>(c0) = (c0 >= 0)
}
```

Note that the returned stream terminates
whenever the condition specified by `stream_vt_tabulopt$test`
is met.

In the default setting, a call to `fgetc` is blocked
until there are characters in the underlying buffer. If a signal
(SIGALRM) comes when `fget` is being blocked, `fget` returns EOF.

In the following implementation, an alarm is set (to occur) before
each call to `fgetc` and the alarm is cancelled after the call:
  
```ats
impltmp
{}//tmp
FILEref_streamize_ascii
  (inp) =
(
  stream_vt_tabulopt<int>()
) where
{
impltmp
stream_vt_tabulopt$fopr<int>(_) =
let
val u0 =
FILEref_streamize_ascii$alarm_start<>()
val c0 = $extfcall(sint, "fgetc", inp)
val u1 =
FILEref_streamize_ascii$alarm_cancel<>()
//
in
  if
  (c0 >= 0)
  then (c0)
  else (if (u1 = 0u) then (~1) else (~2))
end // end of [let]
impltmp
stream_vt_tabulopt$test<int>(c0) = (c0 >= ~1)
}
```

If `fgetc` returns EOF and `alarm_cancel` returns zero,
then it means that the error from `fget` was due to SIGALRM
being raised.

If `fgetc` returns EOF and `alarm_cancel` returns non-zero,
then it means that the error from `fget` was not due to SIGALRM
being raised.

Please see as follows the interface and default implementation for
`alarm_start` and `alarm_cancel`:

```ats
extern
fun{}
FILEref_streamize_ascii$alarm_start(): uint
extern
fun{}
FILEref_streamize_ascii$alarm_cancel(): uint
impltmp
FILEref_streamize_ascii$alarm_start<>() = alarm(0u)
impltmp
FILEref_streamize_ascii$alarm_cancel<>() = alarm(0u)
```

Before calling
`FILEref_streamize_ascii`, one needs to set a do-nothing
handler for SIGALRM (for otherwise a raised SIGALRM simply
terminates the program being executed):


```ats
implfun
main0() = let
//
var
SA0: sigaction
val () =
lrf_nullize<sigaction>(SA0)
//
val () =
sigaction_set_handler
(SA0, lam(sgn) => ((*void*)))
//
val () =
assertloc(sigaction_null(SIGALRM, SA0) = 0)
//
val cs =
(
FILEref_streamize_ascii(the_stdin())
) where
{
impltmp // expecting at one char per second
FILEref_streamize_ascii$alarm_start<>() = alarm(1u)
}
//
in
(
stream_vt_foreach0<sint>(cs)
) where
{
impltmp
stream_vt_foreach0$work<sint>(c0) =
if c0 >= 0 then print(char0_chr(c0)) else println!("ALARM!")
}
end // end of [main0]
```

Happy programming in ATS!!!
