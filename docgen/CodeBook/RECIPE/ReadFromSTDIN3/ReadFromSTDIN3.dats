(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

#staload
"libats/libc/SATS/signal.sats"
#staload
"libats/libc/SATS/unistd.sats"

(* ****** ****** *)

extern
fun{}
FILEref_streamize_ascii
(inp: FILEref): stream_vt(int)

(* ****** ****** *)

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

(* ****** ****** *)

extern
fun{}
FILEref_streamize_ascii$alarm_start(): uint
extern
fun{}
FILEref_streamize_ascii$alarm_cancel(): uint

(* ****** ****** *)

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
  else (if (u1 != 0u) then (~2) else (~1))
end // end of [let]
impltmp
stream_vt_tabulopt$test<int>(c0) = (c0 >= ~1)
}

(* ****** ****** *)

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
impltmp
FILEref_streamize_ascii$alarm_start<>() = alarm(1u)
impltmp
FILEref_streamize_ascii$alarm_cancel<>() = alarm(0u)
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

(* ****** ****** *)

(* end of [ReadFromSTDIN3.dats] *)
