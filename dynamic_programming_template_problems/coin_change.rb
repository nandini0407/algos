# Given a set of coins and amount, Write an algo­rithm to find out how many ways we can make the change of the amount
# using the coins given. Eg., amount = 5, coins = [1, 2, 3], output = 5, since there are 5 ways to make change ->
# ({1,1,1,1,1} {1,1,1,2}, {1,2,2}, {1,1,3} {2,3})
#
# Solution : Let F(i, j) be the number of ways in which we can make change for target j using a subset of length i.
# If j is less than the denomination at coins[i], then the number of ways to get to j using i coins is simply the number of
# ways to get to j using i - 1 coins. If j is greater than or equal to the denomination at coins[i], then the number of
# ways to get to j is the sum of the number of ways to get to j using i - 1 coins and the number of ways to get to
# (j - coins[i]) using i coins.
# F(i, j) = F(i - 1, j) if j < coins[j]
# F(i, j) = F(i - 1, j) + F(i, j - coins[j]) if j >= coins[i]
# Base cases :
# F(0, 0) = 1, since there is one way to get to 0 using 0 coins
# F(0, j) = 0 for all j > 0, since any j over 0 needs at least 1 coin
# F(i, 0) = 1, since it is possible to make 0 using any subset of coins
# Bottom-up logic :
# cell[i][j] = cell[i - 1][j] if j < coins[i]
# cell[i][j] = cell[i - 1][j] + cell[i][j - coins[i]] if j >= coins[i]

def coin_change_making(change, coins)
  table = Array.new(coins.length + 1) { Array.new }
  coins.unshift(0)

  table[0][0] = 1

  i = 1
  while i < table.length
    table[i][0] = 1
    i += 1
  end

  j = 1
  while j <= change
    table[0][j] = 0
    j += 1
  end

  i = 1
  while i < table.length
    j = 1
    while j <= change
      if j < coins[i]
        table[i][j] = table[i - 1][j]
      else
        table[i][j] = table[i - 1][j] + table[i][j - coins[i]]
      end
      j += 1
    end
    i += 1
  end

  table[-1][-1]

end

puts coin_change_making(5, [1, 2, 3])
