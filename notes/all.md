getMinElm_311b.sml


```

fun getMinElm T = 
  if #1(T) > #2(T) then 
    if #1(T) > #3(T) then #1(T) else #3(T)
  else 
    if #2(T) > #3(T) then #2(T) else #3(T)
```

thirdPower_311a.sml


```

fun thirdPower (x) = x*x*x;
```

copyelements_321c.sml


```

fun copyelements (L) =
  if L = nil then nil (* 基底 *)
  else hd(L)::hd(L)::copyelements(tl(L));
```

e.sml


```

fun multiplying (x,i) =
  if i = 0 then 1.0  (* 型に注意！ *)
  else x * multiplying (x, i-1);
```

f.sml


```

(* 整数のリストの最大値を計算する関数 *)
fun maxelement(L) = 
  if tl(L) = nil then hd(L)
  else if hd(L) > maxelement(tl(L)) then hd(L)
       else maxelement(tl(L));

(* improved: the func is just called once *)
fun maxelement2(L) =
  if tl(L) = nil then hd(L)
  else if hd(L) > hd(tl(L)) then maxelement2(hd(L)::tl(tl(L)))
       else maxelement2(tl(L));

```

lengthList_321b.sml


```

fun listlength (L) =
  if L = nil then 0
  else listlength(tl(L)) + 1;
```

deleteElement_333.sml


```

fun deleteElement (nil, _) = L
  | deleteElement (x::xs, i) = if then deleteElement(xs, );
```

deleteIE_333.sml


```

fun deleteIE (nil, i) = nil
  | deleteIE (x::xs, 1) = xs
  | deleteIE (x::xs, i) = x::deleteIE (xs, i-1)

(* another example *)
fun deleteIE (nil, _) = nil
  | deleteIE (_::xs, 1) = xs
  | deleteIE (x::xs, i) = x::deleteIE (xs, i-1)
```

insertElementFirst_3312.sml


```

fun insertElementFirst (_, nil) = nil
  | insertElementFirst (a, x::xs) = (a::x)::insearch(a, xs); 
(*| insertElementFirst (a, x::xs) = (a::x)@insearch(a, xs); *)
(* コンス演算子は右側から評価する *)
```

insertFirst_3312.sml


```

fun insertFirst (nil, a) = a::L
  | insertFirst ([x]::[xs], _) = insertFirst([x]);
```

isFirstCharVowel_339.sml


```

fun isFirstVowel (x::_) = if x="a" orelse x="i" orelse x="u" orelse x="e" orelse x="o" then true else false;
```

piglatin_3310.sml


```

fun piglatin (S) = implode(piglatin1(explode(S)));

(* 最初1文字以上が子音のとき *)
fun piglatin2 (nil) = nil
  | piglatin2 (x::xs) = if vowel (x::xs) then x::xs@[#"a", #"y"]
                        else piglatin2 (xs@[x]);

(* 最初が母音のとき *)
fun piglatim1 (nil) = nil
  | piglatin1 (x::xs) = if vowel (x::xs) then x::xs@[#"y", #"a", #"y"]
                        else piglatin2 (xs@[x]);

```

repElements_332.sml


```

fun repElements nil = nil (* 基底 *)
  | repElements ([x]) = [x] (* 基底...要素数が奇数のときも考慮 *)
  | repElements (x::y::xs) = y::x::repElements(xs);
```

3-3-1

b.sml


```

(* fact.sml *)
fun fact (0) = 1 
  | fact (n) = n * fact (n-1)

(* answer *)
fun cycleList (nil) =
  | cycleList (x::xs) = xc@[x];
```

3-3-1

c.sml


```

fun cydeList nil = nil
  | cydeList (x::xs) = (xs)@[x];


  (* anser *)

fun multiCycle (0, L) = L
  | multiCycle (i, L) = multiCycle (i-1, cycleList(L));


fun ic (nil, _) = nil
  | ic (x::xs, 1) = xs@[x]
  | ic (x::xs, i) = ic (xs@[x], i-1)
```

