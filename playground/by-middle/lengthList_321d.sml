(* fun lengthList (_::nil) = 1
  | lengthList (x::xs) = lengthList(xs) + 1 *)
(* こっちの方がきれいでいいかも．上の場合だと一つ目のパターンと二つ目のパターンが被ってしまっている．*)
fun lengthList (nil) = 0
  | lengthList (x::xs) = lengthList(xs) + 1
