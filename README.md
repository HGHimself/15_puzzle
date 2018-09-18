# 15 Puzzle
### By HG King, Olivia Ledford, and Chris Mitchell

# To Run Depth First Search:
### HG King
```
ruby Puzzle.rb
```

Watch as your results populate!

# To Run Iterative Depth First Search:
### Olivia Ledford
This solution is run using ```sh
ruby idsTester.rb "(initial state)" "(goal state)"
```

You can also copy and paste either of the following:

#### Problem One:

```sh
ruby idsTester.rb "( (1 2 7 3) (5 6 11 4) (9 10 15 8) (13 14 12 0) (3 3) )" "( (1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 0) (3 3) )"
```


#### Problem Two:

```sh
ruby idsTester.rb "( (5 1 7 3) (9 2 11 4) (13 6 15 8) (0 10 14 12) (3 0) )" "( (1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 0) (3 3) )"
```


You can also generate any problems you would like to test, as long as they hold this form, and fit the 15-puzzle size.

The last two digits, held in parentheses at the end of both the initial state and the goal state, represent the location on the 4x4 grid where the empty tile is held. It's also represented with a 0 in the initial and goal state strings as well.

It returns a set of movements to the solution, the number of nodes touched, the size of the open list, the number of nodes previously generated, and the time it took to run.

The solution, when it is returned, is displayed as cardinal directions that demonstrate the movement of the blank tile: N = up, E = right, S = down, and W = left.

When the puzzle can't be solved in a reasonable workspace, deemed as 1,000,000 generated nodes, it times out.

**Problem One** is solveable under IDS - this problem outputs a solution of ```W N N N E S S S```, expands a total of 3529 nodes, with 1725 of them being previously generated, and an exeuction time averaging 91.425 ms. The first 5 nodes expanded after the start state are as follows:
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 15 | 0  |
     | 13 | 14 | 12 | 8  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 0  | 15 |
     | 13 | 14 | 12 | 8  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 0  | 10 | 15 |
     | 13 | 14 | 12 | 8  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 14 | 10 | 15 |
     | 13 | 0  | 12 | 8  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 14 | 10 | 15 |
     | 13 | 12 | 0  | 8  |

**Problem Two** is solveable under IDS - this problem outputs a solution of ```N N N E S S S E N N N E S S S```, expands a total of 724,983 nodes, with 483,277 of them being previously generated, and an exeuction time averaging 16,792.683 ms. The first 5 nodes expanded after the start state are as follows:
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 15 | 8  |
     | 10 | 0  | 14 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 15 | 8  |
     | 10 | 14 | 0  | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 0  | 8  |
     | 10 | 14 | 15 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 8  | 0  |
     | 10 | 14 | 15 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 8  | 12 |
     | 10 | 14 | 15 | 0  |

# To Run A* Search
### Chris Mitchell
To run A* search on the two test cases presented in the homework, simply run:
```
ruby AStarPuzzle.rb
```

This algorithm uses the total Manhattan distance as its heuristic function, and uses the depth of a node as the path cost to that node.

At the end of each problem, the program returns the following metrics:
* total number of nodes expanded
* total number of moves in the final solution
* sequence of moves in final solution
  - Note that this sequence of moves is conveyed using the same conventions as described above for IDS.
* first five nodes expanded by the algorithm (in order of expansion)
* total time taken to find a solution

The results of the algorithm can be summarized as follows:

#### Problem One
* **28** nodes expanded
* **8** moves to solve
* solution: **W N N N E S S S**
* **4.11 ms** to solve
* first five nodes expanded:
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 15 | 8  |
     | 13 | 14 | 12 | 0  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 15 | 8  |
     | 13 | 14 | 0  | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 0  | 8  |
     | 13 | 14 | 15 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 15 | 8  |
     | 13 | 14 | 12 | 0  |
  -  |    |    |    |    |
     |----|----|----|----|
     | 1  | 2  | 7  | 3  |
     | 5  | 6  | 11 | 4  |
     | 9  | 10 | 15 | 8  |
     | 13 | 14 | 0  | 12 |

#### Problem Two
* **156** nodes expanded
* **15** moves to solve
* solution: **N N N E S S S E N N N E S S S**
* **29.981 ms** to solve
* first five nodes expanded:
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 15 | 8  |
     | 0  | 10 | 14 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 0  | 6  | 15 | 8  |
     | 13 | 10 | 14 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 15 | 8  |
     | 10 | 0  | 14 | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 15 | 8  |
     | 10 | 14 | 0  | 12 |
  -  |    |    |    |    |
     |----|----|----|----|
     | 5  | 1  | 7  | 3  |
     | 9  | 2  | 11 | 4  |
     | 13 | 6  | 0  | 8  |
     | 10 | 14 | 15 | 12 |

# About The Classes

### Puzzle.rb
This is where the whole program starts. to run it, navigate to the
directory you have the file in and do ```ruby Puzzle.rb```

from there youll see it run hopefully.
Only thing that goes on here is the input and goal states are created, objects are instantiated, etc.

### Searcher.rb

Here I just created a class that holds the code that is tree search oriented. The search_graph method is specific to my Depth first search algorithm. Other than that, the other methods should work for any algorithm being used. Maybe the expand method needs to be different because that add and removes nodes to the fringe(I have it LIFO if it works like I expect it to). This section of the project was completed by HG King.

### Fringe.rb and Node.rb

These classes are just the basic object that searcher uses. Fringe is a fancy wrapper around an array, has useful methods that I made so you dont have to google so much Ruby array stuff. Node is the class that holds the state and other useful information. The X and Y instance variables indicate the 2d indices for the 0 or blank spot. NOTE: when you call node.direction, it returns a copy of the state after a move in that direction has been made. node.state will return a reference to the current state that node holds. Node.state shouldnt be modifiedor else that'll mess everything up.

### ids.rb, idsTester.rb, and puzzleNode.rb

These classes hold the code that handles the iterative deepening search. ```puzzleNode.rb``` handles the creation and movement of nodes. It also parses the given input, ensuring that the given fringe is populated. This fringe, once created, is passed to ```ids.rb```, where the frontal node of the fringe is pulled, tested against the goal, and then 'moved' in the proper order. These movements are then recorded in a new tree so that it can be traveresed in the form of the solution.

This solution was created on a late 2013 Macbook Pro, with 8GB of RAM and 2.4 GHz Intel Core i5 processor.

### AStarPuzzle.rb, AStarFringe.rb, AStarNode.rb, & AStarSearcher.rb

These files are very similar to their non-A* counterparts, except they have been modified to better suit the implementation of the A* algorithm. One of the most notable changes is the inclusion of the ```.calculate_manhattan_distance(state, goal_state)``` method in ```AStarNode.rb```. This method allows any node to calculate the total Manhattan distance across all of its tiles given its current state and the goal state. Another notable method included for A* is the ```.sort``` method in ```AStarFringe.rb```. This method is used to sort the nodes in the fringe by their costs (which are calculated by adding the total Manhattan distance and the depth of a given node) so that A* expands nodes in the correct order. It is also important to note that, unlike the DFGS implementation, this algorithm is implemented as a *tree* search. As such, this algorithm does not include the logic used in DFGS to maintain a closed list.

This solution was produced on an early 2015 Macbook Pro with 8GB of RAM and a 2.7 GHz Intel Core i5 processor.
