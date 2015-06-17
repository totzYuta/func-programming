(* pmult *)
val rec pmult = fn (P, nil) => nil
                 | (P, q::qs) => padd(smult(P, q), 0.0::pmult(P, qs));
