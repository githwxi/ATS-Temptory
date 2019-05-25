# Counting Words

This example gives an implementation that counts words in
a given source and then sorts these words according to their
frequencies.

I regard it as a good programming style to introduce
type definitions for various concepts occurring in the code:
  
```ats
//
typedef word = string
typedef iword = (int, string)
//
typedef words = list0(word)
typedef iwords = list0(iword)
//
```

The type `iword` is just for each pair consisting of an int-value and a
string-value.

Let us first read all the words from the standard input (STDIN):

```ats
val words =
FILEref_streamize_word(the_stdin())
```

At the this point, `words` is a linear stream of string-values. We can
turn this stream into a linear list:

```ats
val words = listize(words)
```

As we do not plan to use a linear list in this example, we turn this linear
list into a non-linear list:

```ats
val words = list0_vt2t(words)
```

Then we can merge-sort the list of words obtained so far:

```ats
val words = mergesort(words)
```

At this point, we have a list of words sorted according to the standard lexicographic
ordering on string-values.

The next step is to turn the sorted list of words into a list of iword-values:

```ats
val iwords =
(
  loop(words)
) where
{
fun
loop(xs: words): iwords =
(
case+ xs of
| nil() => nil()
| cons(x0, xs) => loop2(xs, x0, 1, nil())
) (* end of [loop2] *)

and
loop2
( xs: words
, x0: word, i0: int
, res: iwords): iwords =
(
case+ xs of
| nil() => 
  cons((i0, x0), res)
| cons(x1, xs) =>
  if x0 = x1
  then loop2(xs, x0, i0+1, res)
  else loop2(xs, x1, 1, cons((i0, x0), res))
) (* end of [loop2] *)
}
```

For each iword-value in `iwords`, the int-value indicates the number of
times the string-value appears in `words`.

We can now sort `iwords` based on a specific order:

```ats
val iwords =
(
mergesort(iwords)
) where
{
implement
list0_mergesort$cmp<iword>
  (iw1, iw2) =
let
  val i1 = iw1.0
  val i2 = iw2.0
in
  if i1 > i2 then ~1 else (if i1 < i2 then 1 else compare(iw1.1, iw2.1))
end
}
```

Note that the specified order indicates that one iword-value `iw1` is
less than another one `iw2` if the int-value in `iw1` is less than
that in `iw2` or the two int-values are equal and the string-value in
`iw1` is less than that in `iw2`.

Let print out the first 250 (or fewer) words together with their
frquencies:


```ats
//
#define N 250
//
val
_(*bool*) =
(
list0_iforall(iwords)
) where
{
implement
list0_iforall$test<iword>
  (i0, iw) =
if
(i0 < N)
then (println!("word#", i0+1, ": ", iw.1, "(", iw.0, ")"); true)
else false
} (* end of [val] *)
//
```

One can execute `make` to generate `WordFrqncyCnt_dats`. For instance,
the following command-line should count the words in the novel `Moby Dick`
by Herman Melville:

  
```shell
wget -q -O - "http://www.gutenberg.org/files/2701/2701-0.txt" | ./WordFrqncyCnt_dats
```

The following output is expected:


