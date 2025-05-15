module Main where

import SolutionWeek03 ( note, tax, length', length'', reverse', reverse'', append', append'', take', take'' )
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

lengthTestCases = [
    (TestCase "testEmpty" 0, []),
    (TestCase "testSingle" 1, [1]),
    (TestCase "testMultiple" 3, [1, 2, 3])
    ]

reverseTestCases = [
    (TestCase "testEmpty" [], []),
    (TestCase "testSingle" [1], [1]),
    (TestCase "testMultiple" [3, 2, 1], [1, 2, 3])
    ]

tailRecReverseTestCase = [
    (TestCase "testIs reverse'' TailRecursive" (reverse [1..1000000]), [1..1000000])
    ]        

appendTestCases = [
    (TestCase "testEmpty" [], ([], [])),
    (TestCase "testLEmpty" [1, 2], ([], [1, 2])),
    (TestCase "testREmpty" [1, 2], ([1, 2], [])),
    (TestCase "testMultiple" [1, 2, 3, 4], ([1, 2], [3, 4]))
    ]

takeTestCases = [
    (TestCase "testZero" [], (0, [1, 2, 3])),
    (TestCase "testEmpty" [], (3, [])),
    (TestCase "testFewer" [1, 2], (2, [1, 2, 3])),
    (TestCase "testExact" [1, 2, 3], (3, [1, 2, 3])),
    (TestCase "testMore" [1, 2, 3], (5, [1, 2, 3]))
    ]

main :: IO ()
main = do
    let status = Passed
    putStrLn "\n --- testing note :: Double -> (Integer, String) ---"
    status <- combine status <$> runTestSuite note noteTestCases
    
    putStrLn "\n --- testing tax :: Double -> Double ---"
    status <- combine status <$> runTestSuite tax taxTestCases

    putStrLn "\n --- testing length' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite length' lengthTestCases

    putStrLn "\n --- testing length'' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite length'' lengthTestCases

    putStrLn "\n --- testing reverse' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite reverse' reverseTestCases

    putStrLn "\n --- testing reverse'' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite reverse'' reverseTestCases

    putStrLn "\n --- testing tail recursiveness of reverse'' :: [a] -> Int ---"
    putStrLn " Hint: if it times out/takes too long its probably not tail recursive"
    status <- combine status <$> runTestSuite reverse'' tailRecReverseTestCase

    putStrLn "\n --- testing append' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite (uncurry append') appendTestCases

    putStrLn "\n --- testing append'' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite (uncurry append'') appendTestCases

    putStrLn "\n --- testing take' :: Int -> [a] -> [a] ---"
    status <- combine status <$> runTestSuite (uncurry take') takeTestCases

    putStrLn "\n --- testing take'' :: Int -> [a] -> [a] ---"
    status <- combine status <$> runTestSuite (uncurry take'') takeTestCases
    
    exitFor status
