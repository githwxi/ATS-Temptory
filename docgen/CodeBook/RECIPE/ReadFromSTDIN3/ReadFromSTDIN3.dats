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
FILEref_streamize_char
(inp: FILEref): stream_vt(int)
extern
fun{}
FILEref_streamize_char$alarm_start(): uint
extern
fun{}
FILEref_streamize_char$alarm_cancel(): uint

(* ****** ****** *)

impltmp
{}//tmp
FILEref_streamize_char
  (inp) =
(
  auxmain()
) where
{
fun
auxmain(): stream_vt(int) =
$ldelay
(
let
val u0 =
FILEref_streamize_char$alarm_start<>()
//
val c0 = $extfcall(sint, "fgetc", inp)
//
val u1 =
FILEref_streamize_char$alarm_cancel<>()
//
in
  if
  (c0 >= 0)
  then
  stream_vt_cons(c0, auxmain())
  else
  (
  if
  (u1 > 0)
  then
  stream_vt_nil()
  else
  stream_vt_cons(c0, auxmain())  
  )
end // end of [let]
)
} (* end of [FILEref_streamize_char] *)

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
FILEref_streamize_char(the_stdin())
) where
{
impltmp
FILEref_streamize_char$alarm_start<>() = alarm(1u)
impltmp
FILEref_streamize_char$alarm_cancel<>() = alarm(0u)
}
//
in
(
stream_vt_foreach0<int>(cs)
) where
{
impltmp
stream_vt_foreach0$work<int>(c0) =
if c0 >= 0 then print(char0_chr(c0)) else println!("ALARM!")
}
end // end of [main0]

(* ****** ****** *)

(* end of [ReadFromSTDIN3.dats] *)
