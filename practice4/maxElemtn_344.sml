(* inspired by 3.2.1(f) *)
fun maxElement L =
let
  (* ここでtail部分の最大値を求めておく *)
  maxElementOfTail = 
    if tl(L) = nil then hd(L)
    else if hd(tl(L)) > maxElement(tl(L)) then hd(tl(L))
         else maxElement(tl(L))
in
  (* 変数宣言部で求めた最大値とheadを比較して値を返す *)
  if h(L) > maxElementOfTail then h(L)
  else maxElementOfTail
end;
