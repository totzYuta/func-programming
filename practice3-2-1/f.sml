fun maxelement(L) = 
  if tl(L) = nil then hd(L)
  else if hd(L) > maxelement(tl(L)) then hd(L)
       else maxelement(tl(L));

(* improved: the func is just called once *)
fun maxelement2(L) =
  if tl(L) = nil then hd(L)
  else if hd(L) > hd(tl(L)) then maxelement2(hd(L)::tl(tl(L)))
       else maxelement2(tl(L));

