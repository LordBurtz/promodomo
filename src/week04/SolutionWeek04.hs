module SolutionWeek04 where

palindrome :: String -> Bool
palindrome [] = True
palindrome [s] = True
palindrome (x:xs) = x == tailX && 
    case xs of
        [_] -> True
        lst -> ( palindrome . init ) xs
    where tailX = last xs

sieve' :: [Integer] -> [Integer]
sieve' [] = []
sieve' (z:xs) = z : sieve' [x | x <- xs, x `mod` z /= 0]

quicksort :: [Integer] -> [Integer]
quicksort [] = []
quicksort (z:zs) = quicksort [ x | x <- zs, z > x ] ++ z : quicksort [ x | x <- zs, z < x ]
