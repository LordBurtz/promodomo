module Week07 where

-- Aufgabe 1

elem' :: (Eq a) => a -> [a] -> Bool
elem' = undefined

all' :: (a -> Bool) -> [a] -> Bool
all' = undefined

reverse' :: [a] -> [a]
reverse' = undefined

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' = undefined


-- Aufgabe 2

fooA = undefined

fooB = undefined

fooC = undefined

fooD = undefined

fooE = undefined

fooF = undefined

-- helper method for b)
bar = id


-- Aufgabe 3

sumOddSqr :: Integer
sumOddSqr = undefined

collatzSq :: Int
collatzSq = undefined

-- helper method for constructing a single collatz sequence
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n : chain (n `div` 2)
    | odd n = n : chain (n * 3 + 1)
