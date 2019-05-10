(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
val
abc = "abcdefghijklmnopqrstuvwxyz"
val
ord =
(
list0_vt2t
(gseq_map_list<string><char><int>(abc))
) where
{
implement
gseq_map$fopr<char><int>(c0) = char0_ord(c0)
}
//
(* ****** ****** *)
//
val
ABC =
(
list0_vt2t
(gseq_map_list<string><char><char>(abc))
) where
{
implement
gseq_map$fopr<char><char>(c0) = char0_toupper(c0)
}
//
val
ORD =
(
list0_vt2t
(gseq_map_list<list(char)><char><int>(ABC))
) where
{
implement
gseq_map$fopr<char><int>(c0) = char0_ord(c0)
}
(* ****** ****** *)
//
val () = println!("abc = ", abc)
//
local
implement
fprint$val<int>
(out, i0) =
$extfcall
(void, "fprintf", out, "%x", i0)
in
val () = println!("ord = ", ord)
end//local
//
val () = println!("ABC = ", ABC)
//
val () = println!("ORD = ", ORD)
//
(* ****** ****** *)

(* end of [test05.dats] *)
