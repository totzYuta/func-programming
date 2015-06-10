fun sumPair nil = (0, 0)
  | sumPair (x::y::zs) = 
let
  val odd = x + sumPair(zs);
  val even = y + sumPair(zs);
in
  (odd, even)
end;
