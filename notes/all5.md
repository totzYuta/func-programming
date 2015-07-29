# lib5

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

