module Main where

import SolutionWeek03 ( note )
import TestUtils

main :: IO ()
main = testNoteAllCases

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
