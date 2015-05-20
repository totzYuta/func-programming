fun copyelements (L) =
  if L = nil then nil (* 基底 *)
  else hd(L)::hd(L)::copyelements(tl(L));
