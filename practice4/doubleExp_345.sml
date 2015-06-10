fun doubleExp (x::real, 0) = x
  | doubleExp (x, i) = 
  let
    val y = doubleExp (x, i-1)
  in
    y * y
  end;
