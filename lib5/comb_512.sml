val rec comb = fn (_, 0) => 1  (* 0個を選ぶ *)
                | (n, m) => if m=n then 1  (*
                nとmが等しいってのはパターンでは書けない *)
                            else comb(n-1, m) + comb(n-1, m-1)

(* n個の中からm個を選ぶときの全てのパターン *)
(* (n m) = n!/(n-m)! * 1/n! *)
