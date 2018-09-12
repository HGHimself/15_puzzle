

closed = Array.new

node = [1,2,3,4,5,6]

node2 = [1,3,4,5]


#if State[node] is not in closed then
if !closed.include?(node)
  puts "node isnt in here"
  #add State[node] to closed
  #have to dupe! because you dont want just a pointer
  closed.push(node.dup)

end #loop

if !closed.include?(node2)
  puts "node2 isnt in here"
  #add State[node] to closed
  #have to dupe! because you dont want just a pointer
  closed.push(node2.dup)

end #loop

if !closed.include?(node2)
  puts "node2 isnt in here"
  #add State[node] to closed
  #have to dupe! because you dont want just a pointer
  closed.push(node2.dup)
else
  puts "node2 is in here now"
end #loop
