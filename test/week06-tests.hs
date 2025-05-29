module Main where

import Week06 (Astronaut(..), Rolle(..), Zustand(..), Farbe(..), 
                       istCrewmate, istImposter, istLebendig, istTot,
                       ML(..), myHead, myAppend, myAdd, myString, myLess,
                       length', any', maximum', unzip')
import TestUtils

-- Custom Eq instance for ML for testing purposes
instance Eq a => Eq (ML a) where
    E == E = True
    (L x xs) == (L y ys) = x == y && xs == ys
    _ == _ = False

-- Helper function to create test astronauts
makeAstronaut :: String -> Rolle -> Zustand -> [String] -> Farbe -> Astronaut
makeAstronaut = Astronaut

-- Test cases for istCrewmate
istCrewmateTestCases :: [(TestCase Bool, Astronaut)]
istCrewmateTestCases = [
    (TestCase "testCrewmate" True, makeAstronaut "Alice" Crewmate Lebending ["task1"] Blau),
    (TestCase "testImposter" False, makeAstronaut "Bob" Imposter Lebending ["task2"] Rot)
    ]

-- Test cases for istImposter
istImposterTestCases :: [(TestCase Bool, Astronaut)]
istImposterTestCases = [
    (TestCase "testCrewmate" False, makeAstronaut "Alice" Crewmate Lebending ["task1"] Blau),
    (TestCase "testImposter" True, makeAstronaut "Bob" Imposter Lebending ["task2"] Rot)
    ]

-- Test cases for istLebendig
istLebendigTestCases :: [(TestCase Bool, Astronaut)]
istLebendigTestCases = [
    (TestCase "testLebendig" True, makeAstronaut "Alice" Crewmate Lebending ["task1"] Blau),
    (TestCase "testTot" False, makeAstronaut "Bob" Imposter Tot ["task2"] Rot)
    ]

-- Test cases for istTot
istTotTestCases :: [(TestCase Bool, Astronaut)]
istTotTestCases = [
    (TestCase "testLebendig" False, makeAstronaut "Alice" Crewmate Lebending ["task1"] Blau),
    (TestCase "testTot" True, makeAstronaut "Bob" Imposter Tot ["task2"] Rot)
    ]

-- Test cases for myHead
myHeadTestCases :: [(TestCase Integer, ML Integer)]
myHeadTestCases = [
    (TestCase "testSingle" 1, L 1 E),
    (TestCase "testMultiple" 5, L 5 (L 10 (L 15 E)))
    ]

-- Test cases for myAppend
myAppendTestCases :: [(TestCase (ML Integer), (ML Integer, ML Integer))]
myAppendTestCases = [
    (TestCase "testEmptyFirst" (L 1 (L 2 E)), (E, L 1 (L 2 E))),
    (TestCase "testEmptySecond" (L 1 (L 2 E)), (L 1 (L 2 E), E)),
    (TestCase "testBothNonEmpty" (L 1 (L 2 (L 3 (L 4 E)))), (L 1 (L 2 E), L 3 (L 4 E))),
    (TestCase "testBothEmpty" E, (E, E))
    ]

-- Test cases for myAdd
myAddTestCases :: [(TestCase (ML Integer), (ML Integer, ML Integer))]
myAddTestCases = [
    (TestCase "testSameLengthLists" (L 3 (L 7 E)), (L 1 (L 2 E), L 2 (L 5 E))),
    (TestCase "testFirstShorter" (L 3 E), (L 1 E, L 2 (L 5 E))),
    (TestCase "testSecondShorter" (L 3 E), (L 1 (L 2 E), L 2 E)),
    (TestCase "testBothEmpty" E, (E, E))
    ]

-- Test cases for myString
myStringTestCases :: [(TestCase String, ML Integer)]
myStringTestCases = [
    (TestCase "testSingle" "1", L 1 E),
    (TestCase "testMultiple" "1, 2, 3", L 1 (L 2 (L 3 E)))
    ]

