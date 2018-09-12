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

    #closed = an empty set
    closed = Array.new

    #fringe ← Insert(Make-Node(Initial-State[problem]), fringe)
    root = Node.new(nil, 0, 0, init_state)
    flag = i = 0
    init_state.each do |num|
      if num == 0
        flag = i
      end
      flag += 1
    end

    x = flag % width;
    y = flag / width;

    root.setup(width * width, width, x, y)
    fringe.insert(root)

    loop do #this works ayy ruby is so cool
      puts "in loop"
      #if fringe is empty then return failure
      if fringe.empty
        return nil
      end

      #node ← Remove-Front(fringe)
      node = fringe.remove_front

      #if Goal-Test(problem, State(node)) then return node
      if goal_test(node.state, goal_state)
        return node
      end

      #if State[node] is not in closed then
      if closed.include?(node.state)
        #add State[node] to closed
        closed.push(node.state)

        #fringe ← InsertAll(Expand(node, problem), fringe)
        newNodes = expand(node, problem)
        fringe.insert_all(newNodes)
      end

    end #loop
  end #tree_search

  def expand(parent, problem)

    successors = Array.new

    states = successor_function(node)
    states.each do |state|

      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + 1
      depth = parent.depth + 1
      node = new Node(parent, cost, depth, state)

      #add node to successors
      successors.push(node)
    end
    return successors
  end #expand

  def successor_function(node)

    successors = Array.new

    if node.up
      state = node.state
      successors.push(state)
    end

    if node.down
      state = node.state
      successors.push(state)
    end

    if node.left
      state = node.state
      successors.push(state)
    end

    if node.right
      state = node.state
      successors.push(state)
    end

    return successors

  end

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

end #searcher class
