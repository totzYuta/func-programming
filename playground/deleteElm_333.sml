fun deleteElm (nil, _) = nil
  | deleteElm (_::xs, 1) = xs (*
  右の評価式で使わない変数をパターンで宣言してはいけない *)
  | deleteElm (x::xs, i) = x::deleteElm(xs, i-1) 
