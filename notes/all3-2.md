
## 3-2


31.md


```
(a) int型とreal型で計算しているから
(b) ~~リストの中身が違う型だから~~ 違う型を取る関数はかけない
(c) 循環するようにすると、型が決まらないため x y -> y x
(b) 循環しているから。自分自身を取る場合は、特別な場合を除いて型が決まらないから。
```

311.md


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



314.md


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


32.md


```

idは高等関数である。引数できたものをそのまま返す関数

1. ~~'a->'a->'a~~ 'a->'a  idにid('a->'a)を渡している TODO:ask here! 

2. Just confirm here...

3. Just confirm here...
```

33.md


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



34.md



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



35.md



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

36.md


```

'a -> 'b

無限呼び出しになるけど型はあるよ、って言いたかったんだろーなと。
```

37.md



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



38.md



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

cube_33.sml


```

fun cube x = x*x*x;
```

id_33.sml


```

fun id x = x;
```

twice_33.sml


```

fun twice f x = f (f x);
```

