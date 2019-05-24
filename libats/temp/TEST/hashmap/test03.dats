(* ****** ****** *)
//
// HX-2019-05-09:
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

vtypedef word = string_vt

(* ****** ****** *)

val
href0 =
(
hmapref_make<k0,x0>()
) where
{
  sexpdef k0 = word and x0 = int
}

(* ****** ****** *)

val-
~some_vt(inp) =
FILEref_open_opt
("/usr/share/dict/words", "r")
val
words =
FILEref_streamize_word_vt(inp)
//
val () =
(
stream_vt_foreach0<word>(words)
) where
{
implement
stream_vt_foreach0$work<word>(w0) =
ignoret
(
hmapref_insert_any<k0,x0>(href0, w0, 0)
) where
{
  vtypedef k0 = word; vtypedef x0 = int
}
}

(* ****** ****** *)

val () = FILEref_close(inp)

(* ****** ****** *)

val
red =
$UN.string0_t2vt"red"
val cp =
hmapref_search_ref(href0, red)
val
red = $UN.string0_vt2t(red)
val () =
println!("red: cp = ", cptr2ptr(cp))

(* ****** ****** *)

val
blue =
$UN.string0_t2vt"blue"
val cp =
hmapref_search_ref(href0, blue)
val
blue = $UN.string0_vt2t(blue)
val () =
println!("blue: cp = ", cptr2ptr(cp))

(* ****** ****** *)

val
uvxy =
$UN.string0_t2vt"uvxy"
val cp =
hmapref_search_ref(href0, uvxy)
val
uvxy = $UN.string0_vt2t(uvxy)
val () =
println!("uvxy: cp = ", cptr2ptr(cp))

(* ****** ****** *)

val words = takeout_all(href0)
val ((*void*)) = list0_vt_free(words)

(* ****** ****** *)

local
#staload
"libats\
/temp/SATS/hashmap_chain.sats"
in
val
((*free*)) =
(
hashmap_free
(
$UN.castvwtp0{hashmap(k0,x0)}(href0))
) where
{
  vtypedef k0 = word; typedef x0 = int
}
end // end of [local]

(* ****** ****** *)

(* end of [test03.dats] *)
