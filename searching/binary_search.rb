# Binary Search : This technique searches a sorted array for a given target
# element. It compares the target with the array's midpoint, if the target
# than the midpoint, it only searches in the left half of the array. If
# target > midpoint, it only searches the right half. It eliminates half
# the array in each iteration. If the target is equal to midpoint, it returns
# that index. If the target is not present in the array, it returns -1.
# Time complexity : O(logn)

def bsearch(arr, target)
  i = 0
  j = arr.length - 1
  while i <= j
    m = (i + j) / 2
    if target < arr[m]
      j = m - 1
    elsif target > arr[m]
      i = m + 1
    elsif target == arr[m]
      return m
    end
  end
  -1
end

p bsearch([1,2,3,4,5,7,10], 7)
p bsearch([1,2,3,4,5,7,10], 1)
p bsearch([1,2,3,4,5,7,10], 4)
p bsearch([1,2,3,4,5,7,10], 10)
p bsearch([], 8)
p bsearch([1,2,3], 4)
