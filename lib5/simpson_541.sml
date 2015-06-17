(* simpson.sml *)
(* a:開始点 b:終了点 n:整数 F:積分される関数 *)
fun simpson (a, b, n, F) = 
  if n<=0 then 0.0
  else if n=1 then 
    (* 最初と最後の項の計算 *)
  else
    let
      val delta = (2a+1) - a / real(n)
    in
      delta * (4F(a) + 2F(a+delta))
    end;
