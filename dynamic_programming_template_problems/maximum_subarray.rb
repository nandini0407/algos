# Find the maximum sum from a contiguous subarray within a one-dimensional array of numbers.
# Eg., arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# Output is 6, the sum of the contiguous subarray [4, -1, 2, 1]
# Solution :
# At any index j, the maximum sum either a) adds arr[j] to the solution found so far, ior b) starts a new sum with just arr[j].
# In the first case, the optimal solution F(j) = arr[j] + F(j - 1). In the second case the optimal solution is simply arr[j] itself.
# The maximum of the above two is chosen. Top down recursion can be expressed as :
# F(j) = max((arr[j] + F(j - 1)), arr[j])
# Base case :
# F(0) = arr[0], i.e., the first element is itself the optimal solution at j = 0
# Since the optimal solution is a function of only one dimension, we can use an array to save optimal values at each j.
# Bottom-up logic :
# sums[j] = max((arr[j] + sums[j]), arr[j])

def max_subarray(arr)
  sums = [arr[0]]
  j = 1
  while j < arr.length
    val = [(arr[j] + sums[j - 1]), arr[j]].max
    sums << val
    j += 1
  end
  sums.max
end

puts max_subarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