3-3-1

d.sml


```

fun copyElements nil = nil
  | copyElements (x::xs) = x::x::copyElements(xs)

(* answer *)
fun dupE (nil) = nil
  | dupE (x::xs) = x::x::dupE(xs);
```

3-3-1

e.sml


```

fun multiplying x 0.0 : real = 1.0 
  | multiplying x i : real = x * multiplying (x, i-1.0)

  (* answer *)
fun multiplying (x, 0) = 1.0
  | multiplying (x, i) = x * multiplying (x, x-1);
```

3-3-1

f.sml


```

fun calcMaxNum (x::nil) : real = x
  | calcMaxNum (x::xs) : real = if x > calcMaxNum(xs) then x
                                else calcMaxNum(xs)

(* answer *)
fun maxList ([x : real]) = x (* ここじゃなくてもいいのでどっかに型宣言*)
  | maxList (x::y::zs) = if x > y then maxList(x::zs)
                         else maxList (y::zs);
```

answer.sml


```

a) 

x: "a", y: "b", zs: ["c"], w: ["d", "e"]

b) 

x: "a", y: "b", zs: nil, w: 4.5

c)

一致しない
```

answer.sml


```

x: (1,2)
y: 3
zs: nil
```

cat_351.sml


```

(* リストLとリストMを連結する関数．ただし@演算子を使わずに::を使い，リストLの長さにのみ比例する時間で動作するように実装する *)
fun cat (nil, M) = M

  | cat (x::xs, M) = x::cat(xs, M)
```

cycle_352.sml


```

(* リストLをi回巡回する関数cycleを書く．ただしこの関数はリストLの長さに比例した時間で動くものとする．-> 補助関数に分割して作成する *)

fun cycle1 (L, M, 0) = cat(L, rev(M))
  | cycle1 (x::xs, M, i) = cycle1(xs, x::M, i-1)

fun cycle (L, i) = 
  cycle1 (L, nil, i);
```

3-2

31.md


```

(a) int型とreal型で計算しているから
(b) ~~リストの中身が違う型だから~~ 違う型を取る関数はかけない
(c) 循環するようにすると、型が決まらないため x y -> y x
(b) 循環しているから。自分自身を取る場合は、特別な場合を除いて型が決まらないから。
```

3-2

311.md


```

## 1. fn x => x > 1

int -> bool

ここはなんでintになる？


## 2. fn x => fn y => fn z => (x y, x "Ada", y > z)

```
fn x => fn y => fn z => (x  y, x "Ada", y > z)
   t2      t3      t4    _t5_  __t6__  __t7__
                         _________t8_________
________________t1___________________________
```

t1 = t2 -> t3 -> t4 -> t8

t5, t6, t7について

t2 = t3 -> t5
t2 = String -> t6
t7 = bool
t8 = t5 * t6 * t7
t5 = t6
t3 = String

t1 = (string -> t6) -> string -> string -> (t6 * t6 * bool)
   = (string -> 'a) -> string -> string -> ('a * 'a * bool)


## 3. fn x => fn y => y (x > x)

```
fn x  => fn y => y (x > x)
   t1       t2      _t3__
                 ___t4___
___________t5____________
```

t5 = t1 -> t2 -> t4
t2 = t3 -> t4
t3 = bool
t2 = int  
**何も指定がなく四則演算や比較がされている場合勝手にintとする**

t5 = int -> (bool -> 'a) -> 'a
```

3-2

314.md


```

# 3.14

## - "M" = #"M"

正しくない


## - "ML" = "SML"

正しい false bool


## - fn x => (x, x) = (x, x)

右辺はboolになる。

左辺は`''a`になる。クオーテーションは**等価判定ができる型**という意味。

```
''a -> bool
```

実数や関数


## - fn (x, f) => (f (fn x => x), f x, x = x)

fには`(fn x => x)`と、`x`という2種類の引数をそれぞれとっている。

`x=x`という等価判定をすることができない。なぜなら`x`は関数になるから。
```

