fun thousandthPower (x: real) =
let
  val tenthPowerOfX = x*x*x*x*x*x*x*x*x*x;
  val hundredthPowerOfX = hundredthPower x;
in
  tenthPowerOfX * hundredthPowerOfX
end;
