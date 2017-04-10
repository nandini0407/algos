def chess_rook_moves(n, m)
  top_row = Array.new(n + 1, 0)

  number_of_paths = [top_row]

  i = 1
  while i <= n
    number_of_paths << [0]
    j = 1
    while j <= m
      if i == 1 && j == 1
        number_of_paths[i] << 0
      elsif i == 1 && j == 2
        number_of_paths[i] << 1
      elsif i == 2 && j == 1
        number_of_paths[i] << 1
      else
        number_of_paths[i] << (number_of_paths[i][j - 1] + number_of_paths[i - 1][j])
      end
      j += 1
    end
    i += 1
  end

  number_of_paths[n][m]
end

puts chess_rook_moves(3, 3)
puts chess_rook_moves(8, 8)
puts chess_rook_moves(2, 2)
