require './Node'

class Fringe
  def initialize()
    @nodes = Array.new
  end

  #inserts individual node onto front of array
  def insert(node)
    if @nodes == nil
      return false
    else
      #append node onto front of fringe?
      @nodes.unshift(node)
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
    if nodes == nil
      return false
    else
      #append node onto front of fringe?
      @nodes.push(node)
    end
  end

  #adds all nodes onto end of array
  def enqueue_all(newNode)
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


end
