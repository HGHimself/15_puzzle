require './Node' 

class Fringe
  def initialize()
    @nodes = Array.new
  end

  #maybe we need to insert an array of nodes into the fringe
  def insert(node)
    if nodes == nil
      return false
    else
      #append node onto front of fringe?
      @nodes.unshift(node)
    end
  end

  #hopefully this guy works
  def insert_all(newNodes)
    if newNodes == nil
      return false
    else
      newNodes.each do |node|
        insert(node)
      end
    end
  end

  def remove_front
    if empty
      return nil
    else
      #pop top off stack and return it
      return @nodes.shift
    end
  end

  def empty
    if @nodes.size == 0
      return true
    else
      return false
    end
  end
end
