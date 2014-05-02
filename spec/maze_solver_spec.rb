require_relative 'spec_helper'
require_relative '../maze_solver'

describe 'MazeSolver' do
  let(:small_maze){
    <<-11x11
      ###########
      #         #
      # ###### ##
      →   #     #
      ### # ### #
      #     #   #
      # ##### ###
      # #   #   @
      # ### #####
      #         #
      ###########
    11x11
  }

  let(:maze_solver) { MazeSolver.new(small_maze) }  
  
  context "A new maze solver" do
    it "instantiates with the maze as an attribute" do   
      expect(maze_solver.maze).to eq(small_maze)
    end
  end

  context 'Parsing a maze' do
    let(:maze_array) {MazeSolver.new(small_maze).maze_array}

    it 'converts the maze to an array' do
      maze_array_fixture = [
        ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"],
        ["#", " ", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
        ["#", " ", "#", "#", "#", "#", "#", "#", " ", "#", "#"],
        ["→", " ", " ", " ", "#", " ", " ", " ", " ", " ", "#"],
        ["#", "#", "#", " ", "#", " ", "#", "#", "#", " ", "#"],
        ["#", " ", " ", " ", " ", " ", "#", " ", " ", " ", "#"],
        ["#", " ", "#", "#", "#", "#", "#", " ", "#", "#", "#"],
        ["#", " ", "#", " ", " ", " ", "#", " ", " ", " ", "@"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
        ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"]
      ]

      expect(maze_array).to eq(maze_array_fixture)
    end
      
  end

  context 'Solving a maze' do
    describe '#solve' do
    end

    describe '#solution_path' do
      it 'returns the solution path array' do
        maze_solver.solve

        
        # We're using nodes that absolutely must be traveled to in order to confirm a solution path, 
        # as mazes might include more than one solution.
        solution_must_contain = [[0, 3], [7, 5], [7, 6], [7, 7], [8, 7], [9, 7], [10,7]]

        solution_must_contain.each do |node|
          expect(maze_solver.solution_path).to include(node)
        end
      end
    end

    # It is possible 
    describe '#display_solution_path' do
      xit 'prints out the solved maze' do
        # There is another possible solution so don't worry
        # if this test fails.

        @solution_string = "
###########
#         #
# ##### ###
→...#.....#
###.#.###.#
#  ...#...#
# #####.###
# #   #...@
# ### #####
#         #
###########".strip

        maze_solver.solve
        expect($stdout).to receive(:puts).with(@solution_string)

        maze_solver.display_solution_path   
      end
    end

  end
end 