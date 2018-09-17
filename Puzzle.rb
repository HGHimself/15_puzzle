require './Searcher'

#homework settings
#init_state = [5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]
init_state = [1,2,7,3,5,6,11,4,9,10,15,8,13,14,12,0]

#easy test
#init_state= [1,2,3,4,5,6,7,8,9,10,11,12,13,0,14,15]

goal_state = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]

#init_state = [1,2,3,4,0,6,7,8,5]
#goal_state = [1,2,3,4,5,6,7,8,0]

width = 4
#fringe = Fringe.new
searcher = Searcher.new

#decided not to pass in a fringe cus I made one in the initialize function
node = searcher.graph_search(init_state, goal_state, width)

if node != nil
  state = node.state
  puts "#{state[0]} #{state[1]} #{state[2]} #{state[3]}"
  puts "#{state[4]} #{state[5]} #{state[6]} #{state[7]}"
  puts "#{state[8]} #{state[9]} #{state[10]} #{state[11]}"
  puts "#{state[12]} #{state[13]} #{state[14]} #{state[15]}"
else
  puts "Got a nil"
end
