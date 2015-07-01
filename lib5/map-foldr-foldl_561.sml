(* a. 整数のリストを実数のリストに変換する関数 *)
(* http://walk.wgag.net/sml/coretypes.html *)
- map (fn (x) => real x) [2, 3, 5, 10];

(* b. 整数のリストLをLの各要素の絶対値でかつ実数のリストに変換する関数 *)
(* 絶対値にする関数 http://walk.wgag.net/sml/coretypes.html *)
- map (fn (x) => real (abs x)) [2, 3, ~5, 10, ~24];

(* c. 関数implode, すなわち、文字のリストを一つの文字列に変換する関数 *)
- foldr (fn (x,y) => x^y) (map (fn (x) => str x) [#"H", #"e", #"l", #"l", #"o", #"!"]); 
