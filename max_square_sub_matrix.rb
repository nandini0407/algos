# Given a matrix of dimensions mxn having all entries as 1 or 0, find out the size of maximum size square sub-matrix with all 1s

def max_sq_sub_matrix(matrix)
  table = []

  n = matrix.length
  m = matrix[0].length

  largest_square = nil

  i = 0
  while i < n
    table << []
    j = 0
    while j < m
      if matrix[i][j] == 0
        table[i] << 0
      elsif i == 0 || j == 0
        table[i] << matrix[i][j]
      else
        table[i] << ([table[i - 1][j - 1], table[i - 1][j], table[i][j - 1]].min + 1)
      end
      if largest_square.nil? || table[i][-1] > largest_square
        largest_square = table[i][j]
      end
      j += 1
    end
    i += 1
  end

  largest_square
end

puts max_sq_sub_matrix([[1,1,0,1,1],[0,1,1,1,1],[0,0,1,1,1],[1,1,1,1,1],[0,1,1,1,0]])
puts max_sq_sub_matrix([[0,0,0,0,0],[0,0,0,1,1],[0,0,0,1,1],[0,0,0,0,0],[0,0,0,0,0]])
puts max_sq_sub_matrix([[0,1,1], [0,1,1], [0,0,0]])
