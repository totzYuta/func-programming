(* another sample *)
fun factorial 0  = 1  (* n==0 *)
  | factorial n  = n * factorial (n-1)
