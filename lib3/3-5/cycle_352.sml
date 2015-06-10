(* リストLをi回巡回する関数cycleを書く．ただしこの関数はリストLの長さに比例した時間で動くものとする．-> 補助関数に分割して作成する *)

fun cycle1 (L, M, 0) = cat(L, rev(M))
  | cycle1 (x::xs, M, i) = cycle1(xs, x::M, i-1)

fun cycle (L, i) = 
  cycle1 (L, nil, i);
