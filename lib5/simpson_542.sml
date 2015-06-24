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


(* sample *)
fun simpson (a, b, n, F) = 
  let val delta = (b-a) / (2.0 * real (n));
      val keisu = delta / 3.0;
      fun simpsonsub(ai) = 4.0 * F(ai) + 2.0 * F(ai+delta);
      fun simpson2 (_, 0) = 0.0
        | simpson2 (ai, m) = simpsonsub(ai) + simpson2 (ai+delta+delta, m-1)
  in
    if n<=0 orelse b-a <= 0.0 then 0.0 
                              else keisu * (F(a) + simpson2(a+delta, n) - F(b))
                              (* 何個あるのか個数nを渡してsimpson2ではmとして使ってる *)
  end;

(* 実行例 
* - simpson(0.0, 1.0, 1, fn x=>x*x);  
*)
