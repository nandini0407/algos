# Given an array, find the length of the longest increasing subsequence from a given sequence. The longest increasing subsequence
# means to find a subsequence of a given sequence in which he subsequence's elements are in sorted order, lowest to highest, and in which
# the subsequence is as long as possible. The subsequence is not necessarily contiguous or unique. Duplicate numbers are not counted
# as increasing subsequence.
# Eg., [15, 27, 14, 38, 26, 55, 46, 65, 85] => 6
# Solution :
# For any index i in the input array, F(i) is the length of the longest increasing subsequence at index i, such that
# arr[i] is the last element of that subsequence. To compute F(i), consider the element arr[i]. It is either
# a) smaller than all elements at indices from 0 to i-1, or b) larger than at least one element at indices from 0 to i-1.
# F(i) in the first case is 1, since the element arr[i] starts a new subsequence. F(i) in the second case is 1 + max of F of all
# elements from indices 0 to i-1, which are smaller than arr[i].
# Top down recursion can be expressed as :
# if arr[i] is the smaller than all arr[0] to arr[i - 1],
# F(i) = 1
# else
# F(i) = (1 + max(F(j))), such that 0 <= j < i
# Base case :
# F(0) = 1
# Use an array to populate F(i) values for all i.
# Bottom-up logic :
# longest_subseq_length[i] = 1 if all arr[j] > arr[i], else (1 + max(longest_subseq_length(j))) for all arr[j] < arr[i]

def longest_increasing_subseq(arr)
  longest_subseq_length = [1]

  i = 1
  while i < arr.length
    j = 0
    temp = 0
    while j < i
      if arr[i] > arr[j]
        temp = [temp, longest_subseq_length[j]].max
      end
      j += 1
    end

    longest_subseq_length << (temp + 1)
    i += 1
  end

  longest_subseq_length.max
end

puts longest_increasing_subseq([15, 27, 14, 38, 26, 55, 46, 65, 85])
puts longest_increasing_subseq([10, 22, 9, 33, 21, 50, 41, 60, 80])
