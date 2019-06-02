(* ****** ****** *)

(*
Author: HX-2019-06-01
*)

(* ****** ****** *)

(*
How to compile:
tempacc -O2 -DATS_MEMALLOC_LIBC -o Doublet_dats Doublet.dats 
How to test it: ./Doublet_dats
*)

(* ****** ****** *)

#staload
"libats/libc/SATS/search.sats"
#staload _ =
"libats/libc/DATS/search.dats"

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

local

(* ****** ****** *)
//
val
inez =
hcreate(i2sz(1024*1024))
//
val () = assertloc(inez != 0)
//
(* ****** ****** *)

typedef word = string

(* ****** ****** *)

val-
~some_vt(words) =
FILEref_open_opt
("/usr/share/dict/words", "r")
//
val
words =
FILEref_streamize_line(words)
//
val () =
(
stream_vt_foreach0<word>(words)
) where
{
impltmp
stream_vt_foreach0$work<word>(w0) =
ignoret
(hsearch_enter<ptr>(w0, ptr0_null()))
}
//
in

fun
word_is_legal
( w0
: word )
: bool = isneqz(hsearch_find(w0))

end (* end-of-local *)
//
(* ****** ****** *)

#symload legalq with word_is_legal

(* ****** ****** *)

(*
val () = assertloc(legalq("squash"))
val () = assertloc(legalq("eggplant"))
val () = assertloc(legalq("zucchini"))
*)

(* ****** ****** *)

typedef word = string

extern
fun
word_neighbors
(word): list0_vt(word)

(* ****** ****** *)
//
#define N0 26
//
(* ****** ****** *)

implement
word_neighbors(w0) =
let
//
val n0 = size(w0)
val w0 = copy_vt(w0)
val p0 = cptrof(w0)
//
//
typedef
xs = size and x0 = size
vtypedef
w0 = word and ws = list0_vt(word)
//
val wss =
(
gseq_map_list<xs><x0><ws>(n0)
) where
{
fun
helper
(pi: cptr(char), c0: char): ws =
(
gseq_mapopt_list<int><int><w0>(N0)
) where
{
impltmp
gseq_mapopt$test<int>(k0) =
let
val c1 = 'a' + k0
in
  if
  (c0 = c1)
  then false else
  let
    val () =
    $UN.cptr0_set(pi, c1) in legalq($UN.cast{string}(p0))
  end // end of [else]
end (* gseq_mapopt$test *)
//
impltmp
gseq_mapopt$fopr<int><w0>(j0) = copy($UN.cast{string}(p0))
//
} (* end of [helper] *)
//
implate
gseq_map$fopr<x0><ws>(i0) =
let
val pi = p0 + i0
val c0 = $UN.cptr0_get(pi)
in
  let
  val ws = helper(pi, c0) in $UN.cptr0_set(pi, c0); ws
  end  
end
}
in
  let val () = free(w0) in list0_vt_concat<string>(wss) end
end // end of [word_neighbors]

(* ****** ****** *)

(*
val
waters =
word_neighbors("water")
val () =
println!("waters = ", waters)
val () = list0_vt_free(waters)
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
#staload
"libats/temp/bucs320/SATS/graph.sats"
#staload
"libats/temp/bucs320/DATS/graph.dats"
//
in
//
implfun
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
impltmp
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
impltmp
graph_node_mark<node>
(nx) =
{
val-
~lsome _ =
htabref_enter_opt<ptr>
  (ht0, nx[0], null)
}
//
impltmp
graph_node_is_marked<node>
(nx) =
case+
htabref_find_opt<>(ht0, nx[0])
of | ~lsome _ => true | ~lnone() => false 
//
impltmp
graph_node_neighbors<node>
  (nx0) =
(
list0_vt2t
(
list0_vt_map0<word><node>(word_neighbors(nx0[0]))
)
) where
{
  impltmp
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
~lsome(ws) = doublet("wheat", "flour")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end
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

val-
~lsome(ws) = doublet("garden", "flower")
val ((*void*)) =
let val ws = reverse_vt(ws) in println!(ws); free(ws) end

(* ****** ****** *)

%{^
/*
** HX-2019-06-01:
** This part is for
** handling some exception constants
*/
ATSdynexn_dec(temptory_056___ListSubscriptExn) ;
ATSdynexn_dec(temptory_056___ArraySubscriptExn) ;
%} (* %{^ *)

(* ****** ****** *)

(* end of [Doublet.dats] *)
