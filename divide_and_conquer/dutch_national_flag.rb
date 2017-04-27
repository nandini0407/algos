# The Dutch National Flag problem is to rearrange an array of characters
# R, W and B (Red, White and Blue, the colors of the flag), so that all Rs
# come first, all Ws come next and Bs come last. Design a linear in-place
# algorithm for this problem.
# Explain how a solution to the Dutch National Flag problem can be used in
# quicksort.
#
# Solution : Use divide-and-conquer strategy. ?

def dutch_flag(arr)
  i = 0
  j = 0
  k = arr.length - 1

  while j <= k
    if arr[j] == "R"
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
      j += 1
    elsif arr[j] == "W"
      j += 1
    elsif arr[j] == "B"
      arr[j], arr[k] = arr[k], arr[j]
      k -= 1
    end
  end

  arr
end

p dutch_flag(["R", "W", "R", "B", "B", "R", "W", "W", "R"])
p dutch_flag(["R", "W", "B", "R", "W", "B"])
