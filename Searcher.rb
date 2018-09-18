require './Fringe'

#main class here
#basic tree searcher, uses fringe as stack of nodes to be searched
class Searcher

  def initialize
    #fringe is a class variable
    @fringe = Fringe.new
    @fringeSize = 0
  end

  #main function here
  #so far, thinking the init state will be array of integers representing the puzzle state
  #so will goal state
  def graph_search(init_state, goal_state, width)
    puts "Starting the puzzle!"
    #closed = an empty set
    closed = Array.new

    #fringe = Insert(Make-Node(Initial-State[problem]), fringe)
    initNode = Node.new(nil, 0, 0, init_state, "0")
    @fringe.insert(initNode)

    loop do
      #if fringe is empty then return failure
      if @fringe.empty
        return nil
      end

      #node = Remove-Front(fringe)
      currentNode = @fringe.remove_front

      #if State[node] is not in closed then
      if !closed.include?(currentNode.state)
        if @fringe.size % 3 == 0
          puts " "
          puts " "
          puts currentNode.action
          puts "fringe size is #{@fringe.size}"
          if @fringeSize > @fringe.size
            dif = @fringeSize - @fringe.size
            puts "--fringe is down #{dif}--"
          else
            if @fringeSize < @fringe.size
              dif = @fringe.size - @fringeSize
              puts "++fringe is up #{dif}++"
            else
              #this should never run because the fringe will always pop 1 off
              puts "==fringe has stayed the same=="
            end
          end
          print_state(currentNode.state)
          @fringeSize = @fringe.size
        end

        #if Goal-Test(problem,State[node]) then return node
        #I added the goal test inside the if not in closed block
        if goal_test(currentNode.state, goal_state)
          puts "~~We have a match~~"
          return currentNode
        else
          #puts "Not quite right yet"
        end

        #puts "well yall, we are going to expand"
        #add State[node] to closed
        #have to dupe! because you dont want just a pointer
        #this is very key here
        closed.push(currentNode.state.dup)

        #fringe = InsertAll(Expand(node, problem), fringe)
        newNodes = expand_graph(currentNode)
        @fringe.insert_all(newNodes)
      else
        #puts "!!Hey this state has been checked already!!"
      end

    end #loop
  end #tree_search

  def expand_graph(parent)

    #successors ← the empty set
    successors = Array.new

    #for each action, result in Successor-Fn(problem, State[node]) do
    states, actions = successor_function_graph(parent)
    i = 0
    states.each do |state|
      #s←a new Node
      #Parent-Node[s]←node;
      #Action[s]←action;
      action = actions[i]
      #State[s]←result
      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + 1
      #Depth[s] ← Depth[node] + 1
      depth = parent.depth + 1
      s = Node.new(parent, cost, depth, state, action)
      #add s to successors
      successors.push(s)
      i += 1
    end

    return successors
  end #expand

  def successor_function_graph(node)

    newStates = Array.new
    values = Array.new
    actions = Array.new
    #here we gotta check each possible move for this node
    #node.direction returns a copy of the state after a move in said direction
    #false if move isnt possible

    up = node.upValue
    if up != false
      #puts "Up works!"
      upState = node.up
      newStates.push(upState)
      values.push(up)
      actions.push('N')
    end

    down = node.downValue
    if down != false
      #puts "down works!"
      downState = node.down
      newStates.push(downState)
      values.push(down)
      actions.push('S')
    end

    left = node.leftValue
    if left != false
      #puts "left works!"
      leftState = node.left
      newStates.push(leftState)
      values.push(left)
      actions.push('W')
    end

    right = node.rightValue
    if right != false
      #puts "right works!"
      rightState = node.right
      newStates.push(rightState)
      values.push(right)
      actions.push('E')
    end

    #this bit takes the stack of new states and orders them
    #right now with > the order goes from smaller to higher
    swapped = true
    while swapped do
      swapped = false
      0.upto(values.size-2) do |i|
        if values[i] > values[i+1]
          values[i], values[i+1] = values[i+1], values[i] # swap values
          actions[i], actions[i+1] = actions[i+1], actions[i] # swap values
          newStates[i], newStates[i+1] = newStates[i+1], newStates[i] # swap values
          swapped = true
        end
      end
    end

    return newStates, actions

  end

  def goal_test(state, goal)
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

  def print_state(state)
    puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
    puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
    puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
    puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

    #puts "#{state[0]} #{state[1]} #{state[2]}"
    #puts "#{state[3]} #{state[4]} #{state[5]}"
    #puts "#{state[6]} #{state[7]} #{state[8]} "
    #puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  end

end #searcher class
