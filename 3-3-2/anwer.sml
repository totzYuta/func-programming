fun repElements nil = nil (* 基底 *)
  | repElements ([x]) = [x] (* 基底 *)
  | repElements (x::y::xs) = y::x::repElements(xs);
