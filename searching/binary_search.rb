
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
