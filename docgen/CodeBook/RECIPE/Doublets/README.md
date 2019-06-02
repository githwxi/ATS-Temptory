# The Doublet Puzzle

**Doublets** is a word game invented by Lewis Carroll (1832-1898), the
author of children's classic "Alice in Wonderland".  For a description
of this game, please visit, for instance, the
[link](http://www.logicville.com/doublets.htm).

Given two words recognized in a chosen dictionary, they are said to be
one-step connected if they differ precisely at one position in their
spellings. Clearly, two connected words must contain the same number
of characters. Two given words W0 and W1 are many-step connected if a
sequence of words beginning with W0 and ending with W1 can be found
such that any two consecutive words in this sequence are one-step
connected. The game Doublets basically asks the player to tell whether
two given words are many-step connected. For instance. `head` and
`tail` form a doublet as is shown by the following sequence:

head, held, hell, tell, tall, tail

One may play Doublets on-line by visiting
[here](http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html).

As usual, let us first introduce some type defintions:

```ats
typedef word = string
typedef wpath = list0(word)
```

The primary function to be implemented is given the following interface:
  
```ats
extern
fun
doublet
(w0: word, w1: word): optn_vt(wpath)
```

I plan to make use of linear types and dependent types in this example:

```ats
typedef word(n:int) = string(n)
vtypedef lword(n:int) = string_vt(n)
```

Given a static int `n`, `string(n)` is for strings consisting of `n`
letters and `string_vt(n)` for linear strings consisting of `n`
letters. Note that only a linear string can be modified or freed.

If one wants a bit more adventure, one may use the following
interface to specify that `doublet` can only be applied to two words
of the same length:

```ats
extern
fun
doublet{n:int}
(w0: word(n), w1: word(n)): optn_vt(wpath(n))
```

where the type `wpath(n)` is just `list0(word(n))`.

The entirety of the code implementing Doublets can be found [here](./Doublet.dats).

The first part of the code is for implementing the following function:

```ats
fun legalq(w0: word): bool
```

which tests if a given word is legal, that is, appearing in a chosen dictionary. For
a bit of curiosity, I built an simple interface in ATS for calling various functions
provided in `search.h` by libc. For instance, `hcreate` is for creating a (global) hashmap
and `hsearch_enter` is for inserting an entry into the hashmap.

The second part of the code is for implementing the following
function that returns all of the words that are one-step related
to a given word:

```ats
fun
word_neighbors(w0: word): list0_vt(word)
```

The key helper function for implementing `word_neighbors` is the following
one, which returns all of the words that are one-step related to a given word
at a given position:

```ats
//
fun
word_neighbors_at
{n:int}{i:nat | i < n}
(w0: !lword(n), i0: int(i)) : list0_vt(word(n))

```

Note that the first argument `w0` of `word_neighbors_at` is given a
linear type, which allows `w0` to be modified.

Doublets-of-24 is a typical problem of graph-based search. Assume that
a node NX0 consists of a list of words representing a path (from some
chosen word).  Let W1 be the last word on NX0. Extending NX0 with
another word W2 that is one-step related to W1 forms another node NX1
that is a considered a neighbor of NX0.

The third part of the code implements a graph-based search to check if
a path exists between two given words. A template-based implementation
for graph-based search is available in the library:

```ats
#staload
"libats/temp/bucs320/SATS/graph.sats"
#staload
"libats/temp/bucs320/DATS/graph.dats"
```

The template `graph_streamize_bfs` can be called to enumerate the
nodes in a given graph in the breadth-first fashion:

```ats
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
```

Note that the template `graph_node_children` needs to be implemented
in order for `graph_streamize_bfs` to work.  Also, graph-based search
needs to mark a visted node (since the involved graph may contain
circles).  The template `graph_node_mark` is for marking and
`graph_node_is_marked` for checking if a node is marked. Theoretically
speaking, if no marking is done here, the search is still able to find
a path connecting two given words as long as such a path exists. But
the search space can become so big that the search probably never
returns once the path is long (e.g., containing a dozen words).

Again, please find the entirety of the code implementing Doublets
[here](./Doublet.dats).

Happy programming in ATS-Temptory!!!

