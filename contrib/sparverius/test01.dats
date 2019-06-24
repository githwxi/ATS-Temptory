#include "share/HATS/temptory_staload_bucs320.hats"

implfun main0() =
{

local

(*
impltmp the_stdout<>() = devnull where
{
  val-~optn0_vt_some(devnull) = FILEref_open_opt("/dev/null", "w")
}
*)

in

  val lopt1s = optn1_vt_some{int}(0)
  val lopt0s = optn0_vt_some{int}(1)
  val lopt1n = optn1_vt_none{int}()
  val lopt0n = optn0_vt_none{int}()

  val () = println!(lopt1s)
  val () = println!(lopt0s)
  val () = println!(lopt1n)
  val () = println!(lopt0n)

  val-~optn1_vt_some(x) = lopt1s
  val-~optn0_vt_some(x) = lopt0s
  val-~optn1_vt_none() = lopt1n
  val-~optn0_vt_none() = lopt0n


  val opt1s = optn1_some{int}(2)
  val opt0s = optn0_some{int}(3)
  val opt1n = optn1_none{int}()
  val opt0n = optn0_none{int}()

  val () = println!(opt1s)
  val () = println!(opt0s)
  val () = println!(opt1n)
  val () = println!(opt0n)


  val llist1 = $list1_vt{int}(1,2,3)
  val llist0 = g0ofg1($list1_vt{int}(4,5,6))

  val () = println!(llist1)
  val () = println!(llist0)

  val () = free(llist1)
  val () = free(llist0)


  val list1 = $list1{int}(1,2,3)
  val list0 = g0ofg1($list1{int}(4,5,6))

  val () = println!(list1)
  val () = println!(list0)


  val lstream0 = stream_vt_make<int>(g0ofg1($list1_vt{int}(1,2,3,4,5)))
  val lstream1 = stream_vt_make<int>(g0ofg1($list1_vt{int}(1,2,3,4,5)))

  val () = println!(lstream0)
  val () = println!(lstream1) where
  {
    impltmp stream_vt_print$n<>() = 3
  }

end

}
