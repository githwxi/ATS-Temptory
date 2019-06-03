(* ****** ****** *)

(*
Author: HX-2019-05-25
*)

(* ****** ****** *)

(*
How to compile:
mytempacc -O2 -o WordFrqncyCnt_vt_dats WordFrqncyCnt_vt.dats 
How to test it:
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | ./WordFrqncyCnt_vt_dats 
How to test for memory-cleaness:
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | valgrind ./WordFrqncyCnt_vt_dats 
*)

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

vtypedef word = string_vt
vtypedef iword = (int, word)
vtypedef words = list0_vt(word)
vtypedef iwords = list0_vt(iword)

(* ****** ****** *)

val words =
FILEref_streamize_word_vt(the_stdin())

(* ****** ****** *)

val words =
(
stream_vt_map<word><word>(words)
) where
{
impltmp
stream_vt_map$fopr<word><word>(w0) =
let
val w1 =
(
string0_vt_map1<>(w0)
) where
{
impltmp
string0_vt_map1$fopr<>(c0) = tolower(c0)
}
in
  let val () = free(w0) in w1 end
end
} (* end of [val words] *)

(* ****** ****** *)

val words = listize(words)
val words = mergesort(words)

(* ****** ****** *)

val iwords =
(loop(words)) where
{
fun
loop(xs: words): iwords =
(
case+ xs of
| ~lnil() => lnil()
| ~lcons(x0, xs) => loop2(xs, x0, 1, lnil())
) (* end of [loop] *)

and
loop2
( xs: words
, x0: word, i0: int
, res: iwords): iwords =
(
case+ xs of
|
~lnil() => 
 lcons((i0, x0), res)
|
~lcons(x1, xs) =>
 if
 (x0 = x1)
 then
 let
   val () = free(x1)
 in
   loop2(xs, x0, i0+1, res)
 end
 else
 loop2(xs, x1, 1, lcons((i0, x0), res))
) (* end of [loop2] *)
}
//
(* ****** ****** *)

val iwords =
(
mergesort(iwords)
) where
{
impltmp
list0_vt_mergesort$cmp<iword>
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
list0_vt_iforall0(iwords)
) where
{
//
impltmp
list0_vt_iforall0$test<iword>
  (i0, iw) =
let
val (i, w) = iw
in
if
(i0 >= N)
then
(free(w); false)
else
let
val () =
println!
("word#", i0+1, ": ", i, "(", w, ")") in free(w); true end
end (* end of [let] *)
//
} (* end of [val] *)

(* ****** ****** *)

(* end of [WordFreqCnt_vt.dats] *)
