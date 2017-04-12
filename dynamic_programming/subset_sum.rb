# Detect if a subset from a given set of N non-negative integers sums upto a given value.
# To come up with a top-down recursive approach for this, consider the problem already solved for all but the last element.
# The target sum can either a) contain the last element, or b) not contain the last element.
# If it does not contain the last element, and sub_sum(arr[0..-2], target) evaluates to true, then the final result will be true since
# one of the subsets of arr sums to target.
# If it does not contain the last element, then subtract the last element from the target and check if the function evaluates to true
# for the difference that remains. If true, then the final result will be true since the solved smaller problem + last element together
# sum to target.
# Use this top-down logic => sub_sum(arr, target) = sub_sum(arr[0..-2], target) || sub_sum(arr[0..-2], target - arr[-1])
# Base cases :
# sub_sum([0], 0) = true
# sub_sum([0], j) = false for j > 0
# sub_sum(arr, 0) = true for any value in the array which is > 0
# Bottom-up logic will be => cell[i][j] = true if cell[i - 1][j] == true, else cell[i][j] = cell[i - 1][j] || cell[i - 1][j - arr[i]]

def sub_sum(arr, target)
  top_row = Array.new(target, false)
  table = [top_row]
  arr.unshift(0)
  table[0].unshift(true)

  i = 1
  while i < arr.length
    table << []
    j = 0
    while j <= target
      if j == 0
        table[i] << true
      elsif arr[i] > j
        table[i] << table[i - 1][j]
      else
        table[i] << (table[i - 1][j] || table[i - 1][j - arr[i]])
      end
      j += 1
    end
    i += 1
  end

  table[arr.length - 1][target]
end

puts sub_sum([1, 3, 9, 2], 5)
