def coin_collecting(coins)
  f = []
  i = 0
  f << []
  j = 0
  while j < coins[0].length
    # if the robot encounters an 'x' in the top row, all following columns are inaccessible to the robot in that row
    if coins[i][j] == 'x'
      while j < coins[0].length
        f[i] << 'x'
        j += 1
      end
      break
    else
      f[i] << coins[i][j]
      j += 1
    end
  end

  x_in_first_column = false

  while i < coins.length - 1
    i += 1
    f << []
    if coins[i][0] == 'x'
      f[i] << 'x'
      x_in_first_column = true
    elsif x_in_first_column == true
      f[i] << 'x'
    else
      f[i] << coins[i][0]
    end

    j = 1
    while j < coins[i].length
      if coins[i][j] == 'x'
        f[i] << 'x'
      elsif f[i][j - 1] == 'x' && f[i - 1][j] == 'x'
        f[i] << 'x'
      elsif f[i][j - 1] == 'x'
        f[i] << f[i - 1][j] + coins[i][j]
      elsif f[i - 1][j] == 'x'
        f[i] << f[i][j - 1] + coins[i][j]
      else
        f[i] << [f[i][j - 1], f[i - 1][j]].max + coins[i][j]
      end
      j += 1
    end
  end

  f[coins.length - 1][coins[0].length - 1]
end

puts coin_collecting([[0,'x',0,1,0,0],[1,0,0,'x',1,0],[0,1,0,'x',1,0],[0,0,0,1,0,1],['x','x','x',0,1,0]])
puts coin_collecting([[0,0,0,1,0,0],[1,0,0,'x',1,0],[0,1,0,'x',1,0],[0,0,0,1,0,1],['x','x','x',0,1,0]])
