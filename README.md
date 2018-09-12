# 15 Puzzle

## To Run:
```ruby Puzzle.rb```
</br>Choose which algorithm you would like to see run:
1. Depth-First
2. Iterative-Deepening Search
3. A* Search

# Puzzle.rb
This is where the whole program starts. to run it, navigate to the
directory you have the file in and do ```ruby Puzzle.rb```

from there youll see it run hopefully.
Only thing that goes on here is the input and goal states are created, objects are instantiated, etc.

# Searcher.rb

Here I just created a class that holds the code that is tree search oriented. The search_graph method is specific to my Depth first search algorithm. Other than that, the other methods should work for any algorithm being used. Maybe the expand method needs to be dirrefent because that add and removes nodes to the fringe(I have it LIFO if it works like I expect it to)

# Fringe.rb and Node.rb

These classes are just the basic object that searcher uses. Fringe is a fancy wrapper around an array, has useful methods that I made so you dont have to google so much Ruby array stuff. Node is the class that holds the state and other useful information. The X and Y instance variables indicate the 2d indices for the 0 or blank spot. NOTE: when you call node.direction, it returns a copy of the state after a move in that direction has been made. node.state will return a reference to the current state that node holds. Node.state shouldnt be modifiedor else that'll mess everything up.
