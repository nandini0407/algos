# Given an array, return true if it has 3 elements that sum to s specific target.
# eg., [4,7,2,-1,5,-7], target = 8, this returns true

def sum_target(arr, target)
  arr.sort!
  i = 0
  while i < arr.length
    new_target = target - arr[i]
    j = i + 1
    k = arr.length - 1
    while j < k
      if arr[j] + arr[k] == new_target
        return true
      elsif arr[j] + arr[k] < new_target
        j += 1
      elsif arr[j] + arr[k] > new_target
        k -= 1
      end
    end
    i += 1
  end
  false
end

puts sum_target([4,7,2,-1,5,-7], 8)
puts sum_target([4,7,2], 13)
puts sum_target([4,-7,2], -1)
