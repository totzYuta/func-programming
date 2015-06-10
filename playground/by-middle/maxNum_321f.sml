fun maxNum (x::nil) = x
  | maxNum (x::y::xs) = if x > y then maxNum(x::xs) else maxNum(y::xs)
