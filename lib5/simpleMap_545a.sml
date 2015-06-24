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
