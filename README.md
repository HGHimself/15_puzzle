# 15 Puzzle
### By HG King, Olivia Ledford, and Chris ??

# To Run Depth First Search:
### HG King
```ruby Puzzle.rb```

Watch as your results populate!

# To Run Iterative Depth First Search:
### Olivia Ledford
This solution is run using ```ruby idsTester.rb "(initial state)" "(goal state)"```.
</br> </br> You can also copy and paste **Problem One**:
</br> ```ruby idsTester.rb "( (1 2 7 3) (5 6 11 4) (9 10 15 8) (13 14 12 0) (3 3) )" "( (1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 0) (3 3) )"```
</br> </br> and **Problem Two**:
</br> ```ruby idsTester.rb "( (5 1 7 3) (9 2 11 4) (13 6 15 8) (0 10 14 12) (0 3) )" "( (1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 0) (3 3) )"```
</br> </br> You can also generate any problems you would like to test, as long as they hold this form, and fit the 15-puzzle size.

The last two digits, held in parentheses at the end of both the initial state and the goal state, represent the location on the 4x4 grid where the empty tile is held. It's also represented with a 0 in the initial and goal state strings as well.

It returns a set of movements to the solution, the number of nodes touched, the size of the open list, the number of nodes previously generated, and the time it took to run.

The solution, when it is returned, is displayed as cardinal directions that demonstrate the movement of the blank tile: N = up, E = right, S = down, and W = left.

When the puzzle can't be solved in a reasonable workspace, deemed as 1,000,000 generated nodes, it times out.

**Problem One** is solveable under IDS - it outputs a solution of ```W N N N E S S S```, expands a total of 3529 nodes with 1725 of them being previously generated, and an exeuction time averaging 91.425 ms. The first 5 search nodes are **_THING_**.

**Problem Two** times out under IDS - it obviously does not output a solution, it fails after expanding 1,000,000 nodes with **_X_** of them being previously generated, and has an execution time averaging **_Y_** ms. The first 5 search nodes are **_THING_**.

# To Run A* Search
### Chris ??
Info about A* here

# About The Classes

### Puzzle.rb
This is where the whole program starts. to run it, navigate to the
directory you have the file in and do ```ruby Puzzle.rb```

from there youll see it run hopefully.
Only thing that goes on here is the input and goal states are created, objects are instantiated, etc.

### Searcher.rb

Here I just created a class that holds the code that is tree search oriented. The search_graph method is specific to my Depth first search algorithm. Other than that, the other methods should work for any algorithm being used. Maybe the expand method needs to be dirrefent because that add and removes nodes to the fringe(I have it LIFO if it works like I expect it to). This section of the project was completed by HG King.

### Fringe.rb and Node.rb

These classes are just the basic object that searcher uses. Fringe is a fancy wrapper around an array, has useful methods that I made so you dont have to google so much Ruby array stuff. Node is the class that holds the state and other useful information. The X and Y instance variables indicate the 2d indices for the 0 or blank spot. NOTE: when you call node.direction, it returns a copy of the state after a move in that direction has been made. node.state will return a reference to the current state that node holds. Node.state shouldnt be modifiedor else that'll mess everything up.

### ids.rb, idsTester.rb, and puzzleNode.rb

These classes hold the code that handles the iterative deepening search. ```puzzleNode.rb``` handles the creation of nodes using
