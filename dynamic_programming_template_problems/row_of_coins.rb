# There is a row of n coins whose values are some positive integers c1, c2, . . . , cn, not necessarily distinct.
# The goal is to pick up the maximum amount of money subject to the constraint that no two coins adjacent in the
# initial row can be picked up.
# Let F (n) be the maximum amount that can be picked up from the row of n coins. To derive a recurrence for F (n),
# we partition all the allowed coin selections into two groups: those that include the last coin and those without it.
# The largest amount we can get from the first group is equal to cn + F (n − 2)—the value of the nth coin plus the maximum
# amount we can pick up from the first n − 2 coins. The maximum amount we can get from the second group is equal to F (n − 1)
# by the definition of F(n).
# Top down recurrence can be defined as :
# F(n) = max((coins[n] + F(n - 2)), F(n - 1))
# Base cases :
# F(0) = 0, F(1) = coins[1], i.e., the value of the first coin
# Use an array to save the maximum amount at each index.
# Bottom-up logic to fill this array :
# max_amount[n] = max((coins[n] + max_amount[n - 2]), max_amount[n - 1])

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
