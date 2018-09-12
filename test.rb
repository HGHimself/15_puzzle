

=begin
values = Array.new
#here we gotta check each possible move for this node
#node.direction returns a copy of the state after a move in said direction
#false if move isnt possible

up = node.upValue
if up != nil
  #puts "Up works!"
  upState = node.up
  newStates.push(upState)
  values.push(up)
end

down = node.downValue
if down != nil
  #puts "down works!"
  downState = node.down
  newStates.push(downState)
  values.push(down)
end

left = node.leftValue
if left != nil
  #puts "left works!"
  leftState = node.left
  newStates.push(leftState)
  values.push(left)
end

right = node.rightValue
if right != nil
  #puts "right works!"
  rightState = node.right
  newStates.push(rightState)
  values.push(right)
end

swapped = true
while swapped do
  swapped = false
  0.upto(values.size-2) do |i|
    if values[i] < values[i+1]
      values[i], values[i+1] = values[i+1], values[i] # swap values
      newStates[i], newStates[i+1] = newStates[i+1], newStates[i] # swap values
      swapped = true
    end
  end
end
=end
