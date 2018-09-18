require './AStarSearcher'

#homework settings
init_state = [[1,2,7,3,5,6,11,4,9,10,15,8,13,14,12,0],[5,1,7,3,9,2,11,4,13,6,15,8,0,10,14,12]]

# solution: NNWWSSEENNNWWWSSSEEENNNWWWSSSEEE	(32 moves)
# init_state = [3,4,8,12,2,7,15,14,1,6,11,13,5,10,9,0]

# solution: SWNWSWNENWNESENESWNWSWSESENES		(29 moves)
# init_state = [6,1,8,7,3,9,2,4,13,15,14,0,10,5,12,11]

# solution: WWWSEEESWWWSEEENNNESSSENNNESSS		(30 moves)
# init_state = [0,5,1,7,2,11,4,3,9,13,6,15,10,14,12,8]
# Not solved in reasonable time

# solution: NWNENWSWNWSESWSENESE 				(20 moves)
# init_state = [2,5,4,8,1,7,10,3,14,6,12,15,9,13,11,0]

# solution: SSWNNWSSSWNNESSENNESS				(21 moves)
# init_state = [1,3,11,0,9,2,15,4,13,5,8,7,10,6,14,12]

#easy test
# init_state= [1,2,3,4,5,6,7,8,9,10,11,12,13,0,14,15]

goal_state = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]

width = 4

init_state.each do |state|
	searcher = Searcher.new
	startTime = Time.now
	node = searcher.tree_search(state, goal_state, width)
	finishTime = Time.now
	totalTime = (finishTime - startTime) * 1000.0
	if node != nil
		puts "~"
		puts "~ Total time to solve: #{totalTime} ms"
		puts "~"
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	end
end