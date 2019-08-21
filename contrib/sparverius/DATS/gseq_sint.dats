(* ****** ****** *)
//
// list0-sequence
//
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
#staload
"libats/SATS/char.sats"
#staload
"libats/SATS/list.sats"
#staload
"libats/SATS/string.sats"
//
(* ****** ****** *)

#staload "libats/SATS/gseq.sats"

(* ****** ****** *)

propdef k0 = gseq
typedef x0 = sint
typedef xs = sint

(* ****** ****** *)

impltmp
gseq_streamize<gseq><xs,x0>
  (xs) =
(
  sint0_streamize<>(xs)
)
(* ****** ****** *)

impltmp
gseq_forall<gseq><xs,x0>
(xs) =
(
sint0_forall<>(xs)
) where
{
impltmp
sint0_forall$test<>(x0) = gseq_forall$test<k0><xs,x0>(x0)
}

(* ****** ****** *)

(* end of [gseq_sint.dats] *)
