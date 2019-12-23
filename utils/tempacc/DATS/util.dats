#include
"share/HATS\
/temptory_staload_bucs320.hats"

#staload "./../SATS/util.sats"

impltmp{}
to_bool(i) =
(if i = 0 then false else true)

impltmp{}
to_booln i = ~(to_bool i)

impltmp{}
str_strr(cs, ch) =
(loop0(cptrof(cs), 0, ~1)) where
{
  fun
  loop0
  ( p1: cptr(char)
  , sz: int, i0: int): int = let
    val c1 = $UN.cptr0_get(p1)
  in
    ifcase iseqz(c1) => i0
    | _ =>
      loop0(succ(p1), sz+1, nxt)
      where
        val nxt = (if c1=ch then sz else i0)
      end
  end
}

impltmp{}
str_cmp(cs, match) =
loop0(cptrof(cs), cptrof(match)) where
{
  fun
  loop0
  ( p1: cptr(char)
  , p2: cptr(char)): int = let
    val c1 = $UN.cptr0_get(p1)
    val c2 = $UN.cptr0_get(p2)
  in
    ifcase
    | iseqz(c1) => (c1 - c2)
    | _ (* else *) =>
    (
    ifcase
    | (c1 = c2) =>
      loop0(succ(p1), succ(p2))
    | _ (* else *) => char0_ord(c1)
    )
  end // end of [loop0]
}

impltmp{}
ext_cmp(cs, match) = let
  val ext0 = str_strr(cs, '.')
in
  ifcase
  | ext0 < 0 (* -1 *) => ~1
  | _ => str_cmp(str0, match)
    where
      val i = $UN.cast{usize}(ext0)
      val str0 = $UN.cast{string}(succ(cptrof(cs)+i))
    end
end


(* ****** ****** *)

impltmp{} dirsep_get () = '/'
impltmp{} dirsep_gets () = "/"
impltmp{} dirname_self () = "."
impltmp{} dirname_parent () = ".."

(* ****** ****** *)
//
// If found,
// the returned position
// equals 1 + the actual position
//
impltmp{}
str_rightmost2
(cs, ch1, ch2) =
loop0(p0, 0u, 0u, 0u) where
{
//
val p0 = string0_cptrof(cs)
//
  fun
  loop0
  ( p1: cptr(char)
  , sz: uint
  , i1: uint
  , i2: uint
  ) : (uint, uint) = let
    val c1 = $UN.cptr0_get(p1)
  in
    ifcase
    | iseqz(c1) => (i1, i2)
    | _ =>
      loop0
      (p1, sz, rch1, rch2) where
    {
      val p1 = succ(p1) and sz = succ(sz)
      val rch1 = (if c1 = ch1 then sz else i1)
      val rch2 = (if c1 = ch2 then sz else i2)
    }
  end
}

(* ****** ****** *)

#define CNUL '\000'

impltmp{}
string0_cpy(cs1, size) = let
  val cp0 =
  $UN.calloc<char>(succ(size))
  val cp1 =
  (string0_ifoldleft<cptr(char)>(cs1, cp0)) where
  {
    impltmp
    string0_ifoldleft$fopr<cptr(char)>(r0, i0, x0) =
      ifcase
      | $UN.cast{size}(i0) < size => ($UN.cptr0_set(r0, x0); succ(r0))
      | _ => r0
  }
in
  $UN.castvwtp0{string0_vt}(cp0) where { val () = $UN.cptr0_set(cp1, CNUL) }
end

(* ****** ****** *)

impltmp{}
base_ext(str) =
  (fst, snd) where
{
//
val sep = dirsep_get<>()
//
  val-
  (fst, snd) =
  str_rightmost2<>(str, sep, '.')
//
(*
val () =
  println!("base_ext: str = ", str)
  val () =
  println!("base_ext: fst = ", fst)
  val () =
  println!("base_ext: snd = ", snd)
*)
//
  val
  split0 = $UN.cast{size}(snd - fst - 1u)
//
  val str0 =
  $UN.cast{string}(cptrof(str)+fst)
  val str1 =
  $UN.cast{string}(succ(cptrof(str0)+split0))

  val length = i2sz(length(str0))
  val split1 = length - $UN.cast{size}(split0)
//
  val fst = string0_cpy<>(str0, split0)
  val snd = string0_cpy<>(str1, split1)
//
(*
  val () = println!("base_ext: fst = ", fst)
  val () = println!("base_ext: snd = ", snd)
*)
//
} (* end of [base_ext] *)

(* ****** ****** *)

(* end of [util.dats] *)
