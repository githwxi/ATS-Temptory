# Hello, World!

I suppose that you have already gained access to the commands tempacc,
tempopt. If you have not, there are quite a few resources on-line that
can guide you through the process of installing ATS (more precisely,
ATS-Temptory) on your own machine.

Let us go through the few lines of code in [Hello.dats](./Hello.dats)
quickly.  One can form a line-comment in ATS by starting the line with
two slashes (//). One can also form a block-comment in ATS by using
the ML-style of commenting:

```ats
(*
...here-is-a-block-comment...
*)
```

The following lines are for staloading (that is, statically loading)
some library code that the ATS compiler (ATS/Postiats) may need for the purpose
of compilation:

```ats
#include
"share/HATS/temptory_staload_bucs320.hats"
```

I will give some explanation elsewhere on using library functions in
the construction of ATS programs.  In order to compile a program into
an executable, the special function named `main` need to be
implemented. In the following code, `main0` is a variant of
`main`:

```ats
implement
main0() = println! ("Hello", ", world!")
```

Note that the body of `main0` is required to be of the type
`void`. The function-like `println!` prints its arguments to
the standard output and then prints a newline at the end. I use the
name function-like to refer to something in ATS that is like a
function but is not actually a function.

There is a Makefile provide for compiling the code. One can also use
the following command-line for compilation:

```shell
tempacc -o Hello_dats Hello.dats
```

which should generate an executable of the name *Hello_dats*. By executing
*Hello_dats*, one sees the expected output:

```text
>> ./Hello_dats
<< Hello, world!
```

Happy programming in ATS-Temptory!!!
