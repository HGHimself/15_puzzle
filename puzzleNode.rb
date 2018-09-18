class PuzzleNode
  attr_reader :value, :moves
  attr_accessor :goal_value, :heuristic

  def initialize(value, blank, goal_value, heuristic, moves = '')
    @goal_value = goal_value
    @heuristic = heuristic
    @moves = moves
    @value = value
    @blank = blank
  end

  # fringe = Insert(Make-Node(Initial-State[problem]), fringe)
  def self.parseState state, value_only = false
    # Yay for Ruby one-liners
    # Parses the given input into the square format map.
    array = state.split(/[ \(\)]+/).reject{|e| e == ""}.map(&:to_i)
    squares = array[0..-3].each_slice(4).to_a
    blank = array[-2..-1]
    if value_only
      squares
    else
      # I've applied this parser to solutions that require a heuristic,
      # but the heuristic is useless here.
      new(squares, blank, nil, @heuristic)
    end
  end

  # generates the states of the puzzle based on current input
  def generateStates
    states = [ ]
    states << west  if west?
    states << north if north?
    states << east  if east?
    states << south if south?
    states.shuffle
  end

  # moves the 0 (blank) tile to the next position based on the search
  # output, and forms the next square mapping.
  def moveBlankTo to_row, to_col, move
    val  = Marshal.load(Marshal.dump(@value))
    row_1, col_1 = @blank
    blnk = [to_row, to_col]
    val[row_1][col_1] = value[to_row][to_col]
    val[to_row][to_col] = 0
    PuzzleNode.new(val, blnk, @goal_value, @heuristic, @moves + move)
  end

  def north?
    @blank[0] > 0 and @moves[-1] != 'S'
  end
  def north
    row, col = @blank
    moveBlankTo(row - 1, col, 'N')
  end
  def south?
    @blank[0] < 3 and @moves[-1] != 'N'
  end
  def south
    row, col = @blank
    moveBlankTo(row + 1, col, 'S')
  end
  def east?
    @blank[1] < 3 and @moves[-1] != 'W'
  end
  def east
    row, col = @blank
    moveBlankTo(row, col + 1, 'E')
  end
  def west?
    @blank[1] > 0 and @moves[-1] != 'E'
  end
  def west
    row, col = @blank
    moveBlankTo(row, col - 1, 'W')
  end
  def to_s
    @moves
  end
  def == other
    @value == other.value
  end
end
