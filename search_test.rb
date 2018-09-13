require_relative '15_puzzle'
require_relative 'ids'

goal_1   = ARGV[1] # or set this to a string with your own goal
goal_val = PuzzleNode.parse_state(goal_1, true)

start_string = ARGV[0] #or set this to one of the difficulties defined above

s0                   = PuzzleNode.parse_state(start_string)
s0.goal_value        = goal_val
goal_node            = PuzzleNode.parse_state(goal_1)
goal_node.goal_value = goal_val

def print_helper(array)
  array.each do |sub_array|
    sub_array.each do |tile|
      print "#{tile} "
    end
    print "\n"
  end
end

puts ' '
puts '------- ITERATIVE DEEPENING DEPTH LIMITED SEARCH (Start Depth = 4, Inc = 1) --------'
searcher = DepthLimitedSearcher.new(s0, goal_node, :generate_states, 4, 1)
start = Time.now
solution = searcher.search
puts "| Solution: #{solution}"
puts "| Number of nodes visted: #{searcher.num_nodes_visited}"
puts "| Size of open list: #{searcher.open.size}"
puts "| Number of nodes that were already generated: #{searcher.already_generated}"
puts "| Time taken: #{Time.now - start}s"
puts '-------------------------------------------------------------------------------------'


