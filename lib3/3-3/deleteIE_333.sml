fun deleteIE (nil, i) = nil
  | deleteIE (x::xs, 1) = xs
  | deleteIE (x::xs, i) = x::deleteIE (xs, i-1)

(* another example *)
fun deleteIE (nil, _) = nil
  | deleteIE (_::xs, 1) = xs
  | deleteIE (x::xs, i) = x::deleteIE (xs, i-1)
