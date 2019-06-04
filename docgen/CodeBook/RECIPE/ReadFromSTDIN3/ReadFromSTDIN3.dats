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

implfun
main0() = let
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
val ui = $extfcall(uint, "alarm", 1u)
val c0 = $extfcall(sint, "fgetc", the_stdin())
val () = println!("c0 = ", c0)
val () = $extfcall(void, "perror", "fgetc")
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [ReadFromSTDIN3.dats] *)
