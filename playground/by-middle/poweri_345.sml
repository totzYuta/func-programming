fun doubleExp (x:real, 0) = x
  | doubleExp (x:real, i) = 
  let
    val num = doubleExp(x*x, i-1)
  in
    num
  end;

