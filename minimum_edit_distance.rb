# Given two strings S1 and S2, find out the minimum edit distance to transform S1 to S2. Edit operations: insertion, deletion, substitution

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
