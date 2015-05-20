fun calcMaxNum (x::nil) : real = x
  | calcMaxNum (x::xs) : real = if x > calcMaxNum(xs) then x
                                else calcMaxNum(xs)

(* answer *)
fun maxList ([x : real]) = x (* ここじゃなくてもいいのでどっかに型宣言*)
  | maxList (x::y::zs) = if x > y then maxList(x::zs)
                         else maxList (y::zs);
