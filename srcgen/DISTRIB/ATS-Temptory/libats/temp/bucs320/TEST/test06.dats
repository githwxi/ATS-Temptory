(* ****** ****** *)
(*
HX:
For testing
graph streamization
BTW, hsearh is HORRIBLE!!!
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
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
//
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
  if
  (i0 < n0)
  then append(word_neighbors_at(w1, i0), auxlst(w1, i0+1))
  else list0_vt_nil()
  )
}

(* ****** ****** *)

(*
val waters = word_neighbors_all("water")
val ((*void*)) = println!("waters = ", waters)
*)

(* ****** ****** *)

typedef
wpath = list0(word)

extern
fun
doublet
( w0: word
, w1: word): optn_vt(wpath)

(* ****** ****** *)

local
//
#staload _ =
"libats/temp/DATS/qlistref.dats"
(*
#staload _ =
"libats/temp/DATS/slistref.dats"
*)
//
in
//
implement
doublet(w0, w1) =
(
let
val
nxs =
graph_streamize_bfs<node>
  (list0_sing(w0))
val
nxs =
(
stream_vt_filter<node>(nxs)
) where
{
implement
stream_vt_filter$test<node>(nx0) =
(nx0[0] = w1)
(*
where
{
val () = println!("nx0[0] = ", nx0[0])
}
*)
}
in
case+ !nxs of
| ~stream_vt_nil() => lnone()
| ~stream_vt_cons(nx0, nxs) => (~nxs; lsome(nx0))
end (* end-of-let *)
) where
{
//
typedef node = wpath
//
val null = ptr0_null()
//
val-
~lsome(ht0) =
htabref_create(i2sz(128*1024))
//
implement
graph_node_mark<node>
(nx) =
{
val-
~lsome _ =
htabref_enter_opt<ptr>
  (ht0, nx[0], null)
}
//
implement
graph_node_is_marked<node>
(nx) =
case+
htabref_find_opt<>(ht0, nx[0])
of | ~lsome _ => true | ~lnone() => false 
//
implement
graph_node_neighbors<node>
  (nx0) =
(
list0_vt2t
(
list0_vt_map0<word><node>
(word_neighbors_all(nx0[0]))
)
) where
{
  implement
  list0_vt_map0$fopr<word><node>(w0) = list0_cons(w0, nx0)
}
//
} (* end of [doublet] *)
//
end // end of [local]

(* ****** ****** *)

val-
~lsome(ws) = doublet("poor", "rich")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end

(* ****** ****** *)

val-
~lsome(ws) = doublet("flour", "bread")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end

(* ****** ****** *)

val-
~lsome(ws) = doublet("river", "flood")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end

(* ****** ****** *)

val-
~lsome(ws) = doublet("water", "blood")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end

(* ****** ****** *)

(* end of [test06.dats] *)
