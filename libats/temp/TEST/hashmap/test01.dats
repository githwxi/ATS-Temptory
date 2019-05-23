(* ****** ****** *)
/*
HX: for testing [hashmap]
*/
(* ****** ****** *)

implement main1() = ( 0 )

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

#staload
"libats\
/temp/SATS/hashmap_chain.sats"

(* ****** ****** *)

local

#staload _ =
"./../../DATS/hashfun.dats"
#staload _ =
"./../../DATS/linmap_list.dats"
#staload _ =
"./../../DATS/hashmap_chain.dats"

in(* in-of-local *)
//
typedef
k0 = int
and
x0 = string
//
typedef kx = (k0, x0)
//
val
map =
hashmap_make_hcap<k0,x0>
  (i2sz(1))
val () =
assertloc(size(map) = 0)
//
val () = insert_any(map, 0, "0")
//
val-
~none_vt
 () = insert_opt(map, 1, "1")
val-
~none_vt
 () = insert_opt(map, 2, "2")
//
val () = println!("map = ", map)
//
val-
~some_vt
 ("2") = insert_opt(map, 2, "3")
val-
~some_vt
 ("1") = insert_opt(map, 1, "2")
val-
~some_vt
 ("0") = insert_opt(map, 0, "1")
//
val () = println!("map = ", map)
//
val-tt = remove(map, 0) // found
val-ff = remove(map, 3) // ~found
//
val () = println!("map = ", map)
//
val-
~none_vt() = insert_opt(map, 4, "4")
val-
~none_vt() = insert_opt(map, 5, "5")
val-
~none_vt() = insert_opt(map, 6, "6")
val-
~none_vt() = insert_opt(map, 7, "7")
val-
~none_vt() = insert_opt(map, 8, "8")
val-
~none_vt() = insert_opt(map, 9, "9")
//
(* ****** ****** *)
//
val ((*void*)) = println!("map = ", map)
//
val ((*freed*)) = hashmap_free<k0,x0>(map)
//
end // end of [local]

(* ****** ****** *)

(* end of [test01.dats] *)
