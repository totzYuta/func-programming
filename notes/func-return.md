# 演習5.5

### 5.5.2

関数->値->関数に値を適用した結果のリスト
Fのリスト-> a -> F(a)のリスト

>('a -> 'b) list -> 'a -> 'b list


```sml
(* 5.5.1 *)
fun applyList nil _ = nil
  | applyList (F::Fs) x = F x :: applyList Fs x;
```

### 5.5.3

```
F : D -> R
    D -> (T1 -> T2)

makeFnList : F -> G
                  D list -> R list
                    di        fi = F(di)
```


```sml
fun makeFnList _ nil = nil
  | makeFnList F (x::xs) = F x :: makeFnList F xs;
```


### 5.5.3

ss2: 文字列中のどこか

```sml
fun ss2 (x, nil) = ss1 (x, nil)  (* x: 文字のリスト *)
  | ss2 (x, y::ys) = ss1(x, y::ys) orelse ss2 (x, ys);

fun substring x y = ss2 (explode (x), explode (y));
```

(ss1ノートとりそびれたかも...)


### 5.5.4

```sml
- val [he, she, her, his] = f["he", "she", "her", "has"]
```


### 5.5.6

```sml
- applyList [he, she, she, his] "hershey";
```
