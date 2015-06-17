(* simpleMap *)
fun simpleMap (F, nil) = nil
  | simpleMap (F, x::xs) = F(x)::simpleMap(F, xs)

(* USAGE
* - simpleMap (fn (x) = x * 5, [1,2,3]); 
*)
