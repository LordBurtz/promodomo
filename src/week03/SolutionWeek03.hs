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
