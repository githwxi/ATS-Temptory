(* ****** ****** *)
(*
HX:
For testing
graph streamization
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

#staload
"libats/libc/SATS/search.sats"
#staload _ =
"libats/libc/DATS/search.dats"

(* ****** ****** *)

#staload "./../SATS/graph.sats"
#staload "./../DATS/graph.dats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
val
inez =
hcreate(i2sz(128*1024))
//
val () = assertloc(inez != 0)
//
(* ****** ****** *)

typedef word = string
typedef word(n:int) = string(n)
vtypedef lword(n:int) = string_vt(n)

(* ****** ****** *)

extern
fun
is_word(word): bool

(* ****** ****** *)

local
//
val-
~some_vt(words) =
FILEref_open_opt
("/usr/share/dict/words", "r")
//
val
words =
FILEref_streamize_word(words)
//
val () =
(
stream_vt_foreach0<word>(words)
) where
{
implement
stream_vt_foreach0$work<word>(w0) =
ignoret
(hsearch_enter<ptr>(w0, ptr0_null()))
}
//
in

implement
is_word(w0) = isneqz(hsearch_find(w0))

end // end of [local]

(* ****** ****** *)

(*
val () = assertloc(is_word("zephyr"))
val () = assertloc(is_word("zucchini"))
val () = assertloc(is_word("camouflage"))
*)

(* ****** ****** *)
//
#define N 26
//
fun
letter
(j: Natlt(N)): char = ('a' + j)
//
(* ****** ****** *)
//
fun
word_neighbors_at
{n:int}
{i:nat | i < n}
( w0
: !lword(n)
, i0: int(i)
) : list0_vt(string(n)) =
(
let
val c0 = w0[i0]
val ws = 
(
auxlst
(w0, w0[i0], i0, 0(*j*))
)
in
  w0[i0] := c0; reverse(ws)
end
) where
{
fun
auxlst
{j:nat | j <= N}
( w0
: !lword(n)
, c0: char
, i0: int(i)
, j0: int(j)
) : list0_vt(string(n)) =
(
if
(j0 < N)
then
let
val c1 = letter(j0)
in
if (c0 = c1)
then
auxlst(w0, c0, i0, j0+1)
else let
  val () = (w0[i0] := c1)
  val w1 = $UN.castvwtp1{string(n)}(w0)
(*
  val () = println!("i0 = ", i0)
  val () = println!("j0 = ", j0)
  val () = println!("w1 = ", w1)
*)
in
  if
  not
  (is_word(w1))
  then auxlst(w0, c0, i0, j0+1)
  else
  let
  val w1 = copy(w1)
  in
  list0_vt_cons(w1, auxlst(w0, c0, i0, j0+1))
  end
end
end
else list0_vt_nil()
//
) (* end of [auxlst] *)
//
} (* end of [word_get_neighbors_at] *)
//
(* ****** ****** *)

fun
word_neighbors_all
(
w0: word
) : list0_vt(word) =
(
let
  val w1 = copy_vt(w0)
  val r0 = auxlst(w1, 0(*i*))
in
  let val () = free(g0ofg1(w1)) in r0 end
end
) where
{
  val [n:int]
      w0 = g1ofg0(w0)
  val n0 = length(w0)
  fun
  auxlst
  {i:nat | i <= n}
  ( w1
  : !lword(n)
  , i0: int(i)): list0_vt(string(n)) =
  (
  if (i0 < n0) then append(word_neighbors_at(w1, i0), auxlst(w1, i0+1)) else list0_vt_nil()
  )
}

(* ****** ****** *)

val waters = word_neighbors_all("water")
val ((*void*)) = println!("waters = ", waters)

(* ****** ****** *)

(* end of [test06.dats] *)
