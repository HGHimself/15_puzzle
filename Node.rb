class Node
  def initialize(parent, cost, depth, state)
    @parent = parent
    @cost = cost
    @depth = depth
    @state = state
  end

  def add_child(child)
    #append child to array of child nodes?
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

end
