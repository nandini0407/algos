# Given two string sequences, write an algo­rithm to find the length of longest sub­se­quence present in both of them.
# Longest sub­se­quence is a sequence that appears in the same rel­a­tive order, but not nec­es­sar­ily contiguous(not sub­string)
# in both the string. Eg., 'pail' and 'pale' have the longest common subsequence 'pal', which is of length 3.
#
# Solution : Let F(i, j) be the longest common subsequence for substrings s1[0..i] and s2[0..j]. To compute this, compare s1[i]
# with s2[j]. If the letters are different, then the longest common subsequence will be the maximum of F(i - 1, j),
# F(i, j - 1) and F(i - 1, j - 1). If the letters are same, then the longest common subsequence
# will be the maximum of the above three cases plus 1 added to it since the current letters are the same.
# Base cases :
# F(0, 0) = 1 if letters are the same, 0 if they are different
# F(0, j) = F(0, j - 1) + 1 if letters are same, F(0, j - 1) if letters are different
# F(i, 0) = F(i - 1, 0) + 1 if letters are same, F(i - 1, 0) if letters are different
# Bottom-up logic :
# cell[i][j] = max(cell[i - 1][j], cell[i][j - 1], cell[i - 1][j - 1]) + 1 if letters are same
# cell[i][j] = max(cell[i - 1][j], cell[i][j - 1], cell[i - 1][j - 1]) if letters are different


def longest_com_subsequence(s1, s2)
  table = Array.new(s1.length) { Array.new }

  first_val = s1[0] == s2[0] ? 1 : 0
  table[0][0] = first_val

  j = 1
  while j < s2.length
    val = s1[0] == s2[j] ? (table[0][j - 1] + 1) : table[0][j - 1]
    table[0] << val
    j += 1
  end

  i = 1
  while i < s1.length
    val = s1[i] == s2[0] ? (table[i - 1][0] + 1) : (table[i - 1][0])
    table[i] << val
    i += 1
  end

  i = 1
  while i < s1.length
    j = 1
    while j < s2.length
      val = [table[i - 1][j], table[i - 1][j - 1], table[i][j - 1]].max
      table[i][j] = s1[i] == s2[j] ? (val + 1) : val
      j += 1
    end
    i += 1
  end

  table[-1][-1]
end

puts longest_com_subsequence('pale', 'pail') # 3
puts longest_com_subsequence('pale', 'apail') # 3
puts longest_com_subsequence('palae', 'apaile') # 4
