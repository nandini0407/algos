def min_num_sq_sum(n)
  m = Math.sqrt(n).to_i

  table = Array.new(m + 1) { Array.new }

  table[0][0] = 0

  i = 1
  while i <= m
    table[i][0] = 0
    i += 1
  end

  j = 1
  while j <= n
    table[0][j] = 0
    j += 1
  end

  i = 1
  while i < table.length
    j = 1
    while j <= n
      if i == 1
        table[i][j] = j
      elsif j < (i ** 2)
        table[i][j] = table[i - 1][j]
      else
        table[i][j] = [(table[i][j - (i ** 2)] + 1), table[i - 1][j]].min
      end
      j += 1
    end
    i += 1
  end

  table[m][n]
end

puts min_num_sq_sum(5)
puts min_num_sq_sum(12)
