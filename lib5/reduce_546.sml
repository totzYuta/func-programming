exception EmptyList;

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
