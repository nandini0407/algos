# Given a set of intervals, choose an optimal subset such that it has as many non-overlapping intervals as possible.
# Eg., [[0, 10], [1, 3], [9, 20], [17, 20], [11, 15], [4, 7], [8, 10], [5, 15], [17, 20]] => [[1, 3], [4, 7], [8, 10], [11, 15], [17, 20]]
# Note that [[0, 10], [11, 15], [15, 20]] is also a non-overlapping subset, but it has fewer intervals than the previous subset. We want
# the most number of intervals in the resulting subset.

def interval_schedule(intervals)
  sorted_intervals = intervals.sort_by { |interval| interval[1] }
  result = []
  result << sorted_intervals.shift
  current = result[0]

  until sorted_intervals.empty?
    if sorted_intervals[0][0] >= current[1]
      current = sorted_intervals.shift
      result << current
    else
      sorted_intervals.shift
    end
  end

  result
end

p interval_schedule([[0, 10], [1, 3], [9, 20], [17, 20], [11, 15], [4, 7], [8, 10], [5, 15], [14, 20]])
p interval_schedule([[0, 10], [9, 20], [11, 15], [4, 7], [5, 15], [15, 20]])
