require_relative 'puzzleNode'
require_relative 'ids'

# Reads in the goal state from the command line and parses it for the print statement.
goal_input   = ARGV[1]
goal_val = PuzzleNode.parseState(goal_input, true)

max_search_error = "Exeeded maximum of 1,000,000 nodes searched – no solution found"

# Reads in the initial state from the command line and parses it for display.
start_input = ARGV[0]
start_val = PuzzleNode.parseState(start_input, true)

# Re-parses the inputs so that they are readable by the searcher.
start_node                   = PuzzleNode.parseState(start_input)
start_node.goal_value        = goal_val
goal_node            = PuzzleNode.parseState(goal_input)
goal_node.goal_value = goal_val

# Helper function to print in a square format
def printHelper(array)
  array.each do |sub_array|
    sub_array.each do |tile|
      if tile < 10
        print "  #{tile} "
      else
        print " #{tile} "
      end
    end
    print "\n"
  end
end

# Starting and goal states displayed for clarity
puts ' '
puts '      Start:'
printHelper(start_val)
puts ' '

puts '      Goal:'
printHelper(goal_val)
puts ' '

puts 'Note that the 0 displayed in the above arrays is indicative of the empty tile in the 15 Puzzle.'
puts ''

puts '------- ITERATIVE DEEPENING SEARCH (Start Depth = 4, Increment = 1) --------'
# Initializes the search
searchStrategy = DepthLimitedSearcher.new(start_node, goal_node, :generateStates, 4, 1)
startTime = Time.now
possibleSolution = searchStrategy.searcher
solution = (searchStrategy.num_nodes_visited < 1000000) ? possibleSolution : max_search_error
time_elapsed = (Time.now - startTime) * 1000.0

# Prints search solutions
puts "| Solution: #{solution}"
puts "| Number of nodes visted: #{searchStrategy.num_nodes_visited}"
puts "| Size of open list: #{searchStrategy.open.size}"
puts "| Number of nodes that were already generated: #{searchStrategy.already_generated}"
puts "| Time taken: #{time_elapsed} ms"
puts '----------------------------------------------------------------------------'


