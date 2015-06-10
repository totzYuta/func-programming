fun multiplying (x,i) =
  if i = 0 then 1.0  (* 型に注意！ *)
  else x * multiplying (x, i-1);
