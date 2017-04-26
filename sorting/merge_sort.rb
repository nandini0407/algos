# Mergesort is a perfect example of divide-and-conquer technique. It sorts
# a given array by dividing it left and right halves. The left and right
# halves are recursively mergesorted. The sorted halves are then merged
# together into a single sorted array.

def mergesort(arr)
  return arr if arr.length <= 1
  copy = arr.dup
  m = copy.length / 2
  left = copy[0...m]
  right = copy[m..-1]
  left_sorted = mergesort(left)
  right_sorted = mergesort(right)
  merge(left_sorted, right_sorted)
end

def merge(arr1, arr2)
  merged = []
  i = 0
  j = 0
  while i < arr1.length && j < arr2.length
    if arr1[i] < arr2[j]
      merged << arr1[i]
      i += 1
    else
      merged << arr2[j]
      j += 1
    end
  end

  merged + arr1[i..-1] + arr2[j..-1]
end

p mergesort([3, 5, 1, 0, 6, -1, 8, -2])
p mergesort([])
p mergesort([3])
p mergesort([4, 2])
p mergesort([4, 2, 6])
