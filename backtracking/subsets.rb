# Subsets using backtracking : This is similar to generating permutations
# (found in backtracking/permutations.rb), but with one difference. The
# result array will always be in terms of 0 and 1. If the input array has
# a length of 2, the result will be any of [0,0], [0,1], [1,0] or [1,1].
# the input array in mapped to the result to generate its subsets. For eg.,
# mapping input array [3, 4] to result array [0, 0] will generate [], mapping
# the same input array to result [0, 1] and [1, 1] will generate [4] and
# [3, 4] respectively.
# We generate the result array in a similar manner to how we generated
# permutations using backtracking. But in the case the candidates are always
# just 0 and 1.

def subsets(arr)
  result = []
  all_subsets(arr, 0, result)
end

def all_subsets(arr, k, result)
  if k == arr.length
    print_subset(arr, result)
  else
    k += 1
    cand = [0, 1]
    cand.each do |c|
      result << c
      all_subsets(arr, k, result)
      result.pop
    end
  end
end

def print_subset(arr, result)
  printable = []
  result.each_with_index do |el, i|
    printable << arr[i] if el == 1
  end
  p printable
end

subsets([1, 2, 3])
