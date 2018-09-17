require './Node'

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
    puts "inserting"
    if newNodes == nil
      return false
    else
      newNodes.each do |node|
        #puts node.x
        #puts node.y
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

end



fringe = Fringe.new
array = [1,2,3,4]
fringe.insert_all(array)
fringe.insert(5)
puts "fringe size is #{fringe.size}"
puts fringe.remove_front
puts fringe.remove_front
puts fringe.remove_front
puts fringe.remove_front
puts "-"
puts "fringe size is #{fringe.size}"
fringe.nodes.each do |node|
  puts node
end
