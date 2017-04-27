# Quicksort : This is also a divide-and-conquer technique for sorting. Here
# we choose a pivot element, generally the first element. We partititon the
# array into two subarrays - one which has all elements less than the pivot,
# the other which has all elements greater than or equal to the pivot. The
# subarrays are recursively quicksorted and in the we return the sum of the
# subarray with elements < pivot, the pivot itself and the aubarray with
# elements > pivot.


def quicksort(arr)
  if arr.length <= 1
    return arr
  else
    copy = arr.dup
    pivot = copy.shift
    left = []
    right = []
    copy.each do |el|
      if el < pivot
        left << el
      else
        right << el
      end
    end
    quicksort(left) + [pivot] + quicksort(right)
  end
end

p quicksort([3, 6, -1, 9, 0, 4, -2, 5])
p quicksort([])
p quicksort([3, 2])
p quicksort([4])