3-2

32.md


```

idは高等関数である。引数できたものをそのまま返す関数

1. ~~'a->'a->'a~~ 'a->'a  idにid('a->'a)を渡している TODO:ask here! 

2. Just confirm here...

3. Just confirm here...
```

3-2

33.md


```

1. twice cube

```
- twice cube;
val it = fn : int -> int
```


2. fn x => twice id x

```
- fn x => twice id x;
val it = fn : 'a -> 'a
```

匿名関数


3. fun thirce f x = f (f (f x))

```
- fun thirce f x = f (f (f x));
val it = fn : ('a -> 'a) -> 'a -> 'a
```

twiceと一緒だ


```
fun thirce  f   x   = f (f (f x));
    __t1__  t2  t3          _t4_
                         ___t5__
                      ____t6____   
```

このとき

t1 = t2 -> t3 -> t6
t2 = t3 -> t4 (t3を引数にしてt4を得られる)
t2 = t4 -> t5 
t2 = t5 -> r6

これより

t3 = t4 = t5 = t6

これよりt1の式は、

t1 = t2 -> t3 -> t3 = (t3 -> t3) -> t3 -> t3 = ('a->'a)->'a->'a
```

3-2

34.md


```

```sml
fun twice f x = f (f x);
```

の型が`('a->'a)->'a->'a`であることを示せ

---

すべてに変数をあてて具体化する


```
fun twice  f  x   =  f (f  x);
    _t1__  t2 t3       __t4__
                     ___t5___
```

t1 = t2 -> t3 -> t5
t2 = t3 -> t4 
t2 = t4 -> t5

同じ型にならなければいけないので、

t3 = t4
t4 = t5

よって、上のt1の式は以下のようにかける。

t1 = (t3->t3)->t3->t3

仮の変数名を置き換える。

t1 = ('a->'a)->'a->'a
```

3-2

35.md


```

3.5

## 1. fun S x y z = (x z) (y z)

```
fun S  x  y  z  =  (x z) (y z)
    t1 t2 t3 t4    _t5_ _t6_
                   ____t7____
```

t1 = t2 -> t3 -> t4 -> t7
t2 = t4 -> t5
t3 = t4 -> t6
t5 = t6 -> t7

~~t1 = (t4 -> t5) -> (t4 -> t6) -> t4 -> t7~~

(t4 -> t6 -> t7) -> (t4 -> t6) -> t4 -> t7
= ('a -> 'b -> 'c) -> ('a -> 'b) -> 'a -> 'c


## 2. fun K x y = x

```
fun K  x  y  = x
    t1 t2 t3
```

t1 = t2 -> t3 -> t2

**左辺を求める=t1**
**右辺からわかることを出し尽くす**

'a -> 'b -> 'a


## 3. fun A x y z = z y x

```
fun A  x  y  z  =  z  y  x
    t1 t2 t3 t4    __t5___
```

t1 = t2 -> t3 -> t4 -> t5
t4 = t3 -> t2 -> t5

t1 = t2 -> t3 -> (t3 -> t2 -> t5) -> t5
   = 'a -> 'b -> ('b -> 'a -> 'c) -> 'c



## 4. fun B f g = f g g 

```
fun B  f  g  =  f  g  g 
    t1 t2 t3    __t4___
```

t1 = t2 -> t3 -> t4
t2 = t3 -> t3 -> t4

t1 = (t3 -> t3 -> t4) -> t3 -> t4
   = ('a -> 'a -> 'b) -> 'a -> 'b


## 5. fun C x = x C

エラー、型はない！


## 6. fun D p a b = if p a then (b, a) else (a, b)

```
fun D  p  a  b  = if  p  a  then (b,  a) else (a,  b)
    t1 t2 t3 t4       _t5_       __t6__        __t7__
