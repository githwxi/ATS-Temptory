(* ****** ****** *)
//
// HX-2019-05-29:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

%{^
#include <time.h>
%} (* %{^ *)

(* ****** ****** *)

implement
main0((*void*)) = ()

(* ****** ****** *)

implement
string0_rand$char<>() =
$UN.cast{CharNZ}
('0' + nat0_rand_max(48))

val () =
$extfcall
( void
, "srand"
, $extfcall(uint, "time", 0)
)
val () = println!(string0_rand())
val () = println!(string0_rand())
val () = println!(string0_rand())
val () = println!(string0_rand())
val () = println!(string0_rand())

(* ****** ****** *)

(* end of [test23.dats] *)
