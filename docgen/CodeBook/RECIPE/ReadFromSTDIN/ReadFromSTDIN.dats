(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

(*
How to compile:
mytempacc -O2 -o ReadFromSTDIN_dats ReadFromSTDIN.dats 
How to test it: ./ReadFromSTDIN_dats
*)

(* ****** ****** *)

(*
fun
echo() = let
  fun
  loop(xs: stream_vt(string)): void =
  (
    case+ !xs of
    | ~stream_vt_nil() =>
       ((*nothing*))
    | ~stream_vt_cons(x, xs) =>
       (println!(x); loop(xs))
  )
in
  loop(FILEref_streamize_line(the_stdin()))
end //  end of [echo]
*)

(* ****** ****** *)

fun
tally(): int = let
  fun
  loop
  (xs: stream_vt(string), res: int): int =
  (
    case+ !xs of
    | ~stream_vt_nil() => res
    | ~stream_vt_cons(x, xs) =>
      let
        val () =
        if isneqz(x) then prompt()
      in
//
// HX-2018-01-06:
// [g0string2int] converts a given string into
// the int it represents
//
        loop(xs, res+$extfcall(int, "atoi", x))
      end
  ) (* end of [loop] *)

  and
  prompt(): void =
  println!
  ("Please input more or type Ctrl-D:")

in
  println!("Please input one integer:");
  loop(FILEref_streamize_line(the_stdin()), 0)
end // end of [tally]

(* ****** ****** *)

implement
main0() = () where
{
  val S0 = tally()
  val () = println!("The tally of the input integers equals ", S0)
}

(* ****** ****** *)

(* end of [ReadFromSTDIN.dats] *)