```
word#1: the(14715)
word#2: of(6742)
word#3: and(6517)
word#4: a(4805)
word#5: to(4707)
word#6: in(4241)
word#7: that(3100)
word#8: it(2536)
word#9: his(2532)
word#10: i(2127)
word#11: he(1900)
word#12: s(1825)
word#13: but(1823)
word#14: with(1770)
word#15: as(1753)
word#16: is(1751)
word#17: was(1646)
word#18: for(1644)
word#19: all(1545)
word#20: this(1443)
word#21: at(1335)
word#22: whale(1245)
word#23: by(1227)
word#24: not(1173)
word#25: from(1105)
word#26: on(1073)
word#27: him(1069)
word#28: so(1066)
word#29: be(1064)
word#30: you(964)
word#31: one(925)
word#32: there(871)
word#33: or(798)
word#34: now(786)
word#35: had(779)
word#36: have(774)
word#37: were(683)
word#38: they(670)
word#39: which(655)
word#40: like(647)
word#41: me(633)
word#42: then(631)
word#43: their(620)
word#44: are(619)
word#45: some(619)
word#46: what(619)
word#47: when(607)
word#48: an(600)
word#49: no(596)
word#50: my(589)
word#51: upon(568)
word#52: out(539)
word#53: man(530)
word#54: up(526)
word#55: into(523)
word#56: ship(519)
word#57: ahab(517)
word#58: more(509)
word#59: if(501)
word#60: them(474)
word#61: ye(473)
word#62: we(469)
word#63: sea(455)
word#64: old(452)
word#65: would(432)
word#66: other(431)
word#67: been(415)
word#68: over(410)
word#69: these(406)
word#70: will(399)
word#71: though(384)
word#72: its(382)
word#73: down(379)
word#74: only(378)
word#75: such(376)
word#76: who(366)
word#77: any(364)
word#78: head(348)
word#79: yet(345)
word#80: boat(337)
word#81: long(334)
word#82: time(334)
word#83: her(332)
word#84: captain(329)
word#85: do(324)
word#86: here(324)
word#87: very(323)
word#88: about(318)
word#89: still(312)
word#90: than(311)
word#91: chapter(308)
word#92: great(307)
word#93: those(307)
word#94: said(305)
word#95: before(301)
word#96: two(298)
word#97: has(294)
word#98: must(293)
word#99: t(291)
word#100: most(285)
word#101: seemed(283)
word#102: white(281)
word#103: last(278)
word#104: see(275)
word#105: way(273)
word#106: whales(272)
word#107: thou(271)
word#108: after(270)
word#109: again(263)
word#110: stubb(261)
word#111: how(259)
word#112: did(258)
word#113: your(258)
word#114: may(255)
word#115: queequeg(253)
word#116: little(249)
word#117: can(247)
word#118: round(247)
word#119: while(246)
word#120: sperm(245)
word#121: three(245)
word#122: men(244)
word#123: say(244)
word#124: first(239)
word#125: through(235)
word#126: us(234)
word#127: every(232)
word#128: well(230)
word#129: being(225)
word#130: much(224)
word#131: where(223)
word#132: off(220)
word#133: could(217)
word#134: good(216)
word#135: hand(215)
word#136: same(215)
word#137: our(211)
word#138: side(208)
word#139: ever(206)
word#140: never(206)
word#141: himself(205)
word#142: look(205)
word#143: own(205)
word#144: deck(199)
word#145: starbuck(199)
word#146: almost(197)
word#147: go(194)
word#148: even(193)
word#149: water(190)
word#150: thing(188)
word#151: away(186)
word#152: should(185)
word#153: too(185)
word#154: might(183)
word#155: come(180)
word#156: day(179)
word#157: made(178)
word#158: pequod(178)
word#159: life(176)
word#160: world(176)
word#161: sir(175)
word#162: fish(171)
word#163: many(168)
word#164: among(167)
word#165: far(165)
word#166: seen(165)
word#167: back(164)
word#168: without(164)
word#169: line(160)
word#170: let(158)
word#171: oh(157)
word#172: right(157)
word#173: cried(156)
word#174: eyes(156)
word#175: nor(156)
word#176: aye(155)
word#177: god(153)
word#178: know(153)
word#179: part(153)
word#180: night(152)
word#181: sort(152)
word#182: thought(150)
word#183: once(149)
word#184: boats(147)
word#185: air(143)
word#186: crew(141)
word#187: don(140)
word#188: take(137)
word#189: whole(137)
word#190: full(136)
word#191: half(136)
word#192: against(135)
word#193: tell(135)
word#194: things(134)
word#195: thus(134)
word#196: whaling(133)
word#197: thee(131)
word#198: came(130)
word#199: hands(130)
word#200: mast(130)
word#201: small(130)
word#202: soon(130)
word#203: each(129)
word#204: feet(127)
word#205: both(126)
word#206: under(126)
word#207: something(123)
word#208: till(123)
word#209: think(122)
word#210: between(120)
word#211: she(120)
word#212: why(119)
word#213: found(118)
word#214: just(117)
word#215: place(117)
word#216: called(116)
word#217: saw(116)
word#218: another(115)
word#219: ll(115)
word#220: make(115)
word#221: nothing(115)
word#222: towards(115)
word#223: poor(114)
word#224: thy(113)
word#225: times(112)
word#226: along(110)
word#227: body(110)
word#228: heard(110)
word#229: work(110)
word#230: flask(109)
word#231: high(108)
word#232: stand(107)
word#233: moment(105)
word#234: sight(105)
word#235: end(103)
word#236: voyage(103)
word#237: new(102)
word#238: sail(102)
word#239: sun(102)
word#240: hold(99)
word#241: shall(99)
word#242: does(98)
word#243: strange(98)
word#244: nantucket(97)
word#245: went(97)
word#246: years(97)
word#247: however(96)
word#248: leviathan(96)
word#249: face(95)
word#250: few(95)
```

Happy programming in ATS-Temptory!!!
