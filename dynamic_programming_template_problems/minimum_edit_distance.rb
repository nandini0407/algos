# Given two strings s1 and s2, find out the minimum edit distance to transform s1 to s2. Edit operations: insertion, deletion,
# substitution
# To come up with a recursive top-down relation, consider 3 ways of aligning s1 with s2
# a) The last character of s2 is aligned with last-but-one character of s1. This leaves s1[-1] hanging outside. (Do a
# deletion to transform s1 to s2)
# b) The last character of s1 is aligned with last-but-one character of s2. This leaves s2[-1] hanging outside. (Do an
# insertion to transform s1 to s2)
# c) The last characters of both s1 and s2 are aligned. (Do a substitution to transform s1 to s2. The substitution may
# be with nothing if the last characters of both s1 and s2 are same)
# The above three cases can be represented by the following recurrence :
# D(s1, s2) = min((D(s1[0..-2], s2), (D(s1, s2[0..-2])), (D(s1[0..-2], s2[0..-2]))) + 1, if last letters are different, else
# D(s1, s2) = D(s1[0..-2], s2[0..-2]) if the last letters are same
# We consider the minimum of the three cases since we want to look for the minimum number of edits
# Base case : D(s1, "") = s1.length, D("", s2) = s2.length
# Use a table to save result for each pair of letters.
# Bottom-up approach to build the table :
# Build the base cases by considering empty string as the first row and first column
# For any cell[i][j], consider the top, left and top-left cells. If the letters match, cell[i][j] = top-left cell,
# else cell[i][j] = minimum of the three cells + 1

def min_edit_distance(s1, s2)
  table = []
  s1 = " " + s1
  s2 = " " + s2

  i = 0
  while i < s1.length
    table << []
    j = 0
    while j < s2.length
      if i == 0 && j == 0
        table[i] << 0
      elsif i == 0
        table[i] << j
      elsif j == 0
        table[i] << i
      elsif s1[i] == s2[j]
        table[i] << table[i - 1][j - 1]
      else
        table[i] << [table[i - 1][j], table[i - 1][j - 1], table[i][j - 1]].min + 1
      end
      j += 1
    end
    i += 1
  end

  table[s1.length - 1][s2.length - 1]
end

puts min_edit_distance('car', 'cats')
puts min_edit_distance('kitten', 'knitting')
