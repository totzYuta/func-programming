(* sumPairs.sml *)
val rec sumPairs = fn (nil) => 0
                    | ((x,y)::zs) => x + y + sumPairs(zs);
