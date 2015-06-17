fun trap (a, b, n, F) = 
		if n <= 0 orelse b-a <= 0.0 then 0.0
    else
      let
        val delta = (b-a) / real(n)
      in
        delta * (F(a) + F(a+delta)) / 2.0 + trap(a+delta,b, n-1, F)
      end;
