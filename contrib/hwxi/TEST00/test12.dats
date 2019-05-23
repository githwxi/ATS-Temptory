(* ****** ****** *)
//
// HX-2019-05-13:
// For ATS-Temptory
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
(*
val cs =
FILEref_streamize_char(the_stdin())
val () =
(
stream_vt_foreach0(cs)
) where
{
implement
stream_vt_foreach0$work<char>(c0) = print(c0)
}
*)
//
(*
val ls =
FILEref_streamize_line(the_stdin())
val () =
(
stream_vt_iforeach0(ls)
) where
{
implement
stream_vt_iforeach0$work<string>(i0, l0) = println!("line#", i0, ": ", l0)
}
*)
//
val ws =
(
FILEref_streamize_word(the_stdin())
) where
{
implement
FILEref_streamize_word$isalpha<>(c0) = char0_isalnum(c0)
}
val () =
(
stream_vt_iforeach0(ws)
) where
{
implement
stream_vt_iforeach0$work<string>(i0, w0) = println!("word#", i0, ": ", w0)
}
//
(* ****** ****** *)

(* end of [test12.dats] *)
