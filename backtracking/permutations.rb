# Permutations by backtracking : We start off with the arr, a starting length,
# and a result which is also an array that is empty at first. The all_perms
# method is a recursive method. We make a list of the elements that are not
# present in the result. We add the first element from this to the result.
# All the permutations of the prefix in the result with the remaining elements
# are printed. The added element is popped off. The next candidate is now added
# to the result and all the permutations with this prefix are printed, and
# so on.

def perms(arr)
  result = []
  all_perms(arr, 0, result)
end

def all_perms(arr, k, result)
  if k == arr.length
    p result
  else
    k += 1
    cand = next_candidates(arr, result)
    cand.each do |c|
      result << c
      all_perms(arr, k, result)
      result.pop
    end
  end
end

def next_candidates(arr, result)
  cand = []
  arr.each do |el|
    cand << el unless result.include?(el)
  end
  cand
end

perms([1,2,3,4])
