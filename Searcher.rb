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

    #fringe ← Insert(Make-Node(Initial-State[problem]), fringe)
    root = Node.new(nil, 0, 0, init_state)

    flag = i = 0
    init_state.each do |num|
      #puts num
      if num == 0
        flag = i
      end
      i += 1
    end

    puts x = flag % width;
    puts y = flag / width;

    root.setup(width * width, width, x, y)
    fringe.insert(root)
    puts "Starting  LOOP"
    loop do #this works ayy ruby is so cool
      puts "in loop"

      #if fringe is empty then return failure
      if fringe.empty
        return nil
      end

      #node ← Remove-Front(fringe)
      nextNode = fringe.remove_front
      puts ""
      puts "-"
      puts ""
      print_state(nextNode.state)
      puts "gonna test goal!"
      #if Goal-Test(problem, State(node)) then return node
      if goal_test(nextNode.state, goal_state)
        return node
      end

      #if State[node] is not in closed then
      if !closed.include?(nextNode.state)

        #add State[node] to closed
        closed.push(nextNode.state)

        #fringe ← InsertAll(Expand(node, problem), fringe)
        newNodes = expand(nextNode)

        newNodes.each do |n|
          puts ""
          puts "new node here!"
          print_state(n.state)
        end
        fringe.insert_all(newNodes)
      end

    end #loop
  end #tree_search

  def expand(parent)
    puts "~inside expand~"
    successors = Array.new

    states = successor_function(parent)
    states.each do |state|
      puts "**new state"
      print_state(state)
      puts "**new state"
      #Path-Cost[s] ← Path-Cost[node] + Step-Cost(node, action, s)
      cost = parent.cost + 1
      depth = parent.depth + 1
      node = Node.new(parent, cost, depth, state)
      puts "got a new node"
      #add node to successors
      successors.push(node)
    end
    return successors
  end #expand

  def successor_function(node)

    successors = Array.new

    if node.up
      puts"up works"
      state = Array.new
      node.state.each do |s|
        state << s
      end
      print_state(state)
      successors.push(state)
      node.down
    end

    if node.down
      puts"down works"
      state = Array.new
      node.state.each do |s|
        state << s
      end
      print_state(state)
      successors.push(state)
      node.up

    end

    if node.left
      puts"left works"
      state = Array.new
      node.state.each do |s|
        state << s
      end
      print_state(state)
      successors.push(state)
      node.right

    end

    if node.right
      puts"right works"
      state = Array.new
      node.state.each do |s|
        state << s
      end
      print_state(state)
      successors.push(state)
      node.left

    end

    return successors

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
