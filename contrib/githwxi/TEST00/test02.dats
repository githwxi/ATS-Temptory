(* ****** ****** *)
//
// HX-2019-05-06:
// For ATS-Temptory
//
(* ****** ****** *)
//
#staload
"libats/SATS/print.sats"
#staload _ =
"libats/DATS/print.dats"
#staload _ =
"libats/DATS/stdio.dats"
//
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)
//
val () = println!("Hello", ", world", '!')
//
(* ****** ****** *)

(* end of [test02.dats] *)
