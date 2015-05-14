fun copyElements nil = nil
  | copyElements (x::xs) = x::x::copyElements(xs)
