module Graph where

import           Data.List
import           Data.List.Index
import           Data.Maybe
import           Data.Char

type IndexedIntList = [(Int,[(Int,Int)])]

aGraph = (defaultGraph 7) {vertices = indexed [indexed [-1,4,-1,9,-1,-1,-1],
                                       indexed [4,-1,1,-1,1,-1,-1],
                                       indexed [-1,1,-1,-1,4,3,-1],
                                       indexed [9,-1,-1,-1,2,-1,1],
                                       indexed [-1,1,4,2,-1,5,2],
                                       indexed [-1,-1,3,-1,5,-1,-1],
                                       indexed [-1,-1,-1,1,2,-1,-1]]}

data Graph = Graph { vertices   :: IndexedIntList
                   , dimensions :: Int
                   , linesToSearch :: [Int]
                   , linesToAvoid :: [Int]
                   } deriving (Show)


    
defaultGraph :: Int -> Graph
defaultGraph n = Graph { vertices      = generateDefaultVert n
                       , dimensions    = n
                       , linesToSearch = [0]
                       , linesToAvoid  = []
                       }

-- simply de-indexes an indexed list
unindexed :: [(Int,a)] -> [a]
unindexed = map snd

--two functions to generate a default graph given n dimensions
generateDefaultVert :: Int -> IndexedIntList
generateDefaultVert dim = indexed . map indexed $ generateDefaultVertLoop dim dim

generateDefaultVertLoop :: Int -> Int -> [[Int]]
generateDefaultVertLoop _ 0 = []
generateDefaultVertLoop dim n =
    (take dim . cycle $ [-2]) : generateDefaultVertLoop dim (n - 1)

--given vertices and the list of valid lines, return the vertices that have indexes in those lines
validLines :: IndexedIntList -> [Int] -> IndexedIntList
validLines vert lines = filter (\e->fst e `elem` lines) vert

--given a list of indexs to lit and an indexes list, return the same list without those indexes
deleteAtList :: [Int] -> [(Int,a)] -> [(Int,a)]
deleteAtList [x] vert = deleteAt x vert
deleteAtList (x:xs) vert = deleteAt x (deleteAtList xs vert)

--given a list of indexes and an indexed int list, will remove the internal indexes 
deleteCollums :: [Int] -> IndexedIntList -> [[(Int,Int)]]
deleteCollums col = map (deleteAtList col) . unindexed

