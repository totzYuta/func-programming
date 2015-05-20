(* fact.sml *)
fun fact (0) = 1 
  | fact (n) = n * fact (n-1)

(* answer *)
fun cycleList (nil) =
  | cycleList (x::xs) = xc@[x];
