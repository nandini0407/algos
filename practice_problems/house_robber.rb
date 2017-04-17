# You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed,
# the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and
# it will automatically contact the police if two adjacent houses were broken into on the same night.
# Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of
# money you can rob tonight without alerting the police.
#
#
#
# Solution : Use Dynamic Programming. Derive from template row_of_coins.rb

def house_rob(money)
  amount_robbed = [0, money[0]]
  money.unshift(0)
  j = 2
  while j < money.length
    amount_robbed << [(money[j] + amount_robbed[j - 2]), amount_robbed[j - 1]].max
    j += 1
  end
  amount_robbed[-1]
end

puts house_rob([5, 1, 2, 6])
