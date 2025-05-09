module TestUtils where

data TestCase a = TestCase {
    name :: String,
    expected :: a
}

data TestCaseResult = TestCaseResult {
    status  :: Bool,
    msg     :: String
}

instance Show TestCaseResult where
    show (TestCaseResult _ msg) = msg


-- wonky test logic, don't look too close

runTestSuite ::  Show b => (a -> b) -> (b -> b -> Bool) -> [(TestCase b, a)] -> IO ()
runTestSuite func predicate testCases =
    let expect (testcase, input) = expect' testcase predicate $ func input in
    mapM_ (print . expect) testCases

expect' :: Show a => TestCase a -> (a -> a -> Bool) -> a -> TestCaseResult
expect' (TestCase name expected) predicate actual =
    let result = predicate expected actual in
    TestCaseResult result $ msgOf name expected actual result

msgOf :: Show a => String -> a -> a -> Bool -> String
msgOf name _ _ True = successMsg name
msgOf name expected actual False = failureMsg name expected actual

successMsg :: Show a => a -> String
successMsg name = "✓ " ++ show name ++ " passed"

failureMsg :: Show a => String -> a -> a -> String
failureMsg name expected actual =
    "✗ failed " ++ name ++ ":    " ++ " expected:  " ++ show expected ++ ", got: " ++ show actual
