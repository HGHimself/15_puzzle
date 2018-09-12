class Node

  #class variable
  @@size

  def initialize(parent, cost, depth, state)
    @parent = parent
    @cost = cost
    @depth = depth
    @state = state
    
  end

  def setup(size, width)
    @@size = size
    @@width = width

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

  def swap2d(x1, y1, x2, y2)
    i1 = index_from_xy(x1, y1)
    i2 = index_from_xy(x2, y2)

    if i1 != nil and i2 != nil and i1 != i2
      hold = @state[i1]
      @state[i1] = @state[i2]
      @state[i2] = hold
      return true
    else
      return false
    end

  end

  def swap1d(a, b)
    if a == b or a < 0 or b < 0 or a > @@size or b > @@size
      return false
    else
      hold = @state[a]
      @state[a] = @state[b]
      @state[b] = hold
      return true
    end

  end

  def up
    i = index_from_xy(@x, @y - 1)
    j = index_from_xy(@x, @y)
    if nil == i || nil == j
      return false
    else
      if swap1d(i, j)
        @y -= 1
        return true
      else
        return false
      end
    end
  end

  def down
    i = index_from_xy(@x, @y + 1)
    j = index_from_xy(@x, @y)
    if nil == i || nil == j
      return false
    else
      if swap1d(i, j)
        @y += 1
        return true
      else
        return false
      end
    end
  end

  def left
    i = index_from_xy(@x - 1, @y)
    j = index_from_xy(@x, @y)
    if nil == i || nil == j
      return false
    else
      if swap1d(i, j)
        @x -= 1
        return true
      else
        return false
      end
    end
  end

  def right
    i = index_from_xy(@x + 1, @y)
    j = index_from_xy(@x, @y)
    if nil == i || nil == j
      return false
    else
      if swap1d(i, j)
        @x += 1
        return true
      else
        return false
      end
    end
  end


end

=begin
state = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
#  5  1  7  3
#  9  2 11  4
# 13  6 15  8
#  0 10 14 12

width = 4

flag = i = 0
state.each do |num|
  puts num
  if num == 0
    flag = i
  end
  i += 1
end

puts x = flag % width;
puts y = flag / width;

node = Node.new(nil, 0, 0, state)
node.setup(state.size, width, x, y)




state = node.state
puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"
=end
