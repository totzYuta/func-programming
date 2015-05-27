fun piglatin (S) = 
let 
  val L = explode(S); (* 文字列を文字のリストにする *)
  fun piglatin2 (x::xs) = if isFirstCharVowel (x::xs) then x::xs (* 最初母音だよ *)
                          else piglatin2 (xs@[x]) (*
                          子音なので後ろに、次の文字は何? *)
in
  (* concatは文字列の二つを文字列にして返す *)
  if isFirstCharVowel (L) then concat([S, "yay"]) 
  else concat ([implode(piglatin2(L)), "ay"])
end;
