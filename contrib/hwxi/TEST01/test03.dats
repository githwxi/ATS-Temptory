(* ****** ****** *)
(*
** For testing
** temptory-hx-csv-parse
*)
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

val () =
println!
("Hello from [test02]!")

(* ****** ****** *)
//
#staload
"libats/libc/SATS/dirent.sats"
#staload
_(*anon*) =
"libats/libc/DATS/dirent.dats"
//
(* ****** ****** *)

#include
"$PATSHOMELOCS\
/temptory-hx-libpcre/mylibies.hats"

(* ****** ****** *)

val
dirp = opendir(".")
val () =
assertloc(isneqz(dirp))
val
regex =
"^test\\d{2}\\.dats$"
val
dents =
readdir_r_streamize(dirp)

(* ****** ****** *)

val
names = 
(
  auxmain(dents)
) where
{
fun
auxmain
(
xs: stream_vt(dirent)
) : stream_vt(string_vt) =
$ldelay
(
let val nx = !xs in auxmain2(nx) end, ~xs
)
and
auxmain2
( nx
: stream_vt_con(dirent)
) : stream_vt_con(string_vt) =
(
case+ nx of
|
~stream_vt_nil() =>
 stream_vt_nil()
|
@stream_vt_cons(x0, xs) =>
 let
   val cp = x0.d_name()
   val r0 =
   $PCRE.regexp_match_string
   (regex, $UN.cast{string}(cp))
   val xs = xs
   val () = free@(nx)
 in
   if
   (r0 < 0)
   then
   auxmain2(!xs)
   else let
     val cp =
     copy_vt($UN.cast{string}(cp))
   in
     stream_vt_cons(cp, auxmain(xs))
   end // else
 end
)
} (* end of [val] *)

(* ****** ****** *)

val () =
(
stream_vt_foreach0(names)
) where
{
vtypedef x0 = string_vt
implement
stream_vt_foreach0$work<x0>(name) = (println!(name); free(name))
}

(* ****** ****** *)

(* end of [test03.dats] *)
