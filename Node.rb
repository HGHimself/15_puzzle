require 'mathn'

class Node

  #class variable
  @@size

  def initialize(parent, cost, depth, state)
    @parent = parent
    @cost = cost
    @depth = depth
    @state = state
    @@size = state.size
    @@width = Math.sqrt(@@size)

    # range method
    (0..@@size).each do |n|
      if 0 == state[n]
        @x = n % @@width;
        #stupid ruby returns n/w in simplest terms lol needs floor
        @y = (n/@@width).floor;
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

  def x
    return @x
  end

  def y
    return @y
  end

  def index_from_xy(x, y)
    if 0 > y or 0 > x or @@width <= y or @@width <= x
      return nil
    else
      return x + @@width * y;
    end
  end

  def swap1d(a, b, state)
    if a == b or a < 0 or b < 0 or a > @@size or b > @@size
      #puts "out of bounds!"
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
    if nil == i or nil == j
      #puts "bad indexes"
      return false
    else
      if swap1d(i, j, state)
        return state
      else
        #puts "swap was bad"
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
      return state[i]
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
      return state[i]
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
      return state[i]
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
      return state[i]
    end
  end

end

=begin
s = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
#  5  1  7  3
#  9  2 11  4
# 13  6 15  8
#  0 10 14 12



node = Node.new(nil, 0, 0, s)

state = node.down
if !state
  puts "didnt work yall"
else
  puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"
end
=end
