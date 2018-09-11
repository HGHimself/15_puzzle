def ayylmao()
  i = 0
  loop do
    puts i
    if(i > 10)
      return i
    else
      i = i + 1
    end
  end
end


nodes = [1,2,3,4,5,6,7,8,9]
nodes.each do |node|
  puts node
end

n = Array.new([1,2,3])
if n.size == 0
  puts "empty"
else
  puts "not empty"
end

class Boi

  def initialize(yeet)
    @yeet = yeet
  end

  def hello
    puts "hello world"
  end

  def callHello
    hello
  end
end

boi = Boi.new(1)

boi.callHello
boi.yeet
