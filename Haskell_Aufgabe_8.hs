import Data.List
import System.IO


list_len [] = 0
list_len (x:xs) = 1 + list_len xs 

isMatrix :: [[Int]] -> Bool
isMatrix matrix
                | list_len matrix == 1 = True
                | list_len (head matrix) /= list_len (head (tail matrix)) = False
                | otherwise = True && isMatrix (tail matrix)
                 
dimensions :: [[Int]] -> (Int, Int)                
dimensions matrix 
                | isMatrix matrix = (list_len matrix, list_len (head matrix))
                | otherwise = (-1, -1)

isQuadratic :: [[Int]] -> Bool
isQuadratic matrix 
                | (isMatrix matrix) && (list_len matrix == list_len (head matrix)) = True  
                | otherwise = False

getRow :: [[Int]] -> Int -> [Int]  
getRow matrix j 
                | list_len matrix == 1 = [(matrix !! 0) !! j]
                | isMatrix matrix = ((head matrix) !! j) : (getRow (drop 1 matrix) j)
                | otherwise = []

getCol :: [[Int]] -> Int -> [Int]
getCol matrix i 
                | (isMatrix matrix) && (i >= 0) = matrix !! i
                | otherwise = []

trav :: [[Int]] -> [[Int]]
trav matrix
                | list_len matrix == 1 = [getCol matrix 0] 
                | otherwise = (getCol matrix 0) : (trav (drop 1 matrix))  

