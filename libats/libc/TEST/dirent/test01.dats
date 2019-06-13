/*
HX: for testing [dirent]
*/

(* ****** ****** *)

implfun main1() = 0

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload
"./../../SATS/dirent.sats"
#staload _ =
"./../../DATS/dirent.dats"

(* ****** ****** *)
//
impltmp
gseq_forall<
gseq><cptr(DIR),cptr(dirent)>
  (dp) =
(
  readdir_forall<>(dp)
) where
{
impltmp
readdir_forall$test<>(ent) =
(
gseq_forall$test<
gseq><cptr(DIR),cptr(dirent)>(ent)
)
} (* end of [gseq_forall] *)
//
(* ****** ****** *)

val dp = opendir(".")
val () = assertloc(isneqz(dp))

val () =
(
gseq_foreach<
gseq><cptr(DIR),cptr(dirent)>(dp)
) where
{
impltmp
gseq_foreach$work<
gseq><cptr(DIR),cptr(dirent)>(ent) =
  println!($UN.cast{string}(ent.d_name()))
}

val ec = closedir(dp)
val () = assertloc(ec = 0)

(* ****** ****** *)

val dp = opendir("..")
val () = assertloc(isneqz(dp))
val xs = readdir_r_streamize(dp)

val () =
(
stream_vt_foreach0_ref<dirent>(xs)
) where
{
impltmp
stream_vt_foreach0_ref$work<dirent>
  (ent) =
  println!($UN.cast{string}(ent.d_name()))
} (* end of [val] *)

(* ****** ****** *)

(* end of [test01.dats] *)
