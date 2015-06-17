val rec comb = fn (_, 0) => 1
                | (n, m) => if m=n then 1
                            else comb(n-1, m) + comb(n-1, m-1)
