fun depElements (x::nil) = x::[x]
  | depElements (x::xs) = x::x::depElements(xs)