-- Test cases for myLess
myLessTestCases :: [(TestCase Bool, (ML Integer, ML Integer))]
myLessTestCases = [
    (TestCase "testBothEmpty" False, (E, E)),
    (TestCase "testFirstEmpty" True, (E, L 1 E)),
    (TestCase "testSecondEmpty" False, (L 1 E, E)),
    (TestCase "testFirstShorter" True, (L 1 E, L 1 (L 2 E))),
    (TestCase "testSecondShorter" False, (L 1 (L 2 E), L 1 E)),
    (TestCase "testSameLength" False, (L 1 (L 2 E), L 1 (L 2 E)))
    ]

-- Test cases for length'
lengthTestCases :: [(TestCase Int, [Integer])]
lengthTestCases = [
    (TestCase "testEmpty" 0, []),
    (TestCase "testSingle" 1, [1]),
    (TestCase "testMultiple" 5, [1, 2, 3, 4, 5])
    ]

-- Test cases for any'
anyTestCases :: [(TestCase Bool, (Integer -> Bool, [Integer]))]
anyTestCases = [
    (TestCase "testEmptyList" False, ((> 0), [])),
    (TestCase "testNoneMatch" False, ((> 10), [1, 2, 3])),
    (TestCase "testSomeMatch" True, ((> 2), [1, 2, 3, 4])),
    (TestCase "testAllMatch" True, ((> 0), [1, 2, 3]))
    ]

-- Test cases for maximum'
maximumTestCases :: [(TestCase Integer, [Integer])]
maximumTestCases = [
    (TestCase "testSingle" 5, [5]),
    (TestCase "testMultiple" 10, [3, 1, 10, 5, 2]),
    (TestCase "testNegatives" (-1), [-5, -3, -1, -10])
    ]

-- Test cases for unzip'
unzipTestCases :: [(TestCase ([Integer], [String]), [(Integer, String)])]
unzipTestCases = [
    (TestCase "testEmpty" ([], []), []),
    (TestCase "testSingle" ([1], ["a"]), [(1, "a")]),
    (TestCase "testMultiple" ([1, 2, 3], ["a", "b", "c"]), [(1, "a"), (2, "b"), (3, "c")])
    ]

main :: IO ()
main = do
    let status = Passed
    
    putStrLn "\n --- testing istCrewmate :: Astronaut -> Bool ---"
    status <- combine status <$> runTestSuite istCrewmate istCrewmateTestCases

    putStrLn "\n --- testing istImposter :: Astronaut -> Bool ---"
    status <- combine status <$> runTestSuite istImposter istImposterTestCases

    putStrLn "\n --- testing istLebendig :: Astronaut -> Bool ---"
    status <- combine status <$> runTestSuite istLebendig istLebendigTestCases

    putStrLn "\n --- testing istTot :: Astronaut -> Bool ---"
    status <- combine status <$> runTestSuite istTot istTotTestCases

    putStrLn "\n --- testing myHead :: ML a -> a ---"
    status <- combine status <$> runTestSuite myHead myHeadTestCases

    putStrLn "\n --- testing myAppend :: ML a -> ML a -> ML a ---"
    status <- combine status <$> runTestSuite (uncurry myAppend) myAppendTestCases

    putStrLn "\n --- testing myAdd :: Num a => ML a -> ML a -> ML a ---"
    status <- combine status <$> runTestSuite (uncurry myAdd) myAddTestCases

    putStrLn "\n --- testing myString :: Show a => ML a -> String ---"
    status <- combine status <$> runTestSuite myString myStringTestCases

    putStrLn "\n --- testing myLess :: ML a -> ML a -> Bool ---"
    status <- combine status <$> runTestSuite (uncurry myLess) myLessTestCases

    putStrLn "\n --- testing length' :: [a] -> Int ---"
    status <- combine status <$> runTestSuite length' lengthTestCases

    putStrLn "\n --- testing any' :: (a -> Bool) -> [a] -> Bool ---"
    status <- combine status <$> runTestSuite (uncurry any') anyTestCases

    putStrLn "\n --- testing maximum' :: (Ord a) => [a] -> a ---"
    status <- combine status <$> runTestSuite maximum' maximumTestCases

    putStrLn "\n --- testing unzip' :: [(a, b)] -> ([a], [b]) ---"
    status <- combine status <$> runTestSuite unzip' unzipTestCases

    exitFor status 
