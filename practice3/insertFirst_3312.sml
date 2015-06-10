fun insertFirst (nil, a) = a::L
  | insertFirst ([x]::[xs], _) = insertFirst([x]);
