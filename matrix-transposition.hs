
list_len [] = 0
list_len (x:xs) = 1 + list_len xs 

isMatrix :: [[Int]] -> Bool
isMatrix matrix
                | list_len matrix == 1 = True
                | list_len (head matrix) /= list_len (head (tail matrix)) = False
                | otherwise = True && isMatrix (tail matrix)
  
n = map(\x -> x + 1) [1,2,3]

-- let myMatix [[1,2,3], [4,5,6]]

first = map(\x -> x !! 0) [[1,2,3], [4,5,6]]
myHead = map(\x -> head x) [[1,2,3], [4,5,6]]
fibs1 = map fst $ iterate (\(a,b) -> (b,a+b)) (0,1)

trav :: [[Int]] -> Bool
trav matrix
                | list_len matrix == 1 = True
                | list_len (head matrix) /= list_len (head (tail matrix)) = False
                | otherwise = True && trav (tail matrix)

len matrix = tail matrix
len_01 = len [[1,2,3], [4,5,6]]


trav_01 = trav [[1,2,3], [4,5,6]]


transe               :: [[a]] -> [[a]]
transe []             = []
transe ([]   : xss)   = transe xss
transe ((x:xs) : xss) = (x : [h | (h:_) <- xss]) : transe (xs : [ t | (_:t) <- xss])