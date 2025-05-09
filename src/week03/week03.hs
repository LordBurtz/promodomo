module Week03 where

note :: Double -> (Integer, String)
note n
  | n < 50 = (5, "nicht ausreichend")
  | otherwise =
        let con = 4 / 50 in
        let grade = ceiling $ con * (100 - n) in
        let idx = fromInteger grade in
        (grade, grades !! (idx - 1))

        where grades = ["sehr gut", "gut", "befriedigend", "ausreichend", "nicht ausreichend"]


