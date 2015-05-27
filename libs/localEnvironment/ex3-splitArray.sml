fun splitList nil = (nil, nil)
  | splitList ([a]) = ([a], nil)
  | splitList (a::b::cs) = 
  let 
    val (M, N) = splitList (cs)
  in
    (a::M, b::N)
  end;


(* without let in end *)
(a::(#1(split(cs))), 
 b::(#2(split(cs))));
(* 二回読んでて効率悪い！ *)
