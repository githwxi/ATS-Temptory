(* ****** ****** *)

(*
Author: HX-2019-05-25
*)

(* ****** ****** *)

(*
How to compile:
tempacc -O2 -DATS_MEMALLOC_LIBC -o WordFrqncyCnt_dats WordFrqncyCnt.dats 
How to test it:
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | ./WordFrqncyCnt_dats 
*)

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

typedef word = string
typedef iword = (int, string)

vtypedef words = list0(word)
vtypedef iwords = list0(iword)

(* ****** ****** *)

val words =
FILEref_streamize_word(the_stdin())

(* ****** ****** *)

val words =
(
stream_vt_map<word><word>(words)
) where
{
impltmp
stream_vt_map$fopr<word><word>(w0) = tolower(w0)
}

(* ****** ****** *)

val words = listize(words)
val words = list0_vt2t(words)
val words = mergesort(words)

(* ****** ****** *)

val iwords =
(
  loop(words)
) where
{
fun
loop(xs: words): iwords =
(
case+ xs of
| nil() => nil()
| cons(x0, xs) => loop2(xs, x0, 1, nil())
) (* end of [loop] *)

and
loop2
( xs: words
, x0: word, i0: int
, res: iwords): iwords =
(
case+ xs of
| nil() => 
  cons((i0, x0), res)
| cons(x1, xs) =>
  if x0 = x1
  then loop2(xs, x0, i0+1, res)
  else loop2(xs, x1, 1, cons((i0, x0), res))
) (* end of [loop2] *)
}

(* ****** ****** *)

val iwords =
(
mergesort(iwords)
) where
{
impltmp
list0_mergesort$cmp<iword>
  (iw1, iw2) =
let
  val i1 = iw1.0
  val i2 = iw2.0
in
  if i1 > i2 then ~1 else (if i1 < i2 then 1 else compare(iw1.1, iw2.1))
end
}

(* ****** ****** *)

#define N 250

(* ****** ****** *)

val
_(*bool*) =
(
list0_iforall(iwords)
) where
{
impltmp
list0_iforall$test<iword>
  (i0, iw) =
if
(i0 < N)
then (println!("word#", i0+1, ": ", iw.1, "(", iw.0, ")"); true)
else false
} (* end of [val] *)

(* ****** ****** *)

(* end of [WordFrqncyCnt.dats] *)
