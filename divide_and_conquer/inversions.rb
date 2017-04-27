# Given an array A of real numbers, a pair (A[i], A[j]) is said to be an
# inversion if they are out of sorted order, ie., A[i] > A[j] but i < j.
# Design an O(nlogn) algorithm to count the number of inversions.
#
# Solution : Use mergesort with a twist. Divide the array in two and recusively
# mergesort both. Modify the merge function to return the count of inversions
# along with the merged array. To count inversions, if left[i] <= right[j]
# proceed as usual. But if left[i] > right[j], then all elemnts from left[i]
# till the last element of left will be greater than right[j], since both
# arrays are sorted. So count increases by (left.length - i). In the main
# modified mergesort function, return the sum of counts of the left, right
# and merged arrays.
#
# The above algorithm takes O(nlogn) time.

def inversions(arr)
  if arr.length <= 1
    return [0, arr]
  else
    m = arr.length / 2
    count_left, left = inversions(arr[0...m])
    count_right, right = inversions(arr[m..-1])
    count, result = merge_inversions(left, right)
    return [count_left + count_right + count, result]
  end
end

def merge_inversions(arr1, arr2)
  i = 0
  j = 0
  count = 0
  merged = []
  while i < arr1.length && j < arr2.length
    if arr1[i] <= arr2[j]
      merged << arr1[i]
      i += 1
    else
      merged << arr2[j]
      count += arr1[i..-1].length
      j += 1
    end
  end

  merged.concat(arr1[i..-1] + arr2[j..-1])
  [count, merged]
end

p inversions([1, 3, 4, 5, 2, 7, 6]) # 4
p inversions([1, 3, 2, 4, 5, 7, 6]) # 2
p inversions([5, 1, 2, 6, 4, 3]) # 7
p inversions([1, 5, 2, 4, 6, 3]) # 5
