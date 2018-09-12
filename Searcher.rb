require './Fringe'

#main class here
#basic tree searcher, uses fringe as stack of nodes to be searched
class Searcher

  def initialize
    #fringe is a class variable
    @fringe = Fringe.new
  end

  #main function here
  #so far, thinking the init state will be array of integers representing the puzzle state
  #so will goal state
  def graph_search(init_state, fringe, goal_state, width)
    puts "Starting the puzzle!"
    #closed = an empty set
    closed = Array.new

    #fringe = Insert(Make-Node(Initial-State[problem]), fringe)
    initNode = Node.new(nil, 0, 0, init_state)
    fringe.insert(initNode)

    loop do
      #if fringe is empty then return failure
      if fringe.empty
        return nil
      end

      #node = Remove-Front(fringe)
      currentNode = fringe.remove_front
      puts " "
      puts " "
      puts "fringe size is #{fringe.size}"
      print_state(currentNode.state)

      #if Goal-Test(problem,State[node]) then return node
      if goal_test(currentNode.state, goal_state)
        puts "~~We have a match~~"
        return currentNode
      else
        puts "Not quite right yet"
      end

      #if State[node] is not in closed then
      if !closed.include?(currentNode.state)
        puts "well yall, we are going to expand"
        #add State[node] to closed
        #have to dupe! because you dont want just a pointer
        #this is very key here
        closed.push(currentNode.state.dup)

        #fringe = InsertAll(Expand(node, problem), fringe)
        newNodes = expand(currentNode)
        fringe.insert_all(newNodes)
      else
        puts "!!Hey this state has been checked already!!"
      end

    end #loop
  end #tree_search

  def expand(parent)

    #successors ← the empty set
    successors = Array.new

    #for each action, result in Successor-Fn(problem, State[node]) do
    successor_function(parent).each do |state|

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

  def successor_function(node)

    newStates = Array.new

    #here we gotta check each possible move for this node
    #node.direction returns a copy of the state after a move in said direction
    #false if move isnt possible

    upState = node.up
    if upState != false
      puts "Up works!"
      newStates.push(upState)
    end

    downState = node.down
    if downState != false
      puts "Down works!"
      newStates.push(downState)
    end

    leftState = node.left
    if leftState != false
      puts "Left works!"
      newStates.push(leftState)
    end

    rightState = node.right
    if rightState != false
      puts "Right works!"
      newStates.push(rightState)
    end

    return newStates

  end

  def goal_test(state, goal)
    i = 0
    state.each do |s|
      if s != goal[i]
        puts "its false!!"
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
  end

end #searcher class
