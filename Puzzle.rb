require './Searcher'

puts "Hello! Welcome to the Depth First Search method of solving the 15-Puzzle."
puts ""
puts "You must first select a starting configuration."

choice = 0
while choice != "1" and choice != "2"
  puts "1)"
  state = [1,2,7,3,5,6,11,4,9,10,15,8,13,14,12,0]
  puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  puts "or"
  puts "2)"
  state = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
  puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  puts ""
  puts "Please enter your choice:"

  choice = gets.strip
end

#homework settings
if choice == "1"
  init_state = [1,2,7,3,5,6,11,4,9,10,15,8,13,14,12,0]
else
  if choice == "2"
    init_state = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
  end
end

#easy test
#init_state= [1,2,3,4,5,6,7,8,9,10,11,12,13,0,14,15]

goal_state = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]


width = 4
#fringe = Fringe.new
searcher = Searcher.new
startTime = Time.now
#decided not to pass in a fringe cus I made one in the initialize function
node = searcher.graph_search(init_state, goal_state, width)
finishTime = Time.now
totalTime = (finishTime - startTime) * 1000.0
if node != nil
  state = node.state
  puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"

  puts "Time to complete was #{totalTime}ms."
else
  puts "There is no solution for this configuration!!"
end

puts "Tracing back the moves"

nodes = Array.new

loop do
  parent = node.parent
  nodes.unshift(node)
  if parent == nil
    break
  end
  node = parent
end

nodes.each do |node|
  #puts " "
  puts "#{node.action}, "
  state = node.state
  #puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  #puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  #puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  #puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"
end
