# Given two strings S1 and S2. Find the longest common substring between S1 and S2
# Eg., 'blue' and 'clue' have a longest common substring length of 3 ('lue')
# To solve this, get the longest common suffix by comparing the suffix of every prefix of one string to the suffix of every prefix of the
# other string, and return the longest common suffix
# This can be represented by the top-down recurrence relation :
# longest_common_substring(s1, s2) = max(longest_common_suffix(s1[0..i], s2[0..j])) where 0 <= i < s1.length and 0 <= j < s2.length
# Base cases :
# F(i, 0) = 0 if letters are differnt, 1 if letters are same
# F(0, j) = 0 if letters are differnt, 1 if letters are same
# Compare 'b' with 'c', 'cl', 'clu', 'clue', then 'bl' with 'c', 'cl', 'clu', 'clue' and so on
# Think of it this way - in the dp table, the value in every cell can have either a) both letters same or b) both letters different
# If both letters are same, then check if the smaller problem has been solved, i.e., the case where that letter is missing from both
# strings
# This is available in cell[i - 1][j - 1]. Simply add 1 to this to populate cell[i][j]. This represents the longest common suffix so far
# If both letters are different, then cell[i][j] = 0

def long_comm_substring(s1, s2)
  table = []
  maximum = nil

  i = 0
  while i < s1.length
    table << []
    j = 0
    while j < s2.length
      value = s1[i] == s2[j] ? 1 : 0
      if i == 0 || j == 0
        table[i] << value
      else
        if value == 1
          table[i] << (table[i - 1][j - 1] + value)
        else
          table[i] << 0
        end
      end

      if maximum.nil? || table[i][j] > maximum
        maximum = table[i][j]
      end

      j += 1
    end
    i += 1
  end

  maximum
end

puts long_comm_substring('abab', 'baba')
puts long_comm_substring('blue', 'clue')
puts long_comm_substring('pale', 'pail')
