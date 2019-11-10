module Main where
import           Data.List.Index hiding (deleteAt)
import           Graph

main :: IO ()
main = do
    dim <- getLine
    let dimN = read dim :: Int
    inputs <- getMultipleLines dimN
    let vert = map makeVerticeList inputs
    let listOfVertices = map (read::String->[Int]) vert
    let indexedVertices = indexed . map indexed $ listOfVertices
    let myGraph = (defaultGraph dimN){vertices=indexedVertices}
    print $ generateMSB myGraph
    
makeVerticeList :: String -> String
makeVerticeList line = "[" ++ [if x == ' ' then ',' else x | x <- line] ++ "]"

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        return (x:xs)
