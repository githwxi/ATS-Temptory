#include "share/HATS/temptory_staload_bucs320.hats"

#staload "libats/SATS/dynarray.sats"
#staload _ = "libats/DATS/dynarray.dats"

implfun main0() =
{
//
typedef T = int
//
val DA = dynarray_make_nil<T> (i2sz(1))
//
// TODO: fix the 0 bytes memmove case and then you can use this
//val () = dynarray_insert_at (DA, i2sz(0), 0)
val () = dynarray_append (DA, 0)
val () = println! ("DA[0] = ", dynarray_get_at_sint<int>(DA, 0))
val () = assertloc(0 = dynarray_get_at_sint<int>(DA, 0))
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(0), 1)
val () = println! ("DA[0] = ", dynarray_get_at_sint<int>(DA, 0))
val () = assertloc(1 = dynarray_get_at_sint<int>(DA, 0))
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(1), 2)
val () = println! ("DA[1] = ", dynarray_get_at_sint<int>(DA, 1))
val () = assertloc(2 = dynarray_get_at_sint<int>(DA, 1))
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(2), 3)
val () = println! ("DA[2] = ", dynarray_get_at_sint<int>(DA, 2))
val () = assertloc(3 = dynarray_get_at_sint<int>(DA, 2))
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(3), 4)
val () = println! ("DA[3] = ", dynarray_get_at_sint<int>(DA, 3))
val () = assertloc(4 = dynarray_get_at_sint<int>(DA, 3))
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val (arr, sz) = dynarray_takeout (DA)
prval () = dynarray_restore (DA, arr)
//
var x : int = (g0ofg1)0
val () = dynarray_takeout_at (DA, i2sz(1), x)
//val () = println! ("takeout(0) = ", x)
val () = dynarray_takeout_at (DA, i2sz(0), x)
//val () = println! ("takeout(beg) = ", x0)
val () = dynarray_takeout_last (DA, x)
//val () = println! ("takeout(end) = ", x0)
//
val () = println! ("DA->sz = ", dynarray_get_size (DA))
//
val ((*freed*)) = dynarray_free_tflt{int} (DA)
(*
val ((*freed*)) = dynarray_free (DA) where {
impltmp
gfree$ref<int> (x) = ()
}*)
//
} (* end of [val] *)
