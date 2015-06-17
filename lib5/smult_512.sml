(* smult.sml *)

val rec smult = fn (nil, q) => nil
                 | ((p:real)::ps, q) => (p*q)::smult(ps, q);
