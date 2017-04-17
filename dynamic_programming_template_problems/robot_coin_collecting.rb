def coin_collecting(coins)
  f = []
  i = 0
  f << []
  j = 0
  while j < coins[0].length
    f[i] << coins[i][j]
    j += 1
  end

  while i < coins.length - 1
    i += 1
    f << []
    f[i] << coins[i][0]
    j = 1
    while j < coins[i].length
      f[i] << [f[i][j - 1], f[i - 1][j]].max + coins[i][j]
      j += 1
    end
  end

  f[coins.length - 1][coins[0].length - 1]
end

puts coin_collecting([[0,0,0,0,1,0],[0,1,0,1,0,0],[0,0,0,1,0,1],[0,0,1,0,0,1],[1,0,0,0,1,0]])
