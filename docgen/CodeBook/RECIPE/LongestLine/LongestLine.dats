
(* ****** ****** *)

(*
Author: HX-2019-05-31
*)

(* ****** ****** *)

(*
How to compile:
tempacc -O2 -DATS_MEMALLOC_LIBC -o LongestLine_dats LongestLine.dats
How to test it:
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | ./LongestLine_dats
*)

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

vtypedef line = string_vt

(* ****** ****** *)

fun
LongestLine
( filr
: FILEref): loptn(line) =
(
let
val
lines =
FILEref_streamize_line_vt(filr)
in
case+ !lines of
|
~stream_vt_nil
 ((*void*)) => lnone()
|
~stream_vt_cons
 (line, lines) =>
 let
   val N = length(line)
 in
   lsome(loop(N, line, lines))
 end
end
) where
{
fun
loop
( N0: int
, line0: line
, lines: stream_vt(line)): line =
(
case+ !lines of
|
~stream_vt_nil() => line0
|
~stream_vt_cons(line1, lines2) =>
 let
   val N1 = length(line1)
 in
   if
   (N0 < N1)
   then (free(line0); loop(N1, line1, lines2))
   else (free(line1); loop(N0, line0, lines2))
 end
)
} (* end of [LongestLine] *)

(* ****** ****** *)

val-
~lsome
(longest) = LongestLine(the_stdin())

(* ****** ****** *)

val () =
let
val () =
println!("longest = (", longest, ")") in free(longest)
end (* end of [let] *)

(* ****** ****** *)

(* end of [LongestLine.dats] *)
