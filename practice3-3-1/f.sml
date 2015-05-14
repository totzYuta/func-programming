fun calcMaxNum (x::nil) : real = x
  | calcMaxNum (x::xs) : real = if x > calcMaxNum(xs) then x
                              else calcMaxNum(xs)
