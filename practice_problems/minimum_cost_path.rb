# Given a 2D-matrix where each cell has a cost to travel. You have to write an algo­rithm to find a path from left-top
# cor­ner to bottom-right cor­ner with min­i­mum travel cost. You can move only right or down.
#
#
#
# Solution : Use Dynamic Programming

def min_cost_path(cells)
  # cells.unshift(Array.new(cells[0].length, 0))
  # top_row = Array.new(cells[0].length + 1, 0)
  table = Array.new(cells.length) { Array.new }

  table[0][0] = cells[0][0]

  j = 1
  while j < cells[0].length
    table[0][j] = cells[0][j] + table[0][j - 1]
    j += 1
  end

  i = 1
  while i < cells.length
    table[i][0] = cells[i][0] + table[i - 1][0]
    i += 1
  end

  i = 1
  while i < cells.length
    j = 1
    while j < cells[0].length
      table[i] << (([table[i - 1][j], table[i][j - 1]].min) + cells[i][j])
      j += 1
    end
    i += 1
  end

  table[-1][-1]
end

puts min_cost_path([[1, 7, 9, 2], [8, 6, 3, 2], [1, 6, 7, 8], [2, 9, 8, 2]])
puts min_cost_path([[1, 2, 3], [1, 4, 0], [2, 1, 3]])
