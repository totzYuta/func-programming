(* pow.sml *)

fun power x 0 = 1                 (* y = 0 のとき *)
  | power x y = x * power x (y-1) (* y > 0 のとき *)

(* another sample *)
fun power2 x 0  = 1                 (* y = 0 のとき *)
  | power2 x y  = x * power x (y-1) (* y > 0 のとき *)

(* another sample *)
fun power3(x,y) = 
  if y = 0 then 1.0
  else x * power2(x,y-1)
