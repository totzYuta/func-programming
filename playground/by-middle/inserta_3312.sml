fun inserta (_, nil) = nil
  | inserta (a, x::xs) = (a::x)::inserta(a, xs)
