require 'set'

class DepthLimitedSearcher
  attr_reader :num_nodes_visited, :open, :already_generated
  def initialize(initial_state, goal_state, generate_states, depth, increment = 1)
    @depth             = depth
    @increment         = increment
    @goal_state        = goal_state
    @generate_states   = generate_states
    @current           = initial_state
    @num_nodes_visited = 0
    @open = Set.new
    @already_generated = 0
  end

  def searcher
    # sets the current found solution to the self-called recursion
    found_goal = dls

    # indicates solution and failure
    return found_goal if (found_goal || found_goal == -1)

    # moves onto the next step
    @depth += @increment

    # recursively calls itself
    searcher
  end

  # node = Remove-Front(fringe) occurs at the node = @current, which
  # is ported over from the parse in puzzleNode.rb
  def dls(node = @current, depth = @depth)
    if depth >= 0
      # Breaks out after 1,000,000 nodes are expanded
      return -1 unless @num_nodes_visited < 1000000

      # if Goal-Test(problem,State(node)) then return node
      goal = @goal_state.respond_to?(:value) ? @goal_state.value : @goal_state
      return node if node.value == goal

      # fringe = InsertAll(Expand(node, problem), fringe)
      children = node.send(@generate_states)

      # calculates the number of nodes visited
      @num_nodes_visited += children.size

      # maps the current state of the puzzle after the generated
      # current states are generated above
      return children.map { |c|
        if @open.include? c.value
          @already_generated += 1
        else
          @open << c.value
        end

        # calls itself at the next depth.
        dls(c, depth - 1)

      # if fringe is empty then return failure
      }.reject(&:nil?)[0]
    end
  end
end
