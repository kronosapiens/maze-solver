require 'pry'

class MazeSolver

  attr_accessor :solution_path, :maze_array, :maze

  def initialize(maze)
    @solution_path = []
    @maze = maze
    @maze_array = to_a
  end

  def to_a
    master_arr = []
    arr = maze.split('').reject { |el| el == "\n" }
    arr.each_slice(17) { |sub_arr| master_arr << sub_arr }
    master_arr.collect do |arr|
      arr.slice(6, 17)
    end
  end

  def solve
    solution_path = search([3, 0], 0)
    @solution_path = solution_path.collect {|coord| coord.reverse}
  end

  def search(current, counter, prev = nil)
    # maze_array[current[0]][current[1]] = "."
    possibilities = next_nodes(current, prev)

    if counter >= 100
      nil
    elsif possibilities.empty?
      nil
    elsif possibilities.values.include?("@")
      [current, possibilities.key("@")]
      # get_solution
    else
      possible_arrays = possibilities.keys.map do |move|
        search(move, counter+1, current)
      end
      valid_paths = possible_arrays.compact.select{|path| valid_path?(path)}
      shortest_path = valid_paths.min {|a, b| a.length <=> b.length}
      if shortest_path.nil?
        nil
      else
        shortest_path.unshift(current)
      end
    end
  end

  def next_nodes(current, prev)
    hash = {
     [current[0]-1, current[1]] => maze_array[current[0]-1][current[1]], #maze_array[2][4]
     [current[0], current[1]+1] => maze_array[current[0]][current[1]+1],
     [current[0]+1, current[1]] => maze_array[current[0]+1][current[1]],
     [current[0], current[1]-1] => maze_array[current[0]][current[1]-1]
    }.reject {|k, v| k == prev || v == "#" || v == "."}
  end

  def valid_path?(path_array)
    # binding.pry
    path_array[-1] == [7, 10]
    # path_array[-2] == 7 && path_array[-1] == 10
  end

  def get_solution
    sol_array = []
    maze_array.each_with_index do |row, row_i|
      row.each_with_index do |position, pos_i|
        sol_array << [row_i, pos_i] if position == "."
      end
    end
    sol_array
  end

end