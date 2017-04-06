def min_sum_descent(triangle)
  sum_triangle = Array.new(triangle.length) { Array.new }
  sum_triangle[0][0] = triangle[0][0]
  i = 1
  while i < triangle.length
    j = 0
    while j < triangle[i].length
      if j == 0
        sum_triangle[i] << sum_triangle[i - 1][j] + triangle[i][j]
      elsif j == triangle[i].length - 1
        sum_triangle[i] << sum_triangle[i - 1][j - 1] + triangle[i][j]
      else
        sum_triangle[i] << [sum_triangle[i - 1][j], sum_triangle[i - 1][j - 1]].min + triangle[i][j]
      end
      j += 1
    end
    i += 1
  end
  sum_triangle[-1].min
end

# O(n^2)

puts min_sum_descent([[2], [5,4], [1,4,7], [8,6,9,6]])
