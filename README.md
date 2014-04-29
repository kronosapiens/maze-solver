---
tags: DFS
languages: ruby
---

# Recursive depth-first maze-solver algorithm

Our mazes are represented as strings.

    ###########
    #         #
    # ##### ###
    →   #     #
    ### # ### #
    #     #   #
    # ##### ###
    # #   #   @
    # ### #####
    #         #
    ###########

This represents an 11x11 Maze. The start of the maze is represented by `→` and the end of the maze by a `@`. The `#` represents a wall. The solution to this maze could be represented as:

    ###########
    #         #
    # ##### ###
    →...#.....#
    ###.#.###.#
    #  ...#...#
    # #####.###
    # #   #...@
    # ### #####
    #         #
    ###########

Mazes should be assumed to be bordered by blocking `#` tiles, creating an arena for the maze, however, that shouldn't actually change the BFS algorithm.

Your goal is to deliver a class, `MazeSolver`, that when initialized with a string of the maze, can solve it.
