(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

(*
How to compile:
mytempacc -O2 -o ReadFromSTDIN2_dats ReadFromSTDIN2.dats 
How to test it: ./ReadFromSTDIN2_dats
*)

(* ****** ****** *)

fun
prompts
(
// argless
) : stream_vt(int) =
stream_vt_map<int><int>
(
sint_streamize_gte(0) // HX: generating 0, 1, 2, 3, ...
) where
{
  impltmp
  stream_vt_map$fopr<int><int>(i) =
  (println!("Please input an integer or type Ctrl-D:"); i)
}

(* ****** ****** *)

fun
tally() = let
  val ps = prompts()
  val xs =
  FILEref_streamize_line(the_stdin())
  val xs =
  stream_vt_filter<string>(xs) where
  {
  impltmp
  stream_vt_filter$test<string>(x0) = isneqz(x0)
  }
  val ys =
  (
  stream_vt_z2map<int,string><int>(ps, xs)
  ) where
  {
  impltmp
  stream_vt_z2map$fopr<int,string><int>(p0, x0) = $extfcall(int, "atoi", x0)
  }
in
  (
  stream_vt_foldleft0<int><int>(ys, 0)
  ) where
  {
    impltmp
    stream_vt_foldleft0$fopr<int><int>(r0, y0) = r0 + y0
  }
end // end of [tally]

(* ****** ****** *)

implement
main0() = let
  val res = tally() in println!("The tally of all the integers equals ", res)
end // end of [main0]

(* ****** ****** *)

(* end of [ReadFromSTDIN2.dats] *)
