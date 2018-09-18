
def multiple
  x = [1,2,3,4]
  y = [5,6,7,8]
  return x , y
end

puts multiple
puts "-"
x, y = multiple

i = 0
x.each do |num|
  puts num
  puts y[i]
  puts "*"
end
