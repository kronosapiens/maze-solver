class MazeSolver

  attr_accessor :solution_path, :maze_array, :maze

  def initialize(maze)
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
    @solution_path = search([3, 0], []).collect {|coord| coord.reverse}
  end

  def search(current, history)
    possibilities = next_nodes(current, history)
    if possibilities.empty?
      nil
    elsif possibilities.values.include?("@")
      [current, possibilities.key("@")]
    else
      possible_arrays = possibilities.keys.map do |move|
        search(move, history << current)
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

  def next_nodes(current, history)
    hash = {
     [current[0]-1, current[1]] => maze_array[current[0]-1][current[1]], #maze_array[2][4]
     [current[0], current[1]+1] => maze_array[current[0]][current[1]+1],
     [current[0]+1, current[1]] => maze_array[current[0]+1][current[1]],
     [current[0], current[1]-1] => maze_array[current[0]][current[1]-1]
    }.reject {|k, v| history.include?(k) || v == "#" || v == "."}
  end

  def valid_path?(path_array)
    path_array[-1] == [7, 10]
  end

end