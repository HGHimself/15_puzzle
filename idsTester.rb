require_relative 'puzzleNode'
require_relative 'ids'

goal_input   = ARGV[1]
goal_val = PuzzleNode.parse_state(goal_input, true)

start_input = ARGV[0]
start_val = PuzzleNode.parse_state(start_input, true)

start_node                   = PuzzleNode.parse_state(start_input)
start_node.goal_value        = goal_val
goal_node            = PuzzleNode.parse_state(goal_input)
goal_node.goal_value = goal_val

def print_helper(array)
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

puts ' '
puts '      Start:'
print_helper(start_val)
puts ' '

puts '      Goal:'
print_helper(goal_val)
puts ' '

puts 'Note that the 0 displayed in the above arrays is indicative of the empty tile in the 15 Puzzle.'
puts ''

puts '------- ITERATIVE DEEPENING DEPTH LIMITED SEARCH (Start Depth = 4, Increment = 1) --------'
searchStrategy = DepthLimitedSearcher.new(start_node, goal_node, :generate_states, 4, 1)
startTime = Time.now
solution = searchStrategy.searcher
puts "| Solution: #{solution}"
puts "| Number of nodes visted: #{searchStrategy.num_nodes_visited}"
puts "| Size of open list: #{searchStrategy.open.size}"
puts "| Number of nodes that were already generated: #{searchStrategy.already_generated}"
puts "| Time taken: #{Time.now - startTime}s"
puts '------------------------------------------------------------------------------------------'


