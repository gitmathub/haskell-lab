import Data.List
import System.IO


list_len :: [a] -> Int
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
getRow matrix i 
                | list_len matrix == 1 = [(head matrix) !! i]
                | isMatrix matrix = ((head matrix) !! i) : (getRow (tail matrix) i)
                | otherwise = []

getCol :: [[Int]] -> Int -> [Int]
getCol matrix j 
                | (isMatrix matrix) && (j >= 0) = matrix !! j
                | otherwise = []

mod_matrix :: [[Int]] -> [[Int]]
mod_matrix matrix  
                | list_len matrix == 1 = [tail (head matrix)]
                | otherwise = (tail (head matrix)) : (mod_matrix (tail matrix))  

trav :: [[Int]] -> [[Int]]
trav matrix      
                | list_len (head matrix) == 0 = []
                | otherwise = (getRow matrix 0) : (trav (mod_matrix matrix))
                                                               
-- trav :: [[a]] -> [[a]]
-- trav [] = []
-- trav ([] : xss) = transe xss 
-- trav ((x:xs) : xss) = (x : [h | (h:_) <- xss]) : transe (xs : [ t | (_:t) <- xss])

replacer :: [a] -> Int -> a -> [a]
replacer tensor index value
                | list_len tensor == 0 = []
                | index == 0 = (value) : (replacer (tail tensor) (maxBound :: Int) value)
                | otherwise = (head tensor) : (replacer (tail tensor) (index-1) value)

setEntry :: [[Int]] -> Int -> Int -> Int -> [[Int]]
setEntry matrix i j aij = replacer matrix j (replacer (matrix !! j) i aij)
                
vector_add :: [Int] -> [Int] -> [Int]
vector_add vec1 vec2
                | list_len vec1 == 1 = [head vec1 + head vec2]
                | otherwise = (head vec1 + head vec2) : (vector_add (tail vec1) (tail vec2))
 
matrix_add :: [[Int]] -> [[Int]] -> [[Int]]
matrix_add matrix1 matrix2 
                | (list_len matrix1 == list_len matrix2) && (list_len (head matrix1) == list_len (head matrix2)) && (list_len matrix1 == 1) && (isMatrix matrix1) = [vector_add (head matrix1) (head matrix2)]
                | (isMatrix matrix1) && ((list_len matrix1) == (list_len matrix2)) && ((list_len (head matrix1)) == (list_len (head matrix2))) = (vector_add (head matrix1) (head matrix2)) : (matrix_add (tail matrix1) (tail matrix2))
                | otherwise = [[]]
