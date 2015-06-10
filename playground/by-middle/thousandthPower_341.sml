fun thousandthPower (x) = 
let
  val tenthPowerOfX = x*x*x*x*x*x*x*x*x*x
in
  tenthPowerOfX * tenthPowerOfX * tenthPowerOfX * tenthPowerOfX
end;