```

t1 = t2 -> t3 -> t4 -> t6
t1 = t2 -> t3 -> t4 -> t7

t2 = t3 -> t5
t6 = t7  
t4 = t3  (* ifの結果が等しい、つまりt6とt7の型が等しいので、それぞれの一番目、二番目の型は同じでなければならない *)
t5 = bool (* if分の条件はboolじゃなきゃいけない->型決まってるので *)
t6 = t3*t3 (* TODO: ASK!! *)

t1 = (t3 -> bool) -> t3 -> t3 -> t3*t3 
   = ('a -> bool) -> 'a -> 'a -> 'a * 'a
```

3-2

36.md


```

'a -> 'b

無限呼び出しになるけど型はあるよ、って言いたかったんだろーなと。
```

3-2

37.md


```

## 1. fun f x y z = x y z : int

まず前準備

```
fun f  x  y  z  =  x  y  z
    t1 t2 t3 t4    __t5___
```

t1 = t2 -> t3 -> t4 -> t5
t2 = t3 -> t4 -> t5

t1 = (t3 -> t4 -> t5) -> t3 -> t4 -> t5
   = ('a -> 'b -> 'c) -> 'a -> 'b -> 'c


じゃあこれにintをつける。

```
fun f x y z = x y z : int
```

この`: int`っていうのは`t5`に適用されている。

t1 = ('a -> 'b -> int) -> 'a -> 'b -> int


## 2. fun f x y z = x (y z) : int

```
fun f  x  y  z  = x (y z) 
    t1 t2 t3 t4      _t5_
                  __t6__
```

t1 = t2 -> t3 -> t4 -> t6
t3 = t4 -> t5
t2 = t5 -> t6

t1 = (t5 -> t6) -> (t4 -> t5) -> t4 -> t6
   = ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b

intをつけると...

```
fun f x y z = x (y z) : int
```

これは`t6`に適用されるので...


t1 = ('a -> int) -> ('c -> 'a) -> 'c -> int 
   = ('a -> int) -> ('b -> 'a) -> 'b -> int 


cをbに変えるのを忘れない！


## 3. fun f x y z = (x y z) : int

```
fun f  x  y  z = (x y z)
    t1 t2 t3 t4   __t5__
```

これは、`t5`をintと指定しているので、**1と同じ意味になる！！！**


## 4. fun f x y z = x y (z: int)

`t4`がintとなっているので、1の問題から、

```
t1 = ('a -> int -> 'b) -> 'a -> int -> 'b
```


## 5. fun x y z = x (y z : int)

2の問題と同じになる。

`t5`がintといっているので...

t1 = (int -> 'a) -> ('b -> int) -> 'b -> 'a 
```

3-2

38.md


```

# 3.8

## 以下の動作と型を説明せよ

fun f x = K x (fn y => x (x 1))

fun K x y = x
- val it = fn : 'a -> 'b -> 'a

---

### 動作:


### 型: 

fun f  x  =  K  x (fn  y => x  (x  1))
    t6 t7              t2   t5  _t4_
                            ___t3____
                   ________t1________
             __________t8____________


先に後ろの部分を考える。

t1 = t2 -> t3
t5 = t4 -> t3
t5 = int -> t4

t3 = t4 = int
t1 = t2 -> int

ここで、t8っていうのは〜、Kの結果だから〜 

t8 = t7

t7っていうのは〜、右辺の`K x`のxと一緒なので〜

t7 = t5 = int -> int

t6 = t7 -> t8 
   = (int -> int) -> int -> int
```

3-2

cube_33.sml


```

fun cube x = x*x*x;
```

3-2

id_33.sml


```

fun id x = x;
```

3-2

twice_33.sml


```

fun twice f x = f (f x);
```

doubleExp_345.sml


