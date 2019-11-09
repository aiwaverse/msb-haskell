module Graph where

selectValidRows :: [[Integer]] -> [Integer] -> [[Integer]]
selectValidRows graph linesToSearch = [x | (x,i) <- zip graph [0..], i `elem` linesToSearch]