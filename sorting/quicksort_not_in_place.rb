
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
