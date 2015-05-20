fun fact(n) = 
  if n = 0 then 1
  else n * fact(n-1)

(* another sample *)
fun factorial 0  = 1  (* n==0 *)
  | factorial n  = n * factorial (n-1)

(* another sample *)
fun factorial2 0:int = 1  (* n==0 *)
  | factorial2 n:int = n * factorial (n-1)
