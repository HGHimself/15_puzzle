require './AStarNode'

class Fringe
  def initialize()
    @nodes = Array.new
    @size = 0
  end

  #inserts individual node onto front of array
  def insert(node)
    if @nodes == nil
      return false
    else
      #append node onto front of fringe?
      @nodes.unshift(node)
      @size += 1
    end
  end

  #inserts all nodes onto front of array
  def insert_all(newNodes)
    if newNodes == nil
      return false
    else
      newNodes.each do |node|
        insert(node)
      end
    end
  end

  #adds individual node onto end of array
  def enqueue(node)
    if node == nil
      return false
    else
      #append node onto front of fringe?
      @nodes.push(node)
    end
  end

  #adds all nodes onto end of array
  def enqueue_all(newNodes)
    if newNodes == nil
      return false
    else
      newNodes.each do |node|
        enqueue(node)
      end
    end
  end

  #pops first node off of array
  def remove_front
    if empty
      return nil
    else
      #pop top off stack and return it
      @size = @size - 1
      return @nodes.shift

    end
  end

  #pops last node off of array
  def remove_rear
    if empty
      return nil
    else
      #pop top off stack and return it
      return @nodes.pop
    end
  end

  def empty
    if @nodes.size == 0
      return true
    else
      return false
    end
  end

  def size
    return @size
  end

  def nodes
    return @nodes
  end

  # method which sorts the fringe by cost
  # (in this case, cost is the Manhattan distance
  #  from the current node to the solution)
  def sort
    if empty
      return nil
    else
      @nodes.sort! { |node1, node2| node1.cost <=> node2.cost }
      return @nodes
    end
  end

  def print_costs
    @nodes.each {|node| print "#{node.cost}", " - "}
  end

end