fun cydeList nil = nil
  | cydeList (x::xs) = (xs)@[x];


  (* anser *)

fun multiCycle (0, L) = L
  | multiCycle (i, L) = multiCycle (i-1, cycleList(L));


fun ic (nil, i) = nil
  | ic (x::xs, 1) = xs@[x]
  | ic (x::xs, i) = ic (xs@[x], i-1)
