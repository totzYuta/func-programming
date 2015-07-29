# lib3

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

## 3-2

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

## 3-2

lengthList_321b.sml


```

fun listlength (L) =
  if L = nil then 0
  else listlength(tl(L)) + 1;
```

## 3-3

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

## 3-3-1

b.sml


```

(* fact.sml *)
fun fact (0) = 1 
  | fact (n) = n * fact (n-1)

(* answer *)
fun cycleList (nil) =
  | cycleList (x::xs) = xc@[x];
```

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

d.sml


```

fun copyElements nil = nil
  | copyElements (x::xs) = x::x::copyElements(xs)

(* answer *)
fun dupE (nil) = nil
  | dupE (x::xs) = x::x::dupE(xs);
```

e.sml


```

fun multiplying x 0.0 : real = 1.0 
  | multiplying x i : real = x * multiplying (x, i-1.0)

  (* answer *)
fun multiplying (x, 0) = 1.0
  | multiplying (x, i) = x * multiplying (x, x-1);
```

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

## 3-3-5

answer.sml


```

a) 

x: "a", y: "b", zs: ["c"], w: ["d", "e"]

b) 

x: "a", y: "b", zs: nil, w: 4.5

c)

一致しない
```

## 3-3-6

answer.sml


```

x: (1,2)
y: 3
zs: nil
```

## 3-5

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

