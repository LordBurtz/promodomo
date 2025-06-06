module SolutionWeek03 where

note :: Double -> (Integer, String)
note n
  | n < 50 = (5, "nicht ausreichend")
  | otherwise =
        let con = 4 / 50 in
        let grade = max 1 $ ceiling $ con * (100 - n) in
        let idx = fromInteger grade in
        (grade, grades !! (idx - 1))

        where grades = ["sehr gut", "gut", "befriedigend", "ausreichend", "nicht ausreichend"]

tax :: Double -> Double
tax income
  | income < 10000 = 0
  | income <= 30000 =
    let taxable = income - 10000 in
    taxable * 0.1
  | income <= 70000 =
    let taxable = income - 30000 in
    taxable * 0.2 + tax 30000
  | otherwise =
    let taxable = income - 70000 in
    taxable * 0.3 + tax 70000

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

length'' :: [a] -> Int
length'' lst =
  let length''' [] acc = acc
      length''' (x:xs) acc = length''' xs (acc + 1) in
    length''' lst 0

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) =reverse' xs ++ [x]

reverse'' :: [a] -> [a]
reverse'' lst =
  let reverse''' [] acc = acc
      reverse''' (x:xs) acc = reverse''' xs (x:acc) in
  reverse''' lst []

append' :: [a] -> [a] -> [a]
append' [] b = b
append' (x:xs) b = x : append' xs b

append'' :: [a] -> [a] -> [a]
append'' xs ys = append''' xs id ys
  where
    append''' [] f acc = f acc
    append''' (z:zs) f acc = append''' zs (\r -> f (z : r)) acc
 
take' :: Int -> [a] -> [a]
take' 0 a = []
take' n [] = []
take' n (x:xs) = x : take' (n -1) xs

take'' :: Int -> [a] -> [a]
take'' n a = take''' n a []
  where
    take''' 0 _ acc = acc
    take''' _ [] acc = acc 
    take''' n (x:xs) acc = take''' (n-1) xs (acc ++ [x])
