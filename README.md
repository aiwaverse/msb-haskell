# Minimum Spanning Biforest Problem

This code is a solution to the minimum spanning biforest problem (MSB), or, if you're smart, the minimum spanning tree (MSA) minus the heaviest connection.

## Building
It's a stack based haskell project, build with stack:
```bash
stack build
```
The executable is some folders deep in the .stack-work folder, the build command will give some info, you're free to copy that executable afterwards.

## Usage
The program expects an integer followed by a new line, which determines the graph number of vertices, this is basically entering the [adjacency matrix](https://en.wikipedia.org/wiki/Adjacency_matrix) of a graph.
Then, enter n numbers separated by space, n times, here, -1 represents no connection between the vertices, while any integer >=0 means the weight of the connection, take the following graph as an example:
!(Example graph)[https://github.com/aiwaverse/msb-haskell/blob/master/image/grafo.png]
It is entered as follow
```bash
./msb-haskell-exe
7
-1 4 -1 9 -1 -1 -1
4 -1 1 -1 1 -1 -1
-1 1 -1 -1 4 3 -1
9 -1 -1 -1 2 -1 1
-1 1 4 2 -1 5 2
-1 -1 3 -1 5 -1 -1
-1 -1 -1 1 2 -1 -1

```
And the result is directly given, following by a termination:
```base
8
```
