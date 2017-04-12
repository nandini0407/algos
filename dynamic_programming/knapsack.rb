# Given a knapsack of capacity W lbs, and n items of weights w1, w2,..wn, and values v1, v2,..vn, find the most valuable subset of
# items that fit into the knapsack.
# Eg., w1 = 2, v1 = 12, w2 = 1, v2 = 10, w3 = 3, v3 = 20, w4 = 2, v4 = 15, knapsack capacity W = 5.
# For the above example, w1, w2 and w4 form the subset with the highest value 37, that can fit into the knapsack.
# To solve this problem, consider an instance of first i items and a knapsack capacity of j. All subsets of the first i items
# that fit into knapsack j can be divided into two categories a) those that contain the ith item and b) those that do not contain
# the ith item. Those that do not contain the ith item will have the value F(i - 1, j). For those that contain the ith item,
# the optimal subset will have the ith item, plus the optimal subset of the knapsack of capacity j - wi (the current capacity
# minus the weight of the ith item).
# Note that if the ith item's weight exceeds j, then the value will still be F(i - 1, j)
# The above solution can be expressed by the following top-down recurrence relation -
# F(i, j) = max((vi + F(i - 1, j - wi)), F(i - 1, j)) if j - wi >= 0
# F(i, j) = F(i - 1, j) if j - wi < 0
# Base cases :
# F(i, 0) = 0
# F(0, j) = 0
# Bottom-up recurrence is similar -
# cell[i][j] = max((vi + cell[i - 1][j - wi]), cell[i - 1][j]) if j - wi >= 0
# cell[i][j] = cell[i - 1][j] if j - wi < 0

def knapsack_problem(n, values, weights, capacity)
  top_row = Array.new(capacity + 1, 0)
  table = [top_row]
  values.unshift(0)
  weights.unshift(0)

  i = 1
  while i <= n
    table << []
    j = 0
    while j <= capacity
      if j == 0
        table[i] << 0
      else
        if (j - weights[i]) < 0
          table[i] << table[i - 1][j]
        else
          table[i] << [(values[i] + table[i - 1][j - weights[i]]), table[i - 1][j]].max
        end
      end
      j += 1
    end
    i += 1
  end

  table[n][capacity]
end

puts knapsack_problem(4, [12, 10, 20, 15], [2, 1, 3, 2], 5)
