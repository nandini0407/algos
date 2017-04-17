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

  i = 1
  while i < prices.length
    j = 0
    max_diff = nil
    while j < i
      if prices[i] > prices[j]
        if max_diff.nil? || (prices[i] - prices[j]) > max_diff
          max_diff = prices[i] - prices[j]
        end
      end
      j += 1
    end

    if max_diff.nil?
      diffs << 0
    else
      diffs << max_diff
    end

    i += 1
  end

  diffs.max
end

puts best_time([7, 1, 5, 3, 6, 4])
