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
  def tree_search(init_state, fringe, goal_state)

    #fringe ← Insert(Make-Node(Initial-State[problem]), fringe)
    fringe.insert(new Node(nil, 0, 0, init_state))

    loop do #this works ayy ruby is so cool

      #if fringe is empty then return failure
      if fringe.empty
        return false
      end

      #node ← Remove-Front(fringe)
      node = fringe.remove_front

      #if Goal-Test(problem, State(node)) then return node
      #IDK what this means or how to implement it
      if puzzle.goal_test
        return node
      end

      #fringe ← InsertAll(Expand(node, problem), fringe)
      newNodes = expand(node, problem)
      fringe.insert_all(newNodes)

    end #loop
  end #tree_search

  def expand(parent, problem)

    successors = Array.new

    states = successor_function(node.state)
    states.each do |state|

      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + 1
      depth = parent.depth + 1
      node = new Node(parent, cost, depth, state)

      #add node to successors
      successors.push(node)
    end
    return successors
  end

  def successor_function(state)

  end

end