```

fun doubleExp (x::real, 0) = x
  | doubleExp (x, i) = 
  let
    val y = doubleExp (x, i-1)
  in
    y * y
  end;
```

maxElement_344.sml


```

(* inspired by 3.2.1(f) *)
fun maxElement L =
let
  (* ここでtail部分の最大値を求めておく *)
  maxElementOfTail = 
    if tl(L) = nil then hd(L)
    else if hd(tl(L)) > maxElement(tl(L)) then hd(tl(L))
         else maxElement(tl(L))
in
  (* 変数宣言部で求めた最大値とheadを比較して値を返す *)
  if h(L) > maxElementOfTail then h(L)
  else maxElementOfTail
end;

(* answer *)
fun maxNumber (x::nil) = x
  | maxNumber (x::xs) = 
  let
    val m = maxNumber (xs)
  in
    if x > m then x
    else m
  end;
```

thousandthPower_341.sml


```

fun thousandthPower (x: real) =
let
  val tenthPowerOfX = x*x*x*x*x*x*x*x*x*x;
  val hundredthPowerOfX = hundredthPower x;
in
  tenthPowerOfX * hundredthPowerOfX
end;
```

applyList.sml


```

fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;
```

comb_512.sml


```

val rec comb = fn (_, 0) => 1  (* 0個を選ぶ *)
                | (n, m) => if m=n then 1  (*
                nとmが等しいってのはパターンでは書けない *)
                            else comb(n-1, m) + comb(n-1, m-1)

(* n個の中からm個を選ぶときの全てのパターン *)
(* (n m) = n!/(n-m)! * 1/n! *)
```

comp_564.sml


```

(* 5.6.4
* 以下の式が与えられている時、関数の場合には型、定数の場合にはその値を答えよ *)

fun comp F G = (* カリー化形式 *)
let
  fun C x = G(F(x))
in 
  C
end;

fun add1 x = x + 1;

(* val comp = fn : ('a -> b)->('b -> 'c)->'a->'c *)



(* a *)
- val compA1 = comp add1;

             (* compA1の型 *) 
copm: ('a->'b)->('b->'c)->'a->'c
                (int->a)->int->'a
                  


(* b *)
- val compCampaA1 = comp compA1

((int->'a)->'c)-:(int->'a)->'c
((int->'a)->'b)-:(int->'a)->'b


(* c *)
- val f = compA1 add1;

compA1: (int->'a)->(int->'a)

(* d *)
- f(2);

val it = 4 : int


(* e *)
- val g = compCompA1 compA1;

compAcompA1: ((int->'a)->'b) -> (int->'a)->'b)
compA1(init->'a ) ->(int->'a') 


(* f *)
val h = g add1;

h: int -> int

(* g *)
h (2);

val it = 5: int
```

isSubsequence_556.sml


```

(* 5.5.1 *)
fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;

(* 5.5.4 *)

fun isSubsequence2 (x, nil) = isSubsequence1 (x, nil)
  | isSubsequence2 (x, y::ys) = isSubsequence1 (x, y::ys) orelse isSubsequence2
  (x, ys);


  (* 2つの文字列に関して部分ならびを検出する配列 *)

(*
* answer
*)

(* 5.5.6 *)
fun sq (nil, _) = true
  | sq (_, nil) = false
  | sq (x::xs, y::ys) = if x=y then sq (xs, ys)
                        else sq (x::xs, ys);

fun subsequence x y = sq (explode(x), explode(y));

- val g = makeFnList subsequence;
- val [ear, part, trap, seat] = g ["ear", "part", "trap", "seat"];
- applyList [ear, part, trap, seat] "separate";

(* [true, true, false, true] *)
```

map-foldr-foldl_561.sml


