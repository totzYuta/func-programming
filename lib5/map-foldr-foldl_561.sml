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
