/*
HX: for testing [dirent]
*/

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

implement main1() = 0

(* ****** ****** *)

#staload
"./../../SATS/dirent.sats"
#staload _ =
"./../../DATS/dirent.dats"

(* ****** ****** *)
//
implement
gseq_forall<
  cptr(DIR)><cptr(dirent)>
  (dp) =
(
  readdir_forall<>(dp)
) where
{
implement
readdir_forall$test<>(ent) =
(
  gseq_forall$test<cptr(dirent)>(ent)
)
} (* end of [gseq_forall] *)
//
(* ****** ****** *)

val dp = opendir(".")
val () = assertloc(isneqz(dp))

val () =
(
gseq_foreach<
  cptr(DIR)><cptr(dirent)>(dp)
) where
{
implement
gseq_foreach$work<cptr(dirent)>(ent) =
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
implement
stream_vt_foreach0_ref$work<dirent>
  (ent) =
  println!($UN.cast{string}(ent.d_name()))
} (* end of [val] *)

(* ****** ****** *)

(* end of [test01.dats] *)