```

(* a. 整数のリストを実数のリストに変換する関数 *)
(* http://walk.wgag.net/sml/coretypes.html *)
- map (fn (x) => real x) [2, 3, 5, 10];

- val A = map real; (* answer *)


(* b. 整数のリストLをLの各要素の絶対値でかつ実数のリストに変換する関数 *)
(* 絶対値にする関数 http://walk.wgag.net/sml/coretypes.html *)
- map (fn (x) => real (abs x)) [2, 3, ~5, 10, ~24];


(* c. 関数implode, すなわち、文字のリストを一つの文字列に変換する関数 *)
- foldr (fn (x,y) => x^y) (map (fn (x) => str x) [#"H", #"e", #"l", #"l", #"o", #"!"]); 
(* answer *)
val c  = foldr (fn (x,y) => str(x)^y) "";
val c2 = foldl (fn (x,y) => y^str(x)) "";


(* d. 関数concat, すなわち、文字列のリストを一つの文字列に連結する関数 *)
(* answer *)
val D  = foldr op^ "";
val D2 = foldl (fn(x,y)=>y^x) "";


(* e. 整数の列[a1, a2, ..., an]をa1-a2+a3-a4+...に変換する関数 *)
(* answer *)
val E  = foldr op- 0; (* foldrの場合初期値を与える必要がある。foldlではできない
*)

(* f. booleanのリストからその論理積を計算する関数 *)
val F = foldr (fn(x,y)=>x andalso y) true;
(* foldr, foldlどちらでも*)

(* g. booleanのリストアからその論理和を計算する関数 *)
val G = foldr (fn(x,y)=>x orelse y) false; (*
なんでもtrueになってしまうため初期値はfalseとする *)

(* h. booleanのリストからその排他的論理和を計算する。 *)
val H = foldr (fn (x,y) => x <> y) false;

`<>`は同じ値かどうか確認するため
```

merge_512.sml


```

(* merge.sml *)
val rec merge = fn (nil, M) => M
                 | (L, nil) => L
                 | (L as x::xs, M as y::ys) => 
                     if x<y then x::merge (xs, M)
                     else y::merge(L, ys);

(* L as x::xs とするとLでもx::xsでも同じリストを参照できる *)
```

padd_512.sml


```

(* padd.sml *)

(* 

fun padd(P, nil) =  P
  | padd(nil, Q) = Q
  | padd((P:real)::ps, q) = (p+q)::padd(ps,qs);

*)

(* 再帰で使うときはrecをつける *)

val rec padd = fn (P, nil) => P
                | (nil, Q) => Q
                | ((P:real)::ps, q::qs) => (P+q)::padd(ps,qs);
```

pmult_512.sml


```

(* pmult *)
val rec pmult = fn (P, nil) => nil
                 | (P, q::qs) => padd(smult(P, q), 0.0::pmult(P, qs));
```

reduce_546.sml


```

exception EmptyList;

(* 再帰的に配列の要素2つを使う関数を全部に実行していく *)
fun reduce (F, nil) = raise EmptyList (* 例外の名前 *)
| reduce (F, [a]) = a
| reduce (F, x::xs) =  F(x, reduce(F, xs));

(* a. 実数のリストの最大値を求める *)
- reduce (fn (x,y) => if x>y then x else (y:real),
          [1.1, ~2.2, 3.3]);

(* b. 実数のリストの最小値を求める *)
- reduce (fn (x,y) => if x<y then x else (y:real), 
          [1.9, ~2.6, 3.1]);

(* c. 文字列のリストの全ての要素を連結してひとつの文字列にする *)
- reduce (fn (x,y) => x^y, ["Hello", ", ", "world!"]);

- reduce (op ^, ["Hello", ", ", "world!"]);

(* d. ブール型のリストの論理和を求める *)
- reduce (fn (x,y) => x orelse y, [false, false, true, false]);
(* 引数を b1, b2 とかにしたらなお分かりやすいかも *)

(* 5.4.8 *)
(* reduce(op -, L) を行うとどうなるか *)
(* opについて: http://www.smlnj.org/doc/errors.html [29] *)
組みをとって渡された演算子に従って計算する関数に変換する構文
リストの最初の値から、その後の値をどんどん引いていった値

関数名として与えることができる。reduceの第一引数として引き算を与える、など。

L = [5,4,3,2,1]のとき
5 - (4 - (3 - (2 - 1) ) ) = 5 - 4 + 3 - 2 - 1
```

