(* ****** ****** *)

(*
** For testing csv_parse_line
*)

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
#include "./../mylibies.hats"
//
(* ****** ****** *)

local
#staload
CSVPARLN = $CSV_PARSE_LINE
in(*in-of-local*)
extern
fun{}
csv_parse_line(line: string): list0(string)
impltmp
{}(*tmp*)
csv_parse_line
  (line) = res0 where
{
//
var nerr: int = 0
val res0 =
$CSVPARLN.csv_parse_line_nerr<>(line, nerr)
//
val (  ) = println!("nerr = ", nerr)
val res0 = $UN.castvwtp0{list0(string)}(res0)
//
} (* end of [csv_parse_line] *) end // end of [local]

(* ****** ****** *)

implement
main0() = {
//
val inp = "\
Total,245,307,536,422,301,487,395,383,307,407,0,584,120,65,325.6428571,555\
" // end of [val]
//
val xs0 = csv_parse_line(inp)
val ((*void*)) = println! ("xs0 = ", xs0)
//
val inp = "\
Total,,0, \"0, 0\"\",\"0, \"\"0\"\"\"\
" // end of [val]
val xs0 = csv_parse_line(inp)
val ((*void*)) =
(
print!("xs0 = "); list0_iforeach(xs0); println!()
) where
{
impltmp
list0_iforeach$work<string>(i0, x0) =
  (if i0 > 0 then print(";"); print!("(", x0, ")"))
} (* end of [where] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
