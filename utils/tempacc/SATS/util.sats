fun{}
to_bool : int -> bool

fun{}
to_booln : int -> bool

fun{}
str_strr(cs: string, pred: char): int

fun{}
str_cmp(cs: string, match: string): int

fun{}
ext_cmp(cs: string, match: string): int

(* ****** ****** *)

fun{}
dirsep_get ():<> [n:int | n > 0] char(n)

fun{}
dirsep_gets ():<> string

fun{}
dirname_self ():<> string

fun{}
dirname_parent ():<> string

(* ****** ****** *)

fun{}
filename_get_ext(name: string):<> string

fun{}
filename_test_ext(name: string, ext: string):<> bool

fun{}
filename_get_base (name: string):<> string

fun{}
filename_test_base (name: string, base: string):<> bool

(* ****** ****** *)

fun{}
str_rightmost2
( cs: string
, ch1: char, ch2: char): (uint, uint)

fun{}
string0_cpy(cs2: string, n: size): string_vt

fun{}
base_ext(xs: string): (string0_vt, string0_vt)
