def coin_row(coins)
  coins.unshift(0)
  f = [0, coins[1]]
  i = 2
  while i < coins.length
    f << [f[i - 2] + coins[i], f[i - 1]].max
    i += 1
  end
  f[-1]
end

puts coin_row([5, 1, 2, 10, 6, 2])
