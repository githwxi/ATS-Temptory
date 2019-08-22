(*
#include "share/HATS/temptory_staload_bucs320.hats"
*)


extern
fun
to_bool : int -> bool
implfun
to_bool i = (if i = 0 then false else true)

extern
fun
to_booln : int -> bool
implfun
to_booln i = ~(to_bool i)


extern
fun{}
str_strr(cs: string, pred: char): int

impltmp{}
str_strr(cs, ch) = (loop0(cptrof(cs), 0, ~1)) where
{
  fun loop0(p1: cptr(char), sz: int, i: int): int = let
    val c1 = $UN.cptr0_get(p1)
  in
    ifcase iseqz(c1) => i
    | _ =>
      loop0(succ(p1), sz+1, nxt)
      where
        val nxt = (if c1=ch then sz else i)
      end
  end
}

extern
fun{}
str_cmp(cs: string, match: string): int

impltmp{}
str_cmp(cs, match) = loop0(cptrof(cs), cptrof(match)) where
{
  fun loop0(p1: cptr(char), p2: cptr(char)): int = let
    val c1 = $UN.cptr0_get(p1)
    val c2 = $UN.cptr0_get(p2)
    (*
    val () = println!("c1,c2 = ", c1, ",", c2)
    *)
  in
    ifcase iseqz(c1) => (c1 - c2)
    |_=>
      ifcase (c1 = c2) => loop0(succ(p1), succ(p2))
      |_=>
        char0_ord(c1)
  end
}

extern
fun{}
ext_cmp(cs: string, match: string): int

impltmp{}
ext_cmp(cs, match) = let
  val ext0 = str_strr(cs, '.')
in
  ifcase ext0 < 0 (* -1 *)=> ~1
  | _ => str_cmp(str0, match)
    where
      val i = $UN.cast{usize}(ext0)
      val str0 = $UN.cast{string}(succ(cptrof(cs)+i))
    end
end


(* ****** ****** *)

extern fun{} dirsep_get ():<> [n:int | n > 0] char(n)
extern fun{} dirsep_gets ():<> string
extern fun{} dirname_self ():<> string
extern fun{} dirname_parent ():<> string

(* ****** ****** *)

extern fun{}
filename_get_ext(name: string):<> string

extern fun{}
filename_test_ext(name: string, ext: string):<> bool

(* ****** ****** *)

extern fun{}
filename_get_base (name: string):<> string
//vStrptr1
extern fun{}
filename_test_base (name: string, base: string):<> bool

impltmp{} dirsep_get () = '/'
impltmp{} dirsep_gets () = "/"
impltmp{} dirname_self () = "."
impltmp{} dirname_parent () = ".."


extern fun{} string0_rforall(cs: string): bool
extern fun{} string0_rforall$test(c0: char): bool

impltmp {} string0_rforall(cs) = (loop1(p1))
where
{

  val p0 = string0_cptrof(cs)

  val p1 = loop0(p0) where
  {
    fun loop0(p1: cptr(char)): cptr(char) = let
      val c1 = $UN.cptr0_get(p1)
    in
      if iseqz(c1) then p1 else loop0(succ(p1))
    end
  }

  fun loop1(p1: cptr(char)): bool =
  (
    if p1 <= p0 then true else let
      val p1 = pred(p1)
      val c1 = $UN.cptr0_get(p1)
      val test = string0_rforall$test<>(c1)
    in
      if test then loop1(p1) else false
    end
  )

}

(* ****** ****** *)


extern
fun{}
str_rightmost2(cs: string, pred: char, pred2: char): (uint, uint)

impltmp{}
str_rightmost2(cs, ch, ch2) = loop0(p0, 0u, 0u, 0u) where
{
  val p0 = string0_cptrof(cs)

  fun loop0(p1: cptr(char), sz: uint, i: uint, i2: uint): (uint, uint) = let
    val c1 = $UN.cptr0_get(p1)
  in
    ifcase
    | iseqz(c1) => (i, i2)
    | _ => loop0(succ(p1), succ(sz), rch1, rch2) where
    {
      val rch1 = (if c1 = ch then sz else i)
      val rch2 = (if c1 = ch2 then sz else i2)
    }
  end
}

#define CNUL '\000'

extern
fun{}
string0_cpy(cs2: string, n: size): string_vt

impltmp{}
string0_cpy(cs1, size) = let
  (*
  val () = println!(size)
  *)
  val cp0 = $UN.calloc<char>(succ(size))

  val cp1 = (string0_ifoldleft<cptr(char)>(cs1, cp0)) where
  {
    impltmp
    string0_ifoldleft$fopr<cptr(char)>(r0, i0, x0) =
      if
      $UN.cast{size}i0 < size
      then ($UN.cptr0_set(r0, x0); succ(r0))
      else r0
  }
in
  let
    val () = $UN.cptr0_set(cp1, CNUL)
  in
    $UN.castvwtp0{string0_vt}(cp0)
  end
end

extern fun{}
base_ext(xs: string): (string0_vt, string0_vt)

impltmp{}
base_ext(istr) = (xs, ys) where
{
  val sep = dirsep_get<>()

  val-(fst,snd) = str_rightmost2<>(istr, '/', '.')

  val split0 = $UN.cast{size}(snd - fst - 1u)

  val str0 = $UN.cast{string}(succ(cptrof(istr)+fst))
  val str1 = $UN.cast{string}(succ(cptrof(str0)+split0))

  val length = i2sz(length(str0))
  val split1 = length - $UN.cast{size}(split0)

  val xs = string0_cpy<>(str0, split0)
  val ys = string0_cpy<>(str1, split1)
}
