(* ****** ****** *)
//
// For numbers
//
(* ****** ****** *)

fun
{a:tflt}
g_0(): (a)
fun
{a:tflt}
g_1(): (a)
fun{a:tflt}
g_2(): (a)

(* ****** ****** *)

fun
{a:tflt}
g_succ(a): a
fun
{a:tflt}
g_pred(a): a

(* ****** ****** *)

fun
{a:tflt}
g_add(a, a): a
fun
{a:tflt}
g_sub(a, a): a
fun
{a:tflt}
g_mul(a, a): a
fun
{a:tflt}
g_div(a, a): a
fun
{a:tflt}
g_mod(a, a): a

(* ****** ****** *)

fun
{a:tflt}
g_ofint: int -> a
fun
{a:tflt}
g_toint: (a) -> int

fun
{a:tflt}
g_ofdbl: double -> a
fun
{a:tflt}
g_todbl: (a) -> double

(* ****** ****** *)

fun
{pf:prop}
{xs:tflt
;x0:tflt}
gseq_add(xs: xs): x0
fun
{pf:prop}
{xs:tflt
;x0:tflt}
gseq_mul(xs: xs): x0

(* ****** ****** *)

(* end of [gnum.sats] *)
