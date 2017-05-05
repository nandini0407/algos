# Design an algorithm to rearrange elements of a given array of n real
# numbers so that all its negative elements precede all its positive elements.
# Your algorithm should be both time efficient and space efficient.
#
# Solution : Use divide-and-conquer strategy. Apply quicksort algo with a
# twist. Use 0 as a pivot and iterate only once through every element.

def neg_before_pos(arr)
  return arr if arr.length <= 1

  pivot = 0
  i = 0
  j = arr.length - 1

  swapped = true
  while swapped

    while i < arr.length && arr[i] < pivot
      i += 1
    end

    while j >= 0 && arr[j] >= 0
      j -= 1
    end

    if i < j
      arr[i], arr[j] = arr[j], arr[i]
      swapped = true
    else
      swapped = false
    end
  end

  arr
end

p neg_before_pos([1, -1, 2, -2, 3, -3, 4])
p neg_before_pos([])
p neg_before_pos([1])
p neg_before_pos([1, -1])
