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
val () = dynarray_insert_at (DA, i2sz(0), 0)
val () = println! ("DA[0] = ", DA[0])
val () = assertloc(0 = DA[0])
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(0), 1)
val () = println! ("DA[0] = ", DA[0])
val () = assertloc(1 = DA[0])
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(1), 2)
val () = println! ("DA[1] = ", DA[1])
val () = assertloc(2 = DA[1])
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(2), 3)
val () = println! ("DA[2] = ", DA[2])
val () = assertloc(3 = DA[2])
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val () = dynarray_insert_at (DA, i2sz(3), 4)
val () = println! ("DA[3] = ", DA[3])
val () = assertloc(4 = DA[3])
val () = println! ("DA->sz = ", dynarray_get_size (DA))
val () = println! ("DA->cap = ", dynarray_get_capacity (DA))
//
val (arr, sz) = dynarray_takeout (DA)
prval () = dynarray_restore (DA, arr)
//
var x : int
val () = dynarray_takeout_at (DA, i2sz(1), x)//weird!
val () = assertloc (x = 2)
val () = println! ("takeout(1) = ", x)
var y : int
val () = dynarray_takeout_at (DA, i2sz(0), y)
val () = assertloc (y = 1)
val () = println! ("takeout(beg) = ", y)
var z : int
val () = dynarray_takeout_last (DA, z)
val () = assertloc (z = 0)
val () = println! ("takeout(end) = ", z)
//
val () = println! ("DA->sz = ", dynarray_get_size (DA))
//
val ((*freed*)) = dynarray_free (DA) where {
//
impltmp
gfree$ref<int> (x) = ()
//
}
//
} (* end of [val] *)
