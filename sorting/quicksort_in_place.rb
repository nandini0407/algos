
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
