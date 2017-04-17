# Say you have an array for which the ith element is the price of a given stock on day i.
# If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock),
# design an algorithm to find the maximum profit.
# Input: [7, 1, 5, 3, 6, 4]
# Output: 5, i.e., maximum difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
#
#
#
#
#
# Solution : Use Dynamic Programming. Derive from template longest_increasing_subsequence.rb

def best_time(prices)
  diffs = [0]
  min_so_far = prices[0]

  i = 1
  while i < prices.length
    if prices[i] < min_so_far
      min_so_far = prices[i]
      diffs << 0
    else
      diffs << (prices[i] - min_so_far)
    end
    i += 1
  end

  diffs.max
end

# O(n)

puts best_time([7, 1, 5, 3, 6, 4])
puts best_time([10, 7, 5, 8, 11, 9])
