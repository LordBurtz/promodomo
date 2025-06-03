module SolutionWeek07 where

-- Aufgabe 1

elem' :: (Eq a) => a -> [a] -> Bool
elem' a = foldl (\acc val -> acc || a == val) False

all' :: (a -> Bool) -> [a] -> Bool
all' f = foldl (\acc val -> acc && f val) True 

reverse' :: [a] -> [a]
reverse' = foldl (\acc val -> (val:acc)) []

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f = snd . foldl (\(break, acc) val -> if break || (not . f) val then (True, acc) else (False, acc ++ [val])) (False, [])


-- Aufgabe 2
bar = id

fooA = (* 4)

fooB = bar . bar

fooC = flip (,)

fooD = (== 1) . ((flip mod) 2)

-- foo x = sqrt (5 * (sum (take x [1..50])))
fooE = sqrt . (* 5) . sum . flip take [1..50]

-- foo (x:_) = "River" ++ [x] ++ "Plate" 
fooF = ((++) "River") . (flip (:) "Plate") . head


-- Aufgabe 3

sumOddSqr :: Integer
sumOddSqr = sum . map (flip (^) 2) $ takeWhile (((>) 10000) . (flip (^) 2)) [1,3..100]

collatzSq :: Int
collatzSq = length $ filter ((<) 15 . length) $ map chain [1..100]

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n : chain (n `div` 2)
    | odd n = n : chain (n * 3 + 1)
