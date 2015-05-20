fun copyElements nil = nil
  | copyElements (x::xs) = x::x::copyElements(xs)

(* answer *)
fun dupE (nil) = nil
  | dupE (x::xs) = x::x::dupE(xs);
