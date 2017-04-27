# Quicksort-in-place : This is also a divide-and-conquer algorithm to sort
# elements in an array. It is different from the regular quicksort in that
# it doesn't create extra arrays every time. It is more space efficient.
# We choose a pivot, generally the first element. We have two pointers, one
# at the beginning (starting from the second element) and one at the end.
# The left pointer keeps moving right till it encounters an element that is
# greater than the pivot. The right pointer moves left till it encounters
# an element that is less than or equal to the pivot. We then swap the element
# at the left pointer with the element at the right pointer. The movement
# and swapping continues till the pointers cross each other (ie, the left
# pointer is to the right of the right pointer). We stop when they have
# crossed each other. At this point of the algorithm, the original right
# pointer is now pointing to an element that is less than the pivot. We swap
# the pivot with this element. By doing this, we end up with an array where
# all elements to the left of the pivot are less than or equal to the pivot,
# and all elements to the right of the pivot are greater than the pivot.
# We exit the loop, and then recursively quicksort the left and right subarrays
# on either side of the pivot. In the end, we return the sum of the quicksorted
# left subarray, the pivot itself and the quicksorted right subarray.
# Time complexity : Best case is O(nlogn), worst case is O(n^2)


def quicksort_in_place(arr)
  return arr if arr.length <= 1

  pivot = arr[0]

  swapped = true
  i = 1
  j = arr.length - 1

  while swapped

    while i < arr.length && arr[i] <= pivot
      i += 1
    end

    while arr[j] > pivot
      j -= 1
    end

    if i < j
      arr[i], arr[j] = arr[j], arr[i]
      swapped = true
    else
      arr[0], arr[j] = arr[j], arr[0]
      swapped = false
    end

  end

  quicksort_in_place(arr[0...j]) + [pivot] + quicksort_in_place(arr[(j + 1)..-1])

end

p quicksort_in_place([3, 6, -1, 9, 0, 4, -2, 5])
p quicksort_in_place([])
p quicksort_in_place([3, 2])
p quicksort_in_place([4])
