//
// RK-2019-05-13:
// Followed the format of ./pats_trans3_error.dats
// and added relevant definitions to ./pats_ccomp.dats
//
staload
ATSPRE = "./pats_atspre.dats"
//
(* ****** ****** *)

staload ERR = "./pats_error.sats"

(* ****** ****** *)

staload "./pats_ccomp.sats"

(* ****** ****** *)
//
vtypedef
ccomperrlst_vt = List_vt (ccomperr)
//
(* ****** ****** *)

local

val
the_ccomperrlst = ref<ccomperrlst_vt> (list_vt_nil)

fun
the_ccomperrlst_get
(
// argumentless
) : ccomperrlst_vt = let
  val (vbox pf | p) = ref_get_view_ptr (the_ccomperrlst)
  val xs = !p
  val () = !p := list_vt_nil ()
in
  xs
end // end of [the_ccomperrlst_get]

in (* in-of-local *)

implement
the_ccomperrlst_add
  (x) = () where {
  val (vbox pf | p) = ref_get_view_ptr (the_ccomperrlst)
  val () = !p := list_vt_cons (x, !p)
} // end of [the_ccomperrlst_add]

implement
the_ccomperrlst_finalize () = {
  val xs =
    the_ccomperrlst_get ()
  // end of [val]
  val nxs = list_vt_length (xs)
  val ((*freed*)) = list_vt_free (xs)
// (*
  val () =
  if nxs > 0 then {
    val () =
    fprintf (
      stderr_ref
    , "patsopt(CCOMP): there are [%i] errors in total.\n", @(nxs)
    ) (* end of [fprintf] *)
  } (* end of [if] *) // end of [val]
// *)
  val () =
  if nxs > 0
    then $raise($ERR.PATSOPT_CCOMP_EXN())
  // end of [if]
} (* end of [the_ccomperrlst_finalize] *)

end // end of [local]

(* ****** ****** *)

(* end of [pats_ccomp_error.dats] *)
