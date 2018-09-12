require './Searcher'

init_state = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
goal_state = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]
width = 4
fringe = Fringe.new
searcher = Searcher.new
node = searcher.graph_search(init_state, fringe, goal_state, width)

if node != nil
  state = node.get_state
  puts "#{state[0]} #{state[1]} #{state[2]}"
  puts "#{state[3]} #{state[4]} #{state[5]}"
  puts "#{state[6]} #{state[7]} #{state[8]}"
else
  puts "Got a nil"
end
