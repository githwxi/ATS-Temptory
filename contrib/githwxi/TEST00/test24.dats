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

implfun main0() = ()

(* ****** ****** *)

implate
gseq_streamize<FILEref><char>(filr) = FILEref_streamize_char(filr)
implate
gseq_streamize<FILEref><string>(filr) = FILEref_streamize_line(filr)

(* ****** ****** *)

(*
val () =
println!("sizeof(stdin) = ", gseq_length<FILEref><char>(the_stdin()))
val () =
println!("sizeof(stdin) = ", gseq_length<FILEref><string>(the_stdin()))
*)

(* ****** ****** *)

val () =
(
gseq_iforeach<FILEref><string>(the_stdin())
) where
{
implate
gseq_iforeach$work<string>(i, line) = println!("line#", i+1, ": ", line)
}

(* ****** ****** *)

(* end of [test24.dats] *)
