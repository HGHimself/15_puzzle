require 'mathn'

class AStarNode

  #class variable
  @@size

  def initialize(parent, cost, depth, state, goal_state, moves = '')
    @@size = state.size
    @@width = Math.sqrt(@@size)
    @parent = parent
    @depth = depth
    # For this A* search, the heuristic is the manhattan distance and the
    # path cost is the depth (assuming the travel cost between each node
    # is one achieves the same effect)
    @cost = depth + calculate_manhattan_distance(state, goal_state)
    @state = state
    # Used to keep track of moves to arrive at a given state
    @moves = moves

    (0..@@size).each do |n|
      if 0 == state[n]
        @x = n % @@width
        #stupid ruby returns n/w in simplest terms lol needs floor
        @y = (n/@@width).floor
      end
    end

  end

  def parent
    return @parent
  end

  def cost
    return @cost
  end

  def depth
    return @depth
  end

  def state
    return @state
  end

  def moves
    return @moves
  end

  def x
    return @x
  end

  def y
    return @y
  end

  # Calculate Manhattan distance given desired goal state
  def calculate_manhattan_distance(state, goal_state)
    manhattanDistance = 0
    (0..(@@size - 1)).each do |n|
      currX = n % @@width
      currY = (n / @@width).floor
      m = goal_state.index(state[n])
      goalX = m % @@width
      goalY = (m / @@width).floor;
      manhattanDistance += (currX - goalX).abs + (currY - goalY).abs
    end
    return manhattanDistance
  end

  # returns 1d index given the 2d index
  def index_from_xy(x, y)
    if 0 > y or 0 > x or @@width <= y or @@width <= x
      return false
    else
      return x + @@width * y;
    end
  end

  def swap1d(a, b, state)
    if (a == b) or (0 > a) or (0 > b) or (@@size < a) or (@@size < b)
      return false
    else
      hold = state[a]
      state[a] = state[b]
      state[b] = hold
      return true
    end
  end

  def move(i, j)
    state = @state.dup
    if false == i or false == j
      return false
    else
      if swap1d(i, j, state)
        return state
      else
        return false
      end
    end
  end

  def up
    i = index_from_xy(@x, @y - 1)
    j = index_from_xy(@x, @y)
    return move(i, j)
  end

  def upValue
    i = index_from_xy(@x, @y - 1)
    if i == false
      return i
    else
      return 'N'
    end
  end

  def down
    i = index_from_xy(@x, @y + 1)
    j = index_from_xy(@x, @y)
    return move(i, j)
  end

  def downValue
    i = index_from_xy(@x, @y + 1)
    if i == false
      return i
    else
      return 'S'
    end
  end

  def left
   i = index_from_xy(@x - 1, @y)
   j = index_from_xy(@x, @y)
   return move(i, j)
  end

  def leftValue
    i = index_from_xy(@x - 1, @y)
    if i == false
      return i
    else
      return 'W'
    end
  end

  def right
    i = index_from_xy(@x + 1, @y)
    j = index_from_xy(@x, @y)
    return move(i, j)
  end

  def rightValue
    i = index_from_xy(@x + 1, @y)
    if i == false
      return i
    else
      return 'E'
    end
  end

end