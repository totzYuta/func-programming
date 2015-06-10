fun insertElementFirst (_, nil) = nil
  | insertElementFirst (a, x::xs) = (a::x)::insearch(a, xs); 
(*| insertElementFirst (a, x::xs) = (a::x)@insearch(a, xs); *)
(* コンス演算子は右側から評価する *)
