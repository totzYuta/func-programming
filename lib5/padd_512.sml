(* padd.sml *)

(* 

fun padd(P, nil) =  P
  | padd(nil, Q) = Q
  | padd((P:real)::ps, q) = (p+q)::padd(ps,qs);

*)

(* 再帰で使うときはrecをつける *)

val rec padd = fn (P, nil) => P
                | (nil, Q) => Q
                | ((P:real)::ps, q::qs) => (P+q)::padd(ps,qs);
