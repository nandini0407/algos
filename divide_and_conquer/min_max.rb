# Write a divide-and-conquer algorithm for finding values of both largest
# and smallest elements in an array of size n.
#
# Solution : Use recursion. Divide the array in two halves. Return the
# smallest and largest of both halves. Return the smaller of the two smallest
# and larger of the two largest. Base cases are array of length less than
# 2 and array of length 2. 

def minmax(arr)

  if arr.length <= 1
    return arr
  elsif arr.length == 2
    smallest = nil
    largest = nil
    if arr[0] > arr[1]
      smallest = arr[1]
      largest = arr[0]
    else
      smallest = arr[0]
      largest = arr[1]
    end
    return [smallest, largest]
  else
    m = arr.length / 2
    small1, large1 = minmax(arr[0...m])
    small2, large2 = minmax(arr[m..-1])
    return [[small1, small2].min, [large1, large2].max]
  end

end

p minmax([7, 2, 9, 0, -1, 3, 8, 4])
p minmax([3, 2])
p minmax([])
