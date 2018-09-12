require './Fringe'

class SearchIDS

  def initialize
    @fringe = Fringe.new
  end

  def depthLimitedSearch(init_state, fringe, goal_state, width)
    recursiveDepthLimitedSearch()
  end

  def recursiveDepthLimitedSearch(init_state, goal_state, limit)
    # fringe = Insert(Make-Node(Initial-State[problem]), fringe)
    initNode = Node.new(nil, 0, 0, init_state)
    fringe.insert(initNode)

    loop do
      # when fringe is empty return failure
      if fringe.empty
        puts "Failure!"
        return nil
      end

      # node = Remove-Front(fringe)
      currentNode = fringe.remove_front

      # Print statement to simplify view of execution
      if fringe.size % 300 == 0
        puts " "
        puts " "
        puts "fringe size is #{fringe.size}"
        print_state(currentNode.state)
      end

      # when Goal-Test(problem, State(node)) then return node
      if goalTest(currentNode.state, goal_state)
        puts "Success!"
        return currentNode
      elsif

      else
        loop do
          successor = expandTree(currentNode)
          fringe.insert_all(successor)

          # for each successor in expand(node, problem) do
          result = recursiveDepthLimitedSearch(successor.each, problem, limit)


      end



    for
  end

  def iterativeDeepeningSearch(init_state, fringe, goal_state, width)
    puts 'Running the puzzle using iterative deepening search!'

    depth = 0
    loop do
      #when fringe is empty, return failure
      result = depthLimitedSearch(problem, depth)

    end
  end

  def expandTree(parent)

    #successors ← the empty set
    successors = Array.new

    #for each action, result in Successor-Fn(problem, State[node]) do
    successor_function_graph(parent).each do |state|

      #s←a new Node
      #Parent-Node[s]←node;
      #Action[s]←action;
      #State[s]←result
      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + 1
      #Depth[s] ← Depth[node] + 1
      depth = parent.depth + 1
      s = Node.new(parent, cost, depth, state)

      #add s to successors
      successors.push(s)
    end

    return successors
  end #expand

  def successorFunctionTree(node)

    newStates = Array.new
    values = Array.new
    #here we gotta check each possible move for this node
    #node.direction returns a copy of the state after a move in said direction
    #false if move isnt possible

    up = node.upValue
    if up != false
      #puts "Up works!"
      upState = node.up
      newStates.push(upState)
      values.push(up)
    end

    down = node.downValue
    if down != false
      #puts "down works!"
      downState = node.down
      newStates.push(downState)
      values.push(down)
    end

    left = node.leftValue
    if left != false
      #puts "left works!"
      leftState = node.left
      newStates.push(leftState)
      values.push(left)
    end

    right = node.rightValue
    if right != false
      #puts "right works!"
      rightState = node.right
      newStates.push(rightState)
      values.push(right)
    end

    swapped = true
    while swapped do
      swapped = false
      0.upto(values.size-2) do |i|
        if values[i] < values[i+1]
          values[i], values[i+1] = values[i+1], values[i] # swap values
          newStates[i], newStates[i+1] = newStates[i+1], newStates[i] # swap values
          swapped = true
        end
      end
    end

    return newStates

  end

  def goalTest(state, goal)
    i = 0
    state.each do |s|
      if s != goal[i]
        #puts "its false!!"
        return false
      end
      i += 1
    end
    #no mismatches so we good
    return true
  end

  def printState(state)
    puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
    puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
    puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
    puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  end

end
