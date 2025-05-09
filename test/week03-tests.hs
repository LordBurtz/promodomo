module Main where

import SolutionWeek03 ( note, tax )
import TestUtils

noteTestCases :: [(TestCase (Integer, String), Double)]
noteTestCases = [
        ( TestCase "testZero" (5, "nicht ausreichend"), 0.0),      -- Minimum possible value
        ( TestCase "testCeilTo4" (5, "nicht ausreichend"), 49.9),  -- Just below threshold
        ( TestCase "testFloorTo4" (4, "ausreichend"), 50.0),       -- Boundary case
        ( TestCase "testCeilTo3" (4, "ausreichend"), 62.4),        -- Mid-range for grade 4
        ( TestCase "testFloorTo3" (2, "gut"), 75.0),               -- Boundary for grade 3
        ( TestCase "testCeilTo1" (2, "gut"), 87.4),                -- Boundary for grade 2
        ( TestCase "test1" (1, "sehr gut"), 95.0),                 -- Mid-range for grade 1
        ( TestCase "test1Max" (1, "sehr gut"), 100.0)              -- Maximum possible value
        ]

taxTestCases = [
    (TestCase "testUnder10kIncome" 0, 2500),
    (TestCase "testUnder30kIncome" 1500, 25000),
    (TestCase "testUnder30kIncome" 13000, 80000)
    ]        

main :: IO ()
main = do
    putStrLn "\n --- testing note :: Double -> (Integer, String) ---"
    runTestSuite note (==) noteTestCases
    
    putStrLn "\n --- testing tax :: Double -> Double ---"
    runTestSuite tax (==) taxTestCases
