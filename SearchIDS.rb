require './Fringe'

class SearchIDS

  def initialize
    @fringe = Fringe.new
  end

  def ids_search(init_state, fringe, goal_state, width)
    puts 'Running the puzzle using iterative deepening search!'

    closed = Array.new

    #fringe = Insert(Make-Node(Initial-State[problem]), fringe)
    initNode = Node.new(nil, 0, 0, init_state)
    fringe.insert(initNode)

    loop do
      #when fringe is empty, return failure
      if fringe.empty
        return nil
      end
    end

    for (i = 0; true; i++)

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
    #puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
    #puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
    #puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
    #puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

    puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
    puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
    puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
    puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  end

end
