(* ****** ****** *)

implfun main1() = 0

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
#include
"$PATSHOMELOCS\
/temptory-hx-csv-process/mylibies.hats"
#include
"$PATSHOMELOCS\
/temptory-hx-csv-process/mydepies.hats"
//
(* ****** ****** *)

#define MYDATA "./DATA/myclass.csv"

(* ****** ****** *)
//
#staload $CSV_PROCESS(*for opening NS*)
//
(* ****** ****** *)
//
val
(
theColNames
,
theStudents
) =
let
val-
~lsome(inp) =
FILEptr0_open_opt(MYDATA, "r")
in
(FILEptr0_streamize_tobj(inp))
end // end of [theStudents]
//
val
theStudents = tolist(theStudents)
//
val () =
println!
("|theColNames| = ", length(theColNames))
val () =
println!
("|theStudents| = ", length(theStudents))
//
(* ****** ****** *)
//
extern
fun
list0_tobject_tally
  (list0(tobject)): double
//
(* ****** ****** *)

val () =
(
list0_foreach(theStudents) 
) where
{
typedef x0 = tobject
impltmp
list0_foreach$work<x0>(x0) =
let
//
#macdef un = TVstr_un
//
val S1 = atoi(un(x0["hwk01"]))
val S2 = atoi(un(x0["hwk02"])) in x0["total"] := TVint(S1+S2)
end // end of [let]
} (* end of [val] *)

(* ****** ****** *)
//
val
theColNames =
extend(theColNames, "total")
//
(* ****** ****** *)

local

impltmp
tvalue_print<>
  (t0) =
(
case+ t0 of
| TVnil() => print"[]"
| TVint(x) => print(x)
| TVflt(x) => print(x)
| TVstr(x) => print(x)
| _(*else*) => print("TVxxx(...)")
)

in (*in-of-local*)

val () =
(
println!(theColNames)
) where
{
impltmp
list0_print$beg<>() = ()
impltmp
list0_print$end<>() = ()
}

val N =
length(theStudents)
val
theAverage =
tobject_encode
(hmapref_make_hint(16))
val () =
theAverage["name"] :=
(
  TVstr("average")
)
val () =
theAverage["hwk01"] :=
(
TVflt
(
list0_foldleft<x0><r0>(xs,0)/1.0*N
)
) where
{
//
val xs = theStudents
//
typedef x0 = tobject and r0 = int
//
impltmp
list0_foldleft$fopr<x0><r0>
  (r0, x0) =
  r0 + atoi(TVstr_un(x0["hwk01"]))
}
val () =
theAverage["hwk02"] :=
(
TVflt
(
list0_foldleft<x0><r0>(xs, 0)/(1.0*N)
)
) where
{
//
val xs = theStudents
//
typedef x0 = tobject and r0 = int
//
impltmp
list0_foldleft$fopr<x0><r0>
  (r0, x0) =
  r0 + atoi(TVstr_un(x0["hwk02"]))
}
val () =
theAverage["total"] :=
(
TVflt
(
list0_foldleft<x0><r0>(xs, 0)/(1.0*N)
)
) where
{
//
val xs = theStudents
//
typedef x0 = tobject and r0 = int
//
impltmp
list0_foldleft$fopr<x0><r0>
  (r0, x0) = (r0 + TVint_un(x0["total"]))
}

val () =
(
list0_foreach
(extend(theStudents,theAverage))
) where
{
typedef x0 = tobject
impltmp
list0_foreach$work<x0>(x0) =
(
  print!(x0["name"]);
  print!(",", x0["hwk01"]);
  print!(",", x0["hwk02"]);
  print!(",", x0["total"]); print_newline()
)
}

end // end of [local]

(* ****** ****** *)

(* end of [CSV-Processing.dats] *)
