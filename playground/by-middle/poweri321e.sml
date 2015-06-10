fun poweri (x, 0) = 1.0
  | poweri (x, i) = x * poweri(x, i-1)
