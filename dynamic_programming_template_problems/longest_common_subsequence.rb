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
