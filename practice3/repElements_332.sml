fun repElements nil = nil (* 基底 *)
  | repElements ([x]) = [x] (* 基底...要素数が奇数のときも考慮 *)
  | repElements (x::y::xs) = y::x::repElements(xs);
