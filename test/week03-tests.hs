module Main where

-- import Week03Solution ( note )

main :: IO ()
main = testNoteAllCases

note :: Double -> (Integer, String)
note n
  | n < 50 = (5, "nicht ausreichend")
  | otherwise =
        let con = 4 / 50 in
        let grade = max 1 . ceiling $ con * (100 - n) in
        let idx = fromInteger grade in
        (grade, grades !! (idx - 1))

        where grades = ["sehr gut", "gut", "befriedigend", "ausreichend", "nicht ausreichend"]


testNoteAllCases =
  let predicate a b = a == b in
  let testCases = [
        ( TestCase "testZero" predicate (5, "nicht ausreichend"), 0.0),      -- Minimum possible value
        ( TestCase "testCeilTo4" predicate (5, "nicht ausreichend"), 49.9),  -- Just below threshold
        ( TestCase "testFloorTo4" predicate (4, "ausreichend"), 50.0),       -- Boundary case
        ( TestCase "testCeilTo3" predicate (4, "ausreichend"), 62.4),        -- Mid-range for grade 4
        ( TestCase "testFloorTo3" predicate (2, "gut"), 75.0),               -- Boundary for grade 3
        ( TestCase "testCeilTo1" predicate (2, "gut"), 87.4),                -- Boundary for grade 2
        ( TestCase "test1" predicate (1, "sehr gut"), 95.0),                 -- Mid-range for grade 1
        ( TestCase "test1Max" predicate (1, "sehr gut"), 100.0)              -- Maximum possible value
        ] in
  let expect (testcase, input) = expect' testcase $ note input in
  mapM_ (print . expect) testCases

-- abstract test methods, can ignore

data TestCase a = TestCase {
    name :: String,
    predicate :: a -> a -> Bool,
    expected :: a
}

data TestCaseResult = TestCaseResult {
    status  :: Bool,
    msg     :: String
}

instance Show TestCaseResult where
    show (TestCaseResult _ msg) = msg

expect' :: Show a => TestCase a -> a -> TestCaseResult
expect' (TestCase name predicate expected) actual =
    let result = predicate expected actual in
    TestCaseResult result $ msgOf name expected actual result

msgOf :: Show a => String -> a -> a -> Bool -> String
msgOf name _ _ True = successMsg name
msgOf name expected actual False = failureMsg name expected actual

successMsg :: Show a => a -> String
successMsg name = "✓ " ++ show name ++ "passed"

failureMsg :: Show a => String -> a -> a -> String
failureMsg name expected actual =
    "✗ failed " ++ name ++ ":    " ++ " expected:  " ++ show expected ++ ", got: " ++ show actual
