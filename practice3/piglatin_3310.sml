fun piglatin (S) = implode(piglatin1(explode(S)));

(* 最初1文字以上が子音のとき *)
fun piglatin2 (nil) = nil
  | piglatin2 (x::xs) = if vowel (x::xs) then x::xs@[#"a", #"y"]
                        else piglatin2 (xs@[x]);

(* 最初が母音のとき *)
fun piglatim1 (nil) = nil
  | piglatin1 (x::xs) = if vowel (x::xs) then x::xs@[#"y", #"a", #"y"]
                        else piglatin2 (xs@[x]);

