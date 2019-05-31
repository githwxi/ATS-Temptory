(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

implfun main0() = ()

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
impltmp
gseq_map$fopr<char><int>(c0) = char0_ord(c0)
}
//
val () =
(
assertloc(string0_forall(abc))
) where
{
impltmp
string0_forall$test<>(c) = char0_islower(c)
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
impltmp
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
impltmp
gseq_map$fopr<char><int>(c0) = char0_ord(c0)
}
//
val () =
(
assertloc(list0_forall(ABC))
) where
{
impltmp
list0_forall$test<char>(c) = char0_isupper(c)
}
//
(* ****** ****** *)
//
val () = println!("abc = ", abc)
//
local
impltmp
fprint$val<int>
(out, i0) =
$extfcall
(void, "fprintf", out, "%X", i0)
in
val () = println!("ord = ", ord)
end//local
//
val () = println!("ABC = ", ABC)
val () = println!("ORD = ", ORD)
//
val () = println!("indexof(abc,a) = ", indexof(abc, 'a'))
val () = println!("indexof(abc,A) = ", indexof(abc, 'A'))
val () = println!("indexof(ABC,Z) = ", indexof(ABC, 'Z'))
//
(* ****** ****** *)

val
ABC2 = string0_make(ABC)
val () = println!("ABC2 = ", ABC2)
val
ABC3 =
list0_vt2t(string0_listize(ABC2))
val
ABC4 =
list0_vt2t(string0_rlistize(ABC2))
val () = println!("ABC3 = ", ABC3)
val () = println!("ABC4 = ", ABC4)

(* ****** ****** *)

(* end of [test05.dats] *)
