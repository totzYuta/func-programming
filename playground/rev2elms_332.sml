fun rev2elms (x::nil) = [x] (*
  ここがリストなの注意！ちゃんと再帰で返す値の型を意識すること *)
  | rev2elms (nil) = nil
  | rev2elms (x::y::xs) = y::x::rev2elms(xs)
