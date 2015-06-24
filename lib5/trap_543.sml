fun trap (a, b, n, F) = 
		if n <= 0 orelse b-a <= 0.0 then 0.0
    else
      let
        val delta = (b-a) / real(n)
      in
        delta * (F(a) + F(a+delta)) / 2.0 + trap(a+delta,b, n-1, F)
      end;

(* 
* 全体のinの中で再帰せずに、
* letの中で補助関数でも作って再帰処理を行うようにすればいい 
*)

fun trap (a, b, n, F) = 
		if n <= 0 orelse b-a <= 0.0 then 0.0
    else
      let
        val delta = (b-a) / real(n)
        fun trap1(_, 0) = 0.0
          | trap1(x, i) = delta * (F(x) + F(x+delta)) / 2.0 + trap1(x+delta,
          i-1)
      in
        trap1(a, n)
      end;
