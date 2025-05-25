module Main where

import Week05 (Player(..),Foot(..), Position(..), sameTeam, uniqueNumbers, coverPositions)
import TestUtils

makePlayer :: String -> Int -> Position -> Player
makePlayer team number = Player "name" team number LeftF

-- Test cases for sameTeam
sameTeamTestCases :: [(TestCase Bool, [Player])]
sameTeamTestCases = [
    (TestCase "testEmpty" True, []),
    (TestCase "testSingle" True, [makePlayer "TeamA" 1 Goalkeeper]),
    (TestCase "testSameTeam" True, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamA" 7 Forward,
        makePlayer "TeamA" 10 Midfielder
    ]),
    (TestCase "testDifferentTeams" False, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamB" 7 Forward
    ])
    ]

uniqueNumbersTestCases :: [(TestCase Bool, [Player])]
uniqueNumbersTestCases = [
    (TestCase "testEmpty" True, []),
    (TestCase "testSingle" True, [makePlayer "TeamA" 1 Goalkeeper]),
    (TestCase "testUniqueNumbers" True, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamA" 7 Forward,
        makePlayer "TeamA" 10 Midfielder
    ]),
    (TestCase "testDuplicateNumbers" False, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamA" 7 Forward,
        makePlayer "TeamA" 7 Midfielder
    ])
    ]

coverPositionsTestCases :: [(TestCase Bool, [Player])]
coverPositionsTestCases = [
    (TestCase "testEmpty" False, []),
    (TestCase "testSingle" False, [makePlayer "TeamA" 1 Goalkeeper]),
    (TestCase "testAllPositions" True, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamA" 5 Defender,
        makePlayer "TeamA" 8 Midfielder,
        makePlayer "TeamA" 9 Forward
    ]),
    (TestCase "testMissingPosition" False, [
        makePlayer "TeamA" 1 Goalkeeper,
        makePlayer "TeamA" 5 Defender,
        makePlayer "TeamA" 9 Forward
    ])
    ]

main :: IO ()
main = do
    let status = Passed
    putStrLn "\n --- testing sameTeam :: [Player] -> Bool ---"
    status <- combine status <$> runTestSuite sameTeam sameTeamTestCases

    putStrLn "\n --- testing uniqueNumbers :: [Player] -> Bool ---"
    status <- combine status <$> runTestSuite uniqueNumbers uniqueNumbersTestCases

    putStrLn "\n --- testing coverPositions :: [Player] -> Bool ---"
    status <- combine status <$> runTestSuite coverPositions coverPositionsTestCases

    exitFor status