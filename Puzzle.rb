class Node
  def initialize(parent, action, cost, depth, state)
    @parent = parent
    @cost = cost
    @depth = depth
    @state = state
  end

  def add_child(child)
    #append child to array of child nodes?
  end
end

class Fringe
  @array
  def insert(node)
    #append node onto front of fringe?
  end

  def remove_front
    #pop top off stack
  end
end

class Searcher
  def initialize
  end

  def tree_search(init_state, fringe)
    #fringe ← Insert(Make-Node(Initial-State[problem]), fringe)
    fringe.insert(new Node(new Puzzle(init_state)))
    loop do
      #if fringe is empty then return failure
      if fringe.empty
        return False
      end
      #node ← Remove-Front(fringe)
      node = fringe.remove_front
      #if Goal-Test(problem, State(node)) then return node
      if puzzle.goal_test
        return node
      end
      fringe ← InsertAll(Expand(node, problem), fringe)
    end
  end

  def expand(parent, problem)
    successors[]
    for each action, state in Successor-Fn(problem, node.state) do
      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + Step-Cost(parent, action, node)
      depth = parent.depth + 1
      node = new Node(parent, action, cost, depth, result)
      #add node to successors
    end
    return successors
  end
end
