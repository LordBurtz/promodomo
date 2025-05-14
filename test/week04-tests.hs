module Main where

import Week04 (palindrome, sieve', quicksort)
import TestUtils

palindromeTestCases :: [(TestCase Bool, String)]
palindromeTestCases = [
    (TestCase "testEmpty" True, ""),
    (TestCase "testSingle" True, "a"),
    (TestCase "testPalindromeEven" True, "abba"),
    (TestCase "testPalindromeOdd" True, "racecar"),
    (TestCase "testNonPalindromeEven" False, "abcd"),
    (TestCase "testNonPalindromeOdd" False, "hello")
    ]

sieveTestCases :: [(TestCase [Integer], [Integer])]
sieveTestCases = [
    (TestCase "testEmpty" [], []),
    (TestCase "testSingle" [2], [2]),
    (TestCase "testSmallRange" [2, 3, 5, 7], [2, 3, 5, 7, 8, 9, 10]),
    (TestCase "testLargerRange" [2, 3, 5, 7, 11, 13, 17, 19], [2..20])
    ]

quicksortTestCases :: [(TestCase [Integer], [Integer])]
quicksortTestCases = [
    (TestCase "testEmpty" [], []),
    (TestCase "testSingle" [5], [5]),
    (TestCase "testSorted" [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]),
    (TestCase "testReversed" [1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
    (TestCase "testMixed" [1, 2, 3, 4, 5], [3, 1, 5, 2, 4])
    ]

main :: IO ()
main = do
    putStrLn "\n --- testing palindrome :: String -> Bool ---"
    runTestSuite palindrome palindromeTestCases
    
    putStrLn "\n --- testing sieve' :: [Integer] -> [Integer] ---"
    runTestSuite sieve' sieveTestCases

    putStrLn "\n --- testing quicksort :: [Integer] -> [Integer] ---"
    runTestSuite quicksort quicksortTestCases
    
    putStrLn "done"
