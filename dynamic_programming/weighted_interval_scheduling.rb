# Given a set of intervals and values for each interval, choose an optimal subset such that the total value of the intervals in the
# subset is maximum, and the intervals are non-overlapping. Return the sum of the values of the optimal subset.
# Eg., intervals = [[1, 4], [2, 6], [5, 7], [3, 10], [8, 12], [9, 13]], values = [2, 4, 4, 7, 2, 1]
# The output is 8, which is the sum of values of non-overlapping intervals [1, 4], [5, 7], [8, 12]
# The solution for this problem involves computing the largest index i for an interval index j such that i is the leftmost interval
# that ends before j begins.e., leftmost(j) = i. This will be 0 if there is no interval before j that ends just before j begins.
# Once this is computed, the optimal solution for interval at index j, F(j) can either
# a) inculde j or b) not include j. If it includes j, F(j) = value(j) + F(leftmost(j)). If it does not include j, then F(j) = F(j - 1)
# The recurrence relation is : F(j) = max((value(j) + F(leftmost(j))), F(j - 1))
# Base case : F(0) = 0, where 0th index has an interval [0, 0] and a value of 0
# Bottom-up logic will be : sum[j] = max((value(j) + sum[leftmost[j]]), sum[j - 1])

def weighted_intervals(intervals, values)
  intervals.unshift([0, 0])
  values.unshift(0)
  leftmost = compute_leftmost(intervals) # O(n^2) worst case ?

  sums = [] # one-dimensional
  i = 0
  while i < intervals.length
    if i == 0
      sums << 0
    else
      val = [(values[i] + sums[leftmost[i]]), sums[i - 1]].max
      sums << val
    end
    i += 1
  end

  sums[-1]
end

def compute_leftmost(intervals)
  leftmost = []
  i = intervals.length - 1
  while i >= 0
     current = intervals[i]
     j = i - 1
     found = false
     until found || j < 0
       if intervals[j][1] <= current[0]
         leftmost.unshift(j)
         found = true
       else
         j -= 1
       end
     end
     leftmost.unshift(0) if found == false
     i -= 1
  end
  leftmost
end

puts weighted_intervals([[1, 4], [2, 6], [5, 7], [3, 10], [8, 12], [9, 13]], [2, 4, 4, 7, 2, 1])
