# lib4

doubleExp_345.sml


```

fun doubleExp (x::real, 0) = x
  | doubleExp (x, i) = 
  let
    val y = doubleExp (x, i-1)
  in
    y * y
  end;
```

maxElement_344.sml


```

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

(* answer *)
fun maxNumber (x::nil) = x
  | maxNumber (x::xs) = 
  let
    val m = maxNumber (xs)
  in
    if x > m then x
    else m
  end;
```

thousandthPower_341.sml


```

fun thousandthPower (x: real) =
let
  val tenthPowerOfX = x*x*x*x*x*x*x*x*x*x;
  val hundredthPowerOfX = hundredthPower x;
in
  tenthPowerOfX * hundredthPowerOfX
end;
```

