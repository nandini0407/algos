# A Maze is given as N*N binary matrix of blocks where source block is the
# upper left most block i.e., maze[0][0] and destination block is lower
# rightmost block i.e., maze[N-1][N-1]. A rat starts from source and has to
# reach destination. The rat can move only in two directions: forward and down.
# In the maze matrix, 0 means the block is dead end and 1 means the block
# can be used in the path from source to destination. Note that this is a
# simple version of the typical Maze problem. For example, a more complex
# version can be that the rat can move in 4 directions and a more complex
# version can be with limited number of moves.
# Eg maze for the simple version :
# [[1, 0, 0, 0],
# [1, 1, 0, 1],
# [0, 1, 0, 0],
# [1, 1, 1, 1]]
# Following is the solution matrix (output of program) for the above input
# matrix.
# [[1, 0, 0, 0],
# [1, 1, 0, 0],
# [0, 1, 0, 0],
# [0, 1, 1, 1]]
# All enteries in solution path are marked as 1.
#
# Solution : Use a flavor of DFS. 

def rat_in_maze(maze, s, d)
  result = Array.new(maze.length) { Array.new }

  maze.each_with_index do |row, i|
    row.each_with_index do |_, j|
      result[i][j] = Hash.new
      result[i][j][:state] = "not visited"
      result[i][j][:parent] = nil
    end
  end

  possible = solve_maze(maze, s, d, result)
  if possible
    x, y = d[0], d[1]
    path = [[x, y]]
    parent = result[x][y][:parent]
    while x != nil && y != nil
      path.unshift(parent)
      if parent.nil?
        x = nil, y = nil
      else
        x, y = parent[0], parent[1]
        parent = result[x][y][:parent]
      end
    end
    return path
  else
    return false
  end

end

def solve_maze(maze, s, d, result)
  return true if s == d

  x, y = s[0], s[1]
  result[x][y][:state] = "now visiting"

  res1 = false
  res2 = false
  res3 = false
  res4 = false

  if (x - 1) >= 0 && maze[x - 1][y] != 0 && result[x - 1][y][:state] == "not visited"
    res1 = solve_maze(maze, [x - 1, y], d, result)
    result[x - 1][y][:state] = "done"
    result[x - 1][y][:parent] = [x, y] if res1
  elsif (y + 1) < maze.length && maze[x][y + 1] != 0 && result[x][y + 1][:state] == "not visited"
    res2 = solve_maze(maze, [x, y + 1], d, result)
    result[x][y + 1][:state] = "done"
    result[x][y + 1][:parent] = [x, y] if res2
  elsif (x + 1) < maze.length && maze[x + 1][y] != 0 && result[x + 1][y][:state] == "not visited"
    res3 = solve_maze(maze, [x + 1, y], d, result)
    result[x + 1][y][:state] = "done"
    result[x + 1][y][:parent] = [x, y] if res3
  elsif (y - 1) >= 0 && maze[x][y - 1] != 0 && result[x][y - 1][:state] == "not visited"
    res4 = solve_maze(maze, [x, y - 1], d, result)
    result[x][y - 1][:state] = "done"
    result[x][y - 1][:parent] = [x, y] if res4
  end

  if res1 || res2 || res3 || res4
    return true
  else
    return false
  end

end

p rat_in_maze([[1, 0, 0, 0], [1, 1, 0, 1], [0, 1, 0, 0], [1, 1, 1, 1]], [0, 0], [3, 3])
p rat_in_maze([[1,0,0,0,0,0],[1,1,1,1,1,1],[0,1,0,1,0,1],[0,1,0,1,0,1],[1,1,1,0,1,1],[0,0,1,1,1,0]], [0,0], [4,5])
