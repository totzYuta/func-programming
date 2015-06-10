fun checkElms (x::nil) = [x]
  | checkElms (x::xs) = checkElms(xs)@[x]
