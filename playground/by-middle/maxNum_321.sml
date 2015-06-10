fun maxNum(nil) = nil
  | maxNum(x::xs) = 
  let
    val num = maxNum(xs)
  in
    if x > num then x
    else num
  end;
