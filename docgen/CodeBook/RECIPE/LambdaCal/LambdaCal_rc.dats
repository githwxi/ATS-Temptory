(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

impltmp
(a:vtflt
,b:vtflt)
gcopy$val<(a,b)>
  (xy) = let
//
val (x0, y0) =
$UN.castvwtp1{(a,b)}(xy)
val x1 = gcopy$val<a>(x0)
val y1 = gcopy$val<b>(y0)
val () = $UN.castvwtp0(x0)
val () = $UN.castvwtp0(y0) in (x1, y1)
end

(* ****** ****** *)

typedef tvar = string

(* ****** ****** *)
//
datavtype
term1_con =
| TM1var of tvar
| TM1lam of
  ( tvar, term1 )
| TM1app of
  ( term1, term1 )
//
where
term1 = refcnt(term1_con)

(* ****** ****** *)
//
fun
term1_con_copy
( t0: 
! term1_con
) : term1_con =
(
case+ t0 of
|
TM1var(x1) => TM1var(x1)
|
TM1lam(x1, t1) =>
TM1lam(x1, refcnt_incref(t1))
|
TM1app(t1, t2) =>
TM1app
(refcnt_incref(t1), refcnt_incref(t2))
) where
{
impltmp
gcopy$val<term1_con>(t0) = term1_con_copy(t0)
}
impltmp
gcopy$val<term1_con>(t0) = term1_con_copy(t0)
//
(* ****** ****** *)
//
fun
term1_con_free
(t0: term1_con): void =
(
case+ t0 of
| ~
TM1var(x1) => ()
| ~
TM1lam(x1, t1) => refcnt_decref(t1)
| ~
TM1app(t1, t2) =>
(refcnt_decref(t1); refcnt_decref(t2))
) where
{
impltmp
gfree$val<term1_con>(t0) = term1_con_free(t0)
}
impltmp
gfree$val<term1_con>(t0) = term1_con_free(t0)
//
(* ****** ****** *)

extern
fun
print0_term1
(t0: term1): void
#symload
print0 with print0_term1

implement
print0_term1(t0) =
(
let
#symload
print with print0_term1
//
val t0 = refcnt_get0_elt(t0)
//
in
case+ t0 of
| ~
TM1var(x1) =>
print!("TM1var(", x1, ")")
| ~
TM1lam(x1, t1) =>
print!("TM1lam(", x1, "; ", t1, ")")
| ~
TM1app(t1, t2) =>
print!("TM1app(", t1, "; ", t2, ")")
end
)

(* ****** ****** *)
//
datavtype
term2_con =
| TM2var of tvar
| TM2lam of
  ( term1, tenv2 )
| TM2laz of
  ( term1, tenv2 )
| TM2app of
  ( term2, term2 )
where
term2 = refcnt(term2_con)
and
tenv2 = list0_rc@(tvar, term2)

(* ****** ****** *)
//
fun
term2_con_copy
( t0: 
! term2_con
) : term2_con =
(
case+ t0 of
|
TM2var(x1) => TM2var(x1)
|
TM2lam(t1, env) =>
TM2lam
( refcnt_incref(t1)
, refcnt_incref(env))
|
TM2laz(t1, env) =>
TM2laz
( refcnt_incref(t1)
, refcnt_incref(env))
|
TM2app(t1, t2) =>
TM2app
(refcnt_incref(t1), refcnt_incref(t2))
) where
{
impltmp
gcopy$val<term2_con>(t0) = term2_con_copy(t0)
}
impltmp
gcopy$val<term2_con>(t0) = term2_con_copy(t0)
//
(* ****** ****** *)
//
fun
term2_con_free
(t0: term2_con): void =
(
case+ t0 of
| ~
TM2var(x1) => ()
| ~
TM2lam(t1, env) =>
(refcnt_decref(t1); refcnt_decref(env))
| ~
TM2laz(t1, env) =>
(refcnt_decref(t1); refcnt_decref(env))
| ~
TM2app(t1, t2) =>
( refcnt_decref(t1); refcnt_decref(t2) )
) where
{
impltmp
gfree$val<term2_con>(t0) = term2_con_free(t0)
}
impltmp
gfree$val<term2_con>(t0) = term2_con_free(t0)
//
(* ****** ****** *)

extern
fun
tenv2_find
(xts: tenv2, x0: tvar): term2
implement
tenv2_find
(xts, x0) =
(
let
val
xts =
refcnt_get0_elt(xts)
in
case+ xts of
| ~
list0_rc_nil
((*void*)) => refcnt(TM2var(x0))
| ~
list0_rc_cons
(xt1, xts) =>
let
val (x1, t1) = xt1
in
if
(x0 = x1)
then
let
val () = gfree$val(xts) in t1
end
else
(gfree$val(t1); tenv2_find(xts, x0))
end
end // end of [let]
)

(* ****** ****** *)

fun
compile
(t0: term1): term2 =
(
let
val
xts = 
refcnt
(list0_rc_nil()) in evaluate(t0, xts)
end
) (* end of [compile] *)

and
evaluate
( t0
: term1
, env0
: tenv2): term2 =
(
let
val t0 =
refcnt_get0_elt(t0)
in
case+ t0 of
| ~
TM1var(x0) =>
let
val t0 =
tenv2_find(env0, x0)
val t0 =
refcnt_get0_elt(t0)
in
case+ t0 of
| ~
TM2laz
(t1, env1) =>
evaluate(t1, env1)
| _(*non-TM2laz*) =>
refcnt_make_elt(t0)
end
|(*!*)
TM1lam(x1, t1) =>
let
val t0 = refcnt(t0)
in
refcnt(TM2lam(t0, env0))
end
| ~
TM1app(t1, t2) =>
let
val
env1 =
refcnt_incref(env0)
val t1 =
evaluate(t1, env1)
val t1 =
refcnt_get0_elt(t1)
in
//
case+ t1 of
| ~
TM2lam
(t1, env1) =>
let
  val t1 =
  refcnt_get0_elt(t1)
  val- ~
  TM1lam(x1, u1) = t1
  val t2 =
  refcnt(TM2laz(t2, env0))
in
  evaluate(u1, env1) where
  {
  val
  env1 =
  refcnt
  (list0_rc_cons((x1, t2), env1))
  }
end
| _ (*non-TM2lam*) =>
  let
  val t1 = refcnt(t1)
  in
  refcnt
  (TM2app(t1, evaluate(t2, env0)))
  end
//
end
end // end of [let]
) (* end of [evaluate] *)

(* ****** ****** *)

fun
normalize
(t0: term1): term1 =
(
  normize(compile(t0))
) where
{
fun
normize(t0: term2): term1 =
(
let
val t0 =
refcnt_get0_elt(t0)
in
case+ t0 of
| ~
TM2var(x1) =>
refcnt(TM1var(x1))
| ~
TM2laz(t1, env1) =>
normize(evaluate(t1, env1))
| ~
TM2lam(t1, env1) =>
let
  val t1 =
  refcnt_get0_elt(t1)
  val- ~
  TM1lam(x1, u1) = t1
in
  refcnt
  (
  TM1lam
  ( x1
  , normize(evaluate(u1, env1)))
  )
end
| ~
TM2app(t1, t2) =>
refcnt
(TM1app(normize(t1), normize(t2)))
end
)
}

(* ****** ****** *)

#macdef
TM1var_rc(x) =
refcnt(TM1var(,(x)))
#macdef
TM1lam_rc(x, y) =
refcnt(TM1lam(,(x), ,(y)))
#macdef
TM1app_rc(x, y) =
refcnt(TM1app(,(x), ,(y)))

(* ****** ****** *)
//
extern
fun
print1_term1
(t0: !term1): void
#symload
print with print1_term1
//
implfun
print1_term1
  (t0) =
  print0_term1(refcnt_incref(t0))
//
(* ****** ****** *)

implement
main0() =
{

(* ****** ****** *)

val K =
let
val x = "x"
val y = "y"
in
TM1lam_rc
( x
, TM1lam_rc
  (y, TM1var_rc(x)))
end

val () = println!("K = ", K)

(* ****** ****** *)

val S =
let
val x = "x"
val y = "y"
val z = "z"
in
TM1lam_rc
( x
,
TM1lam_rc
( y
, 
TM1lam_rc
( z
, 
TM1app_rc
(
TM1app_rc(TM1var_rc(x), TM1var_rc(z))
,
TM1app_rc(TM1var_rc(y), TM1var_rc(z))
)
)
)
)
end

val () = println!("S = ", S)

(* ****** ****** *)

val K1 = refcnt_incref(K)
val K2 = refcnt_incref(K)
val () = refcnt_decref(K)

val SKK =
TM1app_rc(TM1app_rc(S, K1), K2)
val ( ) =
( print!("SKK_nf = ")
; print0(normalize(SKK)); println!())

(* ****** ****** *)

val N2 =
let
#macdef f = TM1var_rc("f")
#macdef x = TM1var_rc("x")
in
  TM1lam_rc
  ( "f"
  , TM1lam_rc("x", TM1app_rc(f, TM1app_rc(f, x))))
end
val N3 =
let
#macdef f = TM1var_rc("f")
#macdef x = TM1var_rc("x")
in
TM1lam_rc
( "f"
,
TM1lam_rc
("x"
,
TM1app_rc(f, TM1app_rc(f, TM1app_rc(f, TM1app_rc(f, x))))))
end

(* ****** ****** *)
//
#macdef f = TM1var_rc("f")
#macdef x = TM1var_rc("x")
//
val
App_N2_N3_nf =
normalize
(TM1app_rc(TM1app_rc(TM1app_rc(N2, N3), f), x))
//
val ((*void*)) =
(print!("App_2_3 = "); print0(normalize(App_N2_N3_nf)); println!())
//
(* ****** ****** *)

} // end of [main0]

(* ****** ****** *)

(* end of [LambdaCal_rc.dats] *)
