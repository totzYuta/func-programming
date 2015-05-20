fun listlength (L) =
  if L = nil then 0
  else listlength(tl(L)) + 1;
