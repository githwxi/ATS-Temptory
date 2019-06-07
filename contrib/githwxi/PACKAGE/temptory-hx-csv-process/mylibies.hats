(* ****** ****** *)
(*
HX-2019-06:
For downstream staloading
*)
(* ****** ****** *)
//
(*
#include
"$PATSHOMELOCS\
/temptory-hx-libpcre/mylibies.hats"
#include
"$PATSHOMELOCS\
/temptory-hx-csv-parse/mylibies.hats"
*)
//
(* ****** ****** *)
//
#staload
CSV_PROCESS = "./SATS/csv_process.sats"
//
#staload
_(*CSV_PROCESS*) = "./DATS/csv_process.dats"
//
(* ****** ****** *)

(* end of [mylibies.hats] *)