simpleMap_545a.sml


```

fun simpleMap(F, nil) = nil
  | simpleMap(F, x::xs) = F(x)::simpleMap(F, xs);

(* a. 実数のリス中の負の数を0で置き換え、非負の数はそのままにする *)
- simpleMap(fn x=> if x<0.0 then 0.0 else x, [1.0, ~3.3, 5.0]);

(* b. 整数のリストの全ての要素に1を加える *)
- simpleMap(fn x=>x+1, [2, ~3, 4, 5]);

(* c. 小文字だけ大文字に変換する *)
(* 文字の変換についてはsmlのサイトを参照 *)
- simpleMap(fn c=> if c >= #"a" andalso c <= #"z" then chr(ord(c)-32)
                   else c, 
            [#"S",#"u",#"s",#"h",#"i"]);

(* d. 文字列のリストの各要素の5文字より長い部分を切り捨てる *)
- simpleMap(fn s => if size(s)>5 then substring(s, 0, 5)
                    else s, 
            ["Sushi", "Gyudon", "Templa Udon"]);
```

simpson_542.sml


```

(* simpson.sml *)
(* a:開始点 b:終了点 n:整数 F:積分される関数 *)
fun simpson (a, b, n, F) = 
  if n<=0 then 0.0
  else if n=1 then 
    (* 最初と最後の項の計算 *)
  else
    let
      val delta = (2a+1) - a / real(n)
    in
      delta * (4F(a) + 2F(a+delta))
    end;


(* sample *)
fun simpson (a, b, n, F) = 
  let val delta = (b-a) / (2.0 * real (n));
      val keisu = delta / 3.0;
      fun simpsonsub(ai) = 4.0 * F(ai) + 2.0 * F(ai+delta);
      fun simpson2 (_, 0) = 0.0
        | simpson2 (ai, m) = simpsonsub(ai) + simpson2 (ai+delta+delta, m-1)
  in
    if n<=0 orelse b-a <= 0.0 then 0.0 
                              else keisu * (F(a) + simpson2(a+delta, n) - F(b))
                              (* 何個あるのか個数nを渡してsimpson2ではmとして使ってる *)
  end;

(* 実行例 
* - simpson(0.0, 1.0, 1, fn x=>x*x);  
*)
```

smult_512.sml


```

(* smult.sml *)

val rec smult = fn (nil, q) => nil
                 | ((p:real)::ps, q) => (p*q)::smult(ps, q);
```

sumPairs_512.sml


```

(* sumPairs.sml *)
val rec sumPairs = fn (nil) => 0
                    | ((x,y)::zs) => x + y + sumPairs(zs);
```

trap_543.sml


```

fun trap (a, b, n, F) = 
		if n <= 0 orelse b-a <= 0.0 then 0.0
    else
      let
        val delta = (b-a) / real(n)
      in
        delta * (F(a) + F(a+delta)) / 2.0 + trap(a+delta,b, n-1, F)
      end;

(* 
* 全体のinの中で再帰せずに、
* letの中で補助関数でも作って再帰処理を行うようにすればいい 
*)

fun trap (a, b, n, F) = 
		if n <= 0 orelse b-a <= 0.0 then 0.0
    else
      let
        val delta = (b-a) / real(n)
        fun trap1(_, 0) = 0.0
          | trap1(x, i) = delta * (F(x) + F(x+delta)) / 2.0 + trap1(x+delta,
          i-1)
      in
        trap1(a, n)
      end;
```

