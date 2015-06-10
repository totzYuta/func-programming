fun depElms (x::nil) = x::[x]
  | depElms (x::xs) = x::x::depElms(xs)
