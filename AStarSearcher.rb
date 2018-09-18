require './AStarFringe'

#main class here
#basic tree searcher, uses fringe as stack of nodes to be searched
class Searcher

  def initialize
    #fringe is a class variable
    @fringe = Fringe.new
    @fringeSize = 0
    @nodesExpanded = 0
  end

  #main function here
  #so far, thinking the init state will be array of integers representing the puzzle state
  #so will goal state

  def tree_search(init_state, goal_state, width)
    puts "\n\n\nBeginning tree search on following initial state:"
    print_state(init_state)
    # Closed list is not required since this is a tree search.

    # Initialize the first node from which the search will be conducted.
    initNode = AStarNode.new(nil, 0, 0, init_state, goal_state, 0)
    @fringe.insert(initNode)

    record_nodes_for_report = 0
    first_five_nodes_expanded = Array.new
    loop do
      if @fringe.empty
        return nil
      end

      if @nodesExpanded > 999999
        puts "1,000,000 nodes have been expanded but no solution has been found. — terminating..."
        return nil
      end

      currentNode = @fringe.remove_front
      # print_state(currentNode.state)
      # puts "Moves to arrive at this node: #{currentNode.moves}"
      # puts "Overall A* cost for this path: #{currentNode.cost}"
      # puts "Number of nodes expanded so far: #{@nodesExpanded}"

      if goal_test(currentNode.state, goal_state)
        puts ""
        puts "~~~~~~ The solution has been reached ~~~~~~"
        puts "~"
        puts "~ Nodes expanded: #{@nodesExpanded}"
        puts "~ Number of moves to solve: #{currentNode.moves.size}"
        puts "~ Sequence of moves to solve: #{currentNode.moves}"
        puts "~ First five nodes expanded (in order of expansion): "
        (0..first_five_nodes_expanded.size - 1).each do |i|
          print_state(first_five_nodes_expanded[i].state)
        end
        return currentNode
      else
        if record_nodes_for_report < 5
          first_five_nodes_expanded.push(currentNode)
          record_nodes_for_report += 1
        end
        newNodes = expand_graph(currentNode, goal_state)
        @fringe.insert_all(newNodes)
        # Sort fringe in order of cost for A*
        @fringe.sort
      end
    end
  end

  def expand_graph(parent, goal_state)

    @nodesExpanded += 1

    #successors ← the empty set
    successors = Array.new

    newStates = Array.new
    newMoves = Array.new
    tilesMoved = Array.new
    #here we gotta check each possible move for this node
    #node.direction returns a copy of the state after a move in said direction
    #false if move isnt possible

    up = parent.upValue
    if up != false
      upState = parent.up
      newStates.push(upState)
      newMoves.push(up)
      tilesMoved.push(parent.get_tile_value(0,-1))
    end

    down = parent.downValue
    if down != false
      downState = parent.down
      newStates.push(downState)
      newMoves.push(down)
      tilesMoved.push(parent.get_tile_value(0,1))
    end

    left = parent.leftValue
    if left != false
      leftState = parent.left
      newStates.push(leftState)
      newMoves.push(left)
      tilesMoved.push(parent.get_tile_value(-1,0))
    end

    right = parent.rightValue
    if right != false
      rightState = parent.right
      newStates.push(rightState)
      newMoves.push(right)
      tilesMoved.push(parent.get_tile_value(1,0))
    end

    #this bit takes the stack of new states and orders them
    #right now with > the order goes from smaller to higher
    # swapped = true
    # while swapped do
    #   swapped = false
    #   0.upto(newMoves.size-2) do |i|
    #     if newMoves[i] > newMoves[i+1]
    #       newMoves[i], newMoves[i+1] = newMoves[i+1], newMoves[i] # swap values
    #       newStates[i], newStates[i+1] = newStates[i+1], newStates[i] # swap values
    #       swapped = true
    #     end
    #   end
    # end

    (0..newStates.size - 1).each do |i|
      #s←a new Node
      #Parent-Node[s]←node;
      #Action[s]←action;
      #State[s]←result
      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost
      depth = parent.depth + 1
      moves = parent.moves + newMoves[i]
      state = newStates[i]
      movedTile = tilesMoved[i]
      s = AStarNode.new(parent, cost, depth, state, goal_state, movedTile, moves)

      #add s to successors
      successors.push(s)
    end

    return successors
  end #expand

  def goal_test(state, goal)
    i = 0
    state.each do |s|
      if s != goal[i]
        return false
      end
      i += 1
    end
    #no mismatches so we good
    return true
  end

  def printHelper(array)
    newLineCounter = 0
    array.each do |tile|
      newLineCounter += 1
      if tile < 10
        print "  #{tile} "
      else
        print " #{tile} "
      end
      if newLineCounter % 4 == 0
        print "\n"
      end
    end
  end

  def print_state(array)
    print "\n"
    printHelper(array)
  end

end #searcher class
