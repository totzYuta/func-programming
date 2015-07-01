## SMLでの例外


まず例外とは

「仕様上値が定義できない場合に発生する状態」

のこと。これはエラーとは違うものであり、例えば0除算などが挙げられる。

```
- 5 div 0;
uncaught exception Div
```

Divっていうのが、0で割ったときの例外の名前となっている。


## 使い方


`exception`でユーザ定義の例外の宣言を行い、`raise`で例外を発生させる。

関数reduceを例にしてみると、以下のように書くことができる。


```sml
exception EmptyList;

fun reduce (F, nil) = raise EmptyList (* 例外の名前 *)
| reduce (F, [a]) = a
| reduce (F, x::xs) =  F(x, reduce(F, xs));
```

```
val reduce = fn ('a*'a->'a) * 'a list -> 'a
```

```
$ sml sample.sml
Standard ML of New Jersey v110.78 [built: Sun Apr 26 01:06:11 2015]
[opening sample.sml]
exception EmptyList
val reduce = fn : ('a * 'a -> 'a) * 'a list -> 'a
- reduce (fn (x,y) => if x>y then x else (y:real), []);

uncaught exception EmptyList
  raised at: sample.sml:3.29-3.38
```
