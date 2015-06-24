(* merge.sml *)
val rec merge = fn (nil, M) => M
                 | (L, nil) => L
                 | (L as x::xs, M as y::ys) => 
                     if x<y then x::merge (xs, M)
                     else y::merge(L, ys);

(* L as x::xs とするとLでもx::xsでも同じリストを参照できる *)
