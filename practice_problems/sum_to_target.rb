# Given an array, return true if it has 3 elements that sum to s specific target.
# eg., [4,7,2,-1,5,-7], target = 8, this returns true

# Solution : Brute-forced approach will take O(n^3). But the following approach
# takes O(n^2). Sort the array first. Write an outer loop that goes through
# every element. In the loop, set the new value of target to be the difference
# between the old value of target and the element the loop is iterating through.
# Have 2 pointers - one starting from the next position of the loop element,
# the other at the end of the array. If the sum of the elements at these two
# pointers is greater than the new target, then the second pointer should decrease
# or move left, so that it can point to something lesser. If the sum of the
# elements at these two pointers is less than the new target, then the first
# pointer should move right so that it can point to something larger. This inner
# loop should go on until the pointers point to the same element, or until
# the sum equals the new target.

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
