fun getMinElm T = 
  if #1(T) > #2(T) then 
    if #1(T) > #3(T) then #1(T) else #3(T)
  else 
    if #2(T) > #3(T) then #2(T) else #3(T)
